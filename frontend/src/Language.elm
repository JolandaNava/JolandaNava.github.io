module Language exposing (..)

import Html exposing (Html)
import Html.Attributes as Attrs
import Html.Events

type Language
    = IT
    | EN


languageSwitch : (Language -> msg) -> Html msg
languageSwitch changeLanguageTo =
    Html.th [ Attrs.class "language-switch-container" ]
        [ Html.div [ Attrs.class "language-switch" ]
            [ Html.button [ Html.Events.onClick <| changeLanguageTo EN ] [ Html.text "EN" ]
            , Html.text " | "
            , Html.button [ Html.Events.onClick <| changeLanguageTo IT ] [ Html.text "IT" ]
            ]
        ]



makeString : String -> String -> Language -> String
makeString en it l =
    case l of
        EN -> en
        IT -> it


-- All site-related strings

tagline : Language -> String
tagline =
    makeString
        "listening and facilitation"
        "facilitazione e ascolto"

aboutMe : Language -> String
aboutMe =
    makeString
        "About me"
        "Su di me"

pastProjects : Language -> String
pastProjects =
    makeString
        "Recent projects"
        "Progetti recenti"

workWithMe : Language -> String
workWithMe =
    makeString
        "Work with me"
        "Lavora con me"

creations : Language -> String
creations =
    makeString
        "Making" -- TODO
        "Creando"

intro : Language -> String
intro =
    makeString
        """
            I facilitate dialogues, decision-making processes, and trainings, 
            to empower groups and people making a positive impact in the world. 
            I focus on active listening and effective communication, exploring the 
            themes of intersectionality, queerness, and community building.

        """
        """
            Facilito dialoghi, processi decisionali, e formazioni per portare strumenti 
            utili ai gruppi e alle persone che lavorano per portare un cambiamento 
            positivo nel mondo. Parto dall'ascolto attivo e dalla comunicazione efficace, 
            esplorando i temi dell'intersezionalità, della queerness, e della costruzione 
            di comunità. 
        """

aboutMeBlurb : Language -> String
aboutMeBlurb = -- TODO
    makeString
        loremIpsum
        loremIpsum
        -- """
        --     - background
        --     - "qualifiche"
        --     ???
        -- """
        -- """
        --     - background
        --     - "qualifiche"
        --     ???
        -- """

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
pastProjectsBlurb = -- TODO
    makeString
        """
            I find ways to facilitate conversations in all the spaces I traverse, wether with friends, 
            doing trainings, leading workshops, or running a D&D campaign! These are some of the most 
            recent oppurtunities I have had to work with groups to start dialogues around active listening, 
            intersectionality, conflict management... and much more.
        """
        """
            Colgo occasioni per facilitare conversazioni in tutti i contesti che attraverso: 
            che sia fra amichə, durante formazioni specifiche, in workshop tematici, o in una campagna di D&D! 
            Questi sono alcuni dei momenti più recenti in cui ho avuto l'opportunità di lavorare con dei 
            gruppi per iniziare un dialogo sui temi dell'ascolto attivo, dell'intersezionalità, 
            della gestione del conflitto... e molto altro.
        """

pastProjectLink : Language -> String
pastProjectLink =
    makeString
        "read more"
        "leggi di piú"

itciloTitle : Language -> String
itciloTitle =
    makeString
        "Intersectionality Workshop at ITCILO"
        "Attività sull'Intersezionalità all'ITCILO"

itciloBlurb : Language -> String
itciloBlurb =
    makeString
        loremIpsum
        loremIpsum
        -- """
        --     Today was Inclusion Day 2025 at the ITCILO, under the theme “Intersectionality in Action” interactive “Meet Me” workshop delivered

        -- """
        -- """
        --     TODO
        -- """

ribesTitle : Language -> String
ribesTitle =
    makeString
        "Active Listening & Non-Violent Communication Trainings"
        "Formazioni di Ascolto Attivo & Comunicazione Non Violenta"

