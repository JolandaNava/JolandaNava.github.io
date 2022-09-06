module Navigation exposing (simpleNav)

import Html exposing (Html)
import Route exposing (Route(..))
import Html.Attributes as Attrs

simpleNav : Html msg
simpleNav =
    Html.div
        [ Attrs.class "simple-nav" ]
        [ item Book
        , item Home
        , item Characters
        ]


item : Route -> Html msg
item r =
    Html.div
        [ Attrs.class "simple-nav-item" ]
        [ Html.a
            [ Route.href r
            ]
            [ Html.text <| showRoute r ]
        ]


showRoute : Route -> String
showRoute r =
    case r of
        Home -> "Corato"
        Book -> "Scopri il Libro"
        Characters -> "Scopri i Personaggi"
        _ -> "" -- other routes should not get shown