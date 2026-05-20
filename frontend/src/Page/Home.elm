module Page.Home exposing (Model, Msg, init, update, view)

import Html exposing (Html)
import Html.Events as Events
import Browser exposing (Document)
import Cmd.Extra as Cmd
import Html.Attributes as Attrs
import Browser.Dom
import Task exposing (Task)

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
    | ScrollRight
    | ScrollLeft


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
    case msg of
        NoOp ->
            (model, Cmd.none)

        ScrollRight ->
            (model, taskScrollRight "past-projects-scroll")
        
        ScrollLeft ->
            (model, taskScrollLeft "past-projects-scroll")


---- VIEW ----


view : Model -> Document Msg
view model =
    { title = "Jolanda Nava"
    , body = content model
    }

content :  Model -> List (Html Msg)
content  { language } =
    Page.homePageView "Home" "home"
        [ Html.section [ Attrs.class "intro-section", ariaLabel <| L.introduction language ]
            [ firma language
            , Html.div [ Attrs.class "intro-text" ] [ Html.text <| L.intro language ]
            , Html.div [ Attrs.class "buttons" ]
                [ navigationButton language WorkWithMe <| L.workWithMe language
                , navigationButton language AboutMe <| L.learnMore language
                ]
            
            -- floating elements
            , circle_medium "knit"
            , circle_medium_rotated "living-room"
            , circle_large "gomitolo"
            , circle_small_rotated "basil"
            ]
        , section language Left AboutMe
            -- [ sectionTitle Left AboutMe language
            -- , sectionContent AboutMe
                [ Html.div [ Attrs.class "about-me-container" ]
                    [ Html.div [ Attrs.class "about-me-text" ] 
                        <| aboutMeParagraph language
                    , Html.div [ Attrs.class "vertical-buttons" ]
                        [ linkButton "https://timetuna.com/jolanda-nava" <| L.bookChat language
                        , Html.a
                            [ Attrs.class "main-button"
                            , Attrs.href <| L.makeString
                                "assets/cv/Jolanda_Nava_CV__Dec_2024_.pdf"
                                "assets/cv/Jolanda_Nava_CV__Dec_2024_.pdf" -- TODO need IT version
                                language
                            , Attrs.target "_blank"
                            ]
                            [ Html.text <| L.downloadCV language ]
                        , linkButton "https://www.linkedin.com/in/jolandanava" <| L.linkedIn language
                        ]
                    , circle_medium "me"
                    , spotify language
                    ]
                
                -- floating elements
                , Html.img
                    [ Attrs.class "flower"
                    , Attrs.src <| "/assets/flower.png" 
                    , Attrs.alt ""
                    , rolePresentation
                    ] []
                
                ]
            -- ]
        , section language Right WorkWithMe
            -- [ sectionTitle Right WorkWithMe language
            -- , sectionContent WorkWithMe
                [ Html.div [ Attrs.class "work-with-me-text" ] [ Html.text <| L.workWithMeBlurb language ]
                , Html.div [ Attrs.class "work-with-me-container" ]
                    [ proposal workshops language
                    , proposal organisations language
                    , proposal custom language
                    ]
                
                -- floating elements
                , circle_large "lemons"
                ]
            -- ]
        , section language Left PastProjects
            -- [ sectionTitle Left PastProjects language
            -- , sectionContent PastProjects
                [ Html.div [ Attrs.class "past-project-text" ] [ Html.text <| L.pastProjectsBlurb language ]
                , Html.div [ Attrs.class "past-projects-container" ]
                    [ pastProject qualityAssurance language
                    , pastProject ribes language
                    , pastProject gruppoLesbico language
                    , pastProject itcilo language
                    ]
                
                -- floating elements
                , Html.img
                    [ Attrs.class "branch-4"
                    , Attrs.src <| "/assets/branch_4.png"
                    , Attrs.alt ""
                    , rolePresentation
                    ] []
                ]
            -- ]
        , section language Right Creations
            -- [ sectionTitle Right Creations language
            -- , sectionContent Creations
                [ Html.div [ Attrs.class "creations-text" ] [ Html.text <| L.creationsBlurb language ]
                , Html.div [ Attrs.class "creations-container" ]
                    [ picture language "porta-posate"
                    , picture language "catania"
                    , picture language "torta"
                    , picture language "ceramica-jewelry"
                    , picture language "ibiscus-seeds"
                    , picture language "clitoris"
                    , picture language "soap-dispenser"
                    , picture language "sospended-pot"
                    , picture language "carved-donut"
                    , picture language "mending"
                    , picture language "potus"
                    , picture language "bowl1"
                    , picture language "tip-top-tank"
                    , picture language "yarn-bowl"
                    , picture language "pangolin"
                    , picture language "bowl2"
                    , picture language "woman"
                    , picture language "donut"
                    , picture language "uncinetto-top"
                    , picture language "ceramic-trio"
                    , picture language "tazzine"
                    , picture language "fish"
                    , picture language "pot"
                    , picture language "cups"
                    , picture language "maglione"
                    ]
                , Html.div [ Attrs.class "find-me-container" ]
                    [ linkButton "https://www.ravelry.com/projects/jolinava" <| L.ravelry language
                    , linkButton "https://github.com/JolandaNava" <| L.github language
                    ]

                -- floating elements
                , circle_medium "ceramica"
                ]
            -- ]
        , footer language 
        ]


