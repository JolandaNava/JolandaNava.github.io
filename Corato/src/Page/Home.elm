module Page.Home exposing (Model, Msg, init, update, view)

import Html exposing (Html)
import Browser exposing (Document)
import Cmd.Extra as Cmd
import Html.Attributes as Attrs

import Illustrations
import Route
import Page

---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )


---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        NoOp -> (model, Cmd.none)


---- VIEW ----


view : Model -> Document Msg
view model =
    { title = "Corato"
    , body = content model
    }

content :  Model -> List (Html Msg)
content  _ =
    Page.homePageView "Corato" "home"
        [ Html.div []
            [ Html.div
                [ Attrs.class "author" ]
                [ Html.text "Siliva D'Oria" ]
            , Html.div
                [ Attrs.class "page-title" ]
                [ Html.text "Corato" ]
            , Html.div
                [ Attrs.class "home-page-buttons" ]
                [ Html.div
                    [ Attrs.class "home-page-main-button"
                    , Attrs.class "book"
                    ]
                    [ Html.a
                        [ Route.href <| Route.Book Route.Chapters ]
                        [ Html.text "Scopri il Libro" ]
                    ]
                , Html.div
                    [ Attrs.class "home-page-main-button"
                    , Attrs.class "characters"
                    ]
                    [ Html.a
                        [ Route.href <| Route.Characters Route.Narrators ]
                        [ Html.text "Scopri i Personaggi" ]
                    ]
                ]
            ]
        , Html.div [ Attrs.class "open-book" ] [Illustrations.openBook]
            
        ]

-- Image by <a href="https://www.freepik.com/free-vector/modern-book-logo-pack_12126910.htm#query=book&position=12&from_view=search">Freepik</a>