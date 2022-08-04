module Types exposing (..)

import Time exposing Posix
-- import Graph exposing (Edge, Graph, Node)


type Character
    = Rosetta
    | Irene
    | Panettiere
    | Famacista
    | Papa
    | Mamma
    -- TODO add others

narrators : List Charater
narratros = [ Rosetta, Irene, Farmacista ]


type alias CharacterDescription =
    { character : Character
    , birthday : Date
    , death : Maybe Date
    , relations : Relation
    }

type alias Relation = String -- Edge String
-- type alias Relations = Graph Character String


type alias Event =
    { date : Date
    , title : String
    , description : String
    , characters : List Character
    , narrator : Character
    -- , chapter : Int
    }


type alias Date = Posix

type Timeline = List Event


-- type CharacterTimeline = CharacterTimeline Character Timeline


type alias Chapter =
    { id : Int
    , title : String
    , description : String
    , narrator : Character
    , period : (Date, Date)
    }


type Book = Dict Chapter Timeline