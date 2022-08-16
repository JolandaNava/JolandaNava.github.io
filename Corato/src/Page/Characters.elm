module Page.Characters exposing (Model, Msg, init, update, view, subscriptions)

import Html exposing (Html)
import Html.Attributes as Attrs
import Browser exposing (Document)

import Cmd.Extra as Cmd
import RelationsGraph as Relations
import Data
import Show
import Page
import Types as T
import Route

---- MODEL ----


type alias Model =
    { relations : Relations.Model
    }


init : ( Model, Cmd Msg )
init =
    Cmd.withNoCmd
    { relations = Relations.init }


---- UPDATE ----


type Msg
    = NoOp
    | RelationsMsg Relations.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        NoOp ->
            Cmd.withNoCmd model
        RelationsMsg subMsg ->
            Cmd.withNoCmd 
                { relations = Relations.update subMsg model.relations }


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
        [ Html.div
            [ Attrs.class "characters-page-container" ]
            [ Html.div
                [ Attrs.class "characters-list-container" ]
                [ Html.div
                    [ Attrs.class "characters-page-title" ]
                    [ Html.text "I personaggi" ]
                , Html.div
                    [ Attrs.class "characters-list" ]
                        <| List.map characterView Data.characters 
                ]
            , Html.div
                [ Attrs.class "characters-relations-container" ]
                [
                Html.div
                    [ Attrs.class "characters-relations" ]
                    [ showRelations model.relations ]
                ]
            ]
        ]

showRelations : Relations.Model -> Html Msg
showRelations model =
    Html.map RelationsMsg <| Relations.view model


characterView : T.Character -> Html Msg
characterView c =
    Html.div
        [ Attrs.class "characters-list-item" ]
        [ Html.a
            [ Route.href <| Route.Character c ]
            [ Html.text <| Show.character c ]
        ]