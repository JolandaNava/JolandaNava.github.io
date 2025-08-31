module Navigation exposing (simpleNav)

import Html exposing (Html)
import Route exposing (Route)
import Html.Attributes as Attrs

simpleNav : Html msg
simpleNav =
    Html.div
        [ Attrs.class "simple-nav" ]
        [ -- ex: item Route.Home 

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
        Route.Home -> "Home"
        _ -> "" -- other routes should not get shown