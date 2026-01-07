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

makeString : a -> a -> Language -> a
makeString en it l =
    case l of
        EN -> en
        IT -> it


-- All site-related strings

tagline : Language -> String
tagline =
    makeString
        "facilitating change"
        "facilitando cambiamenti"

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
        "What I make"
        "Cosa faccio"

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
            Facilito dialoghi, processi decisionali, e formazioni per dare strumenti 
            utili a gruppi e persone che cercano di portare un cambiamento 
            positivo nel mondo. Parto dall'ascolto attivo e dalla comunicazione efficace 
            per esplorare i temi dell'intersezionalità, della queerness, e della costruzione 
            di comunità. 
        """

aboutMeBlurb : Language -> List String
aboutMeBlurb = 
    makeString
        [   """
                I grew up immersed in nature on the hills of Northen Italy, moved to the city of Turin 
                for high school, left home at 16 to study at UWC Adriatic, then attended university at Yale-NUS College
                in Singapore, where I lived for 7 years. Each move allowed me to widen my view of the world 
                and engage with the complexities of building purposeful communities that make space 
                for our differences. 
            """
        ,    """ 
                In university I focused on creating spaces for intercultural dialogue, and on building 
                a peer listening program on campus. I graduated with a BA in Environmental Studies, 
                a field of learning that allowed me to think deeply about how people organise to enact change.
            """
        ,   """
                Since 2018 I have been working as a programmer first, and tech lead after. I built a team
                of software engineers across Europe, facilitating collaboration and decision-making to create a 
                sustainable working environment. In 2020 I moved back to Turin, where I continue to use 
                my active listening and facilitation skills to create and strenghten communities, 
                especially in queer spaces.
            """
        ]

        [ """
                Sono cresciuta in mezzo alla natura sulle colline del Monferrato, per poi trasferirmi a Torino per il liceo;  
                a 16 anni sono uscita di casa per andare a studiare al Collegio del Mondo Unito dell'Adriatico, vicino a Trieste,  
                per poi partire per Singapore, dove ho studiato - frequentando Yale-NUS College - e lavorato per 7 anni. 
                Ogni passaggio ha contribuito ad ampliare la mia visione del mondo e mi ha permesso di confrontarmi con la  
                complessità di costruire comunità intenzionali che accolgano le nostre differenze.
            """
        ,    """ 
                Durante l'università mi sono impegnata nella creazione di spazi per il dialogo interculturale e nella costruzione 
                di un programma di ascolto fra pari per studenti residenti nel campus. Mi sono laureata in Studi Ambientali,
                un corso che mi ha permesso di riflettere profondamente su come le persone si organizzano per attuare il cambiamento.
            """
        ,   """
                Dal 2018 ho lavorato come programmatrice e poi come responsabile tecnica. Ho costruito un team remoto 
                di ingegneri informatici in Europa, facilitando la collaborazione e il processo decisionale e creando un
                ambiente di lavoro sostenibile. Nel 2020 sono tornata a Torino, dove continuo a mettere a frutto
                le mie capacità di ascolto attivo e facilitazione per creare e rafforzare comunità,
                soprattutto in spazi queer.
            """
        ]

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

emailMe : Language -> String
emailMe =
    makeString
        "email me"
        "scrivimi un'e-mail"

bookChat : Language -> String
bookChat =
    makeString
        "book a time to talk"
        "fissa una chiamata"


linkedIn : Language -> String
linkedIn =
    makeString
        "Find me on LinkedIn"
        "Trovami su LinkedIn"

-- past projects

pastProjectsBlurb : Language -> String
pastProjectsBlurb =
    makeString
        """
            I find ways to facilitate conversations in all the spaces I traverse, wether with friends, 
            conducting trainings, leading workshops, or running a D&D campaign! These are some of the most 
            recent oppurtunities I have had to work with groups and start a dialogue around active listening, 
            intersectionality, conflict management... and much more.
        """
        """
            Colgo occasioni per facilitare conversazioni in tutti i contesti che attraverso: 
            che sia fra amichə, durante formazioni specifiche, in workshop tematici, o in una campagna di D&D! 
            Questi sono alcuni dei momenti più recenti in cui ho avuto l'opportunità di lavorare con gruppi  
            di persone per instaurare un dialogo sui temi dell'ascolto attivo, dell'intersezionalità, 
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
        """
            During Inclusion Day 2025 at the ITCILO (International Training Centre of the International Labour Organization) in Turin, 
            I delivered the interactive workshop "Meet Me" to bring an experiential component to the exploration of the day's theme: 
            "Intersectionality in Action". The activity was conducted on behalf of Giosef Torino, which developped it as part of the 
            project "MARTI - Make it relevant: tools for intersectionlity", and was tailored to best work in the context 
            of the ITCILO's program.
        """
        """
            Durante l'Inclusion Day 2025 presso l'ITCILO (Centro Internazionale di Formazione dell'Organizzazione Internazionale del Lavoro) di Torino,
            ho tenuto il workshop interattivo "Meet Me", portando una componente esperienziale all'esplorazione del tema della giornata:
            "Intersezionalità in azione". L'attività è stata condotta per conto di Giosef Torino, che l'ha sviluppata nell'ambito del
            progetto "MARTI - Make it relevant: tools for intersectionlity", ed è stata adattata per funzionare al meglio nel contesto
            del programma dell'ITCILO.
        """

