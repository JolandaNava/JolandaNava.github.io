module Page.Character exposing (..)

import Html exposing (Html)
import Html.Attributes as Attrs
import Browser exposing (Document)


import Show
import Page
import Types as T
import Show
import Data
import View

---- MODEL ----


type alias Model =
    { character : T.Character
    }


init : T.Character -> ( Model, Cmd Msg )
init c =
    ( { character = c }, Cmd.none )


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
    { title = "Corato - " ++ ( Show.character model.character)
    , body = content model
    }

content :  Model -> List (Html Msg)
content  { character } =
    Page.pageView (Show.character character) "character"
        [ Html.div
            [ Attrs.class "character-container" ]
            [ Html.div
                [ Attrs.class "character-details" ]
                [ Html.text <| .description <| Data.characterDescription character
                ]
            , Html.div
                [ Attrs.class "character-events" ]
                <| makeTimeline character
            ]
        ]


makeTimeline : T.Character -> List (Html Msg)
makeTimeline c =
    let
        events = Data.allEvents -- TODO filter
    in
        List.map View.event events

