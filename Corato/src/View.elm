module View exposing (event, character, timeline)

import Html exposing (Html)
import Html.Attributes as Attrs

import Data
import Types as T
import Show
import Route


event : T.Event -> Html msg
event e =
    Html.div 
        [ Attrs.class "event-view" ]
        [ Html.div []
            [ Html.div
                [ Attrs.class "event-title" ]
                [ Html.text e.title ]
            , Html.div
                [ Attrs.class "event-date" ]
                [ Html.text <| Show.fullDate e.date ]
            , Html.div
                [ Attrs.class "event-description" ]
                [ Html.text e.description ]
            ]
        , Html.div
            [ Attrs.class "event-characters" ]
            <| charactersLink e.characters
        ]

charactersLink : List T.Character -> List (Html msg)
charactersLink cs =
        Html.text "I personaggi: " :: (List.intersperse (Html.text ", ") <| List.map characterLink cs)


characterLink : T.Character -> Html msg
characterLink c =
    Html.a
        [ Attrs.class "characte-link-view" 
        , Route.href <| Route.Character c
        ]
        [ Html.text <| Show.character c ]


character : T.Character -> Html msg
character c =
    let
        cd = Data.characterDescription c
        chpt = Data.chapterNarratedBy c
    
    in
        Html.div 
            [ Attrs.class "character-view" ]
            [ Html.div []
                [ Html.div
                    [ Attrs.class "character-name" ]
                    [ characterLink c ]
                , Html.div
                    [ Attrs.class "character-dates" ]
                    [ Html.text <| lifeSpan cd ]
                    -- [ Html.text <| Show.fullDate cd.birthday ]
                , Html.div
                    [ Attrs.class "character-description" ]
                    [ Html.text cd.description ]
                ]
            , Html.div
                [ Attrs.class "character-chapter" ]
                [ Html.text <| Maybe.withDefault "" <| Maybe.map Show.chapterTitle chpt ]
            ]


lifeSpan : T.CharacterDescription -> String
lifeSpan cd =
    case cd.death of
        Nothing ->
            Show.fullDate cd.birthday

        Just death ->
            String.join " "
                [ Show.fullDate cd.birthday
                , "-"
                , Show.fullDate death
                ]

timeline : Maybe T.Character -> List T.Event -> Html msg
timeline c es =
    let
        timelineLine =
            Html.div [Attrs.class "timeline-main-line"] []

        wrapEvent : T.Event -> Html msg
        wrapEvent e =
            Html.div [ Attrs.class "timeline-view-event" ]
                [ Html.div [ Attrs.class "timeline-event-line" ] []
                , Html.div [ Attrs.class "timeline-event-horizontal-line" ] []
                , event e
                ]

        events = List.map wrapEvent es

    in
        Html.div
            [ Attrs.class "timeline-view" ]
                <| case c of
                    Just cha -> timelineLine :: character cha :: events
                    Nothing  -> timelineLine :: events