ribesBlurb : Language -> String
ribesBlurb =
    makeString
        """
            I conducted three separate trainings on active listening skills, the basics of non-violent and communication, 
            and guidelines for offering support. The trainings were aimed at tutors working with young people with 
            learning disabilities and lasted around one and a half hour each. 
            The encounters were hosted by the learning centre "Il Forno delle Idee" in Turin, as part of a wider 
            range of workshops on communication, and were free to attend for anyone working in the third sector 
            or with young people.
        """
        """
            TODO
        """

qualityAssuranceTitle : Language -> String
qualityAssuranceTitle =
    makeString
        "Conflict Management Evaluation - Qality Assurance for All"
        "Valutazione di gestione del conflitto - Quality Assurance for All"

qualityAssuranceBlurb : Language -> String
qualityAssuranceBlurb =
    makeString
        loremIpsum
        loremIpsum
        -- """
        --     TODO
        -- """
        -- """
        --     "Quality Assurance for All: Ensuring quality of youth work through intersectionality and human rights" - all'interno del programma Erasmus+
        -- """

gruppoLesbicoTitle : Language -> String
gruppoLesbicoTitle =
    makeString
        "Peer Learning on lesbian themes"
        "Autoformazione su tematiche lesbiche"

gruppoLesbicoBlurb : Language -> String
gruppoLesbicoBlurb =
    makeString
        loremIpsum
        loremIpsum
        -- """
        --     TODO
        -- """
        -- """
        --     TODO
        -- """

-- work with me

workWithMeBlurb : Language -> String
workWithMeBlurb = -- TODO
    makeString
        loremIpsum
        loremIpsum

coachingTitle : Language -> String
coachingTitle =
    makeString
        "coaching"
        "coaching"

coachingBlurb : Language -> String
coachingBlurb = -- TODO
    makeString
        loremIpsum
        loremIpsum

workshopsTitle : Language -> String
workshopsTitle =
    makeString
        "workshops"
        "formazioni"

workshopsBlurb : Language -> String
workshopsBlurb = -- TODO
    makeString
        loremIpsum
        loremIpsum

customTitle : Language -> String
customTitle =
    makeString
        "tailored"
        "su misura"

customBlurb : Language -> String
customBlurb = -- TODO
    makeString
        loremIpsum
        loremIpsum

downloadWorkshopProposals : Language -> String
downloadWorkshopProposals =
    makeString
        "workshop proposals"
        "proposte di formazione"

downloadCoachingProposals : Language -> String
downloadCoachingProposals =
    makeString
        "coaching proposals"
        "proposte di coaching"

-- creations

creationsBlurb : Language -> String
creationsBlurb =
    makeString
        """
            Beside facilitating, I like to make, grow, knit, mend, fix, build, crochet, cook, fold, knot, draw, 
            and I'm sure the list will grow longer with the years. I always come back to the joy of making something 
            or learning a new skill, and as such it felt important to include it here. Learning together and 
            teaching each other a craft has also been the basis of a lot of my community building.
        """
        """
            Oltre a facilitare, mi piace costruire, coltivare, fare la maglia, rattoppare, aggiustare, fare l'uncinetto, cucinare, 
            piegare la carta, annodare, disegnare, lavorare la ceramica, e sono sicura che la lista non farà che 
            crescere negli anni. La gioia di creare qualcosa o di imparare una nuova tecnica è una costante per me, 
            e mi premeva includerla qui. Imparare assieme e insegnarci l'un l'altra è alla base di molti dei 
            miei sforzi di costruire comunità.
        """ -- TODO invece di "sforzi"

ravelry : Language -> String
ravelry =
    makeString
        "Find me on Raverly"
        "Trovami su Raverly"

loremIpsum : String
loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum viverra ex, in sagittis augue ultricies id. In hac habitasse platea dictumst. Vivamus vehicula urna sed enim ultrices condimentum. Aenean tristique mi eu metus tempor, sit amet dignissim turpis malesuada. Nunc non volutpat lacus. Proin placerat, nisl et dapibus varius, ante nisl imperdiet sem, vitae pellentesque est dui in erat."
