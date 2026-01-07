module Page.Home exposing (Model, Msg, init, update, view)

import Html exposing (Html)
import Html.Events
import Browser exposing (Document)
import Cmd.Extra as Cmd
import Html.Attributes as Attrs

import Illustrations
import Language as L exposing (Language)
import Route
import Page

---- MODEL ----


type alias Model =
    { language : Language }


init : Language -> ( Model, Cmd Msg )
init l =
    ( {language = l}, Cmd.none )


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
    { title = "Jolanda Nava"
    , body = content model
    }

content :  Model -> List (Html Msg)
content  { language } =
    Page.homePageView "Home" "home"
        [ Html.div [ Attrs.class "intro-section" ]
            [ firma language
            , Html.div [ Attrs.class "intro-text" ] [ Html.text <| L.intro language ]
            , Html.div [ Attrs.class "buttons" ]
                [ navigationButton WorkWithMe <| L.workWithMe language
                , navigationButton AboutMe <| L.learnMore language
                ]
            
            -- floating elements
            , circle_medium "knit"
            , circle_medium_rotated "living-room"
            , circle_large "gomitolo"
            , circle_small_rotated "basil"
            ]
        , sectionTitle Left AboutMe language
        , section AboutMe
            [ Html.div [ Attrs.class "about-me-container" ]
                [ Html.div [ Attrs.class "about-me-text" ] 
                    <| List.map (\p -> Html.p [] [ Html.text p ]) <| L.aboutMeBlurb language
                , Html.div [ Attrs.class "vertical-buttons" ]
                    [ Html.div [ Attrs.class "mini-me" ] [ Html.img [ Attrs.src <| "/assets/me.png" ] [] ]
                    , linkButton "https://timetuna.com/jolanda-nava" <| L.bookChat language
                    -- downloadButton "/cv//Jolanda_Nava_CV__Dec_2024_.pdf" "jolanda_nava_cv_en" <| L.downloadCVEN language
                    -- , downloadButton "/cv//Jolanda_Nava_CV__Dec_2024_.pdf" "jolanda_nava_cv_it" <| L.downloadCVIT language -- TODO update IT CV
                    , emailButton <| L.getInTouch language 
                    , linkButton "https://www.linkedin.com/in/jolandanava" <| L.linkedIn language
                    ]
                , Html.div [ Attrs.class "me" ] [ Html.img [ Attrs.src <| "/assets/me.png" ] [] ]
                ]
            
            -- floating elements
            , Html.img [ Attrs.class "flower", Attrs.src <| "/assets/flower.png" ] []
            
            ]
        , sectionTitle Right PastProjects language
        , section PastProjects
            [ Html.div [ Attrs.class "past-project-text" ] [ Html.text <| L.pastProjectsBlurb language ]
            , Html.div [ Attrs.class "past-projects-container" ]
                [ -- TODO add scrolling on click?
                    Html.div [ Attrs.class "scroll-left" ] [ Illustrations.arrow_left ]
                , Html.div [ Attrs.class "past-projects-scroll" ]
                    [ Html.div [ Attrs.class "past-projects-list" ]
                        [ pastProject qualityAssurance language
                        , pastProject ribes language
                        , pastProject gruppoLesbico language
                        , pastProject itcilo language
                        ]
                    ]
                -- TODO add scrolling on click?
                , Html.div [ Attrs.class "scroll-right" ] [ Illustrations.arrow_right ]
                ]
            
            -- floating elements
            , Html.img [ Attrs.class "branch-4", Attrs.src <| "/assets/branch_4.png" ] []

            ]
        , sectionTitle Left WorkWithMe language
        , section WorkWithMe
            [ Html.div [ Attrs.class "work-with-me-text" ] [ Html.text <| L.workWithMeBlurb language ]
            , Html.div [ Attrs.class "work-with-me-container" ]
                [ proposal workshops language
                , proposal organisations language
                , proposal custom language
                ]
            
            -- floating elements
            , circle_large "lemons"
            ]
        , sectionTitle Right Creations language
        , section Creations
            [ Html.div [ Attrs.class "creations-text" ] [ Html.text <| L.creationsBlurb language ]
            , Html.div [ Attrs.class "creations-container" ]
                [ picture "porta-posate"
                , picture "catania"
                , picture "torta"
                , picture "ceramica-jewelry"
                , picture "ibiscus-seeds"
                , picture "clitoris"
                , picture "soap-dispenser"
                , picture "sospended-pot"
                , picture "carved-donut"
                , picture "mending"
                , picture "potus"
                , picture "bowl1"
                , picture "tip-top-tank"
                , picture "yarn-bowl"
                , picture "pangolin"
                , picture "bowl2"
                , picture "woman"
                , picture "donut"
                , picture "uncinetto-top"
                , picture "ceramic-trio"
                , picture "tazzine"
                , picture "pot"
                , picture "cups"
                ]
            , Html.div [ Attrs.class "ravelry-container" ] [ linkButton "https://www.ravelry.com/projects/jolinava" <| L.ravelry language ]

            -- floating elements
            , circle_medium "ceramica"
            ]
        , footer language 
        -- TODO add some decorations to the footer
        ]


