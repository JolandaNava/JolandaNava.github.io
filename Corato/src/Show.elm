module Show exposing (..)

import Types as T
import Dict
import Time
import Graph exposing (Edge, Graph, Node)
import Graph.DOT as Graph


-- SHOW RELATIONS

relations : T.Relations -> String
relations r =
    Graph.output showNode showEdge r


showEdge : String -> Maybe String
showEdge = Just


showNode : T.Character -> Maybe String
showNode = Just << showCharacter



-- SHOW CHARACTERS 

showCharacter : T.Character -> String
showCharacter x =
    case x of
        T.Rosetta ->  "Rosetta"
        T.Irene -> "Irene"
        T.Panettiere -> "Panettiere"
        T.Farmacista -> "Farmacista"
        T.Papa -> "Papa"
        T.Mamma -> "Mamma"
        T.Perpetua -> "Perpetua"