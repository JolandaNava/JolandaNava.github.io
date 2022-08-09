module View exposing (..)

import Html exposing (Html)
import Html.Attributes as Attrs

import Types as T
import Show
import Route


event : T.Event -> Html msg
event e =
    Html.div 
        [ Attrs.class "event-view" ]
        [ Html.div
            [ Attrs.class "event-title" ]
            [ Html.text e.title ]
        , Html.div
            [ Attrs.class "event-date" ]
            [ Html.text <| Show.fullDate e.date ]
        , Html.div
            [ Attrs.class "event-description" ]
            [ Html.text e.description ]
        , Html.div
            [ Attrs.class "event-characters" ]
            <| characters e.characters

        ]

characters : List T.Character -> List (Html msg)
characters cs =
    List.concat
        [ [ Html.text "I personaggi: " ]
        , List.intersperse (Html.text ", ") <| List.map character cs
        ]



character : T.Character -> Html msg
character c =
    Html.a
        [ Attrs.class "character-view" 
        , Route.href <| Route.Character c
        ]
        [ Html.text <| Show.character c ]