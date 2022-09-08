module Navigation exposing (simpleNav)

import Html exposing (Html)
import Route exposing (Route)
import Html.Attributes as Attrs

simpleNav : Html msg
simpleNav =
    Html.div
        [ Attrs.class "simple-nav" ]
        [ item <| Route.Book Route.Chapters
        , item Route.Home
        , item <| Route.Characters Route.Narrators
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
        Route.Home -> "Corato"
        Route.Book _ -> "Scopri il Libro"
        Route.Characters _ -> "Scopri i Personaggi"
        _ -> "" -- other routes should not get shown