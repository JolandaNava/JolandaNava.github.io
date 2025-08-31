module Page.Home exposing (Model, Msg, init, update, view)

import Html exposing (Html)
import Browser exposing (Document)
import Cmd.Extra as Cmd
import Html.Attributes as Attrs

import Illustrations
import Route
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
    { title = "Come back later"
    , body = content model
    }

content :  Model -> List (Html Msg)
content  _ =
    Page.homePageView "Home" "home"
        [ Html.div []
            [ Html.text "Something is brewing, come back later to see what..."
            ]
        -- , Html.div [ Attrs.class "open-book" ] [Illustrations.openBook]
        ]