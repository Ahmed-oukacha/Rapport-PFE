
#import "../components.typ": *

#eniad-chapter(
  "4",
  [Implémentation et Résultats]
)


#import "../components.typ": *
#import "@preview/cetz:0.5.2"
#import "../components.typ": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/zebraw:0.6.3": *
#show: zebraw
#set page(
)

#set text(
  font: "Times New Roman",
  size: 12pt,
)
#set par(
  justify: true,
  leading: 1.15em,
  
)

// =====================================================
// Style du titre principal
// =====================================================

#show heading.where(level: 1): it => [
  #v(-3cm)

  #text(
    font: "Times New Roman",
    size: 24pt,
    weight: "bold",
    fill: ENIADBlue,
  )[
    #it.body
  ]

  #v(0cm)

  #line(
    length: 100%,
    stroke: 1.4pt + ENIADOrange,
  )

  #v(0.1cm)
]

// =====================================================
// Compteurs dynamiques pour l'introduction
// Sections : 0.1, 0.2, 0.3 ...
// Sous-sections : 0.1.1, 0.1.2 ...
// =====================================================

#let intro-section-counter = counter("intro-section")
#let intro-subsection-counter = counter("intro-subsection")

#intro-section-counter.update(0)
#intro-subsection-counter.update(0)

#let intro-section(title) = [
  #intro-section-counter.step()
  #intro-subsection-counter.update(0)

  #context {
    let chapter = counter(heading).get().first() // chapitre
    let section = intro-section-counter.get().first()

    [
      #hide[
        #heading(
          level: 2,
          numbering: none,
          outlined: true,
        )[ #chapter.#section #title ]
      ]

      #v(0.1cm)

      #text(
        size: 17pt,
        weight: "bold",
        fill: ENIADBlue,
      )[
        #chapter.#section #h(0.6cm) #title
      ]

      #v(0.35cm)

      #line(
        length: 100%,
        stroke: 0.6pt + ENIADBlue.lighten(65%),
      )

      #v(0cm)
    ]
  }
]
#let intro-subsection(title) = [
  #intro-subsection-counter.step()

  #context {
    let chapter = counter(heading).get().first()
    let section = intro-section-counter.get().first()
    let subsection = intro-subsection-counter.get().first()

    [
      #hide[
        #heading(
          level: 3,
          numbering: none,
          outlined: true,
        )[ #chapter.#section.#subsection #title ]
      ]

      #v(0.2cm)

      #text(
        size: 13pt,
        weight: "bold",
      )[
        #chapter.#section.#subsection #h(0.45cm) #title
      ]

      #v(0.2cm)
    ]
  }
]
``
#intro-section[Réalisation et implémentation]
Ce chapitre quitte le terrain de la conception pour entrer dans celui de la construction. Il retrace les choix concrets de développement, l'organisation du code, les itérations successives du produit, et les obstacles rencontrés en cours de route.
#intro-subsection[ Environnement et outils de développement]
Le développement de la plateforme ADAS R2T s’appuie sur un ensemble d’outils et de technologies sélectionnés pour répondre aux exigences de performance, de sécurité et de maintenabilité identifiées dans les besoin non fonctionel récapitule les principales technologies utilisées par couche fonctionnelle.
#intro-subsection[Environnement du pipeline IA.]
Le moteur d’orchestration agentique repose sur Python 3.11 et le framework FastAPI. Le choix
de FastAPI se justifie par son support natif de la programmation asynchrone (async/await),
essentiel pour gérer les appels concurrents aux API des fournisseurs LLM. Le gestionnaire de
paquets uv remplace pip pour accélérer la résolution et l’installation des dépendances.
L’orchestration du graphe d’état s’effectue via LangGraph, qui s’appuie sur la couche
d’abstraction LangChain Core pour unifier les appels aux trois fournisseurs de modèles : Google
Gemini, OpenAI et Ollama modèle qwen2.5:14b pour le développement hors ligne.
#set page(header: report-header, footer: report-footer)
Cette architecture de type LLM factory permet de basculer le modèle utilisé par chaque nœud du
pipeline via une variable d’environnement LLM_OVERRIDE_{NODE}_BACKEND, sans modifier
le code source.
La persistance de l’état du graphe s’appuie sur PostgreSQL via le module de checkpointing dédié
de LangGraph. Les données de validation Pydantic v2 garantissent la conformité structurelle de
chaque sortie LLM. La bibliothèque tenacity gère la résilience des appels réseau grâce à un
mécanisme de réexécution automatique avec repli exponentiel.

// =====================================================
// Table 1 — Pipeline IA
// =====================================================

#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 8.2pt,
    )

    #table(
      columns: (4.2cm, 5.4cm, 6.8cm),
      inset: (x: 5pt, y: 5pt),
      stroke: none,
      align: (left, left, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Couche]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Technologie]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Rôle]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      [
        #text(weight: "bold", fill: ENIADBlue)[Langage]
      ],
      [Python 3.11],
      [Langage principal du pipeline],

      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Framework web]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        FastAPI + Uvicorn
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        API REST asynchrone
      ],

      [
        #text(weight: "bold", fill: ENIADBlue)[Orchestration]
      ],
      [LangGraph \(StateGraph\)],
      [Graphe d’état agentique],

      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Framework LLM]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        LangChain Core
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Abstraction multi-modèle
      ],

      [
        #text(weight: "bold", fill: ENIADBlue)[Validation]
      ],
      [Pydantic v2],
      [Schémas de sortie structurée],

      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Base de données]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        PostgreSQL
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Persistance des checkpoints
      ],

      [
        #text(weight: "bold", fill: ENIADBlue)[Évaluation]
      ],
      [DeepEval],
      [Métriques G-Eval personnalisées],

      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Observabilité LLM]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Langfuse
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Traçage des appels LLM
      ],

      [
        #text(weight: "bold", fill: ENIADBlue)[Monitoring]
      ],
      [Prometheus + Grafana],
      [Métriques système et API],

      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Journalisation]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        structlog
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Logs structurés JSON
      ],

      [
        #text(weight: "bold", fill: ENIADBlue)[Résilience]
      ],
      [tenacity],
      [Retry avec backoff exponentiel],

      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Sécurité]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        python-jose, pycryptodome
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        JWT et chiffrement AES
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Technologies utilisées dans la couche Pipeline IA],
  kind: table,
) <tab:tech-pipeline-ia>


#intro-subsection[Environnement fullstack.]

L’interface utilisateur est développée avec Next.js 16 en TypeScript. Le framework React,
intégré à Next.js, gère l’état applicatif via le React Context API. Le style graphique repose
sur Tailwind CSS v4, un framework CSS utilitaire qui permet un prototypage rapide et une
cohérence visuelle sur l’ensemble des pages.
Le serveur d’application fullstack utilise également FastAPI et communique avec le pipeline
IA via des appels HTTP asynchrones à l’aide de la bibliothèque httpx. La base de données
MongoDB stocke les documents, les exigences et les cas de test via le pilote asynchrone motor.


// =====================================================
// Table 2 — Plateforme Fullstack
// =====================================================

#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 8.2pt,
    )

    #table(
      columns: (4.2cm, 5.4cm, 6.8cm),
      inset: (x: 5pt, y: 5pt),
      stroke: none,
      align: (left, left, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Couche]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Technologie]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Rôle]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      [
        #text(weight: "bold", fill: ENIADBlue)[Frontend]
      ],
      [Next.js 16 + TypeScript],
      [Interface utilisateur],

      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Style CSS]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Tailwind CSS v4
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Système de design utilitaire
      ],

      [
        #text(weight: "bold", fill: ENIADBlue)[Backend]
      ],
      [FastAPI + Python 3.11],
      [Logique applicative],

      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Base de données]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        MongoDB \(motor async\)
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Persistance des documents
      ],

      [
        #text(weight: "bold", fill: ENIADBlue)[Authentification]
      ],
      [JWT + bcrypt],
      [Jetons et hachage de mots de passe],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Technologies utilisées dans la plateforme fullstack],
  kind: table,
) <tab:tech-fullstack>


#intro-subsection[Infrastructure et outillage.]
L’ensemble des services (pipeline IA, backend fullstack, frontend, PostgreSQL, MongoDB,
Prometheus, Grafana) est conteneurisé à l’aide de Docker et orchestré par un fichier
docker-compose.yml. Cette approche garantit la reproductibilité de l’environnement de
développement et simplifie le déploiement.
La qualité du code est maintenue par les outils ruff (linting rapide), black (formatage
automatique) et isort (tri des importations). Le contrôle de version s’effectue sur GitHub avec
deux dépôts : ai-pipeline pour le moteur IA (82 commits) et fullstack pour la plateforme
applicative (137 commits)


// =====================================================
// Table 3 — Infrastructure
// =====================================================