ribesTitle : Language -> String
ribesTitle =
    makeString
        "Active Listening & Non-Violent Communication Trainings"
        "Formazioni di Ascolto Attivo & Comunicazione Non Violenta"

ribesBlurb : Language -> String
ribesBlurb =
    makeString
        """
            I structured and facilitated three separate trainings on communication for "Il Forno delle Idee", a 
            learning centre that works primarely with young people with learning disabilities. The trainings were 
            aimed at the tutors working there and they covered (i) the basics of active listening, (ii) introduction 
            to non violent communication, and (iii) guidelines for constructively receiving disclosure from young people. 
            
            Each training was built to be interactive and to allow for different ways to process information (verbal, written,
            group, individual, etc.); they lasted around one and a half hour each, and were free to attend for anyone working in 
            the third sector or with young people.
        """
        """
            Ho strutturato e facilitato tre formazione sulla comunicazione per "Il Forno delle Idee", un centro per l'apprendimento 
            specializzato nel supporto scolastico per ragazzə DSA e BES. Le formazioni erano rivolte allə tutor 
            e hanno affrontato (i) le basi dell'ascolto attivo, (ii) un'introduzione alla comunicazione non violenta e (iii) 
            come accogliere al meglio possibili comunicazione difficili da parte delle giovani persone.

            Ogni formazione è stata pensata per essere interattiva e consentire diverse modalità di elaborazione delle informazioni 
            (verbale, scritta, di gruppo, individuale, ecc.); la durata è stata di un'ora e mezza circa per ognuna, ed erano 
            accessibili gratuitamente a persone del terzo settore e youth workers.
        """

qualityAssuranceTitle : Language -> String
qualityAssuranceTitle =
    makeString
        "Conflict Management Evaluation - Qality Assurance for All"
        "Valutazione della gestione del conflitto - Quality Assurance for All"

qualityAssuranceBlurb : Language -> String
qualityAssuranceBlurb =
    makeString
        """
            I took part in the piloting process for the Quality Assurance Handbook, a guide produced in the context 
            of the Erasmus+ project "Quality Assurance for All: Ensuring quality of youth work through intersectionality and human rights".

            After attending the initial training and providing feedback on early drafts of the manual, 
            I put the "conflcit management" section into practice by conducting an evaluation process for the 
            cultural association Centro Studi Sereno Regis.
        """
        """
            Ho preso parte al processo di pilotaggio del Manuale di Garanzia della Qualità, una guida prodotta nell'ambito
            del progetto Erasmus+ "Quality Assurance for All: Ensuring quality of youth work through intersectionality and human rights". 

            Dopo aver partecipato alla formazione iniziale e aver dato feedback sulla prima versione del manuale, 
            ho testato la sezione dedicata alla gestione dei conflitti, conducendo un processo di valutazione per 
            l'associazione culturale Centro Studi Sereno Regis.
        """

gruppoLesbicoTitle : Language -> String
gruppoLesbicoTitle =
    makeString
        "Exploring lesbian spaces with the Lesbonautə"
        "Esplorazione e autocoscienza lesbica con le Lesbonautə"

gruppoLesbicoBlurb : Language -> String
gruppoLesbicoBlurb =
    makeString
        """
            Hosted by Maurice GLBTQ+, Lesbonautə is a group of queer women 
            that organises bi-monthly events to explore themes related to lesbian identities and spaces. 
            
            We create a welcoming environment to learn together: from getting to know other groups/initiatives 
            in Turin and in Italy, to exploring Wittig's "The Lesbian Body".

            The meetings are open to anyone who feels involved in the lesbian experience or identifies 
            as lesbian (regardless of gender identity or sexual orientation).
        """
        """
            Lesbonautə è un gruppo di donne queer che opera all'interno dell'associazione Maurice GLBTQ+ 
            organizzando eventi bimestrali per esplorare le identità e gli spazi lesbici.

            Creiamo un ambiente accogliente in cui imparare insieme: dal conoscere altri gruppi/iniziative
            a Torino e in Italia, all'esplorare di "Il corpo lesbico" di Wittig.

            Gli incontri sono aperti a tutte le persone che si sentono coinvolte dall'eperienza lesbica o si 
            riconoscono nell'identità lesbica (a prescindere dalla propria identità di genere o orientamento sessuale).
        """

