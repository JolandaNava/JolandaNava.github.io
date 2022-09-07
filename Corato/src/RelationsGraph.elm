module RelationsGraph exposing (view, Msg, Model, subscriptions, init, update)


import Browser.Events
import Color
import Force
import Graph exposing (Edge, Graph, NodeContext, NodeId)
import Html.Events.Extra.Mouse as Mouse
import Json.Decode as Decode
import Time
import TypedSvg as Svg exposing (circle, g, svg, title)
import TypedSvg.Attributes as SvgAttrs exposing (class, fill, stroke, viewBox)
import TypedSvg.Attributes.InPx exposing (cx, cy, r, strokeWidth, x1, x2, y1, y2, x, y, dx, dy)
import TypedSvg.Core exposing (Attribute, Svg, text, attribute)
import TypedSvg.Types exposing (Paint(..), AnchorAlignment(..))
import Data
import Html exposing (b)
import Types as T
import Show
import Route



w : Float
w =
    700


h : Float
h =
    600


-- Colors

eerie_black : Color.Color
eerie_black = Color.rgb255 28 28 28
bunker : Color.Color
bunker = Color.rgb255 44 44 44
jumbo : Color.Color
jumbo = Color.rgb255 134 134 134
magnesium : Color.Color
magnesium = Color.rgb255 177 177 177
alto : Color.Color
alto = Color.rgb255 218 218 218
lily_white : Color.Color
lily_white = Color.rgb255 235 235 235
white : Color.Color
white = Color.rgb255 255 255 255

black : Color.Color
black = Color.rgb255 0 0 0

transparent : Color.Color 
transparent = Color.rgba 0 0 0 0


edges : Color.Color
edges = white

nodes : Color.Color
nodes = black

names : Color.Color
names = bunker

relations : Color.Color
relations = bunker

type Msg
    = DragStart NodeId ( Float, Float )
    | DragAt ( Float, Float )
    | DragEnd ( Float, Float )
    | Tick Time.Posix


type alias Model =
    { drag : Maybe Drag
    , graph : Graph Entity String
    , simulation : Force.State NodeId
    }


type alias Drag =
    { start : ( Float, Float )
    , current : ( Float, Float )
    , index : NodeId
    }


type alias Entity =
    Force.Entity NodeId { value : T.Character }


initializeNode : NodeContext T.Character String -> NodeContext Entity String
initializeNode ctx =
    { node = { label = Force.entity ctx.node.id ctx.node.label, id = ctx.node.id }
    , incoming = ctx.incoming
    , outgoing = ctx.outgoing
    }


init : Model
init =
    let
        graph =
            Graph.mapContexts initializeNode Data.graphRelations

        link { from, to } =
            ( from, to )

        forces =
            [ Force.links <| List.map link <| Graph.edges graph
            , Force.manyBodyStrength (-100) <| List.map .id <| Graph.nodes graph
            , Force.center (w / 2) (h / 2)
            , Force.collision (0) <| List.map .id <| Graph.nodes graph
            ]
    in
        Model Nothing graph (Force.simulation forces)


updateNode : ( Float, Float ) -> NodeContext Entity String -> NodeContext Entity String
updateNode ( x, y ) nodeCtx =
    let
        nodeValue =
            nodeCtx.node.label
    in
    updateContextWithValue nodeCtx { nodeValue | x = x, y = y }


updateContextWithValue : NodeContext Entity String -> Entity -> NodeContext Entity String
updateContextWithValue nodeCtx value =
    let
        node =
            nodeCtx.node
    in
    { nodeCtx | node = { node | label = value } }


updateGraphWithList : Graph Entity String -> List Entity -> Graph Entity String
updateGraphWithList =
    let
        graphUpdater value =
            Maybe.map (\ctx -> updateContextWithValue ctx value)
    in
    List.foldr (\node graph -> Graph.update node.id (graphUpdater node) graph)


