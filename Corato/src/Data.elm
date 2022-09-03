module Data exposing (..)

import List.Extra as List

import Types as T
import Time
import Graph exposing (Graph, Node, Edge)


-- IL LIBRO
book : T.Book
book =
    List.sortBy getId
        [ chapter1
        , chapter2
        , chapter3
        , chapter4
        , chapter5
        , chapter6

        , chapter12
        ]

getId : T.Chapter -> Int
getId = .id

sorted : List T.Event -> List T.Event
sorted = List.sortBy (Time.posixToMillis << .date)

-- I CAPITOLI
chapter1 : T.Chapter
chapter1 =
    { id = 1
    , title = "Così la gente ci crede di più"
    , description = "Mariagreca, la perpetua"
    , narrator = T.Perpetua
    , period = (fakeDate, fakeDate)
    , events = sorted chapter1Events
    }

chapter2 : T.Chapter
chapter2 =
    { id = 2
    , title = "Splendida e sola"
    , description = "Andrea Suonatori, farmacista"
    , narrator = T.Andrea
    , period = (fakeDate, fakeDate)
    , events = sorted chapter2Events
    }

chapter3 : T.Chapter
chapter3 =
    { id = 3
    , title = "La bocca sporca"
    , description = "Antonio Tandoi"
    , narrator = T.Antonio
    , period = (fakeDate, fakeDate)
    , events = []
    }

chapter4 : T.Chapter
chapter4 =
    { id = 4
    , title = "Le stanze che traboccano"
    , description = "Tommaso Strippoli"
    , narrator = T.Tommaso
    , period = (fakeDate, fakeDate)
    , events = []
    }

chapter5 : T.Chapter
chapter5 =
    { id = 5
    , title = "Mio, mio, mio"
    , description = "Livio Patruno, negoziante di stoffe"
    , narrator = T.Livio
    , period = (fakeDate, fakeDate)
    , events = []
    }

chapter6 : T.Chapter
chapter6 =
    { id = 6
    , title = "La Malascenima"
    , description = "Irene Strippoli"
    , narrator = T.Irene
    , period = (fakeDate, fakeDate)
    , events = sorted chapter6Events
    }

chapter12 : T.Chapter
chapter12 =
    { id = 12
    , title = "La ragione"
    , description = "Rosetta Zitoli"
    , narrator = T.Rosetta
    , period = (fakeDate, fakeDate)
    , events = sorted chapter12Events
    }

-- GLI EVENTI

allEvents : List T.Event
allEvents =
    List.concat <| List.map .events book

-- Chapter 1
chapter1Events : List T.Event
chapter1Events = [ inChiesa, pranzoDagliZitoli ]

inChiesa : T.Event
inChiesa =
    { date = Time.millisToPosix -532310400000
    , title = "Starnuto in Chiesa"
    , description = "Rosetta starnutisce in chiesa durante la messa del mercoledí delle ceneri"
    , characters = [T.Perpetua, T.Rosetta, T.DonSaverio]
    , narrator = T.Perpetua
    }

pranzoDagliZitoli : T.Event
pranzoDagliZitoli =
    { date = Time.millisToPosix -532310400000
    , title = "Pranzo dagli Zitoli"
    , description = "La Perpetua e Don Saverio vanno a pranzo dagli Zitoli dopo la messa"
    , characters = [T.Perpetua, T.Rosetta, T.Rita, T.Nunzio, T.Grazia, T.Isabella, T.NonnaMaria, T.DonSaverio]
    , narrator = T.Perpetua
    }

-- Chapter 2
chapter2Events : List T.Event
chapter2Events = [ armadio, annuncio, comingOut ]

armadio : T.Event
armadio =
    { date = fakeDate -- ? 10 anni, a novembre
    , title = "L'armadio"
    , description = "Mentre Andrea prova i vestiti di sua madre, suo padre rientra dalla farmacia"
    , characters = [T.Rosetta, T.Rita, T.Nunzio, T.Andrea, T.Gabriele]
    , narrator = T.Andrea
    }

annuncio : T.Event
annuncio =
    { date = Time.millisToPosix -528940800000
    , title = "Annuncio del matrimonio"
    , description = "Il papà annuncia il matrimonio tra Rosetta e il panettiere"
    , characters = [T.Rosetta, T.Rita, T.Nunzio, T.Andrea, T.Gabriele, T.DonSaverio, T.Bruno]
    , narrator = T.Andrea
    }

