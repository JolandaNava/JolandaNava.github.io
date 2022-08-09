module Page.Characters exposing (Model, Msg, init, update, view)

import Html exposing (Html)
import Html.Attributes as Attrs
import Browser exposing (Document)

import Data exposing (relations)
import Show
import Page
import Types as T

---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )


---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        NoOp -> (model, Cmd.none)


---- VIEW ----


view : Model -> Document Msg
view model =
    { title = "Corato - I Personaggi"
    , body = content model
    }

content :  Model -> List (Html Msg)
content  _ =
    Page.pageView "Scopri i Personaggi" "characters"
        [ Html.div
            [ Attrs.class "characters-page-container" ]
            [ Html.div
                [ ]
                [ Html.div
                    [ Attrs.class "characters-page-title" ]
                    [ Html.text "I personaggi" ]
                , Html.div
                    [ ]
                        <| List.map characterView Data.characters 
                ]
            , Html.div
                [ ]
                [ Html.div
                    [ Attrs.class "characters-page-title" ]
                    [ Html.text "Le relazioni" ]
                , Html.div
                    [ Attrs.class "characters-relations" ]
                    [ Html.text "Coming soon..." ]
                    -- [ Html.text showRelations ] 
                ]
            ]
        ]

showRelations : String
showRelations =
    Show.relations Data.relations


characterView : T.Character -> Html Msg
characterView c =
    Html.div
        [ Attrs.class "characters-list-item" ]
        [ Html.text <| Show.character c
        ]