update : Msg -> Model -> Model
update msg ({ drag, graph, simulation } as model) =
    case msg of
        Tick t ->
            let
                ( newState, list ) =
                    Force.tick simulation <| List.map .label <| Graph.nodes graph
            in
            case drag of
                Nothing ->
                    Model drag (updateGraphWithList graph list) newState

                Just { current, index } ->
                    Model drag
                        (Graph.update index
                            (Maybe.map (updateNode current))
                            (updateGraphWithList graph list)
                        )
                        newState

        DragStart index xy ->
            Model (Just (Drag xy xy index)) graph simulation

        DragAt xy ->
            case drag of
                Just { start, index } ->
                    Model (Just (Drag start xy index))
                        (Graph.update index (Maybe.map (updateNode xy)) graph)
                        (Force.reheat simulation)

                Nothing ->
                    Model Nothing graph simulation

        DragEnd xy ->
            case drag of
                Just { start, index } ->
                    Model Nothing
                        (Graph.update index (Maybe.map (updateNode xy)) graph)
                        simulation

                Nothing ->
                    Model Nothing graph simulation


subscriptions : Model -> Sub Msg
subscriptions model =
    case model.drag of
        Nothing ->
            -- This allows us to save resources, as if the simulation is done, there is no point in subscribing
            -- to the rAF.
            if Force.isCompleted model.simulation then
                Sub.none

            else
                Browser.Events.onAnimationFrame Tick

        Just _ ->
            Sub.batch
                [ Browser.Events.onMouseMove (Decode.map (.clientPos >> DragAt) Mouse.eventDecoder)
                , Browser.Events.onMouseUp (Decode.map (.clientPos >> DragEnd) Mouse.eventDecoder)
                , Browser.Events.onAnimationFrame Tick
                ]


onMouseDown : NodeId -> Attribute Msg
onMouseDown index =
    Mouse.onDown (.clientPos >> DragStart index)


linkElement : Graph Entity String -> Int -> Edge String -> Svg Msg
linkElement graph int edge =
    let
        source =
            Maybe.withDefault (Force.entity 0 T.Rosetta ) <| Maybe.map (.node >> .label) <| Graph.get edge.from graph

        target =
            Maybe.withDefault (Force.entity 0 T.Rosetta ) <| Maybe.map (.node >> .label) <| Graph.get edge.to graph
        
        id =
            String.fromInt int
    in
    g 
        [ ]
        [ Svg.path
            [ SvgAttrs.class ["edge"]
            , strokeWidth 1
            , stroke <| Paint edges
            , SvgAttrs.id id
            , SvgAttrs.d
                <| String.join " " 
                    [ "M", (String.fromFloat source.x), (String.fromFloat source.y)
                    , "L", (String.fromFloat target.x), (String.fromFloat target.y)
                    ]
            ]
            []

        , Svg.text_
            [ SvgAttrs.class ["edge-text"]
            , dx 7 
            , dy -1
            ]
            [ Svg.textPath 
                [ attribute "href" <| "#" ++ id 
                , fill <| Paint relations
                ]
                [ text edge.label ]
            ]
        , Svg.line
            [ x1 source.x
            , y1 source.y
            , x2 target.x
            , y2 target.y
            , strokeWidth 10
            , stroke <| Paint transparent
            ] []
        ]


nodeElement : { a | id : NodeId, label : { b | x : Float, y : Float, value : T.Character } } -> Svg Msg
nodeElement node =
    g [ SvgAttrs.class ["node-element"] ]
        [ circle
            [ r 1.5
            , fill <| Paint nodes
            , stroke <| Paint transparent
            , strokeWidth 2
            , onMouseDown node.id
            , cx node.label.x
            , cy node.label.y
            ]
            [ title [] [ text <| Show.character node.label.value ] ]
        , Svg.a
            [ SvgAttrs.href <| Route.toCharacter node.label.value ]
            [ Svg.text_
                [ SvgAttrs.class ["node-text"]
                , dx <| node.label.x + 5
                , dy <| node.label.y - 2
                , fill <| Paint names
                ]
                [ text <| Show.character node.label.value ]
            ]
        ]


view : Model -> Svg Msg
view model =
    svg [ viewBox 0 0 w h ]
        [ Graph.edges model.graph
            |> List.indexedMap (linkElement model.graph)
            |> g [ class [ "links" ] ]
        , Graph.nodes model.graph
            |> List.map nodeElement
            |> g [ class [ "nodes" ] ]
        ]


