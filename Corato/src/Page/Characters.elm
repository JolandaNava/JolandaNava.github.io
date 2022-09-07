module Page.Characters exposing (Model, Msg, init, update, view, subscriptions)

import Html exposing (Html)
import Html.Attributes as Attrs
import Html.Events as Events
import Browser exposing (Document)
import Browser.Events as Browser
import Browser.Dom as Browser
import Task

import Cmd.Extra as Cmd
import RelationsGraph as Relations
import Data
import Show
import Page
import Types as T
import Route
import View

---- MODEL ----

type ViewCharacters
    = Narrators
    | Relations

type alias Model =
    { view : ViewCharacters
    , relations : Relations.Model
    }


init : ( Model, Cmd Msg )
init =
    Cmd.withCmd
        fetchGraphElement
        { view = Relations
        , relations = Relations.init (0,0)
        }

fetchGraphElement : Cmd Msg
fetchGraphElement =
    Browser.getElement "graph-svg" |> Task.attempt GetGraphElement

---- UPDATE ----


type Msg
    = RelationsMsg Relations.Msg
    | ChangeView ViewCharacters
    | GetGraphElement (Result Browser.Error Browser.Element)
    | RefetchGraphElement



update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        RelationsMsg subMsg ->
            Cmd.withNoCmd 
                { model | relations = Relations.update subMsg model.relations }
        
        ChangeView v ->
            Cmd.withNoCmd { model | view = v}
        
        GetGraphElement res ->
            case res of
                Ok element ->
                    Cmd.withNoCmd { model | relations = Relations.init (element.element.width, element.element.height)}
                Err _ -> Cmd.withNoCmd model
        
        RefetchGraphElement ->
            Cmd.withCmd fetchGraphElement model


---- SUBSCRIPTIONS ----
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Sub.map RelationsMsg <| Relations.subscriptions model.relations
        , Browser.onResize (\_ _ -> RefetchGraphElement)
        ]



---- VIEW ----


view : Model -> Document Msg
view model =
    { title = "Corato - I Personaggi"
    , body = content model
    }

content :  Model -> List (Html Msg)
content  model =
    Page.pageView "Scopri i Personaggi" "characters"
        [ titleView model
        , case model.view of
           Narrators -> narratorsView
           Relations -> relationsView model.relations
        ]

narratorsView : Html Msg
narratorsView =
    Html.div
        [ Attrs.class "narrators-view"]
        [ Html.div
            [ Attrs.class "quote-container" ]
            [ Html.div
                [ Attrs.class "quote"]
                [ Html.text "\"Some very poignant quote is going right here on who narrates what.\"" ]
            ]
        , Html.div
            [ Attrs.class "characters-list-container" ]
            [ Html.div
                [ Attrs.class "characters-list" ]
                    <| List.map View.character Data.narrators 
            ]
        ]

relationsView : Relations.Model -> Html Msg
relationsView r =
    Html.div
        [ Attrs.class "characters-relations-container" ]
        [
        Html.div
            [ Attrs.class "characters-relations" ]
            [ showRelations r ]
        ]


showRelations : Relations.Model -> Html Msg
showRelations model =
    Html.map RelationsMsg <| Relations.view model



titleView : Model -> Html Msg
titleView model =
    Html.div
        [ Attrs.class "characters-navigation" ]
        [ Html.div
            [ Attrs.class "characters-navigation-arrow"
            , Attrs.class "left"
            , Attrs.classList [("hidden", model.view == Narrators)]
            , Events.onClick <| ChangeView Narrators
            ]
            [ Html.text "torna ai narratori" ]
        , Html.div
            [ Attrs.class "characters-title" ]
            [ Html.text <|
                case model.view of
                    Narrators -> "I Narratori"
                    Relations -> "Le Relazioni"
            ]
        , Html.div
            [ Attrs.class "characters-navigation-arrow"
            , Attrs.class "right"
            , Attrs.classList [("hidden", model.view == Relations)]
            , Events.onClick <| ChangeView Relations
            ]
            [ Html.text "scopri le relazioni" ]
        ]