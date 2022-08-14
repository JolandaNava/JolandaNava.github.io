module Main exposing (..)

import Page.Home as Home
import Page.Book as Book
import Page.Characters as Characters
import Page.Character as Character

import Browser exposing (Document)
import Browser.Navigation as Nav exposing (Key)
import Html exposing (Html)
import Url exposing (Url)
import Route exposing (Route(..))
import Cmd.Extra as Cmd
import Html

---- MODEL ----


type alias Model =
    { page : CurrentPage
    , route : Route
    }

type CurrentPage
    = Redirect
    | Home Home.Model
    | Book Book.Model
    | Characters Characters.Model
    | Character Character.Model


init : () -> Url -> Key -> ( Model, Cmd Msg )
init _ url _ =
    { route = Route.NotFound
    , page = Redirect
    }
        |> changeRouteTo (Route.urlToRoute url)


---- UPDATE ----


type Msg
    = NoOp
    | ChangedUrl Url
    | ClickedLink Browser.UrlRequest
    | HomeMsg Home.Msg
    | BookMsg Book.Msg
    | CharactersMsg Characters.Msg
    | CharacterMsg Character.Msg

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case (msg, model.page) of
        ( ChangedUrl url, _ ) ->
            changeRouteTo (Route.urlToRoute url) model

        ( ClickedLink urlRequest, _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    Cmd.withCmd (Nav.load <| Url.toString url) model

                Browser.External href ->
                    -- avoid redirecting on links with no href attribute
                    if String.isEmpty href then
                        Cmd.withNoCmd model

                    else
                        Cmd.withCmd (Nav.load href) model

        ( HomeMsg subMsg, Home subModel ) ->
            Home.update subMsg subModel
                |> updateWith Home HomeMsg model

        ( BookMsg subMsg, Book subModel ) ->
            Book.update subMsg subModel
                |> updateWith Book BookMsg model

        ( CharactersMsg subMsg, Characters subModel ) ->
            Characters.update subMsg subModel
                |> updateWith Characters CharactersMsg model

        ( CharacterMsg subMsg, Character subModel ) ->
            Character.update subMsg subModel
                |> updateWith Character CharacterMsg model
        
        _ -> ( model, Cmd.none )


---- VIEW ----


view : Model -> Document Msg
view model =
    case model.page of
        Redirect ->
            { title = "redirect"
            , body = redirect_view
            }

        Home subModel ->
            mapView HomeMsg <|
                Home.view subModel
        
        Book subModel ->
            mapView BookMsg <|
                Book.view subModel
        
        Characters subModel ->
            mapView CharactersMsg <|
                Characters.view subModel
        
        Character subModel ->
            mapView CharacterMsg <|
                Character.view subModel


mapView : (msg -> Msg) -> Document msg -> Document Msg
mapView subMsg {title, body} =
    { title = title
    , body = List.map (Html.map subMsg) body
    }

redirect_view : List (Html Msg)
redirect_view =
    [ Html.div []
        [ Html.h1 [] [ Html.text "Loading" ]
        ]
    ]

---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.application
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = ChangedUrl
        , onUrlRequest = ClickedLink
        }

subscriptions : Model -> Sub Msg
subscriptions model =
    case model.page of
        Characters subModel ->
            Sub.map CharactersMsg <| Characters.subscriptions subModel
        _ -> Sub.none 


changeRouteTo : Route -> Model -> ( Model, Cmd Msg )
changeRouteTo route currentModel =
    let
        model =
            { currentModel | route = route }
    in
        case route of
            Route.NotFound ->
                Cmd.withNoCmd { model | page = Redirect } -- TODO?
            
            Route.Home ->
                updateWith Home HomeMsg model Home.init
            
            Route.Book ->
                updateWith Book BookMsg model Book.init
            
            Route.Characters ->
                updateWith Characters CharactersMsg model Characters.init
            
            Route.Character character ->
                updateWith Character CharacterMsg model <| Character.init character


updateWith : (subModel -> CurrentPage) -> (subMsg -> Msg) -> Model -> ( subModel, Cmd subMsg ) -> ( Model, Cmd Msg )
updateWith toCurrentPage toMsg model ( subModel, subCmd ) = Cmd.withCmd
    (Cmd.map toMsg subCmd)
    ( makeModel model <| toCurrentPage subModel)

makeModel : Model -> CurrentPage -> Model
makeModel m sm = {m|page = sm}