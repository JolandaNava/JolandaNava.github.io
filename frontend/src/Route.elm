
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
    -- | Example ExampleView

-- type ExampleView
--     = A
--     | B

-- Parsers

parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home Parser.top
        -- , Parser.map Example <| s "example" </> exampleViewParser
        , Parser.map NotFound <| s "404"
        ]

-- exampleViewParser : Parser ( ExampleView -> a ) a
-- exampleViewParser =
--     Parser.custom "example_parser" readExampleView


-- readExampleView : String -> Maybe ExampleView
-- readExampleView x =
--     case x of
--         "a" -> Just A
--         "b" -> Just B
--         _ -> Nothing

-- showExampleView : ExampleView -> String
-- showExampleView bv =
--     case bv of
--         A -> "a"
--         B ->  "b"

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
                -- Example ex -> ["example", showExampleView ex]
                NotFound -> ["404"]

    in
        "#" ++ String.join "/" path