#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 8.2pt,
    )

    #table(
      columns: (4.2cm, 5.4cm, 6.8cm),
      inset: (x: 5pt, y: 5pt),
      stroke: none,
      align: (left, left, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Couche]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Technologie]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Rôle]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      [
        #text(weight: "bold", fill: ENIADBlue)[Conteneurisation]
      ],
      [Docker + docker-compose],
      [Orchestration multi-services],

      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Gestion de paquets]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        uv \(Python\), npm \(Node\)
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Installation des dépendances
      ],

      [
        #text(weight: "bold", fill: ENIADBlue)[Qualité de code]
      ],
      [SonarQube],
      [Linting et formatage],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Technologies utilisées dans la couche infrastructure],
  kind: table,
) <tab:tech-infrastructure>





#intro-subsection[Organisation du code source]
Un projet de cette envergure *25 nœuds*, trois modes de fonctionnement, *plusieurs couches* d'infrastructure  ne peut se permettre un code monolithique. Dès le départ, l'organisation du code a été pensée pour qu'un développeur puisse localiser n'importe quel composant en quelques secondes.
Le projet adopte une structure `"src/"` qui isole le code applicatif des fichiers de configuration et d'infrastructure :
#figure(
  block(
    width: 100%,
    fill: rgb("#ffffff"),
    stroke: 0.6pt + rgb("#ffffff"),
    radius: 6pt,
    inset: 10pt,
  )[
    #set text(
      font: "Cascadia Code",
      size: 6.6pt,
    )

```text
R2T-0.1V/
├── docker/
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── nginx/
│   ├── prometheus/
│   └── grafana/
├── src/
│   └── app/
│       ├── main.py
│       ├── api/
│       │   └── v1/
│       │       └── pipeline.py
│       ├── core/
│       │   ├── config.py
│       │   ├── logging.py
│       │   ├── metrics.py
│       │   ├── checkpointer.py
│       │   ├── memory_store.py
│       │   ├── memory_manager.py
│       │   ├── middleware.py
│       │   ├── cleanup.py
│       │   └── langgraph/
│       │       ├── graph.py
│       │       ├── utils.py
│       │       ├── nodes/
│       │       │   ├── ingest_excel.py
│       │       │   ├── extract_and_structure.py
│       │       │   ├── analyze_video.py
│       │       │   ├── video_frame_analyzer.py
│       │       │   ├── video_scenario_builder.py
│       │       │   ├── video_scenario_mutator.py
│       │       │   ├── coverage_planner.py
│       │       │   ├── plan_single_req.py
│       │       │   ├── generate_tc.py
│       │       │   ├── synthesizer.py
│       │       │   ├── evaluator.py
│       │       │   ├── human_review.py
│       │       │   ├── process_review.py
│       │       │   ├── output_excel.py
│       │       │   └── video_output_excel.py
│       │       └── prompts/
│       │           ├── extract_and_structure.md
│       │           ├── plan_single_req.md
│       │           ├── generate_tc.md
│       │           └── ...
│       └── schemas/
│           ├── workflow.py
│           └── nodes/
│               ├── test_case.py
│               └── video_scenarios.py
├── tests/
├── evals/
├── .env
├── pyproject.toml
└── uv.lock
```
  ],
  caption: [Arborescence du projet ADAS-R2T],
) 
#intro-subsection[Principes d'organisation]
Trois principes gouvernent cette structure :

*Un nœud, un fichier.* Chaque nœud du graphe LangGraph est implémenté dans son propre fichier Python au sein du répertoire `"nodes/"`. Le fichier `"coverage_planner.py"` contient exclusivement la logique du planificateur de couverture, `"evaluator.py"` celle de l'évaluateur, et ainsi de suite. Cette convention rend la navigation intuitive : pour comprendre le fonctionnement d'un nœud, il suffit d'ouvrir le fichier correspondant.

*Séparation du code et des prompts.* Les instructions envoyées aux modèles de langage ne sont pas noyées dans le code Python. Chaque prompt est stocké dans un fichier Markdown dédié, dans le répertoire `"prompts/"`. La fonction utilitaire `"load_prompt()"` charge le contenu du fichier au moment de l'exécution. Cette séparation offre un double avantage : un ingénieur peut ajuster un prompt sans toucher au code, et chaque modification est traçable dans l'historique Git.

*Schémas comme contrat.* Le répertoire `"schemas/"` définit les structures de données qui circulent dans le pipeline. PipelineState dans `"workflow.py"` déclare l'ensemble des champs de l'état du graphe. Les schémas des nœuds (`"test_case.py"`, `"video_scenarios.py"`) définissent les formats de sortie attendus des appels LLM via Pydantic. Ces schémas servent à la fois de documentation et de validation automatique.
#intro-subsection[Rôles des répertoires]

#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 8.4pt,
    )

    #table(
      columns: (5.7cm, 11cm),
      inset: (x: 5pt, y: 6pt),
      stroke: none,
      align: (left, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Répertoire]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Rôle]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        #text(weight: "bold", fill: ENIADBlue)[docker/]
      ],
      [
        Infrastructure de déploiement : Dockerfile, Compose, Nginx, Prometheus, Grafana.
      ],

      // Row 2
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[src/app/api/]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Points d’accès REST : endpoints du pipeline et authentification.
      ],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[src/app/core/]
      ],
      [
        Services transverses : configuration, logging, métriques, mémoire et checkpointer.
      ],

      // Row 4
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[src/app/core/langgraph/]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Cœur du pipeline : définition du graphe, orchestration des nœuds et gestion des prompts.
      ],

      // Row 5
      [
        #text(weight: "bold", fill: ENIADBlue)[src/app/core/langgraph/nodes/]
      ],
      [
        Les dix-neuf nœuds du graphe, organisés avec un fichier dédié par nœud.
      ],

      // Row 6
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[src/app/core/langgraph/prompts/]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Fichiers Markdown contenant les prompts utilisés par les appels LLM.
      ],

      // Row 7
      [
        #text(weight: "bold", fill: ENIADBlue)[src/app/schemas/]
      ],
      [
        Structures de données Pydantic : état du pipeline, cas de test et scénarios vidéo.
      ],

      // Row 8
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[tests/]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Tests unitaires et tests d’intégration réalisés avec pytest.
      ],

      // Row 9
      [
        #text(weight: "bold", fill: ENIADBlue)[evals/]
      ],
      [
        Évaluations de qualité, notamment avec DeepEval, à compléter selon les métriques retenues.
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Organisation logique des principaux répertoires du projet ADAS-R2T],
  kind: table,
) <tab:project-directories>

#intro-subsection[Gestion des dépendances]
Le projet utilise *`"uv"`* comme gestionnaire de paquets Python, choisi pour sa rapidité d'installation et sa compatibilité avec le format `"pyproject.toml"`. Les dépendances sont verrouillées dans `"uv.lock"`, garantissant que chaque développeur et chaque conteneur Docker travaille avec les mêmes versions exactes.

Les dépendances se répartissent en plusieurs catégories : le cœur du pipeline (langgraph, langchain, fastapi), les connecteurs LLM (openai, langchain-google-genai), la persistance (psycopg, asyncpg), l'observabilité (langfuse, prometheus-fastapi-instrumentator, structlog), et le traitement multimédia (openpyxl, ffmpeg).
#intro-section[Itérations de développement]
Le développement d'ADAS-R2T s'est déroulé en cinq itérations majeures, chacune ajoutant une couche de fonctionnalité au système. Cette progression reflète la méthodologie Design Science Research adoptée : concevoir un artefact, l'évaluer, puis l'enrichir en fonction des retours.
#intro-subsection[MVP 1 : Requirements to Tests]
La première itération avait pour objectif de prouver le concept fondamental : un pipeline agentique peut-il générer des cas de test exploitables à partir d'exigences fonctionnelles ?

Ce premier pipeline comptait quatorze nœuds répartis en quatre étapes : ingestion du fichier Excel, analyse sémantique par cinq analyseurs parallèles, génération des cas de test, et export au format Excel. Le tout fonctionnait en mode synchrone  l'utilisateur lançait la génération et attendait le résultat sans indication de progression.
Nous avons également travaillé sur la première version de l'interface utilisateur et de la connexion.
Les résultats étaient encourageants mais imparfaits. Le système produisait deux à trois cas de test par exigence, ce qui restait en deçà de la couverture attendue. Les prompts, rédigés en un seul bloc, souffraient d'_"attention dilution"_ : le modèle, submergé par un contexte trop large, passait à côté de détails importants.

Mais l'essentiel était là : un fichier d'exigences entrait, un fichier de cas de test sortait, en moins de deux minutes au lieu de plusieurs jours. Le concept était validé.
#figure(
  image(
    "../img/image.png",
    width: 100%,
  ),
  caption: [Planification MVP 1],
) <fig:Planification_MVP_1>

#v(0.5cm)

#intro-subsection[MVP 2 : Video Input Layer]
La deuxième itération est née d'un constat : le texte seul ne suffit pas pour capturer la richesse des situations de conduite réelle. Un fichier d'exigences décrit ce que le système _doit_ faire ; une vidéo montre ce qui _se passe vraiment_ sur la route.

