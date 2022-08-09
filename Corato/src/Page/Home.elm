module Page.Home exposing (Model, Msg, init, update, view)

import Html exposing (Html)
import Browser exposing (Document)
import Cmd.Extra as Cmd
import Html.Attributes as Attrs

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
content  _ =
    Page.pageView "Corato" "home"
        [ Html.a
            [ Attrs.class "home-page-main-button"
            , Route.href Route.Book
            ]
            [ Html.text "Discover the Book" ]

        , Html.a
            [ Attrs.class "home-page-main-button"
            , Route.href Route.Characters
            ]
            [ Html.text "Discover the Characters" ]
        ]