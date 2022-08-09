module Types exposing (..)

import Time exposing (Posix)
import Graph exposing (Edge, Graph)


type Character
    = Rosetta
    | Irene
    | Panettiere
    | Farmacista
    | Papa
    | Mamma
    | Perpetua
    -- TODO add others


type alias CharacterDescription = 
    { description : String
    , birthday : Date
    , death : Maybe Date
    -- , relations : Relation
    }

type alias Relation = Edge String

type alias Relations = Graph Character String


type alias Event =
    { date : Date
    , title : String
    , description : String
    , characters : List Character
    , narrator : Character
    }


type alias Date = Posix

-- type alias Timeline = List Event


type alias Chapter =
    { id : Int
    , title : String
    , description : String
    , narrator : Character
    , period : (Date, Date)
    , events : List Event
    }

type alias ChapterId = Int


type alias Book = List Chapter