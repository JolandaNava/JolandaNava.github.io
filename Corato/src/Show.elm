module Show exposing (..)

import Types as T
import Time
-- import Graph exposing (Edge, Graph, Node)
import Graph.DOT as Graph
import Data


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
character =
    .fullName << Data.characterDescription


-- SHOW CHAPTERS
chapterTitle : T.Chapter -> String
chapterTitle c =
    String.fromInt c.id ++ ". " ++ c.title


-- SHOW DATES

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
        Time.Jan -> "Gennaio"
        Time.Feb -> "Febbraio"
        Time.Mar -> "Marzo"
        Time.Apr -> "Aprile"
        Time.May -> "Maggio"
        Time.Jun -> "Giugno"
        Time.Jul -> "Luglio"
        Time.Aug -> "Agosto"
        Time.Sep -> "Settembre"
        Time.Oct -> "Ottobre"
        Time.Nov -> "Novembre"
        Time.Dec -> "Dicembre"