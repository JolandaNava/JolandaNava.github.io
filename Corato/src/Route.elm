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


type Route
    = NotFound
    | Home
    | Book
    | Characters
    | Character T.Character


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home Parser.top
        , Parser.map Book <| s "book"
        , Parser.map Characters <| s "characters"
        , Parser.map Character <| s "character" </> characterParser
        , Parser.map NotFound <| s "404"
        ]

characterParser : Parser ( T.Character -> a) a
characterParser =
    Parser.custom "character_parser" readCharacter


readCharacter : String -> Maybe T.Character
readCharacter x =
    case x of
        "rosetta"    -> Just T.Rosetta
        "irene"      -> Just T.Irene
        "panettiere" -> Just T.Panettiere
        "farmacista" -> Just T.Farmacista
        "papa"       -> Just T.Papa
        "mamma"      -> Just T.Mamma
        "perpetua"   -> Just T.Perpetua
        _ -> Nothing

showCharacter : T.Character -> String
showCharacter c =
    case c of
        T.Rosetta    -> "rosetta"
        T.Irene      -> "irene"
        T.Panettiere -> "panettiere"
        T.Farmacista -> "farmacista"
        T.Papa       -> "papa"
        T.Mamma      -> "mamma"
        T.Perpetua   -> "perpetua"

-- HELPERS


href : Route -> Attribute msg
href targetRoute =
    Attr.href (routeToString targetRoute)



{-| insert a page in the navigation history
-}
pushUrl : Nav.Key -> Route -> Cmd msg
pushUrl key route =
    Nav.pushUrl key (routeToString route)

replaceUrl : Nav.Key -> Route -> Cmd msg
replaceUrl key route =
    Nav.replaceUrl key (routeToString route)


fromUrl : Url -> Route
fromUrl = Maybe.withDefault NotFound << Parser.parse parser


-- goto : Session -> Route -> Cmd msg
-- goto session route =
--     pushUrl (navKey session) route

urlToRoute : Url -> Route
urlToRoute url =
    Parser.parse parser url
        |> Maybe.withDefault NotFound


-- INTERNAL


routeToString : Route -> String
routeToString page =
    let
        path : List String
        path =
            case page of
                Home -> []
                Book -> ["book"]
                Characters -> ["characters"]
                Character c -> ["character", showCharacter c]
                NotFound -> ["404"]

    in
    
        Builder.absolute path []