Quatre nouveaux nœuds ont été ajoutés pour former le pipeline vidéo. Le premier extrait les frames clés de la vidéo à intervalles réguliers et filtre les moments significatifs par détection de changement de scène. Le deuxième analyse chaque frame par un modèle multimodal , identifiant les véhicules, piétons, panneaux, et conditions environnementales. Le troisième reconstruit des scénarios complets en établissant des chaînes causales : cause, effet, conséquence. Le quatrième génère entre quinze et vingt-cinq mutations réalistes par scénario source, couvrant cinq stratégies de variation.

Cette capacité d'analyse vidéo avec raisonnement causal n'existait chez aucun outil concurrent identifié. Elle transforme quelques secondes de vidéo en dizaines de scénarios de test structurés.

En parallèle, cette itération a intégré les retours d'une équipe de testeurs ADAS expérimentée. Dix catégories de problèmes récurrents ont été identifiées et transformées en règles de qualité : actions trop robotiques, préconditions incomplètes, valeurs limites vagues, tests hors périmètre, contradictions entre résultats attendus. L'évaluateur est devenu un gardien à deux phases (règles déterministes puis évaluation LLM), portant le taux d'évaluation de dix-sept à cent pour cent.

Le streaming par `"Server-Sent Events"` et la planification par exigence (via `"Send()"`) ont également été introduits dans cette itération, portant le nombre de cas générés de deux-trois à cinq-huit par exigence.
#figure(
  image(
    "../img/image_3.png",
    width: 100%,
    height: 5cm,
  ),
  caption: [Planification MVP 2],
) <fig:Planification_MVP_2>

#v(0.5cm)
#intro-subsection[MVP 3 : Human in the Loop]
La troisième itération a comblé le manque le plus critique des versions précédentes : le contrôle humain en cours d'exécution.

Jusqu'ici, le pipeline fonctionnait comme une boîte noire. Si trois cas de test sur vingt étaient insatisfaisants, il fallait tout relancer. Désormais, le pipeline se met délibérément en pause après l'évaluation. L'utilisateur examine chaque cas, approuve les bons, rejette les mauvais avec un feedback précis, et supprime les hors-sujet.

Le mécanisme de Time Travel de LangGraph permet ensuite de ne régénérer que les cas rejetés, sans reprendre le pipeline depuis le début. Le planificateur reçoit les feedbacks et les intègre dans les prompts, produisant des cas améliorés qui répondent spécifiquement aux remarques. Cette boucle se répète jusqu'à satisfaction, chaque cycle produisant une nouvelle version du fichier (`"v1"`, `"v2"`, `"v3"`).

L'infrastructure de production a également été posée dans cette itération : Docker Compose avec sept services (pipeline, PostgreSQL, Nginx, Prometheus, Grafana, exportateurs), checkpoints chiffrés en AES, rate limiting par utilisateur, isolation `"multi-tenant"`, et tests automatisés avec pipeline CI via GitHub Actions.
#figure(
  image(
    "../img/image_4.png",
    width: 100%,
    height: 5cm,
  ),
  caption: [Planification MVP 3],
) <fig:Planification_MVP_3>

#v(0.5cm)
#intro-subsection[MVP 4 : Chatbot]
La quatrième itération, vise à ajouter un mode conversationnel au système. L'utilisateur pourra interroger le pipeline en langage naturel pour comprendre les résultats : « Pourquoi as-tu généré ce cas de test ? », « Explique-moi ce scénario vidéo », « Quels cas de test couvrent l'exigence `"REQ_003"` ? ».

Ce mode transformera ADAS-R2T d'un outil de génération en un véritable assistant intelligent, capable de justifier ses décisions et de guider l'ingénieur dans son travail de validation.
#intro-subsection[MVP 5 : Mémoire a long terme]
La cinquième itération a doté le système d'une capacité d'apprentissage. Avant cette version, chaque exécution repartait de zéro, sans mémoire des interactions passées. Un utilisateur qui avait rejeté dix fois des cas de test pour cause de préconditions incomplètes devait reformuler la même remarque à chaque session.

La mémoire à long terme résout ce problème à trois niveaux. La mémoire sémantique utilisateur enregistre les préférences individuelles extraites des feedbacks. La mémoire sémantique applicative stocke les règles de qualité partagées par tous les utilisateurs. La mémoire épisodique conserve l'historique factuel des revues.

Un modèle de langage classifie automatiquement chaque feedback : les remarques portant sur des standards du domaine sont orientées vers la mémoire applicative, les préférences personnelles restent au niveau utilisateur. Une règle stricte interdit la duplication entre les deux niveaux.

La recherche dans cette mémoire s'appuie sur des embeddings vectoriels (pgvector) pour ne récupérer que les connaissances pertinentes. Si le volume récupéré dépasse le budget de contexte du modèle, un résumé automatique condense l'essentiel avant injection dans le prompt.
#figure(
  image(
    "../img/image_5.png",
    width: 100%,
    height: 5cm,
  ),
  caption: [Planification MVP 4/5],
) <fig:Planification_MVP_4_5>

#v(0.5cm)

#intro-subsection[Synthèse des itérations]

#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 7.8pt,
    )

    #table(
      columns: (3.4cm, 3cm, 3cm, 3.2cm, 1.8cm, 2.2cm),
      inset: (x: 4pt, y: 5pt),
      stroke: none,
      align: (left, center, center, center, center, center),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Critère]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[MVP 1]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[MVP 2]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[MVP 3]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[MVP 4]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[MVP 5]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      

      // Row 2
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Nœuds]
      ],
      table.cell(fill: rgb("#F3F8FC"))[14],
      table.cell(fill: rgb("#F3F8FC"))[19],
      table.cell(fill: rgb("#F3F8FC"))[25],
      table.cell(fill: rgb("#F3F8FC"))[25],
      table.cell(fill: rgb("#F3F8FC"))[25],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[Modes d’entrée]
      ],
      [Excel],
      [+Vidéo],
      [Même],
      [+Chat],
      [Tous],

      
     
      // Row 6
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Vidéo]
      ],
      table.cell(fill: rgb("#F3F8FC"))[Non],
      table.cell(fill: rgb("#F3F8FC"))[Oui],
      table.cell(fill: rgb("#F3F8FC"))[Oui],
      table.cell(fill: rgb("#F3F8FC"))[Oui],
      table.cell(fill: rgb("#F3F8FC"))[Oui],

      // Row 7
      [
        #text(weight: "bold", fill: ENIADBlue)[HITL]
      ],
      [Non],
      [Non],
      [Oui],
      [Oui],
      [Oui],

      // Row 8
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Mémoire]
      ],
      table.cell(fill: rgb("#F3F8FC"))[Non],
      table.cell(fill: rgb("#F3F8FC"))[Non],
      table.cell(fill: rgb("#F3F8FC"))[Non],
      table.cell(fill: rgb("#F3F8FC"))[Oui],
      table.cell(fill: rgb("#F3F8FC"))[Oui],

      // Row 9
      [
        #text(weight: "bold", fill: ENIADBlue)[Déploiement]
      ],
      [Local],
      [Local],
      [Docker],
      [VPS],
      [VPS],

      // Row 10
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Monitoring]
      ],
      table.cell(fill: rgb("#F3F8FC"))[Logs],
      table.cell(fill: rgb("#F3F8FC"))[+Langfuse],
      table.cell(fill: rgb("#F3F8FC"))[+Prometheus],
      table.cell(fill: rgb("#F3F8FC"))[+Grafana],
      table.cell(fill: rgb("#F3F8FC"))[Tous],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Comparaison synthétique des versions MVP du projet ADAS-R2T],
  kind: table,
) <tab:mvp-comparison>
#intro-section[Ingénierie des prompts]
Dans un système agentique, la qualité des résultats dépend moins du code Python que des instructions données aux modèles de langage. Un prompt mal formulé produit des cas de test vagues ou hors sujet, quel que soit le raffinement de l'architecture qui l'entoure. Cette section décrit l'approche adoptée pour structurer, maintenir et enrichir les prompts du pipeline.
#intro-subsection[Pourquoi séparer les prompts du code]
Dans la première version du système, les prompts étaient écrits directement dans le code Python, sous forme de longues chaînes de caractères imbriquées dans les fonctions des nœuds. Cette approche posait trois problèmes concrets.

Le premier était la lisibilité. Un prompt de deux cents lignes noyé dans du code Python devient rapidement illisible, surtout lorsqu'il contient des exemples, des contraintes, et des formats de sortie.

Le deuxième était la maintenabilité. Pour ajuster une formulation, il fallait ouvrir le fichier Python du nœud, trouver la chaîne de caractères, la modifier sans casser la syntaxe Python, puis relancer le serveur. Une opération qui devrait prendre trente secondes en prenait cinq minutes.

Le troisième était la traçabilité. Dans l'historique Git, les modifications de prompts se mêlaient aux modifications de code, rendant difficile la réponse à la question : « qu'est-ce qui a changé dans le prompt entre la version qui marchait et celle qui ne marche plus ? ».