comingOut : T.Event
comingOut =
    { date = Time.millisToPosix -528940800000
    , title = "Andrea si confida con Rosetta"
    , description = "Rocco accompagna Andrea e Rosetta in farmacia per prendersi cura della ferita di Rosetta. Una volta soli, Andrea si confida."
    , characters = [T.Rosetta, T.Andrea]
    , narrator = T.Andrea
    }


-- Chapter 6
chapter6Events : List T.Event
chapter6Events = [ tommasoLasciaCasa, laPistola, mammaUbriaca, vestitoVerde, ireneVedeGabriele, ireneConosceGabriele, isabellaTrovaFede ]

tommasoLasciaCasa : T.Event
tommasoLasciaCasa =
    { date = Time.millisToPosix -792982800000
    , title = "Il papà di Irene le lascia"
    , description = "Tommaso Strippoli abbandona moglie e figlia per andarsene con l'amante. Irene viene presa in casa dagli Zitoli"
    , characters = [ T.Irene, T.Tommaso, T.Alessandra, T.Nunzio, T.Rosetta ]
    , narrator = T.Irene
    }

laPistola : T.Event
laPistola =
    { date = fakeDate
    , title = "Vincenzino spara un colpo"
    , description = "Vincenzo trova la pistola del papà in casa e spara un colpo, forse ferendo un animale. Da allora, smette di parlare."
    , characters = [ T.Vincenzo ]
    , narrator = T.Irene
    }

vestitoVerde : T.Event
vestitoVerde =
    { date = Time.millisToPosix -760582800000
    , title = "Il decimo compleanno di Irene"
    , description = "Nunzio porta Irene a Bari, nel rientro comprano un vestito verde da regalare a Rosetta."
    , characters = [T.Nunzio, T.Irene]
    , narrator = T.Irene
    }

mammaUbriaca : T.Event
mammaUbriaca =
    { date = Time.millisToPosix -696992400000
    , title = "La mamma cerca di vedere Irene"
    , description = "La mamma di Irene si presenta dagli Zitoli ubriaca, chiedendo di riavere la figlia."
    , characters = [ T.Alessandra, T.Nunzio, T.Rita, T.Irene, T.Rosetta]
    , narrator = T.Irene
    }

ireneVedeGabriele : T.Event
ireneVedeGabriele =
    { date = Time.millisToPosix -559270800000
    , title = "Irene vede Gabriele"
    , description = "Irene vede Gabriele per la prima volta dietro al bancone del panificio."
    , characters = [ T.Irene, T.Gabriele ]
    , narrator = T.Irene
    }

ireneConosceGabriele : T.Event
ireneConosceGabriele =
    { date = Time.millisToPosix -554950800000
    , title = "Irene e Gabriele si parlano"
    , description = "Gabriele accompagna a casa Irene e per la prima volta si parlano."
    , characters = [ T.Irene, T.Gabriele ]
    , narrator = T.Irene
    }

isabellaTrovaFede : T.Event
isabellaTrovaFede =
    { date = Time.millisToPosix -570762000000
    , title = "Isabella trova la fede"
    , description = "Isabella dice di voler diventare suora."
    , characters = [ T.Isabella ]
    , narrator = T.Irene
    }

-- Chapter 12
chapter12Events : List T.Event
chapter12Events = [ ilfattaccio ]

ilfattaccio : T.Event
ilfattaccio =
    { date = Time.millisToPosix -499910400000
    , title = "L'omicidio"
    , description = "A carnevale, Rosetta compie l'omicidio"
    , characters = [T.Rosetta, T.Gabriele]
    , narrator = T.Rosetta
    }

fakeDate : T.Date
fakeDate = Time.millisToPosix -631152000000



-- I PERSONAGGI

-- WARNING don't change the order of these
characters : List T.Character
characters =
    -- I Suonatori
    [ T.Andrea -- 0
    , T.Rocco -- 1
    , T.SignSuonatori -- 2
    , T.Alfredo -- 3

    -- I Tedone
    , T.Riccardo -- 4
    , T.Chiara -- 5
    , T.Gabriele -- 6

    -- Gli Zitoli
    , T.Nunzio -- 7
    , T.Rita -- 8
    , T.Rosetta  -- 9
    , T.Grazia -- 10
    , T.Isabella -- 11
    , T.NonnaMaria -- 12

    , T.Bruno -- 13
    , T.Vincenzo -- 14

    -- Altri
    , T.Irene -- 15
    , T.Tommaso -- 16
    , T.Alessandra -- 17
    , T.DonCataldo -- 18
    , T.Livio -- 19
    , T.Perpetua -- 20
    , T.DonSaverio -- 21

    ]

