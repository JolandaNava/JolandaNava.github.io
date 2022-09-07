module Page.Book exposing (Model, Msg, init, update, view)

import Html exposing (Html)
import Html.Attributes as Attrs
import Browser exposing (Document)
import Html.Events as Events

import Illustrations
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
    ( { view = Chapters }, Cmd.none )


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
    Page.pageView "" "book"
        [ titleView model
        , case model.view of
           Chapters -> chaptersView
           Timeline -> timelineView
        -- , Html.div [Attrs.class "book-stack"] [ Illustrations.bookStack ] 
        ]


-- CHAPTERS VIEW
chaptersView : Html Msg
chaptersView  =
    Html.div [ Attrs.class "chapters-view" ]
        [ Html.div
            [ Attrs.class "chapters-container" ]
                <| List.map chapter Data.book
        ]


chapter : T.Chapter -> Html Msg
chapter c =
    Html.div
        [ Attrs.class "chapter" ]
        [ Html.div 
            [ Attrs.class "chapter-details" ] 
            [ chapterTitle c
            , Html.div
                [ Attrs.class "chapter-description" ]
                [ Html.a
                    [ Route.href <| Route.Character c.narrator
                    ] 
                    [ Html.text <| c.description ]
                ]
            ]
        , Html.div
            [ Attrs.class "chapter-events" ]
            <| List.map View.event c.events
        ]

chapterTitle : T.Chapter -> Html Msg
chapterTitle c =
    Html.div
        [ Attrs.class "chapter-title" ] 
        [ Html.span [] [ Html.text <| c.title ]
        , Html.span [ Attrs.class "number" ] [ Html.text <| "." ++ String.fromInt c.id ]
        ]


-- TIMELINE VIEW 

timelineView : Html Msg
timelineView =
    Html.div [ Attrs.class "timeline-view" ]
        [ Html.div
            [ Attrs.class "timeline-container" ]
            [ View.timeline Nothing Data.allEvents ]
        ]



titleView : Model -> Html Msg
titleView model =
    Html.div
        [ Attrs.class "book-navigation" ]
        [ Html.div
            [ Attrs.class "book-navigation-arrow"
            , Attrs.class "left"
            , Attrs.classList [("hidden", model.view == Chapters)]
            , Events.onClick <| ChangeView Chapters
            ]
            [ Html.text "torna ai capitoli" ]
        , Html.div
            [ Attrs.class "book-title" ]
            [ Html.text <|
                case model.view of
                    Chapters -> "I Capitoli"
                    Timeline -> "Gli Eventi"
            ]
        , Html.div
            [ Attrs.class "book-navigation-arrow"
            , Attrs.class "right"
            , Attrs.classList [("hidden", model.view == Timeline)]
            , Events.onClick <| ChangeView Timeline
            ]
            [ Html.text "scopri gli eventi" ]
        ]