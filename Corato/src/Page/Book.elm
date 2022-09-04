module Page.Book exposing (Model, Msg, init, update, view)

import Html exposing (Html)
import Html.Attributes as Attrs
import Browser exposing (Document)
import Html.Events as Events

import Types as T
import Page
import Data
import Route
import Show
import View

---- MODEL ----

type BookView
    = Chapters
    | Timeline

type alias Model =
    { view : BookView }


init : ( Model, Cmd Msg )
init =
    ( { view = Timeline }, Cmd.none )


---- UPDATE ----


type Msg
    = ChangeView BookView


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        ChangeView viewType -> ({ model| view = viewType }, Cmd.none)


---- VIEW ----


view : Model -> Document Msg
view model =
    { title = "Corato - Il Libro"
    , body = content model
    }

content :  Model -> List (Html Msg)
content  model =
    Page.pageView "Scopri il Libro" "book"
        [ viewControls model
        , case model.view of
           Chapters -> chaptersView
           Timeline -> timelineView
        ]


chaptersView : Html Msg
chaptersView  =
    Html.div
        [ Attrs.class "chapters-container" ]
            <| List.map chapter Data.book


chapter : T.Chapter -> Html Msg
chapter c =
    Html.div
        [ Attrs.class "chapter" ]
        [ Html.div 
            [ Attrs.class "chapter-details" ] 
            [ Html.div
                [ Attrs.class "chapter-title" ] 
                [ Html.text <| Show.chapterTitle c ]
            , Html.a
                [ Attrs.class "chapter-description" 
                , Route.href <| Route.Character c.narrator
                ] 
                [ Html.text <| c.description ]
            ]
        , Html.div
            [ Attrs.class "chapter-events" ]
            <| List.map View.event c.events
        ]

timelineView : Html Msg
timelineView =
    Html.div
        [ Attrs.class "timeline-container" ]
        [ View.timeline Nothing Data.allEvents ]


viewControls : Model -> Html Msg
viewControls model =
    Html.div
        [ Attrs.class "view-controls" ]
        [ Html.div
            [ Attrs.class "control-button"
            , Attrs.classList [("active", model.view == Chapters)]
            , Events.onClick <| ChangeView Chapters
            ]
            [ Html.text "I capitoli" ]
        , Html.div
            [ Attrs.class "control-button"
            , Attrs.classList [("active", model.view == Timeline)]
            , Events.onClick <| ChangeView Timeline
            ]
            [ Html.text "Gli eventi" ]

        ]