La solution a été de déplacer chaque prompt dans un fichier Markdown dédié, stocké dans le répertoire `"prompts/"`. Une fonction utilitaire `"load_prompt(nom)"` charge le contenu au moment de l'exécution :
#show: codly-init.with()
#codly(languages: codly-languages)
```python
def load_prompt(name: str) -> str:
    """Charge un prompt depuis le répertoire prompts/."""
    path = PROMPTS_DIR / f"{name}.md"
    return path.read_text(encoding="utf-8")
```
Désormais, modifier un prompt revient à éditer un fichier `"Markdown"`  pas besoin de toucher au code Python, pas de risque de casser la syntaxe, et chaque modification apparaît clairement dans l'historique Git.
#intro-subsection[Structure d'un prompt]
Les prompts du système suivent une structure inspirée du framework `"MISBAH"`, qui organise les instructions en sections clairement délimitées. Cette structure n'est pas arbitraire : elle reflète la manière dont les modèles de langage traitent l'information, en accordant plus d'attention au début et à la fin du contexte.

Un prompt typique se décompose en six sections :

*Section 1 : Rôle et contexte.* Le prompt commence par définir le rôle du modèle  et le contexte métier . Cette mise en situation conditionne le registre et le niveau de détail des réponses.

#zebraw(
   highlight-lines: 2,
  lang: true,
  lang-color: teal,
  ```md
#Role (
Your operational identity is "Workbook Structure Analyst". You read
spreadsheet snapshots and determine column mappings with high confidence.
You never guess — when uncertain, you indicate low confidence and let
the validation layer handle it.
)
  ```
)
*Section 2 : Tâche à accomplir.* Une description précise de ce que le modèle doit produire, formulée de manière impérative .
#zebraw(
   highlight-lines: 2,
  lang: true,
  lang-color: teal,
  ```md
  #Intent (
  Your SOLE objective is to correctly identify the structure of an ADAS 
  requirements Excel workbook — which sheets contain requirements, which
  contain flow variables, which contain acronyms — so that data can be
  extracted deterministically without errors.
  )
  ```
)

*Section 3 : Données d'entrée.* Les informations concrètes sur lesquelles le modèle doit travailler : le texte de l'exigence, les résultats d'analyse, la `"flow table"`, et les observations vidéo le cas échéant.
\
\
\
#show: zebraw
#zebraw(
   highlight-lines: 2,
  lang: true,
  lang-color: teal,
  ```md
#Standards (
- A requirements sheet has columns for: requirement ID, requirement text.
- The requirement text column is the one with the longest cell content.
- A flow table has columns for: variable name, description, unit, default
  value, initial value, range.
- An acronyms sheet has 2-3 columns: acronym and definition.
- Sheets with only empty rows or revision history are "other".
)
  ```
)
*Section 4 : Format de sortie.* Le schéma exact de la réponse attendue, généralement au format JSON ou sous forme de structure Pydantic. Cette section élimine l'ambiguïté et permet la validation automatique de la réponse.

#zebraw(
   highlight-lines: 2,
  lang: true,
  lang-color: teal,
  ```md
#Outcome (
You must output the result strictly in valid JSON format.
{snapshot}
)
  ```
)
*Section 5 : Contraintes et règles.* Les interdictions et obligations . C'est ici que les retours des experts tests ont été intégrés sous forme de règles explicites.

#zebraw(
   highlight-lines: 2,
  lang: true,
  lang-color: teal,
  ```md
#Protocol (
Follow these steps IN ORDER before writing the output:

Step 1 — READ the blueprint carefully. Identify: the scenario, the type,
and every item in must_verify.

Step 2 — DETERMINE the specific values. For every variable in
preconditions, choose an EXACT numeric value based on the requirement and
the flow table. Never use ranges like "30 < speed < 180".
)
  ```
)


#intro-subsection[L'enrichissement du contexte]
Un prompt ne fonctionne pas seul. Sa puissance vient de ce qu'on lui injecte comme contexte. Au fil des itérations, le contexte fourni à chaque nœud s'est considérablement enrichi.

Lors de la première version, le nœud `"plan_single_req"` recevait uniquement le texte brut de l'exigence. Le modèle devait deviner les transitions d'états, les contraintes temporelles, et les interactions utilisateur.

Dans la version actuelle, le même nœud reçoit un contexte composé de cinq couches :
#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 8.4pt,
    )

    #table(
      columns: (5.2cm, 11.2cm),
      inset: (x: 5pt, y: 6pt),
      stroke: none,
      align: (left, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Couche]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Contenu]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        #text(weight: "bold", fill: ENIADBlue)[Exigence structurée]
      ],
      [
        Texte, variables, conditions et seuils extraits des exigences fonctionnelles.
      ],

      // Row 2 - Zebra
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Résultats d’analyse]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Transitions d’états, contraintes temporelles, interactions HMI et logique de calcul.
      ],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[Flow table et acronymes]
      ],
      [
        Table des transitions du système et acronymes extraits du fichier Excel source.
      ],

      // Row 4 - Zebra
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Observations vidéo]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Scénarios causaux extraits de la vidéo de conduite dans le mode Excel + Vidéo.
      ],

      // Row 5
      [
        #text(weight: "bold", fill: ENIADBlue)[Mémoire à long terme]
      ],
      [
        Préférences de l’utilisateur, règles applicatives et historique des revues.
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Couches d’information exploitées par le pipeline ADAS-R2T],
  kind: table,
) <tab:couches-information-pipeline>
Chaque couche ajoute une dimension que le modèle n'aurait pas pu inférer seul. La `"flow table"`, par exemple, révèle des transitions implicites que le texte de l'exigence ne mentionne pas. Les observations vidéo ancrent la génération dans des situations réelles. La mémoire à long terme évite de reproduire des erreurs déjà corrigées.
#intro-section[Déploiement]

Faire tourner le système sur la machine d'un développeur est une chose. 
Le rendre installable, reproductible et opérable par quelqu'un d'autre en est une tout autre.

Le passage à *#strong[Docker]* a constitué un tournant dans la maturité du projet : 
en une seule commande, l'ensemble de l'infrastructure  sept services, trois bases de données, 
un *#strong[reverse proxy]* et une pile de *#strong[monitoring]*  démarre et se configure automatiquement.
#intro-subsection[Le défi de la reproductibilité]

Avant Docker, l'installation du système nécessitait une dizaine d'étapes manuelles : installer Python 3.12, créer un environnement virtuel, installer les dépendances, installer PostgreSQL, créer la base de données, activer l'extension pgvector, configurer les variables d'environnement, lancer le serveur. 
Si une seule étape était oubliée ou mal exécutée, le système refusait de démarrer, et le diagnostic pouvait prendre des heures.

Avec Docker, cette complexité disparaît derrière une seule *commande* :

#codly(languages: codly-languages)
```shell
cd docker 
docker compose up -d
```
\
\
#intro-subsection[Le Dockerfile du pipeline]
La construction de l'image Docker du pipeline suit une approche en couches, optimisée pour la vitesse de reconstruction :
#codly(languages: codly-languages)
```dockerfile
FROM python:3.12-slim

# Dependances systeme (ffmpeg pour la video)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Dependances Python (changent rarement → cache Docker)
RUN pip install --no-cache-dir uv
COPY pyproject.toml uv.lock* ./
RUN uv sync --no-dev --no-editable

# Code applicatif (change souvent → derniere couche)
COPY src/ ./src/

ENV PYTHONPATH=/app/src
EXPOSE 8000

CMD ["uv", "run", "uvicorn", "app.main:app", \
     "--host", "0.0.0.0", "--port", "8000"]
```
L'ordre des instructions n'est pas anodin. Les dépendances système et Python, qui changent rarement, sont installées en premier. Le code applicatif, qui change à chaque commit, est copié en dernier. Grâce au cache de Docker, une modification du code ne nécessite que la reconstruction de la dernière couche  quelques secondes au lieu de plusieurs minutes.

