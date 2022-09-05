module Page.Home exposing (Model, Msg, init, update, view)

import Html exposing (Html)
import Browser exposing (Document)
import Cmd.Extra as Cmd
import Html.Attributes as Attrs

import Route
import Page

---- MODEL ----


type alias Model =
    { content : Int }


init : ( Model, Cmd Msg )
init =
    ( { content = 0 }, Cmd.none )


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
    Page.pageView "Corato" "home"
        [ Html.div
            [ Attrs.class "author" ]
            [ Html.text "di Siliva D'Oria" ]
        , Html.div
            [ Attrs.class "project-description-container" ]
            [ Html.div
                [ Attrs.class "project-description" ]
                [ Html.text
                    """
                    Lorem ipsum dolor sit amet. Vel voluptatem fuga et veritatis laboriosam aut quos repudiandae est nihil quia. Ea accusantium quod ad dolores magnam et neque cupiditate? Qui deleniti vitae cum corrupti similique ut exercitationem repudiandae et repellat excepturi ex porro iste.

                    At asperiores odit sed delectus perferendis et enim quia et voluptatem officia At omnis officiis sed molestias ipsum qui accusamus enim. Vel iste earum ea voluptas maiores ex error ipsa ea assumenda asperiores aut reprehenderit quia in dolore suscipit. Id placeat sunt in magnam repellendus ea enim provident quo quos unde. Et ipsa assumenda ad minima reiciendis ut nemo earum!
                    """

                ]
            ]
            
        , Html.div
            [ Attrs.class "home-page-buttons" ]
            [ Html.div
                [ Attrs.class "home-page-main-button"
                , Attrs.class "book"
                ]
                [ Html.a
                    [ Route.href Route.Book ]
                    [ Html.text "Scopri il Libro" ]
                ]
            , Html.div
                [ Attrs.class "home-page-main-button"
                , Attrs.class "characters"
                ]
                [ Html.a
                    [ Route.href Route.Characters ]
                    [ Html.text "Scopri i Personaggi" ]
                ]
            ]
        ]