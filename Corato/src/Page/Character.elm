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
    Page.pageView (Show.character character) "character"
        [ Html.div
            [ Attrs.class "character-content" ]
            [  Html.div
                [ Attrs.class "character-details-column" ]
                [ Html.div 
                    [ Attrs.class "character-details" ]
                        <| characterView <| Data.characterDescription character
                ]
            , Html.div
                [ Attrs.class "character-events-column" ]
                [ Html.div
                    [ Attrs.class "character-events" ]
                        <| makeTimeline character
                ]
            ]
        ]


characterView : T.CharacterDescription -> List (Html Msg)
characterView cd =
    [ Html.div
        [ Attrs.class "character-name" ] 
        [ Html.text cd.description ]
    , Html.div
        [ Attrs.class "dates" ]
        [ Html.text <| Show.fullDate cd.birthday
        , Html.text " - "
        , Html.text <| Maybe.withDefault " " <| Maybe.map Show.fullDate cd.death
        ]
    ]



makeTimeline : T.Character -> List (Html Msg)
makeTimeline c =
    let
        characterIsPresent =
            List.member c << .characters

        orderByDate = List.sortBy (Time.posixToMillis << .date)

    in
        List.map View.event
            <| orderByDate
            <| List.filter characterIsPresent Data.allEvents
