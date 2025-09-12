
module Illustrations exposing (..)

import Svg exposing (Svg, svg, path)
import Svg.Attributes exposing (class, d, viewBox, style, width, height, fill)

sampleIllustration : Svg msg
sampleIllustration =
    svg [ style "", viewBox "" ]
        [ path [ d "" ] [] ]

arrow_left : Svg msg
arrow_left =
    svg
        [ width "50"
        , height "50"
        , viewBox "0 0 24 24"
        , fill "000000"
        ]
        [ path
            [ d "M10 22L0 12L10 2L11.775 3.775L3.55 12L11.775 20.225L10 22Z"
            ] []
        ]

arrow_right : Svg msg
arrow_right =
    svg
        [ width "50"
        , height "50"
        , viewBox "0 0 24 24"
        , fill "000000"
        ]
        [ path
            [ d "M8.68247 22.9329L6.90747 21.1579L15.1325 12.9329L6.90747 4.70786L8.68247 2.93286L18.6825 12.9329L8.68247 22.9329Z"
            ] []
        ]