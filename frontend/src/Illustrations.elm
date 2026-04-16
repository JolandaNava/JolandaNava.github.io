
module Illustrations exposing (..)

import Svg exposing (Svg, svg, path)
import Svg.Attributes exposing (class, d, viewBox, style, width, height, fill)

sampleIllustration : Svg msg
sampleIllustration =
    svg [ style "", viewBox "" ]
        [ path [ d "" ] [] ]
