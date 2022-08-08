module Data exposing (..)


import Types as T
import Dict
import Time
import Graph exposing (Edge, Graph, Node)


narrators : List T.Character
narratros = [ T.Rosetta, T.Irene, T.Farmacista, T.Perpetua ]


-- IL LIBRO
book : T.Book
book =
    Dict.fromList createBook


createBook : List (Int, (T.Chapter, T.Timeline))
createBook =
    [ ( getId chapter1, (chapter1, chapter1Timeline) )
    , ( getId chapter2, (chapter2, chapter2Timeline) )
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
    }

chapter2 : T.Chapter
chapter2 =
    { id = 2
    , title = "Splendida e sola"
    , description = "Andrea Suonatori, farmacista"
    , narrator = T.Farmacista
    , period = (fakeDate, fakeDate)
    }

-- GLI EVENTI

chapter1Timeline : T.Timeline
chapter1Timeline = [inChiesa]

inChiesa : T.Event
inChiesa =
    { date = fakeDate
    , title = "Startuto in Chiesa"
    , description = "Rosetta starnutisce in chiesa"
    , characters = [T.Perpetua, T.Rosetta, T.Mamma, T.Papa]
    , narrator = T.Perpetua
    }


chapter2Timeline : T.Timeline
chapter2Timeline = [laCena]

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


-- characterUniverse

-- charactersAsNodes : List (Node T.Character)
-- charactersAsNodes =
--     let
--         mmap : Int -> T.Character -> Node T.Character
--         mmap i c =
--             { id = i
--             , label c
--             }

--     in
--         List.indexedMap mmap characterUniverse 