#intro-subsection[L'orchestration des services]
Le fichier `"docker-compose.yml"` déclare sept services qui forment l'écosystème complet du pipeline :
#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 7.8pt,
    )

    #table(
      columns: (2.6cm, 4cm, 2.5cm, 7.2cm),
      inset: (x: 4pt, y: 5pt),
      stroke: none,
      align: (left, left, center, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Service]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Image]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Port]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Rôle]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        #text(weight: "bold", fill: ENIADBlue)[ai-pipeline]
      ],
      [Build local],
      [8000],
      [
        Pipeline FastAPI + LangGraph
      ],

      // Row 2
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[postgres]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        pgvector/pgvector:pg16
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        5432
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Checkpoints et mémoire à long terme
      ],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[nginx]
      ],
      [nginx:alpine],
      [80],
      [
        Reverse proxy, support SSE et limite d’upload à 200 Mo
      ],

      // Row 4
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[prometheus]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        prom/prometheus
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        9090
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Collecte des métriques toutes les 15 secondes
      ],

      // Row 5
      [
        #text(weight: "bold", fill: ENIADBlue)[grafana]
      ],
      [grafana/grafana],
      [3001],
      [
        Dashboards de supervision en temps réel
      ],

      // Row 6
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[node-exporter]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        prom/node-exporter
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        9100
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Métriques système : CPU, mémoire et disque
      ],

      // Row 7
      [
        #text(weight: "bold", fill: ENIADBlue)[postgres-exporter]
      ],
      [prom/postgres-exporter],
      [9187],
      [
        Métriques PostgreSQL : connexions et requêtes
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Services Docker utilisés pour le déploiement et la supervision d’ADAS-R2T],
  kind: table,
) <tab:docker-services>
\
Les dépendances entre les services sont gérées par Docker Compose. Le service `ai-pipeline` ne démarre qu’après la validation du *health check* de PostgreSQL, ce qui garantit la disponibilité de la base de données avant l’initialisation du pipeline. De son côté, Prometheus attend que le pipeline soit opérationnel avant de commencer la collecte des métriques. Cette orchestration permet d’éviter les erreurs de connexion au démarrage et d’assurer une mise en route plus fiable de l’environnement déployé.
#intro-subsection[La gestion des variables d'environnement]
La configuration du système repose sur des variables d’environnement, conformément aux principes des applications _twelve-factor_. Aucun secret n’est codé en dur dans le code source.

Deux fichiers sont utilisés pour gérer cette configuration. Le fichier `.env.docker` sert de modèle documenté avec des valeurs d’exemple, tandis que le fichier `.env`, ignoré par Git, contient les valeurs réelles utilisées en développement ou en production. Cette approche améliore la sécurité, la portabilité et la reproductibilité du déploiement.
Les variables se répartissent en plusieurs familles :
#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 8.2pt,
    )

    #table(
      columns: (7.2cm, 9.0cm),
      inset: (x: 5pt, y: 6pt),
      stroke: none,
      align: (left, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(left)[
            #text(weight: "bold", fill: ENIADBlue)[Famille]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(left)[
            #text(weight: "bold", fill: ENIADBlue)[Exemples]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        #text(weight: "bold", fill: ENIADBlue)[LLM]
      ],
      [
        #text(font: "Cascadia Code", size: 7pt)[GENERATION_MODEL_ID,\ MODEL_API_KEY]
      ],

      // Row 2
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Vidéo]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        #text(font: "Cascadia Code", size: 7pt)[VIDEO_LLM_BACKEND, \ VIDEO_LLM_MODEL_ID,]
      ],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[Concurrence]
      ],
      [
        #text(font: "Cascadia Code", size: 7pt)[EXTRACT_CONCURRENCY,\ PLAN_CONCURRENCY,]
      ],

      // Row 4
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[PostgreSQL]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        #text(font: "Cascadia Code", size: 7pt)[CHECKPOINT_DB_URI,\ CHECKPOINT_ENCRYPTION_KEY]
      ],

      // Row 5
      [
        #text(weight: "bold", fill: ENIADBlue)[Mémoire]
      ],
      [
        #text(font: "Cascadia Code", size: 7pt)[MEMORY_ENABLED,\ MEMORY_CONTEXT_RATIO,]
      ],

      // Row 6
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Sécurité]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        #text(font: "Cascadia Code", size: 7pt)[PIPELINE_API_KEY,\ JWT_SECRET_KEY]
      ],

      // Row 7
      [
        #text(weight: "bold", fill: ENIADBlue)[Monitoring]
      ],
      [
        #text(font: "Cascadia Code", size: 7pt)[LANGFUSE_PUBLIC_KEY,\ GRAFANA_USER]
      ],

      // Row 8
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Nettoyage]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        #text(font: "Cascadia Code", size: 7pt)[CHECKPOINT_CLEANUP_DAYS,\ UPLOADS_CLEANUP_DAYS]
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Familles de variables d’environnement utilisées par ADAS-R2T],
  kind: table,
) <tab:env-variable-families>
#v(2cm)
#intro-section[Integration avec le frontend]
Le pipeline IA ne fonctionne pas en isolation. Il s'inscrit dans un écosystème plus large où un frontend permet aux utilisateurs d'interagir avec le système, et un backend intermédiaire fait le lien entre les deux. Cette intégration, réalisée en coordination avec un collègue chargé du `"frontend"` et du `"backend BFF"`, a nécessité un travail de spécification rigoureux pour que les deux parties puissent avancer en parallèle sans se bloquer mutuellement.
#intro-subsection[Le contrat API comme point de coordination]
Dès le début du projet, un principe a été posé : les deux équipes ne partagent ni code ni base de données. Le seul lien entre elles est un document de spécification  l'API Contract qui décrit avec précision chaque point d'accès exposé par le pipeline : l'`"URL"`, la méthode `"HTTP"`, le format des requêtes, le format des réponses, les codes d'erreur possibles, et des exemples concrets. Ce document a été rédigé, partagé, puis mis à jour à chaque évolution significative du pipeline. Il a servi de référence unique pour éviter les malentendus : quand le collègue avait une question sur le format d'une réponse, la réponse se trouvait dans le contrat, pas dans une conversation oubliée.

#intro-subsection[Les huit points d'accès]
Le pipeline expose huit `"endpoints"`, chacun correspondant à un besoin précis du frontend :
#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 8.0pt,
    )

    #table(
      columns: (2.0cm, 5.2cm, 9.4cm),
      inset: (x: 5pt, y: 6pt),
      stroke: none,
      align: (left, left, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(left)[
            #text(weight: "bold", fill: ENIADBlue)[Méthode]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(left)[
            #text(weight: "bold", fill: ENIADBlue)[Endpoint]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(left)[
            #text(weight: "bold", fill: ENIADBlue)[Rôle]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        #text(weight: "bold", fill: ENIADBlue)[POST]
      ],
      [
        #text(font: "Cascadia Code", size: 7.2pt)[/api/v1/pipeline/run]
      ],
      [
        Lancer une génération et retourner une réponse JSON ou un fichier.
      ],

      // Row 2
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[POST]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        #text(font: "Cascadia Code", size: 7.2pt)[/api/v1/pipeline/stream]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Lancer une génération avec streaming SSE en temps réel.
      ],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[POST]
      ],
      [
        #text(font: "Cascadia Code", size: 7.2pt)[/api/v1/pipeline/resume/{id}]
      ],
      [
        Reprendre le pipeline après une revue HITL avec les décisions utilisateur.
      ],

      // Row 4
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[POST]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        #text(font: "Cascadia Code", size: 7.2pt)[/api/v1/pipeline/stream/resume/{id}]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Reprendre le pipeline avec streaming SSE.
      ],

      // Row 5
      [
        #text(weight: "bold", fill: ENIADBlue)[GET]
      ],
      [
        #text(font: "Cascadia Code", size: 7.2pt)[/api/v1/pipeline/state/{id}]
      ],
      [
        Lire l’état d’un pipeline en pause.
      ],

      // Row 6
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[POST]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        #text(font: "Cascadia Code", size: 7.2pt)[/api/v1/pipeline/review/{id}]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Re-entrer en revue depuis la page des résultats.
      ],

      // Row 7
      [
        #text(weight: "bold", fill: ENIADBlue)[GET]
      ],
      [
        #text(font: "Cascadia Code", size: 7.2pt)[/api/v1/pipeline/download/{nom}]
      ],
      [
        Télécharger le fichier Excel généré.
      ],

      // Row 8
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[GET]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        #text(font: "Cascadia Code", size: 7.2pt)[/health]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Vérifier la disponibilité du service.
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Principaux endpoints REST exposés par le backend ADAS-R2T],
  kind: table,
) <tab:pipeline-api-endpoints>

Trois de ces endpoints existaient dans la première version (run, stream, download). Les cinq autres ont été ajoutés avec le `"MVP 3"` pour supporter le cycle `"HITL"`.
#intro-subsection[Le format des décisions HITL]
Le format d'échange le plus important est celui des décisions de revue, envoyé via l'`"endpoint"` `"/resume"`. Trois variantes coexistent : 

- *Régénération sélective*  l'utilisateur a examiné chaque cas individuellement :
#codly(languages: codly-languages)
```json
{
  "action": "regenerate_selected",
  "decisions": {
    "TC01": {"action": "approve", "feedback": ""},
    "TC02": {"action": "reject",
             "feedback": "Ajouter road_condition"},
    "TC03": {"action": "delete", "feedback": ""}
  }
}
```
- *Régénération globale* l'utilisateur souhaite tout reprendre :
#codly(languages: codly-languages)
```json
{
  "action": "regenerate_all",
  "decisions": {},
  "global_feedback": "Plus de boundary cases"
}
```
- *Validation directe*  l'utilisateur est satisfait :
#codly(languages: codly-languages)
```json
{
  "action": "skip"
}
```
Une convention importante : un cas de test absent du dictionnaire decisions est automatiquement considéré comme approuvé. Cette convention évite au frontend d'envoyer une décision explicite pour chaque cas lorsque la majorité est satisfaisante.
#intro-subsection[ Le thread_id ]
Le `"thread_id"` est l'identifiant qui permet de suivre une exécution de pipeline à travers toutes les interactions. Il est généré par le pipeline au moment du lancement et retourné dans la première réponse. Le `"backend BFF"` doit le sauvegarder dans MongoDB avec le document concerné, car il sera nécessaire pour chaque opération ultérieure : lecture de l'état, reprise après revue, `"re-entry"`, et téléchargement. Sans ce thread_id, le pipeline ne sait pas à quelle exécution se rattache une requête de reprise. C'est le fil qui traverse toutes les couches du système.
#intro-subsection[Integration du streaming SSE]
Le `"streaming"` par `"Server-Sent Events"` offre une expérience utilisateur radicalement différente de l'attente classique. Au lieu d'une barre de chargement générique, l'utilisateur voit défiler les étapes en temps réel. Côté frontend, l'intégration consiste à ouvrir une connexion persistante vers l'`"endpoint"` `"/stream"` et à traiter les événements au fil de leur arrivée. Six types d'événements sont définis :