narrators : List T.Character
narrators = [ T.Perpetua, T.Andrea, T.Antonio, T.Tommaso, T.Livio, T.Irene, T.Nunzio, T.Rita, T.Isabella, T.Rosetta ]

chapterNarratedBy : T.Character -> Maybe T.Chapter
chapterNarratedBy c =
    List.find ((==) c << .narrator) book



characterDescription : T.Character -> T.CharacterDescription
characterDescription c =
    case c of
        T.Andrea -> andrea
        T.Rocco -> rocco
        T.SignSuonatori -> mammasuonatori
        T.Alfredo -> alfredo

    -- I Tedone
        T.Riccardo -> riccardo
        T.Chiara -> chiara
        T.Gabriele -> gabriele

    -- Gli Zitoli
        T.Nunzio -> nunzio
        T.Rita -> rita
        T.Rosetta -> rosetta
        T.Grazia -> grazia
        T.Isabella -> isabella
        T.NonnaMaria -> nonnaMaria

        T.Bruno -> bruno
        T.Vincenzo -> vincenzo
    
    -- Gli Strippoli
        T.Irene -> irene
        T.Tommaso -> tommaso
        T.Alessandra -> alessandra

    -- Altri
        T.DonCataldo -> donCataldo
        T.Livio -> livio
        T.Perpetua -> perpetua
        T.DonSaverio -> donSaverio
        T.Antonio -> antonio


andrea : T.CharacterDescription
andrea =
    { fullName = "Andrea Suonatori"
    , description = "Farmacista"
    , birthday = fakeDate
    , death = Nothing
    }

rocco : T.CharacterDescription
rocco =
    { fullName = "Rocco Suonatori"
    , description = "Fratello di Andra, avvocato"
    , birthday = fakeDate
    , death = Nothing
    }

mammasuonatori : T.CharacterDescription
mammasuonatori =
    { fullName = "Mamma Suonatori"
    , description = ""
    , birthday = fakeDate
    , death = Just <| Time.millisToPosix -534038400000
    }

alfredo : T.CharacterDescription
alfredo =
    { fullName = "Alfredo Suonatori"
    , description = "Farmacista, ha passato il negozio ad Andrea"
    , birthday = fakeDate
    , death = Just <| Time.millisToPosix -852076800000
    }

riccardo : T.CharacterDescription
riccardo =
    { fullName = "Riccardo Tedone"
    , description = "Panettiere"
    , birthday = fakeDate
    , death = Nothing
    }

chiara : T.CharacterDescription
chiara =
    { fullName = "Chiara Tedone"
    , description = "La moglie del panettiere"
    , birthday = fakeDate
    , death = Nothing
    }

gabriele : T.CharacterDescription
gabriele =
    { fullName = "Gabriele Tedone"
    , description = "Il figlio del panettiere"
    , birthday = fakeDate
    , death = Nothing
    }

nunzio : T.CharacterDescription
nunzio =
    { fullName = "Nunzio Zitoli"
    , description = "Il papà di Rosetta, maestro di musica"
    , birthday = fakeDate
    , death = Nothing
    }

rita : T.CharacterDescription
rita =
    { fullName = "Rita Zitoli"
    , description = "La mamma di Rosetta, la sarta"
    , birthday = fakeDate
    , death = Nothing
    }

rosetta : T.CharacterDescription
rosetta =
    { fullName = "Rosa Maria (Rosetta) Zitoli"
    , description = "La protagonista"
    , birthday = Time.millisToPosix -1104454800000 
    , death = Nothing
    }

grazia : T.CharacterDescription
grazia =
    { fullName = "Grazia Zitoli"
    , description = "La sorella di Rosetta, quella bella"
    , birthday = Time.millisToPosix -1357002000000
    , death = Nothing
    }

isabella : T.CharacterDescription
isabella =
    { fullName = "Isabella Zitoli"
    , description = "La sorella di Rosetta, la suora"
    , birthday = Time.millisToPosix -1420074000000
    , death = Nothing
    }