-- View helper functions


-- ARIA helpers

rolePresentation : Html.Attribute msg
rolePresentation =
    Attrs.attribute "role" "presentation"

ariaLabel : String -> Html.Attribute msg
ariaLabel =
    Attrs.attribute "aria-label"

role : String -> Html.Attribute msg
role =
    Attrs.attribute "role"

ariaLabelledby : String -> Html.Attribute msg
ariaLabelledby =
    Attrs.attribute "aria-labelledby"

-- circle images helpers

circle : Bool -> String -> String -> Html Msg
circle rotated circle_type image =
    Html.div [ Attrs.class <| "circle-" ++ image, Attrs.class "no-pointer-events" ]
        [ Html.div [ Attrs.class circle_type, Attrs.classList [("rotated", rotated)] ]
            [ Html.img
                [ Attrs.class "circle-image"
                , Attrs.src <| "/assets/" ++ image ++ ".png" 
                , Attrs.alt ""
                , rolePresentation
                ] []
            , Html.img
                [ Attrs.class "circle-outline"
                , Attrs.src <| "/assets/" ++ circle_type ++ ".png"
                , Attrs.alt ""
                , rolePresentation
                ] []
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
    Html.h1
        [ Attrs.class "firma"
        , Attrs.title "Jolanda"
        ]
        [ Html.img
            [ Attrs.src "/assets/firma.png"
            , Attrs.alt "Jolanda"
            ] []
        , Html.div [ Attrs.class "tagline" ] [ Html.text <| L.tagline l ]    
        ]

-- section helpers

type Align
    = Left
    | Right


alignClass : Align -> Html.Attribute msg
alignClass al =
    case al of
        Left -> Attrs.class "left-align"
        Right -> Attrs.class "right-align"

section : Language -> Align -> Sections -> List (Html Msg) -> Html Msg
section l alignment s c =
    Html.section [ ariaLabelledby <| sectionId s ]
        [ sectionTitle alignment s l
        , sectionContent s c
        ]
            -- , section AboutMe
            -- [ sectionTitle Left AboutMe language
            -- , sectionContent AboutMe

sectionContent : Sections -> List (Html Msg) -> Html Msg
sectionContent s =
    Html.div [ Attrs.class "section", Attrs.class <| sectionId s]

sectionTitle : Align -> Sections -> Language -> Html Msg
sectionTitle al s l =
    Html.div
        [ Attrs.id <| sectionId s
        , Attrs.class "section-title"
        , alignClass al
        ]
        [ Html.h2 [] [ Html.text <| sectionName s l ] ]


-- content helpers

navigationButton : Language -> Sections -> String -> Html Msg
navigationButton l s buttonText =
    Html.a
        [ Attrs.class "main-button"
        , Attrs.href <| (++) "#" <| sectionId s 
        , ariaLabel <| L.goToSection l ++ sectionName s l
        ]
        [ Html.text buttonText]

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

aboutMeParagraph : Language -> List (Html Msg)
aboutMeParagraph language =
    let
        title = Html.h3 [ Attrs.class "about-me-name" ] [ Html.text "Jolanda Nava" ]
        paragraphs = List.map (\p -> Html.p [] [ Html.text p ]) <| L.aboutMeBlurb language
        
        emailme = 
            Html.p []
                [ Html.text <| L.emailMe language
                , Html.a
                    [ Attrs.href mailto , Attrs.class "about-me-email"]
                    [ Html.text email ]
                ]
    in
        [ title ] ++ paragraphs ++ [ emailme ]

footer : Language -> Html Msg
footer l =
    let
        link s =
            Html.li [ Attrs.class "link-element" ]
                [ Html.a
                    [ Attrs.href <| (++) "#" <| sectionId s
                    , Attrs.class "link"
                    ]
                    [ Html.text <| sectionName s l ]
                ]
        
        separator =
            Html.div [Attrs.class "separator", Attrs.attribute "aria-hidden" "true" ] []

    in
    Html.div [ Attrs.class "footer", role "contentinfo" ]
        [ Html.div []
            [ Html.a
                [ Attrs.href mailto , Attrs.class "link"]
                [ Html.text email ]
            ]
        , Html.ul
            [ Attrs.class "link-list"
            , role "navigation"
            ]
                <| List.intersperse separator
                [ link AboutMe
                , link PastProjects
                , link WorkWithMe
                , link Creations
                ]

        , Html.div [] [ Html.text <| L.allRights l ]
        , Html.div [ Attrs.class "contents-note" ] [ Html.text <| L.contentsStatement l ]
        
        -- floating elements
        , Html.div [ Attrs.class "footer-floating-elements"]
            [ Html.img
                [ Attrs.class "branch-3"
                , Attrs.src <| "/assets/branch_3.png"
                , Attrs.alt ""
                , rolePresentation
                ] []
            , Html.img
                [ Attrs.class "branch-2"
                , Attrs.src <| "/assets/branch_2.png"
                , Attrs.alt ""
                , rolePresentation
                ] []
            ]
        ]

pastProject : PastProject -> Language -> Html Msg
pastProject project l =
    Html.div
        [ Attrs.class "past-project" ]
        [ circle_small project.image
        , Html.h3 [ Attrs.class "past-project-name" ] [ Html.text <| project.title l ]
        , Html.div [ Attrs.class "project-description" ] [ Html.text <| project.description l ]
        , Html.div [ Attrs.class "project-action" ]
            [ Html.a
                [ Attrs.href project.link
                , Attrs.target "_blank"
                , Attrs.class "past-project-link"
                , ariaLabel <| project.title l ++ " - " ++ L.pastProjectLink l
                ]
                [ Html.text <| L.pastProjectLink l ]
            ]
        ]

proposal : Proposal -> Language -> Html Msg
proposal p l =
    Html.div
        [ Attrs.class "work-proposal" ]
        [ Html.img
            [ Attrs.class "proposal-image"
            , Attrs.src <| "/assets/" ++ p.image 
            , Attrs.alt ""
            , rolePresentation
            ] []
        , Html.h3 [ Attrs.class "proposal-name" ] [ Html.text <| p.title l ]
        , Html.div [ Attrs.class "proposal-description" ] [ Html.text <| p.description l ]
        , p.action l
        ]

picture : Language -> String -> Html Msg
picture l s =
    Html.img
        [ Attrs.class "creations-picture"
        , Attrs.src <| "/assets/made/" ++ s ++ ".png"
        , Attrs.alt <| (L.creation l) ++ s
        ] []


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
            , ariaLabel <| L.workshopsTitle l ++ ": " ++ L.downloadWorkshopProposals l
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
            , ariaLabel <| L.orgsTitle l ++ ": " ++ L.downloadOrgsProposals l
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
        , ariaLabel <| L.customTitle l ++ ": " ++ L.bookChat l
        ]
        [ Html.text <| L.bookChat l ]
    }

-- spotify embed

spotify : Language -> Html msg
spotify l =
    Html.iframe
        [ Attrs.class "spotify-embed"
        , ariaLabel <| L.spotify l
        , Attrs.attribute "data-testid" "embed-iframe"
        , Attrs.style "border-radius" "12px"
        , Attrs.src "https://open.spotify.com/embed/episode/0YoPxvLJwr4I1d7vkzyMaA?utm_source=generator"
        , Attrs.height 152
        , Attrs.attribute "frameborder" "0"
        , Attrs.attribute "loading" "lazy"
        ]
        []
    

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


-- scrolling helpers

scrollX : Float -> String ->Task Browser.Dom.Error ()
scrollX x elementId =
    Browser.Dom.setViewportOf elementId x 0


taskScrollRight : String -> Cmd Msg
taskScrollRight =
    Task.attempt (\_ -> NoOp) << scrollX 1300


taskScrollLeft : String -> Cmd Msg
taskScrollLeft =
    Task.attempt (\_ -> NoOp) << scrollX 0