#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 8.2pt,
    )

    #table(
      columns: (4.2cm,12.2cm),
      inset: (x: 5pt, y: 6pt),
      stroke: none,
      align: (left, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(left)[
            #text(weight: "bold", fill: ENIADBlue)[Événement]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(left)[
            #text(weight: "bold", fill: ENIADBlue)[Signification]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        #text(font: "Cascadia Code", size: 7.2pt, weight: "bold", fill: ENIADBlue)[pipeline_started]
      ],
      [
        Le pipeline a démarré. Cet événement contient le `thread_id`.
      ],

      // Row 2
      table.cell(fill: rgb("#F3F8FC"))[
        #text(font: "Cascadia Code", size: 7.2pt, weight: "bold", fill: ENIADBlue)[node_started]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Un nœud a commencé son exécution. Cet événement contient le nom du nœud et un message associé.
      ],

      // Row 3
      [
        #text(font: "Cascadia Code", size: 7.2pt, weight: "bold", fill: ENIADBlue)[node_completed]
      ],
      [
        Un nœud a terminé son exécution. Cet événement contient un résumé du résultat produit.
      ],

      // Row 4
      table.cell(fill: rgb("#F3F8FC"))[
        #text(font: "Cascadia Code", size: 7.2pt, weight: "bold", fill: ENIADBlue)[review_paused]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Le pipeline est en pause pour la revue Human-in-the-Loop. Cet événement contient le `review_round`.
      ],

      // Row 5
      [
        #text(font: "Cascadia Code", size: 7.2pt, weight: "bold", fill: ENIADBlue)[pipeline_completed]
      ],
      [
        Le pipeline a terminé son exécution. Cet événement contient l’URL de téléchargement du résultat.
      ],

      // Row 6
      table.cell(fill: rgb("#F3F8FC"))[
        #text(font: "Cascadia Code", size: 7.2pt, weight: "bold", fill: ENIADBlue)[error]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Une erreur est survenue pendant l’exécution. Cet événement contient le message d’erreur.
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Principaux événements SSE émis par le pipeline ADAS-R2T],
  kind: table,
) <tab:sse-events>


L'événement `"review_paused"` est le plus significatif : c'est lui qui signale au frontend qu'il doit basculer vers la page de revue au lieu d'attendre la fin du pipeline.

#intro-section[Interface utilisateur]

L'interface utilisateur a été développée par un collègue dans le cadre du même projet. Bien que sa réalisation ne relève pas directement de ce travail de stage, il est utile d'en décrire les grandes lignes pour comprendre comment l'utilisateur final interagit avec le pipeline IA.

#intro-subsection[Les pages principales]

L'application web, construite avec `"Next.js 14"`, s'organise autour de quatre pages :

- *Page d'accueil (`"Dashboard"`).* :Elle offre une vue d'ensemble des projets de l'utilisateur : nombre de documents traités, générations en cours, et accès rapide aux derniers résultats. C'est le point d'entrée après l'authentification.

- *Page de génération.* L'utilisateur y charge son fichier Excel d'exigences et, le cas échéant, une vidéo de conduite. Il choisit le mode d'entrée (Excel seul, Vidéo seule, ou les deux), puis lance la génération. Pendant le traitement, les événements `"SSE"` du pipeline s'affichent en temps réel, offrant une visibilité sur l'avancement de chaque étape.

- *Page de résultats (Bibliothèque).*: Elle regroupe l'ensemble des générations passées, organisées par projet et par date. Chaque entrée affiche le nombre de cas de test générés, le nombre de cycles de revue effectués, et permet de télécharger les différentes versions du fichier Excel . C'est depuis cette page que l'utilisateur peut réentrer en revue HITL via le bouton « Review ».

- *Page de revue (`"HITL"`).*: C'est la page la plus riche en interactions. Les cas de test générés y sont présentés sous forme de tableau éditable. Pour chaque cas, l'utilisateur peut approuver, rejeter avec un commentaire, ou supprimer. Les modifications sont sauvegardées dans MongoDB, et lorsque l'utilisateur valide ses décisions, le `"frontend"` transmet les choix au `"pipeline"` IA pour régénération ou téléchargement.
\
\
\
#intro-subsection[Gestion des utilisateurs]
L'accès à l'application est contrôlé par un système d'inscription avec approbation. Un nouvel utilisateur crée un compte, mais ne peut accéder au système qu'après validation par un administrateur. Ce mécanisme, géré entièrement par le `"backend BFF"`, garantit que seuls les membres autorisés de l'équipe utilisent l'outil.

Deux rôles coexistent : l'utilisateur standard, qui peut générer et revoir des cas de test, et l'administrateur, qui peut en plus gérer les comptes et consulter les métriques système via Grafana.
#intro-subsection[Coordination entre les équipes]

Le travail en binôme a nécessité une discipline de coordination. Les deux équipes se synchronisaient sur le contrat `"API"` et testaient indépendamment leur partie avant chaque intégration. Le frontend utilisait des données simulées  en attendant que les endpoints du pipeline soient opérationnels, tandis que le pipeline était testé via Swagger UI, sans attendre que l'interface soit prête.

Cette approche a permis aux deux parties d'avancer en parallèle pendant toute la durée du stage, les moments d'intégration se limitant à vérifier que les formats d'échange correspondaient bien au contrat établi.
#intro-section[Présentation fonctionnelle de la solution]
Cette section présente les principales fonctionnalités de la plateforme ADAS R2T telles qu’elles
apparaissent à l’utilisateur final. L’interface utilisateur Next.js s’organise autour de sept pages
principales, chacune adressant un besoin fonctionnel spécifique. La Figure suivant illustre la page
d’accueil de la plateforme, qui permet de se diriger vers les différents modules ou de consulter
la documentation.

#figure(
  image(
    "../img/page.png",
    width: 100%,
    
  ),
  caption: [Page d'acceil],
) <fig:Page_Acceil>
#intro-subsection[Page d’authentification.]
L’accès à la plateforme est protégé par un formulaire d’authentification. L’utilisateur saisit son
adresse de messagerie et son mot de passe. Le système valide les identifiants contre la collection
users dans MongoDB, vérifie le statut d’approbation du compte (isApproved), puis émet un
jeton JWT d’une durée de validité de 8 heures. Les nouveaux comptes requièrent l’approbation
préalable d’un administrateur avant de pouvoir accéder à la plateforme.

#figure(
  image(
    "../img/page_2.png",
    width: 100%,
    
  ),
  caption: [Page d’authentification],
) <fig:Page_Authentification>
#intro-subsection[Tableau de bord]
Le tableau de bord offre une vue synthétique de l’activité de génération. Il affiche les indicateurs
clés de performance (KPI) : le nombre total de cas de test générés, le nombre de sessions de
génération, le taux de couverture moyen, la durée de génération moyenne par cas de test et le
retour sur investissement (ROI) exprimé en heures économisées. Ces métriques sont calculées
dynamiquement à partir des données historiques stockées dans MongoDB, comme illustré sur
la Figure suivant.
#figure(
  image(
    "../img/page_4.png",
    width: 100%,
    
  ),
  caption: [Tableau de bord],
) <fig:Page_Tableau_de_bord>

#intro-subsection[Page de génération.]
La page de génération constitue le cœur fonctionnel de la plateforme. Elle implémente la
machine à 7 états décrite dans le Chapitre 3 :
- L’utilisateur téléverse un fichier Excel et/ou une vidéo MP4 via une zone de dépôt
('upload'). La Figure 4.7 présente l’interface initiale prête pour l’import.

- Le système affiche un indicateur de chargement pendant l’ingestion des fichiers.

- Les exigences extraites sont présentées dans un tableau interactif de prévisualisation.

- Les journaux d’exécution et la barre de progression s’affichent en temps réel pendant la
génération.

- Une phase de finalisation persiste les cas de test dans MongoDB .

- L’interface de revue HITL permet d’approuver, de modifier ou de régénérer les cas de test
('review').