-- View helper functions

circle : Bool -> String -> String -> Html Msg
circle rotated circle_type image =
    Html.div [ Attrs.class <| "circle-" ++ image, Attrs.class "no-pointer-events" ]
        [ Html.div [ Attrs.class circle_type, Attrs.classList [("rotated", rotated)] ]
            [ Html.img [ Attrs.class "circle-image", Attrs.src <| "/assets/" ++ image ++ ".png" ] []
            , Html.img [ Attrs.class "circle-outline", Attrs.src <| "/assets/" ++ circle_type ++ ".png" ] []
            ]
        ]

circle_small : String -> Html Msg
circle_small =
    circle False "circle_small"

circle_medium : String -> Html Msg
circle_medium =
    circle False "circle_medium"

circle_large : String -> Html Msg
circle_large =
    circle False "circle_large"

circle_small_rotated : String -> Html Msg
circle_small_rotated =
    circle True "circle_small"

circle_medium_rotated : String -> Html Msg
circle_medium_rotated =
    circle True "circle_medium"

circle_large_rotated : String -> Html Msg
circle_large_rotated =
    circle True "circle_large"

firma : Language -> Html Msg
firma l =
    Html.div [ Attrs.class "firma" ]
        [ Html.img [ Attrs.src "/assets/firma.png" ] []
        , Html.h2 [] [ Html.text <| L.tagline l ]    
        ]

section : Sections -> List (Html Msg) -> Html Msg
section s =
    Html.div [ Attrs.class "section", Attrs.class <| sectionId s]


type Align
    = Left
    | Right

alignClass al =
    case al of
        Left -> Attrs.class "left-align"
        Right -> Attrs.class "right-align"

sectionTitle : Align -> Sections -> Language -> Html Msg
sectionTitle al s l =
    Html.div
        [ Attrs.id <| sectionId s
        , Attrs.class "section-title"
        , alignClass al
        ]
        [ Html.h1 [] [ Html.text <| sectionName s l ] ]


navigationButton : Sections -> String -> Html Msg
navigationButton s buttonText =
    Html.a
        [ Attrs.class "main-button", Attrs.href <| (++) "#" <| sectionId s ]
        [ Html.text buttonText]

downloadButton : String -> String -> String -> Html Msg
downloadButton fileName downloadName buttonText =
    Html.a
        [ Attrs.class "main-button"
        , Attrs.href <| "/assets" ++ fileName
        , Attrs.download downloadName
        ]
        [ Html.text buttonText ]


linkButton : String -> String -> Html Msg
linkButton href buttonText =
    Html.a
        [ Attrs.class "main-button", Attrs.href href, Attrs.target "_blank" ]
        [ Html.text buttonText]

email : String
email = "jolanda@nava.pro"

mailto : String
mailto = "mailto:" ++ email

emailButton : String -> Html Msg
emailButton btnText =
    Html.a
        [ Attrs.class "main-button", Attrs.href mailto ]
        [ Html.text btnText ]

footer : Language -> Html Msg
footer l =
    let
        link s =
            Html.a
                [ Attrs.href <| (++) "#" <| sectionId s
                ,  Attrs.class "link"
                ]
                [ Html.text <| sectionName s l ]

    in
    Html.div [ Attrs.class "footer" ]
        [ Html.div []
            [ Html.a
                [ Attrs.href mailto , Attrs.class "link"]
                [ Html.text email ]
            ]
        , Html.div []
            <| List.intersperse (Html.text " | ")
            [ link AboutMe
            , link PastProjects
            , link WorkWithMe
            , link Creations
            ]
        ]

pastProjectLink : String -> String -> Html Msg
pastProjectLink externallink linkText =
    Html.a
        [ Attrs.href externallink, Attrs.target "_blank", Attrs.class "past-project-link" ]
        [ Html.text linkText ]


