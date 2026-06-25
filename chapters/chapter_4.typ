
#import "../components.typ": *

#eniad-chapter(
  "4",
  [Architecture Générale du Projet]
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

Ce premier pipeline comptait quatorze nœuds répartis en quatre étapes : ingestion du fichier Excel, analyse sémantique par cinq analyseurs parallèles, génération des cas de test, et export au format Excel. Le tout fonctionnait en mode synchrone --- l'utilisateur lançait la génération et attendait le résultat sans indication de progression.

Les résultats étaient encourageants mais imparfaits. Le système produisait deux à trois cas de test par exigence, ce qui restait en deçà de la couverture attendue. Les prompts, rédigés en un seul bloc, souffraient d'_"attention dilution"_ : le modèle, submergé par un contexte trop large, passait à côté de détails importants.

Mais l'essentiel était là : un fichier d'exigences entrait, un fichier de cas de test sortait, en moins de deux minutes au lieu de plusieurs jours. Le concept était validé.
#intro-subsection[MVP 2 : Video Input Layer]
La deuxième itération est née d'un constat : le texte seul ne suffit pas pour capturer la richesse des situations de conduite réelle. Un fichier d'exigences décrit ce que le système _doit_ faire ; une vidéo montre ce qui _se passe vraiment_ sur la route.

Quatre nouveaux nœuds ont été ajoutés pour former le pipeline vidéo. Le premier extrait les frames clés de la vidéo à intervalles réguliers et filtre les moments significatifs par détection de changement de scène. Le deuxième analyse chaque frame par un modèle multimodal , identifiant les véhicules, piétons, panneaux, et conditions environnementales. Le troisième reconstruit des scénarios complets en établissant des chaînes causales : cause, effet, conséquence. Le quatrième génère entre quinze et vingt-cinq mutations réalistes par scénario source, couvrant cinq stratégies de variation.

Cette capacité d'analyse vidéo avec raisonnement causal n'existait chez aucun outil concurrent identifié. Elle transforme quelques secondes de vidéo en dizaines de scénarios de test structurés.

En parallèle, cette itération a intégré les retours d'une équipe de testeurs ADAS expérimentée. Dix catégories de problèmes récurrents ont été identifiées et transformées en règles de qualité : actions trop robotiques, préconditions incomplètes, valeurs limites vagues, tests hors périmètre, contradictions entre résultats attendus. L'évaluateur est devenu un gardien à deux phases (règles déterministes puis évaluation LLM), portant le taux d'évaluation de dix-sept à cent pour cent.

Le streaming par `"Server-Sent Events"` et la planification par exigence (via `"Send()"`) ont également été introduits dans cette itération, portant le nombre de cas générés de deux-trois à cinq-huit par exigence.
#intro-subsection[MVP 3 : Human in the Loop]
La troisième itération a comblé le manque le plus critique des versions précédentes : le contrôle humain en cours d'exécution.

Jusqu'ici, le pipeline fonctionnait comme une boîte noire. Si trois cas de test sur vingt étaient insatisfaisants, il fallait tout relancer. Désormais, le pipeline se met délibérément en pause après l'évaluation. L'utilisateur examine chaque cas, approuve les bons, rejette les mauvais avec un feedback précis, et supprime les hors-sujet.

Le mécanisme de Time Travel de LangGraph permet ensuite de ne régénérer que les cas rejetés, sans reprendre le pipeline depuis le début. Le planificateur reçoit les feedbacks et les intègre dans les prompts, produisant des cas améliorés qui répondent spécifiquement aux remarques. Cette boucle se répète jusqu'à satisfaction, chaque cycle produisant une nouvelle version du fichier (`"v1"`, `"v2"`, `"v3"`).

L'infrastructure de production a également été posée dans cette itération : Docker Compose avec sept services (pipeline, PostgreSQL, Nginx, Prometheus, Grafana, exportateurs), checkpoints chiffrés en AES, rate limiting par utilisateur, isolation `"multi-tenant"`, et tests automatisés avec pipeline CI via GitHub Actions.
#intro-subsection[MVP 4 : Chatbot]
La quatrième itération, vise à ajouter un mode conversationnel au système. L'utilisateur pourra interroger le pipeline en langage naturel pour comprendre les résultats : « Pourquoi as-tu généré ce cas de test ? », « Explique-moi ce scénario vidéo », « Quels cas de test couvrent l'exigence `"REQ_003"` ? ».

Ce mode transformera ADAS-R2T d'un outil de génération en un véritable assistant intelligent, capable de justifier ses décisions et de guider l'ingénieur dans son travail de validation.
#intro-subsection[MVP 5 : Mémoire a long terme]
La cinquième itération a doté le système d'une capacité d'apprentissage. Avant cette version, chaque exécution repartait de zéro, sans mémoire des interactions passées. Un utilisateur qui avait rejeté dix fois des cas de test pour cause de préconditions incomplètes devait reformuler la même remarque à chaque session.

La mémoire à long terme résout ce problème à trois niveaux. La mémoire sémantique utilisateur enregistre les préférences individuelles extraites des feedbacks. La mémoire sémantique applicative stocke les règles de qualité partagées par tous les utilisateurs. La mémoire épisodique conserve l'historique factuel des revues.

Un modèle de langage classifie automatiquement chaque feedback : les remarques portant sur des standards du domaine sont orientées vers la mémoire applicative, les préférences personnelles restent au niveau utilisateur. Une règle stricte interdit la duplication entre les deux niveaux.

La recherche dans cette mémoire s'appuie sur des embeddings vectoriels (pgvector) pour ne récupérer que les connaissances pertinentes. Si le volume récupéré dépasse le budget de contexte du modèle, un résumé automatique condense l'essentiel avant injection dans le prompt.
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

#intro-section[Vue d'ensemble]


// #intro-section[Vue d'ensemble]
// #intro-subsection[ Flux global]
// #intro-section[Vue d'ensemble]
// #intro-subsection[ Flux global]
#pagebreak()
``

// #set page(header: report-header, footer: report-footer)