- Le tableau de résultats affiche les statistiques finales et le lien de téléchargement du rapport
Excel .
#figure(
  block(width: 100%)[
    #grid(
      columns: (0.95fr, 1.55fr),
      column-gutter: 0.45cm,
      align: top,

      // Left column: two stacked images
      [
        #grid(
          columns: (1fr,),
          row-gutter: 0.28cm,

          [
            #block(
              fill: rgb("#F8FAFC"),
              stroke: 0.5pt + rgb("#D1D5DB"),
              radius: 5pt,
              inset: 5pt,
            )[
              #image("../img/page_5.png", width: 100%)
            ]
            #v(0.06cm)
            #align(center)[
              #text(size: 8pt)[1-Input]
            ]
          ],

          [
            #block(
              fill: rgb("#F8FAFC"),
              stroke: 0.5pt + rgb("#D1D5DB"),
              radius: 5pt,
              inset: 5pt,
            )[
              #image("../img/page_6.png", width: 100%)
            ]
            #v(0.06cm)
            #align(center)[
              #text(size: 8pt)[2-Génération]
            ]
          ],
        )
      ],

      // Right column: large image
      [
        #block(
          fill: rgb("#F8FAFC"),
          stroke: 0.5pt + rgb("#D1D5DB"),
          radius: 5pt,
          inset: 5pt,
        )[
          #image("../img/page_7.png", width: 100% , height: 8.3cm)
        ]
        #v(0.06cm)
        #align(center)[
          #text(size: 8pt)[3-Output]
        ]
      ],
    )
  ],
  caption: [pages de géneration],
) <fig:pages_de_géneration>

#intro-section[Test et résultats]
Ce chapitre confronte le système à la réalité. Après avoir décrit ce qui a été conçu et construit, il est temps de mesurer ce qui fonctionne, ce qui ne fonctionne pas encore, et ce que les utilisateurs en pensent. Les résultats présentés ici couvrent les tests automatisés, les validations fonctionnelles bout en bout, les retours des experts métier, et les métriques de performance.

#intro-subsection[Stratégie de test]
Tester un système agentique pose un défi particulier : les sorties ne sont pas déterministes. Un même `"prompt"`, soumis au même modèle avec les mêmes entrées, peut produire des résultats légèrement différents d'une exécution à l'autre. Cette variabilité interdit l'approche classique où chaque test compare une sortie à une valeur attendue exacte. La stratégie adoptée combine trois niveaux complémentaires, chacun vérifiant une propriété différente du système :
#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 8.2pt,
    )

    #table(
      columns: (3.2cm, 7.8cm, 5cm),
      inset: (x: 5pt, y: 6pt),
      stroke: none,
      align: (left, left, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Niveau]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Ce qui est vérifié]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Outils]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        #text(weight: "bold", fill: ENIADBlue)[Tests unitaires]
      ],
      [
        Composants isolés : configuration, authentification, logique de revue et gestion mémoire.
      ],
      [
        pytest, pytest-asyncio, unittest.mock
      ],

      // Row 2
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Tests d’intégration]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Endpoints API : formats de requête et réponse, codes d’erreur et enchaînements.
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        httpx, FastAPI TestClient
      ],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[Tests fonctionnels]
      ],
      [
        Scénarios bout en bout : upload, génération, revue, régénération et téléchargement.
      ],
      [
        Swagger UI, validation manuelle
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Niveaux de tests appliqués au système ADAS-R2T],
  kind: table,
) <tab:test-levels>

Les tests unitaires et d'intégration s'exécutent automatiquement dans le `"pipeline CI"` via `"GitHub Actions"`, à chaque commit. Les tests fonctionnels sont réalisés manuellement car ils nécessitent des appels réels aux `"API LLM"` et ne peuvent pas s'exécuter dans un environnement isolé. Un principe important guide l'ensemble : les tests ne doivent jamais dépendre de services externes. Les appels LLM sont simulés par des `"mocks"`, la base PostgreSQL est remplacée par des variables vides,
#intro-subsection[Résultats]
L'execution de la suite de tests produit le resultat suivant :
#codly(languages: codly-languages)
```shell-unix-generic
$ uv run pytest tests/ -v

========================= test session starts ==========================

tests/test_health.py::test_health_check PASSED

tests/test_auth.py::test_run_without_auth PASSED

tests/test_auth.py::test_run_with_wrong_key PASSED

tests/test_auth.py::test_health_no_auth_needed PASSED

tests/test_config.py::test_config_loads PASSED

tests/test_config.py::test_config_defaults PASSED

tests/test_config.py::test_context_windows_defined PASSED

tests/test_config.py::test_memory_config PASSED

==================== 8 passed, 35 skipped, 71 warnings =================
```
\
#intro-section[Evaluation de la qualité des résultats]
L'évolution des indicateurs de qualité à travers les trois versions livrées illustre la progression du système :

#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 8.4pt,
    )

    #table(
      columns: (7cm, 4.2cm, 5.2cm),
      inset: (x: 5pt, y: 6pt),
      stroke: none,
      align: (left, center, center),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(left)[
            #text(weight: "bold", fill: ENIADBlue)[Métrique]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Manuel]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[ADAS R2T]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        #text(weight: "bold", fill: ENIADBlue)[Temps moyen par cas de test]
      ],
      [
        10 à 20 min
      ],
      [
        ≈ 10,00 secondes 
      ],

      // Row 2
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Couverture minimale par exigence]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Variable
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        3 TC garantis
      ],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[Types de scénarios couverts]
      ],
      [
        Nominaux principalement
      ],
      [
        Nominal, limites, négatif, rare
      ],

      // Row 4
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Traçabilité exigence → TC]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Manuelle
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Automatique
      ],

      // Row 5
      [
        #text(weight: "bold", fill: ENIADBlue)[Reproductibilité]
      ],
      [
        Dépendante de l’ingénieur
      ],
      [
        déterministe
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Comparaison entre la génération manuelle et la génération automatisée avec ADAS-R2T],
  kind: table,
) <tab:manual-vs-adas-r2t>
#intro-subsection[Ce que le système apporte de fondamentalement différent]
Au-delà des chiffres, trois apports distinguent qualitativement *"ADAS-R2T"* du processus manuel.

- *L'exhaustivité systématique.* Un ingénieur qui rédige son vingtième cas de test de la journée a naturellement tendance à se concentrer sur les scénarios évidents les cas nominaux, ceux où tout fonctionne comme prévu. Les cas aux limites, les défaillances rares, les combinaisons inhabituelles de conditions sont souvent laissés de côté, non par incompétence, mais par fatigue cognitive. Le système, lui, ne connaît pas la fatigue. Sa stratégie de couverture planifie méthodiquement les quatre types de cas pour chaque exigence, sans exception.

- *L'ancrage dans le réel via la vidéo.* Aucun processus manuel n'exploitait les vidéos de conduite réelle pour en dériver des scénarios de test. Les scénarios étaient imaginés à partir du texte des exigences, sans contact avec la réalité du terrain. Le pipeline vidéo introduit une dimension absente : le raisonnement causal à partir de situations réelles. Un frein d'urgence observé dans une vidéo de trois secondes génère à lui seul une vingtaine de variations des situations qu'un humain mettrait des heures à imaginer, s'il y pensait.

- *La boucle d'amélioration continue.* Dans le processus manuel, un retour de l'équipe de validation entraînait une reprise laborieuse : retrouver le fichier, comprendre ce qui avait été fait, modifier, revérifier. Avec *"ADAS-R2T"*, le feedback est intégré dans la boucle même du système. L'utilisateur rejette un cas, explique pourquoi, et obtient un remplacement en quelques secondes. Mieux encore, cette explication est mémorisée et appliquée automatiquement aux sessions futures.

#intro-subsection[Ce que le système ne remplace pas]
- Il serait présomptueux de prétendre que le système rend l'humain superflu. L'ingénieur de test reste indispensable à trois niveaux.

- Il reste le juge final de la pertinence. Le système peut générer un cas de test techniquement correct mais inutile en pratique. Seul un expert du domaine sait distinguer un test utile d'un test redondant.

- Il reste la source de la connaissance métier. Le système ne connaît pas les contraintes non écrites, les conventions internes, les priorités stratégiques d'un projet. Ces connaissances, transmises par le feedback, sont ce qui permet au système de s'améliorer.

- Il reste le garant de la sécurité. Dans un domaine où les cas de test touchent à la sécurité des personnes, aucune génération automatique ne devrait être déployée sans revue humaine. Le `"HITL"` n'est pas une fonctionnalité optionnelle  c'est une responsabilité.

Le système ne remplace donc pas l'ingénieur. Il le libère des tâches répétitives pour qu'il se concentre sur ce qui requiert véritablement son expertise : juger, prioriser, et décider.
#intro-section[Limites et pistes d'amélioration]

Un système honnête est un système qui connaît ses propres limites. Cette section ne cherche pas à masquer les faiblesses actuelles, mais à les présenter lucidement, en les inscrivant dans une trajectoire d'amélioration. Chaque limite identifiée ouvre une piste concrète pour les développements futurs.

#intro-subsection[La dépendance aux "API LLM" externes]

