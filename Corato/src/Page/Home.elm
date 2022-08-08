module Page.Home exposing (Model, Msg, init, update, view)

import Html exposing (Html, text, div, h1)
import Browser exposing (Document)
import Cmd.Extra as Cmd
import Html.Attributes as Attrs
import Html.Events as Events

import Route
import Page

---- MODEL ----


type alias Model =
    { content : Int }


init : ( Model, Cmd Msg )
init =
    ( { content = 0 }, Cmd.none )


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
    { title = "Corato"
    , body = content model
    }

content :  Model -> List (Html Msg)
content  model =
    Page.pageView "Home"
        [ Html.a
            [ Route.href Route.Book ]
            [ Html.text "Discover the Book" ]

        , Html.a
            [ Route.href Route.Characters ]
            [ Html.text "Discover the Characters" ]
        ]