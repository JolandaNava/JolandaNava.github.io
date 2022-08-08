module Types exposing (..)

import Time exposing (Posix)
import Graph exposing (Edge, Graph)
import Dict exposing (Dict)


type Character
    = Rosetta
    | Irene
    | Panettiere
    | Farmacista
    | Papa
    | Mamma
    | Perpetua
    -- TODO add others

characterUniverse : List Character
characterUniverse =
    [ Rosetta
    , Irene
    , Panettiere
    , Farmacista
    , Papa
    , Mamma
    , Perpetua
    ]


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

type alias ChapterId = Int


type Book = Dict Int (Chapter, Timeline)