nonnaMaria : T.CharacterDescription
nonnaMaria =
    { fullName = "Nonna Maria"
    , description = "La madre di Rita"
    , birthday = fakeDate
    , death = Nothing
    }

bruno : T.CharacterDescription
bruno =
    { fullName = "Bruno ?"
    , description = "Il marito di Grazia, carabiniere"
    , birthday = fakeDate
    , death = Nothing
    }

vincenzo : T.CharacterDescription
vincenzo =
    { fullName = "Vincenzo ?"
    , description = "Il figlio di Grazia e Bruno, non parla"
    , birthday = fakeDate
    , death = Nothing
    }

irene : T.CharacterDescription
irene =
    { fullName = "Irene Strippoli"
    , description = "La migliore amica di Rosetta"
    , birthday = Time.millisToPosix -1076202000000
    , death = Nothing
    }

tommaso : T.CharacterDescription
tommaso =
    { fullName = "Tommaso Strippoli"
    , description = "Il padre di Irene"
    , birthday = fakeDate
    , death = Nothing
    }

alessandra : T.CharacterDescription
alessandra =
    { fullName = "Alessandra Strippoli"
    , description = "La madre di Irene"
    , birthday = fakeDate
    , death = Nothing
    }

donCataldo : T.CharacterDescription
donCataldo =
    { fullName = "Don Cataldo Randolfi"
    , description = "Faceva prestiti alla gente, diciamo"
    , birthday = fakeDate
    , death = Nothing
    }

livio : T.CharacterDescription
livio =
    { fullName = "Livio Patruno"
    , description = "Propietario del negozio di stoffe sul Corso, davanti alla Chiesa di Santa Maria Greca"
    , birthday = fakeDate
    , death = Nothing
    }

perpetua : T.CharacterDescription
perpetua =
    { fullName = "Mariagreca"
    , description = "La perpetua"
    , birthday = fakeDate
    , death = Nothing
    }

donSaverio : T.CharacterDescription
donSaverio =
    { fullName = "Don Saverio"
    , description = "Il parroco"
    , birthday = fakeDate
    , death = Nothing
    }

antonio : T.CharacterDescription
antonio =
    { fullName = "Antonio Tandoi"
    , description = "Negoziante di stoffe"
    , birthday = fakeDate
    , death = Nothing
    }


placeholder : T.CharacterDescription
placeholder =
    { fullName = "placeholder"
    , description = "Placeholder"
    , birthday = fakeDate
    , death = Nothing
    }


-- LE RELAZIONI


graphRelations : Graph T.Character String
graphRelations =
    let
        toString : Node T.Character -> Node T.Character
        toString node =
            { id = node.id
            , label = node.label
            }
    in
        Graph.fromNodesAndEdges
            (List.map toString charactersAsNodes)
            relationsAsEdges

-- relations : T.Relations
-- relations =
--     Graph.fromNodesAndEdges charactersAsNodes relationsAsEdges


charactersAsNodes : List (Node T.Character)
charactersAsNodes =
    let
        
        makeNode : Int -> T.Character -> Node T.Character
        makeNode i c =
            { id = i
            , label = c
            }

    in
        List.indexedMap makeNode characters



relationsAsEdges : List T.Relation
relationsAsEdges =
    -- Zitoli
    [ Edge 7 9 "è padre di"
    , Edge 8 9 "è madre di"
    , Edge 10 9 "è sorella di" 
    , Edge 11 9 "è sorella di" 
    , Edge 12 8 "è madre di"

    , Edge 13 10 "è sposato con"
    , Edge 14 10 "è figlio di"

    -- Tedone
    , Edge 4 6 "è padre di"
    , Edge 5 6 "è madre di"
    , Edge 6 9 "è promesso in sposo a"

    -- Suonatori
    , Edge 2 0 "è madre di"
    , Edge 2 1 "è madre di"
    , Edge 3 0 "è padre di"
    , Edge 3 1 "è padre di"
    , Edge 0 1 "è fratello di"
    , Edge 0 11 "è innamorata di"

    -- Altri
    , Edge 16 15 "è madre di"
    , Edge 17 15 "è padre di"
    , Edge 15 9 "è migliore amica di"
    , Edge 15 6 "è innamorata di"
    
    , Edge 20 21 "è impiegata di"
    , Edge 20 7 "frequenta la casa di"

    , Edge 19 8 "è amico di"
    , Edge 18 7 ""
    ]
