module Show exposing (..)

import Types as T
import Time
-- import Graph exposing (Edge, Graph, Node)
import Graph.DOT as Graph


-- SHOW RELATIONS

relations : T.Relations -> String
relations r =
    Graph.output showNode showEdge r


showEdge : String -> Maybe String
showEdge = Just


showNode : T.Character -> Maybe String
showNode = Just << character



-- SHOW CHARACTERS 

character : T.Character -> String
character x =
    case x of
        T.Rosetta ->  "Rosetta"
        T.Irene -> "Irene"
        T.Panettiere -> "Panettiere"
        T.Farmacista -> "Farmacista"
        T.Papa -> "Papa"
        T.Mamma -> "Mamma"
        T.Perpetua -> "Perpetua"


-- SHOW Date

zone : Time.Zone
zone = Time.utc

fullDate : T.Date -> String
fullDate d =
    String.join " "
        [ String.fromInt <| Time.toDay zone d
        , month <| Time.toMonth zone d
        , String.fromInt <| Time.toYear zone d
        ]

year : T.Date -> String
year d =
    String.fromInt <| Time.toYear zone d

month : Time.Month -> String
month m =
    case m of
        Time.Jan -> "Jan"
        Time.Feb -> "Feb"
        Time.Mar -> "Mar"
        Time.Apr -> "Apr"
        Time.May -> "May"
        Time.Jun -> "Jun"
        Time.Jul -> "Jul"
        Time.Aug -> "Aug"
        Time.Sep -> "Sep"
        Time.Oct -> "Oct"
        Time.Nov -> "Nov"
        Time.Dec -> "Dec"