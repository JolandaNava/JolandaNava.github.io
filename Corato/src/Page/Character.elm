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
import Time

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
    Page.pageView "" "character"
        [ Html.div
            [ Attrs.class "character-title" ]
            [ Html.text <| Show.character character
            ]
        , Html.div
            [ Attrs.class "timeline-container" ]
            [ View.timeline (Just character) <| makeTimeline character ]
        ]

makeTimeline : T.Character -> List T.Event
makeTimeline c =
    List.filter (List.member c << .characters) Data.allEvents
