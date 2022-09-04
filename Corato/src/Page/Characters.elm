module Page.Characters exposing (Model, Msg, init, update, view, subscriptions)

import Html exposing (Html)
import Html.Attributes as Attrs
import Html.Events as Events
import Browser exposing (Document)

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
    Cmd.withNoCmd
    { view = Narrators
    , relations = Relations.init
    }


---- UPDATE ----


type Msg
    = RelationsMsg Relations.Msg
    | ChangeView ViewCharacters


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        RelationsMsg subMsg ->
            Cmd.withNoCmd 
                { model | relations = Relations.update subMsg model.relations }
        
        ChangeView v ->
            Cmd.withNoCmd { model | view = v}


---- SUBSCRIPTIONS ----
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.map RelationsMsg <| Relations.subscriptions model.relations



---- VIEW ----


view : Model -> Document Msg
view model =
    { title = "Corato - I Personaggi"
    , body = content model
    }

content :  Model -> List (Html Msg)
content  model =
    Page.pageView "Scopri i Personaggi" "characters"
        [ viewControls model
        , case model.view of
           Narrators -> narratorsView
           Relations -> relationsView model.relations
        ]

narratorsView : Html Msg
narratorsView =
    Html.div
        [ Attrs.class "characters-list-container" ]
        [ Html.div
            [ Attrs.class "characters-list" ]
                <| List.map View.character Data.narrators 
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

viewControls : Model -> Html Msg
viewControls model =
    Html.div
        [ Attrs.class "view-controls" ]
        [ Html.div
            [ Attrs.class "control-button"
            , Attrs.classList [("active", model.view == Narrators)]
            , Events.onClick <| ChangeView Narrators
            ]
            [ Html.text "I Narratori" ]
        , Html.div
            [ Attrs.class "control-button"
            , Attrs.classList [("active", model.view == Relations)]
            , Events.onClick <| ChangeView Relations
            ]
            [ Html.text "Le Relazioni" ]

        ]