module Route exposing (..)

import Browser.Navigation as Nav
import Html exposing (Attribute)
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Parser as Parser exposing (Parser, oneOf, s)
import Url.Builder as Builder
import Browser.Dom exposing (Error(..))



-- ROUTING


type Route
    = NotFound
    | Home
    | Book
    | Character


parser : Parser (Route -> a) a
parser =
    oneOf
        [ Parser.map Home Parser.top
        , Parser.map Book <| s "book"
        , Parser.map Character <| s "character"
        , Parser.map NotFound <| s "404"
        ]


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
                Character -> ["character"]
                NotFound -> ["404"]

    in
    
        Builder.absolute path []

