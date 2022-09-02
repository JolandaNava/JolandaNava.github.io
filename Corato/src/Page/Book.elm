module Page.Book exposing (Model, Msg, init, update, view)

import Html exposing (Html)
import Html.Attributes as Attrs
import Browser exposing (Document)


import Types as T
import Page
import Data
import Route
import Show
import View

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