Le système repose actuellement sur des modèles de langage accessibles via des "API" externes ("OpenAI", "Google Gemini"). Cette dépendance introduit trois contraintes : un coût par exécution proportionnel au nombre d'appels, une latence variable soumise à la disponibilité des fournisseurs, et un risque d'indisponibilité en cas de panne de leur côté.


Ce choix reste néanmoins assumé. S'appuyer sur des modèles éprouvés nous a permis d'atteindre rapidement un niveau de qualité élevé, sans investir dans une infrastructure d'inférence lourde. La piste d'amélioration est déjà amorcée : l'intégration de modèles locaux via "Ollama" permettra, à terme, une autonomie complète, au prix d'un compromis sur la qualité qu'il faudra évaluer.

#intro-subsection[Les exigences matérielles]

L'application est gourmande en ressources. L'orchestration de dix-neuf nœuds, la gestion de plusieurs bases de données, la pile de monitoring, et le traitement vidéo imposent une machine relativement puissante pour un fonctionnement fluide. Sur un poste modeste, le démarrage des sept conteneurs "Docker" et l'exécution simultanée de plusieurs "pipelines" peuvent saturer la mémoire et le processeur.

Cette lourdeur est le revers d'une architecture complète et observable. Une piste d'optimisation consisterait à rendre certains services optionnels (par exemple, désactiver la pile de monitoring en environnement de développement), et à alléger l'empreinte mémoire des conteneurs. Un déploiement sur serveur dédié ou dans le cloud reste la solution la plus adaptée pour un usage en production.

#intro-subsection[La taille du contexte transmis au "LLM"] 
Pour générer des cas de test de qualité, le système enrichit chaque "prompt" de multiples couches de contexte : exigence structurée, résultats d'analyse, "flow table", observations vidéo, et mémoire à long terme. Cette richesse est la source de la qualité des résultats, mais elle a un coût : un contexte volumineux consomme davantage de "tokens", augmente la latence, et se rapproche des limites de la fenêtre de contexte des modèles.

Le mécanisme de résumé dynamique atténue déjà ce problème en condensant la mémoire lorsqu'elle dépasse un certain seuil. Toutefois, une gestion plus fine du contexte ne transmettre que les informations strictement pertinentes pour chaque exigence, via une sélection plus agressive par recherche sémantique  permettrait de réduire la consommation de "tokens" sans sacrifier la qualité.

#intro-subsection[La spécialisation sur la fonction "ACC"]
Le système a été conçu, développé, et évalué principalement sur la fonction "ADAS" de régulateur de vitesse adaptatif "ACC". Les prompts, les analyseurs, la stratégie de couverture, et les règles de qualité ont été affinés pour ce cas d'usage, qui représente environ quatre-vingt-dix pour cent du travail de validation réalisé.

Les autres fonctions "ADAS"  freinage d'urgence "AEB", maintien dans la voie "LKA", reconnaissance des panneaux "TSR"  n'ont pas encore fait l'objet de tests approfondis. Rien dans l'architecture ne s'oppose à leur prise en charge : le système est conçu pour être générique. Mais la qualité des cas de test générés pour ces fonctions n'a pas été validée par des experts, et il est probable que certains prompts et règles nécessitent des ajustements spécifiques.


Cette spécialisation est un choix pragmatique de stage : plutôt que de couvrir superficiellement toutes les fonctions, nous avons préféré atteindre un niveau de maturité élevé sur une fonction représentative. L'extension aux autres fonctions constitue la suite naturelle du travail, et le principe d'un analyseur générique déjà présent dans le "pipeline" en facilite l'amorce.

#intro-subsection[L'absence de tests de non-régression sur la qualité]

Les tests automatisés couvrent la logique du système (authentification, revue, mémoire), mais pas la qualité intrinsèque des cas de test générés. Un changement de modèle "LLM", une modification de "prompt", ou une mise à jour de dépendance pourrait dégrader la qualité des résultats sans qu'aucune alerte ne se déclenche.

La piste d'amélioration passe par des évaluations automatisées (via "DeepEval" ou un "framework" équivalent) qui mesureraient, à chaque modification, des critères de qualité sur un jeu de référence : pertinence, complétude, couverture des types de cas. Ce filet de sécurité garantirait qu'une amélioration apportée à un endroit ne cause pas de régression ailleurs.

#intro-subsection[Synthèse] 

Ces limites dessinent, en creux, la feuille de route des prochaines itérations. Elles ne remettent pas en cause la valeur du système dans son périmètre actuel  la génération de cas de test "ACC" de haute qualité  mais elles rappellent qu'un produit logiciel n'est jamais achevé. Il évolue, s'étend, et se raffine au contact de ses utilisateurs et de nouveaux cas d'usage.
``

#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 7.8pt,
    )

    #table(
      columns: (4.7cm, 5.3cm, 6cm),
      inset: (x: 5pt, y: 6pt),
      stroke: none,
      align: (left, left, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Limite]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Impact]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Piste d’amélioration]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        #text(weight: "bold", fill: ENIADBlue)[Dépendance aux API LLM]
      ],
      [
        Coût par exécution, latence variable, indisponibilité possible.
      ],
      [
        Modèles locaux via Ollama \(déjà amorcé\).
      ],

      // Row 2
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Exigences matérielles]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Application lourde : 7 conteneurs, vidéo et monitoring peuvent saturer un poste modeste.
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Services optionnels, allègement mémoire et déploiement cloud.
      ],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[Taille du contexte LLM]
      ],
      [
        Contexte volumineux : plus de tokens, latence accrue et limite de fenêtre.
      ],
      [
        Sélection sémantique plus fine et résumé dynamique renforcé.
      ],

      // Row 4
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Spécialisation ACC \(>90%\)]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Les autres fonctions \(AEB, LKA, TSR\) ne sont pas encore testées ni validées par experts.
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Extension via l’analyseur générique déjà présent.
      ],

      // Row 5
      [
        #text(weight: "bold", fill: ENIADBlue)[Pas de non-régression qualité]
      ],
      [
        Un changement de modèle ou de prompt peut dégrader les résultats sans alerte.
      ],
      [
        Évaluations automatisées \(DeepEval\) sur un jeu de référence.
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Limites identifiées et pistes d’amélioration du système ADAS-R2T],
  kind: table,
) <tab:limites-pistes-amelioration>


#intro-section[Difficultes rencontrees et solutions]
Aucun projet de développement ne se déroule comme prévu. Celui-ci ne fait pas exception. Les difficultés rencontrées n'ont pas été de simples bugs à corriger : elles ont parfois remis en question des choix d'architecture, révélé des incompatibilités entre outils, ou mis en lumière des subtilités du `"framework"` qui n'apparaissent dans aucune documentation. Cette section en retrace les plus significatives, non par exhaustivité, mais parce qu'elles illustrent la réalité du développement d'un système agentique.

#intro-subsection[Synthèse des difficultés]
#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 7.6pt,
    )

    #table(
      columns: (5.2cm, 11cm),
      inset: (x: 5pt, y: 6pt),
      stroke: none,
      align: (left, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Difficulté]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Solution]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        #text(weight: "bold", fill: ENIADBlue)[Variabilité des structures Excel d’entrée]
      ],
      [
        Ingestion guidée par LLM \(_IngestionPlan_\) : le modèle analyse un cliché textuel du classeur pour identifier dynamiquement la structure des feuilles, éliminant le besoin d’un template fixe.
      ],

      // Row 2
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Écritures concurrentes lors des fan-outs parallèles]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Réducteurs d’état personnalisés \(#raw("_add_or_reset")\) sur les clés partagées du PipelineState, garantissant l’accumulation ordonnée des résultats sans perte de données.
      ],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[Hallucinations et imprécisions des LLMs]
      ],
      [
        Évaluateur à deux phases : 8 règles déterministes, revue LLM par lot, et validation Pydantic v2 stricte sur chaque sortie, rejetant automatiquement les réponses non conformes.
      ],

      // Row 4
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Rate limiting des API LLM]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Stratégie de réexécution avec repli exponentiel et jitter \(bibliothèque tenacity\), plafonnée à 7 tentatives avec un délai maximum de 120 secondes.
      ],

      // Row 5
      [
        #text(weight: "bold", fill: ENIADBlue)[Confidentialité des données d’exigences dans les checkpoints]
      ],
      [
        Chiffrement AES-CBC de l’état persisté dans PostgreSQL via le module #raw("checkpoint_serde.py"), transparent pour la logique métier.
      ],

      // Row 6
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Maintien du contexte lors de l’interruption HITL]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Persistance complète du graphe d’état via le checkpointer PostgreSQL de LangGraph, permettant la reprise exacte de l’exécution après la décision utilisateur.
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Difficultés techniques rencontrées et solutions mises en place],
  kind: table,
) <tab:difficultes-solutions>

// #intro-section[Vue d'ensemble]
// #intro-subsection[ Flux global]
// #intro-section[Vue d'ensemble]
// #intro-subsection[ Flux global]
#pagebreak()
``

// #set page(header: report-header, footer: report-footer)
