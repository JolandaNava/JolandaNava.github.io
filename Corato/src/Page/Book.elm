module Page.Book exposing (Model, Msg, init, update, view)

import Html exposing (Html, text, div, h1)
import Browser exposing (Document)

import Page

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
    { title = "Corato - The Book"
    , body = content model
    }

content :  Model -> List (Html Msg)
content  _ =
    Page.pageView "Discover the Book"
        [ div [] [ Html.text "book here!" ]
        ]