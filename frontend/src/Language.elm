module Language exposing (..)

import Html exposing (Html)
import Html.Attributes as Attrs
import Html.Events

type Language
    = IT
    | EN


languageSwitch : (Language -> msg) -> Html msg
languageSwitch changeLanguageTo =
    Html.div [ Attrs.class "language-switch" ]
        [ Html.button [ Html.Events.onClick <| changeLanguageTo EN ] [ Html.text "EN" ]
        , Html.text " | "
        , Html.button [ Html.Events.onClick <| changeLanguageTo IT ] [ Html.text "IT" ]
        ]


makeString : String -> String -> Language -> String
makeString en it l =
    case l of
        EN -> en
        IT -> it


-- All site-related strings

testText : Language -> String
testText =
    makeString
        "this is an English text"
        "questo è un testo in Italiano"


tagline : Language -> String
tagline =
    makeString
        "some tagline here please"
        "questa è una tagline"

aboutMe : Language -> String
aboutMe =
    makeString
        "About me"
        "Su di me" -- TODO

pastProjects : Language -> String
pastProjects =
    makeString
        "Recent projects"
        "Progetti recenti" -- TODO

workWithMe : Language -> String
workWithMe =
    makeString
        "Work with me"
        "Lavora con me"

creations : Language -> String
creations =
    makeString
        "Creations & More"
        "Creazioni & altro"

intro : Language -> String
intro =
    makeString
        loremIpsum
        loremIpsum

aboutMeBlurb : Language -> String
aboutMeBlurb =
    makeString
        (loremIpsum ++ loremIpsum)
        (loremIpsum ++ loremIpsum)

learnMore : Language -> String
learnMore =
    makeString
        "Learn more"
        "Scopri di più"


downloadCVEN : Language -> String
downloadCVEN =
    makeString
        "Download my CV (EN)"
        "Scarica il mio CV (EN)"

downloadCVIT : Language -> String
downloadCVIT =
    makeString
        "Download my CV (IT)"
        "Scarica il mio CV (IT)"

getInTouch : Language -> String
getInTouch =
    makeString
        "Get in touch"
        "Contattami"

linkedIn : Language -> String
linkedIn =
    makeString
        "Find me on LinkedIn"
        "Trovami su LinkedIn"

-- past projects

pastProjectsBlurb : Language -> String
pastProjectsBlurb =
    makeString
        loremIpsum
        loremIpsum

testProject : Language -> String
testProject =
    makeString
        loremIpsum
        loremIpsum

testProjectTitle : Language -> String
testProjectTitle =
    makeString
        "project title"
        "project title"

-- work with me

workWithMeBlurb : Language -> String
workWithMeBlurb =
    makeString
        loremIpsum
        loremIpsum

coachingTitle : Language -> String
coachingTitle =
    makeString
        "coaching title"
        "coaching title"

coachingBlurb : Language -> String
coachingBlurb =
    makeString
        loremIpsum
        loremIpsum

workshopsTitle : Language -> String
workshopsTitle =
    makeString
        "workshops title"
        "workshops title"

workshopsBlurb : Language -> String
workshopsBlurb =
    makeString
        loremIpsum
        loremIpsum

customTitle : Language -> String
customTitle =
    makeString
        "custom title"
        "custom title"

customBlurb : Language -> String
customBlurb =
    makeString
        loremIpsum
        loremIpsum

loremIpsum : String
loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum viverra ex, in sagittis augue ultricies id. In hac habitasse platea dictumst. Vivamus vehicula urna sed enim ultrices condimentum. Aenean tristique mi eu metus tempor, sit amet dignissim turpis malesuada. Nunc non volutpat lacus. Proin placerat, nisl et dapibus varius, ante nisl imperdiet sem, vitae pellentesque est dui in erat."


