module Types exposing (..)

import Time exposing (Posix)
import Graph exposing (Edge, Graph)


type Character
    -- I Suonatori
    = Andrea -- la farmacista
    | Rocco -- il fratello, avvocato
    | SignSuonatori -- la mamma
    | Alfredo -- il papa

    -- I Tedone
    | Riccardo -- il papa panettiere
    | Chiara -- la moglie (cugina di papa Suonatori)
    | Gabriele -- il figlio

    -- Gli Zitoli
    | Nunzio
    | Rita
    | Rosetta
    | Grazia
    | Isabella
    | NonnaMaria -- mamma di Rita

    | Bruno -- marito di Grazia, carabiniere
    | Vincenzo -- bimbo di Grazia

    -- Gli Strippoli
    | Irene -- Irene Strippoli
    | Tommaso -- Tommaso Strippoli
    | Alessandra -- Alessandra Strippoli

    -- Altri
    | DonCataldo -- Randolfi
    | Livio -- Patruno, negozio di stoffe
    | Perpetua
    | DonSaverio -- il parroco
    | Antonio -- Antonio Tandoi


type alias CharacterDescription = 
    { fullName : String
    , description : String
    , birthday : Date
    , death : Maybe Date
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