module Main exposing (..)

import Browser exposing (Document)
import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (src)
import Url exposing (Url)

---- MODEL ----


type alias Model =
    {}


init : () -> Url -> Key -> ( Model, Cmd Msg )
init _ _ _ =
    ( {}, Cmd.none )


---- UPDATE ----


type Msg
    = NoOp
    | ChangedUrl Url
    | ClickedLink Browser.UrlRequest


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Document Msg
view model =
    { title = "Corato - pagina"
    , body = view model
    }

content : Model -> List (Html Msg)
content model =
    [ div []
        [ h1 [] [ text "Corato" ]
        ]
    ]

---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.application
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        , onUrlChange = ChangedUrl
        , onUrlRequest = ClickedLink
        }
