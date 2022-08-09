module Navigation exposing (simpleNav)

import Html exposing (Html)
import Route exposing (Route(..))
import Html.Attributes as Attrs

simpleNav : Html msg
simpleNav =
    Html.div
        [ Attrs.class "simple-nav" ]
        [ icon Home
        , icon Book
        , icon Characters
        ]


icon : Route -> Html msg
icon r =
    Html.a
        [ Route.href r ]
        [ Html.text <| showRoute r ]


showRoute : Route -> String
showRoute r =
    case r of
        Home -> "Corato"
        Book -> "Il Libro"
        Characters -> "I Personaggi"
        NotFound -> "404"