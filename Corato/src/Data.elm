module Data exposing (..)


import Types as T
import Time
import Graph exposing (Node)


narrators : List T.Character
narrators = [ T.Rosetta, T.Irene, T.Farmacista, T.Perpetua ]


-- IL LIBRO
book : T.Book
book =
    List.sortBy getId
        [ chapter1
        , chapter2
        ]

getId : T.Chapter -> Int
getId = .id

-- I CAPITOLI
chapter1 : T.Chapter
chapter1 =
    { id = 1
    , title = "Così la gente ci crede di più"
    , description = "Mariagreca, la perpetua"
    , narrator = T.Perpetua
    , period = (fakeDate, fakeDate)
    , events = chapter1Events
    }

chapter2 : T.Chapter
chapter2 =
    { id = 2
    , title = "Splendida e sola"
    , description = "Andrea Suonatori, farmacista"
    , narrator = T.Farmacista
    , period = (fakeDate, fakeDate)
    , events = chapter2Events
    }

-- GLI EVENTI

chapter1Events : List T.Event
chapter1Events = [ inChiesa ]

inChiesa : T.Event
inChiesa =
    { date = fakeDate
    , title = "Starnuto in Chiesa"
    , description = "Rosetta starnutisce in chiesa"
    , characters = [T.Perpetua, T.Rosetta, T.Mamma, T.Papa]
    , narrator = T.Perpetua
    }


chapter2Events : List T.Event
chapter2Events = [ laCena ]

laCena : T.Event
laCena =
    { date = fakeDate
    , title = "Annuncio del matrimonio"
    , description = "Il papà annuncia il matrimonio tra Rosetta e il panettiere"
    , characters = [T.Rosetta, T.Mamma, T.Papa, T.Farmacista, T.Panettiere]
    , narrator = T.Farmacista
    }

fakeDate : T.Date
fakeDate = Time.millisToPosix 0


-- I PERSONAGGI


characterDescription : T.Character -> T.CharacterDescription
characterDescription c =
    case c of
        T.Rosetta -> rosetta
        _ -> rosetta


rosetta : T.CharacterDescription
rosetta =
    { description = "La protagonista"
    , birthday = fakeDate
    , death = Nothing
    }


-- LE RELAZIONI


relations : T.Relations
relations =
    Graph.fromNodesAndEdges charactersAsNodes relationsAsEdges


charactersAsNodes : List (Node T.Character)
charactersAsNodes =
    let
        
        makeNode : Int -> T.Character -> Node T.Character
        makeNode i c =
            { id = i
            , label = c
            }

    in
        List.indexedMap makeNode T.characterUniverse



relationsAsEdges : List T.Relation
relationsAsEdges =
    [ 
        { from = 4
        , to = 0
        , label = "è padre di"
        }
    , 
        { from = 5
        , to = 0
        , label = "è madre di"
        }
    , 
        { from = 5
        , to = 0
        , label = "è promesso in sposo a"
        }
    , 
        { from = 0
        , to = 5
        , label = "è promessa in sposa a"
        }
    ]

