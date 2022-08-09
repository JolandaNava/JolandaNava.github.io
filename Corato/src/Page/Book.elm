module Page.Book exposing (Model, Msg, init, update, view)

import Html exposing (Html)
import Html.Attributes as Attrs
import Browser exposing (Document)


import Types as T
import Page
import Data
import Show
import Route

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
    { title = "Corato - Il Libro"
    , body = content model
    }

content :  Model -> List (Html Msg)
content  _ =
    Page.pageView "Scopri il Libro" "book"
        [ Html.div
            [ Attrs.class "chapters-container" ]
                <| List.map chapterView Data.book

        ]


chapterView : T.Chapter -> Html Msg
chapterView c =
    Html.div
        [ Attrs.class "chapter" ]
        [ Html.div 
            [ Attrs.class "chapter-details" ] 
            [ Html.div
                [ Attrs.class "chapter-title" ] 
                [ Html.text <| c.title ]
            , Html.a
                [ Attrs.class "chapter-description" 
                , Route.href Route.Characters -- TODO link to character page
                ] 
                [ Html.text <| c.description ]
            ]
        , Html.div
            [ Attrs.class "chapter-events" ]
            <| List.map eventsView c.events
        ]


eventsView : T.Event -> Html Msg
eventsView e =
    Html.div 
        [ Attrs.class "event" ]
        [ Html.div
            [ Attrs.class "event-title" ]
            [ Html.text e.title ]
        , Html.div
            [ Attrs.class "event-date" ]
            [ Html.text <| Show.fullDate e.date ]
        , Html.div
            [ Attrs.class "event-description" ]
            [ Html.text e.description ]
        , Html.div
            [ Attrs.class "event-characters" ]
            <| characters e.characters

        ]

characters : List T.Character -> List (Html Msg)
characters cs =
    List.concat
        [ [ Html.text "I personaggi: " ]
        , List.intersperse (Html.text ", ") <| List.map character cs
        ]


character : T.Character -> Html Msg
character c =
    Html.a
        [ Route.href Route.Characters ] --todo route to proper character
        [ Html.text <| Show.character c ]