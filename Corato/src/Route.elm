module Route exposing (..)

import Browser.Navigation as Nav
import Html exposing (Attribute)
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Parser as Parser exposing (Parser, oneOf, s, (</>))
import Url.Builder as Builder
import Browser.Dom exposing (Error(..))
import Types as T
import Html exposing (a)


-- ROUTING

-- Types

type Route
    = NotFound
    | Home
    | Book BookView
    | Characters CharactersView
    | Character T.Character

type BookView
    = Chapters
    | Timeline

type CharactersView
    = Narrators
    | Relations


-- Parsers

parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home Parser.top
        , Parser.map Book <| s "book" </> bookViewParser
        , Parser.map Characters <| s "characters" </> charactersViewParser
        , Parser.map Character <| s "character" </> characterParser
        , Parser.map NotFound <| s "404"
        ]

bookViewParser : Parser ( BookView -> a ) a
bookViewParser =
    Parser.custom "bookview_parser" readBookView


charactersViewParser : Parser ( CharactersView -> a ) a
charactersViewParser =
    Parser.custom "charactersview_parser" readCharactersView

characterParser : Parser ( T.Character -> a) a
characterParser =
    Parser.custom "character_parser" readCharacter


readBookView : String -> Maybe BookView
readBookView x =
    case x of
        "chapters" -> Just Chapters
        "timeline" -> Just Timeline
        _ -> Nothing

showBookView : BookView -> String
showBookView bv =
    case bv of
        Chapters -> "chapters"
        Timeline ->  "timeline"

readCharactersView : String -> Maybe CharactersView
readCharactersView x =
    case x of
        "narrators" -> Just Narrators
        "relations" -> Just Relations
        _ -> Nothing

showCharactersView : CharactersView -> String
showCharactersView cv =
    case cv of
        Narrators -> "narrators"
        Relations ->  "relations"

readCharacter : String -> Maybe T.Character
readCharacter x =
    case x of
        "andrea" -> Just T.Andrea
        "rocco" -> Just T.Rocco
        "signsuonatori" -> Just T.SignSuonatori
        "alfredo" -> Just T.Alfredo

    -- I Tedone
        "riccardo" -> Just T.Riccardo
        "chiara" -> Just T.Chiara
        "gabriele" -> Just T.Gabriele

    -- Gli Zitoli
        "nunzio" -> Just T.Nunzio
        "rita" -> Just T.Rita
        "rosetta" -> Just T.Rosetta
        "grazia" -> Just T.Grazia
        "isabella" -> Just T.Isabella
        "nonnamaria" -> Just T.NonnaMaria

        "bruno" -> Just T.Bruno
        "vincenzo" -> Just T.Vincenzo

    -- Gli Strippoli
        "irene" -> Just T.Irene
        "tommaso" -> Just T.Tommaso
        "alessandra" -> Just T.Alessandra

    -- Altri
        "doncataldo" -> Just T.DonCataldo
        "livio" -> Just T.Livio
        "perpetua" -> Just T.Perpetua
        "donsaverio" -> Just T.DonSaverio
        "antonio" -> Just T.Antonio

        _ -> Nothing

showCharacter : T.Character -> String
showCharacter c =
    case c of
        T.Andrea -> "andrea"
        T.Rocco -> "rocco"
        T.SignSuonatori -> "signsuonatori"
        T.Alfredo -> "alfredo"

    -- I Tedone
        T.Riccardo -> "riccardo"
        T.Chiara -> "chiara"
        T.Gabriele -> "gabriele"

    -- Gli Zitoli
        T.Nunzio -> "nunzio"
        T.Rita -> "rita"
        T.Rosetta -> "rosetta"
        T.Grazia -> "grazia"
        T.Isabella -> "isabella"
        T.NonnaMaria -> "nonnamaria"

        T.Bruno -> "bruno"
        T.Vincenzo -> "vincenzo"

    -- Gli Strippoli
        T.Irene -> "irene"
        T.Tommaso -> "tommaso"
        T.Alessandra -> "alessandra"

    -- Altri
        T.DonCataldo -> "doncataldo"
        T.Livio -> "livio"
        T.Perpetua -> "perpetua"
        T.DonSaverio -> "donsaverio"
        T.Antonio -> "antonio"

-- HELPERS


href : Route -> Attribute msg
href targetRoute =
    Attr.href (routeToString targetRoute)

toCharacter : T.Character -> String
toCharacter =
    routeToString << Character 

{-| insert a page in the navigation history
-}
pushUrl : Nav.Key -> Route -> Cmd msg
pushUrl key route =
    Nav.pushUrl key (routeToString route)

replaceUrl : Nav.Key -> Route -> Cmd msg
replaceUrl key route =
    Nav.replaceUrl key (routeToString route)


-- urlToRoute : Url -> Route
-- urlToRoute url =
--     Parser.parse parser url
--         |> Maybe.withDefault NotFound

urlToRoute : Url -> Route
urlToRoute url =
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> Parser.parse parser
        |> Maybe.withDefault NotFound

    -- The app spec treats the fragment like a path.
    -- This makes it *literally* the path, so we can proceed
    -- with parsing as if it had been a normal path all along.


-- INTERNAL


routeToString : Route -> String
routeToString page =
    let
        path : List String
        path =
            case page of
                Home -> []
                Book bv -> ["book", showBookView bv]
                Characters cv -> ["characters", showCharactersView cv]
                Character c -> ["character", showCharacter c]
                NotFound -> ["404"]

    in
        "#" ++ String.join "/" path
        -- Builder.absolute path []

