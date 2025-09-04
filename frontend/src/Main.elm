module Main exposing (..)

import Page.Home as Home
import Language as Lang exposing (Language)

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
    , language : Language
    }

type CurrentPage
    = Redirect
    | Home Home.Model


init : () -> Url -> Key -> ( Model, Cmd Msg )
init _ url _ =
    { route = Route.NotFound
    , page = Redirect
    , language = Lang.EN -- TODO we could get this from browser preferences/settings
    }
        |> changeRouteTo (Route.urlToRoute url)


---- UPDATE ----


type Msg
    = NoOp
    | ChangedUrl Url
    | ClickedLink Browser.UrlRequest
    | UpdateLanguage Language
    | HomeMsg Home.Msg

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case (msg, model.page) of
        ( ChangedUrl url, _ ) ->
            changeRouteTo (Route.urlToRoute url) model

        ( ClickedLink urlRequest, _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    case url.fragment of
                        Nothing ->
                            (model, Cmd.none)
                        Just _ ->
                            Cmd.with (Nav.load <| Url.toString url) model

                Browser.External href ->
                    -- avoid redirecting on links with no href attribute
                    if String.isEmpty href then
                        (model, Cmd.none)

                    else
                        Cmd.with (Nav.load href) model

        ( UpdateLanguage l, _ ) ->
            -- TODO is there a better way than refreshing everytime we change the language?
            changeRouteTo model.route {model | language = l}

        ( HomeMsg subMsg, Home subModel ) ->
            Home.update subMsg subModel
                |> updateWith Home HomeMsg model
        
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


mapView : (msg -> Msg) -> Document msg -> Document Msg
mapView subMsg {title, body} =
    { title = title
    , body = 
        -- TODO make the language switch always visible?
        (Lang.languageSwitch UpdateLanguage)
        :: List.map (Html.map subMsg) body
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
    Sub.none 


changeRouteTo : Route -> Model -> ( Model, Cmd Msg )
changeRouteTo route currentModel =
    let
        model =
            { currentModel | route = route }
    in
        case route of
            Route.NotFound ->
                ({ model | page = Redirect }, Cmd.none) -- TODO?
            
            Route.Home ->
                updateWith Home HomeMsg model <| Home.init model.language


updateWith : (subModel -> CurrentPage) -> (subMsg -> Msg) -> Model -> ( subModel, Cmd subMsg ) -> ( Model, Cmd Msg )
updateWith toCurrentPage toMsg model ( subModel, subCmd ) = Cmd.with
    (Cmd.map toMsg subCmd)
    ( makeModel model <| toCurrentPage subModel)

makeModel : Model -> CurrentPage -> Model
makeModel m sm = {m|page = sm}