-- work with me

workWithMeBlurb : Language -> String
workWithMeBlurb =
    makeString
        """
            I want to work with people trying to change the world for the better, wether you are a young change-maker, a seasoned activist, 
            someone running an organisation, or a freelancer. These are some of the things I enjoy doing and the value I think they can bring. 
            If you have any idea, question, or concern, get in touch and let's talk!
        """
        """
            Voglio lavorare con persone che stanno cercano di cambiare il mondo in meglio, Che tu sia unə giovane change-maker, 
            unə attivista di lunga data, unə persona che manda avanti un'organizzazione, o unə liberə professionista. Queste 
            sono alcune delle modalità in cui posso portare valore aggiunto in diversi contesti. Se hai idee, domande 
            o dubbi, contattami e parliamone!
        """

orgsTitle : Language -> String
orgsTitle =
    makeString
        "Organisations"
        "Organizzazioni"

orgsBlurb : Language -> String
orgsBlurb =
    makeString
        """ 
            Looking for a process that goes beyond a one-off workshop? Need to evaluate some aspects of your work and want an external perspective? 
            Feel like emerging leaders in your team could use some extra support? We can craft a medium to long term plan that focuses on 
            what matters the most for your organisation.
        """
        """
            Cercate un percorso che vada oltre alla singola formazione? Dovete valutare degli aspetti del vostro operato e vorreste una prospettiva esterna? 
            Pensate che lə nuove leader del team potrebbero aver bisogno di un supporto extra? Possiamo creare assieme un piano a medio-lungo termine che si 
            concentri su ciò che conta di più per la vostra organizzazione.
        """

workshopsTitle : Language -> String
workshopsTitle =
    makeString
        "workshops"
        "formazioni"

workshopsBlurb : Language -> String
workshopsBlurb =
    makeString
        """ 
            Want to work on communication? Think you or your team would benefit from listening better to each other? 
            Want learn how to create a more welcoming environment? These workshops target the basics of active listening and  
            non-violent communication. Content and duration are tweaked each time to suit the context.
        """
        """
            Vuoi lavorare sulla comunicazione? Pensi che tu o il tuo team trarreste beneficio dall'ascoltarvi meglio? 
            Vuoi imparare a creare un ambiente più accogliente? Questi workshop affrontano le basi dell'ascolto attivo e 
            della comunicazione non violenta. La durata e i contenuti sono adattati per ogni contesto.
        """

customTitle : Language -> String
customTitle =
    makeString
        "tailored"
        "su misura"

customBlurb : Language -> String
customBlurb = 
    makeString
        """ 
            Not sure what would work best? Haven't found exactly what you are looking for? 
            Whatever journey you are on, I am always available for a chat: 
            let's discover together what you might need.
        """
        """
            Non sai quale formato potrebbe funzionare meglio? Non trovi esattamente quello che stavi cercando?
            Qualunque sia la tua situazione, sono sempre disponibile per una chiacchierata: 
            scopriamo insieme di cosa potresti aver bisogno.
        """

downloadWorkshopProposals : Language -> String
downloadWorkshopProposals =
    makeString
        "read the proposals"
        "leggi le proposte"

downloadOrgsProposals : Language -> String
downloadOrgsProposals =
    makeString
        "read the proposals"
        "leggi le proposte"

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
            e mi premeva includerla qui. Imparare assieme e insegnarci l'un l'altra è alla base di molto del mio 
            lavoro di costruione di comunità.
        """

ravelry : Language -> String
ravelry =
    makeString
        "Find me on Raverly"
        "Trovami su Raverly"

loremIpsum : String
loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dictum viverra ex, in sagittis augue ultricies id. In hac habitasse platea dictumst. Vivamus vehicula urna sed enim ultrices condimentum. Aenean tristique mi eu metus tempor, sit amet dignissim turpis malesuada. Nunc non volutpat lacus. Proin placerat, nisl et dapibus varius, ante nisl imperdiet sem, vitae pellentesque est dui in erat."
