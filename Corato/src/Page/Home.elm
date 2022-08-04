module Page.Home exposing (Model, Msg, init, update, view)

import Html exposing (Html, text, div, h1)
import Browser exposing (Document)
import Cmd.Extra as Cmd
import Html.Attributes as Attrs
import Html.Events as Events

---- MODEL ----


type alias Model =
    { content : Int }


init : ( Model, Cmd Msg )
init =
    ( { content = 0 }, Cmd.none )


---- UPDATE ----


type Msg
    = NoOp
    | Add
    | Subtract


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        NoOp -> (model, Cmd.none)
        Add -> Cmd.withNoCmd
            { content = model.content + 1 }
        Subtract -> Cmd.withNoCmd
            { content = model.content - 1 }

---- VIEW ----


view : Model -> Document Msg
view model =
    { title = "Corato"
    , body = content model
    }

content :  Model -> List (Html Msg)
content  model =
    [ Html.div []
        [ Html.h1 [] [ Html.text "HOME PAGE" ]
        ]
    , Html.button 
        [ Events.onClick Add

        ] [ Html.text "Add" ]
    , Html.text <| String.fromInt model.content
    , Html.button 
        [ Events.onClick Subtract

        ] [ Html.text "Subtract" ]
    ]