pastProject : PastProject -> Language -> Html Msg
pastProject project l =
    Html.div
        [ Attrs.class "past-project" ]
        [ circle_small project.image
        , Html.h2 [ Attrs.class "past-project-name" ] [ Html.text <| project.title l ]
        , Html.div [ Attrs.class "project-description" ] [ Html.text <| project.description l ]
        , pastProjectLink project.link <| L.pastProjectLink l
        ]

proposal : Proposal -> Language -> Html Msg
proposal p l =
    Html.div
        [ Attrs.class "work-proposal" ]
        [ Html.img [ Attrs.class "proposal-image", Attrs.src <| "/assets/" ++ p.image ] []
        , Html.h2 [ Attrs.class "proposal-name" ] [ Html.text <| p.title l ]
        , Html.div [ Attrs.class "proposal-description" ] [ Html.text <| p.description l ]
        , p.action l
        ]

picture : String -> Html Msg
picture s =
    Html.img [ Attrs.class "creations-picture", Attrs.src <| "/assets/made/" ++ s ++ ".png" ] []


--- DATA

-- past projects

type alias PastProject =
    { title: Language -> String
    , description: Language -> String
    , link: String
    , image: String
    }

itcilo : PastProject
itcilo =
    { title = L.itciloTitle
    , description = L.itciloBlurb
    , link = "https://www.linkedin.com/posts/maudritz_intersectionality-inclusion-diversity-activity-7349176762557161473-8hc4"
    , image = "past-projects/ITCILO"
    }

ribes : PastProject
ribes =
    { title = L.ribesTitle
    , description = L.ribesBlurb
    , link = "https://www.instagram.com/p/DFfM0KisOy5"
    , image = "past-projects/ribes"
    }

qualityAssurance : PastProject
qualityAssurance =
    { title = L.qualityAssuranceTitle
    , description = L.qualityAssuranceBlurb
    , link = "https://www.instagram.com/p/DG21pFXNRhr/"
    , image = "past-projects/quality-assurance"
    }

gruppoLesbico : PastProject
gruppoLesbico =
    { title = L.gruppoLesbicoTitle
    , description = L.gruppoLesbicoBlurb
    , link = "https://www.instagram.com/p/DQoMEu_jbpD/"
    , image = "past-projects/lesbonautə"
    }

-- work with me

type alias Proposal =
    { title: Language -> String
    , description: Language -> String
    , image: String
    , action: Language -> Html Msg
    }

workshops : Proposal
workshops =
    { title = L.workshopsTitle
    , description = L.workshopsBlurb
    , image = "proposals/fern.png"
    , action = \l ->
        Html.a
            [ Attrs.class "proposal-button"
            , Attrs.href <| L.makeString
                "/assets/proposals/workshop-proposals-Jolanda-Nava.pdf"
                "/assets/proposals/proposte-formazione-Jolanda-Nava.pdf"
                l
            , Attrs.target "_blank"
            ]
            [ Html.text <| L.downloadWorkshopProposals l ]
    }

organisations : Proposal
organisations =
    { title = L.orgsTitle
    , description = L.orgsBlurb
    , image = "proposals/sprout.png"
    , action = \l ->
        Html.a
            [ Attrs.class "proposal-button"
            , Attrs.href <| L.makeString
                "/assets/proposals/proposals-orgs-Jolanda-Nava.pdf"
                "/assets/proposals/proposte-organizzazioni-Jolanda-Nava.pdf"
                l
            , Attrs.target "_blank"
            ]
            [ Html.text <| L.downloadOrgsProposals l ]
    }

custom : Proposal
custom =
    { title = L.customTitle
    , description = L.customBlurb
    , image = "proposals/flower.png"
    , action = \l ->
        Html.a
        [ Attrs.class "proposal-button"
        , Attrs.href "https://timetuna.com/jolanda-nava"
        , Attrs.target "_blank"
        ]
        [ Html.text <| L.bookChat l ]
    }

-- navigation sections

type alias Section =
    { id : String
    , text : Language -> String
    }

type Sections
    = AboutMe
    | PastProjects
    | WorkWithMe
    | Creations

getSection : Sections -> Section
getSection s =
    case s of
        AboutMe ->
            { id = "about-me"
            , text = L.aboutMe
            }
        PastProjects ->
            { id = "past-projects"
            , text = L.pastProjects
            }
        WorkWithMe ->
            { id = "work-with-me"
            , text = L.workWithMe
            }
        Creations ->
            { id = "creations"
            , text = L.creations
            }

sectionName : Sections -> Language -> String
sectionName =
    .text << getSection

sectionId : Sections -> String
sectionId =
    .id << getSection