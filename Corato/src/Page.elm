module Page exposing (pageView)

import Html exposing (Html)
import Html.Attributes as Attrs

import Navigation

pageView : String -> List (Html msg) -> List (Html msg)
pageView pageName content =
    [ Html.div
        [ Attrs.class "corato-page" ]
        <| List.append
            [ Html.div
                [ Attrs.class "page-top-banner" ]
                [ Navigation.simpleNav
                , Html.div
                    [ Attrs.class "page-title" ]
                    [ Html.text pageName ]
                ]
            ]
            content
    ]