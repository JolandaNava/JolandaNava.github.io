
module Page exposing (pageView, homePageView)

import Html exposing (Html)
import Html.Attributes as Attrs

import Navigation

pageView : String -> String -> List (Html msg) -> List (Html msg)
pageView pageName class content =
    [ Html.div
        [ Attrs.class "page"
        , Attrs.class class
        ]
        <| List.append
            [ Navigation.simpleNav
            , Html.div
                [ Attrs.class "page-top-banner" ]
                [ Html.div
                    [ Attrs.class "page-title" ]
                    [ Html.text pageName ]
                ]
            ]
            content
    ]

homePageView : String -> String -> List (Html msg) -> List (Html msg)
homePageView pageName class content =
    [ Html.div
        [ Attrs.class "page"
        , Attrs.class class
        ]
        content
    ]
