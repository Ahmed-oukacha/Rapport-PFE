#import "../components.typ": *

#eniad-chapter(
  "3",
  [Architecture Générale du Projet]
)


#import "../components.typ": *
#import "@preview/cetz:0.5.2"
#import "../components.typ": *
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

      #v(0.55cm)
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

      #v(0.45cm)

      #text(
        size: 13pt,
        weight: "bold",
      )[
        #chapter.#section.#subsection #h(0.45cm) #title
      ]

      #v(0.25cm)
    ]
  }
]
``
Ce chapitre presente l'architecture du systeme ADAS-R2T selon une approche descendante : nous partons d'une vue macroscopique du pipeline, puis nous detaillons progressivement chaque couche technique jusqu'aux mecanismes internes du graphe agentique.

#intro-section[Vue d'ensemble]
Le systeme ADAS-R2T repose sur un principe simple : transformer des entrees metier (exigences fonctionnelles, videos de conduite) en sorties exploitables (cas de test structures, scenarios de validation). Entre ces deux extremites, un pipeline intelligent orchestre le travail de dix-neuf nodes specialises.

#intro-subsection[ Flux global]
A son niveau le plus abstrait, le systeme fonctionne comme une chaine de transformation en trois temps :

- *Entree* : l'utilisateur fournit un fichier Excel contenant les exigences fonctionnelles ADAS (et eventuellement une video de conduite reelle).
- *Traitement* : le pipeline agentique analyse, planifie, genere et evalue les cas de test de maniere autonome.
- *Sortie* : un fichier Excel structure contenant les cas de test prets a etre executes par l'equipe de validation.
#adas-r2t-pipeline-stages()


#v(1cm)
Ce flux, en apparence lineaire, cache en realite une mecanique bien plus riche. Le pipeline ne se contente pas de « traduire » des exigences en tests : il analyse chaque exigence sous plusieurs angles, planifie la couverture de test, genere les cas en parallele, les evalue automatiquement, puis les soumet a l'utilisateur pour validation avant de produire le livrable final.
#intro-subsection[ Les quatre etapes du pipeline]
Le traitement interne se decompose en quatre grandes etapes, chacune correspondant a un ensemble des noeuds dans le graphe agentique :
#adas-r2t-pipeline-stages_1()
#v(1cm)
*Etape 1 : Extraction des entrees.* Le systeme ingere le fichier Excel, identifie la structure du document (en-tetes, colonnes, flow table), et extrait les exigences fonctionnelles sous une forme structuree exploitable par les etapes suivantes.

*Etape 2 : Analyse semantique.* Chaque exigence est soumise a cinq analyseurs specialises fonctionnant en parallele : transitions d'etats, contraintes temporelles, interactions homme-machine, logique de calcul, et analyse generique. Cette analyse multi-dimensionnelle permet de capturer la richesse semantique de chaque exigence.

*Etape 3 : Generation des cas de test.* Un planificateur determine la strategie de couverture pour chaque exigence (cas nominaux, limites, negatifs, rares), puis des workers paralleles generent les cas de test correspondants. Un synthetiseur elimine ensuite les doublons et consolide les resultats.

*Etape 4 : Evaluation et sortie.* Chaque cas de test genere est evalue automatiquement (detection de contradictions, verification du perimetre, coherence des valeurs). Les resultats sont ensuite soumis a une revue humaine avant *HITL* d'etre exportes au format Excel.
#intro-subsection[Les trois modes d'entree]

Le systeme supporte trois modes de fonctionnement, offrant une flexibilite adaptee a differents contextes d'utilisation :

#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 10pt,
    )

    #table(
      columns: (3.5cm, 6.2cm, 6.4cm),
      inset: (x: 5pt, y: 6pt),
      stroke: none,
      align: (center, left, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Mode]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Entrées]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Sorties]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        #text(weight: "bold", fill: ENIADBlue)[Excel seule]
      ],
      [
        Fichier d’exigences fonctionnelles
      ],
      [
        Cas de test structurés
      ],

      // Row 2 - Zebra
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Vidéo seule]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Vidéo de conduite réelle
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Scénarios de test avec raisonnement causal
      ],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[Excel + Vidéo]
      ],
      [
        Exigences + vidéo
      ],
      [
        Cas de test enrichis par les scénarios vidéo
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Modes d’entrée et sorties générées par ADAS-R2T],
  kind: table,
) <tab:modes-entrees-sorties>
- Le mode _Excel seul_ constitue le cas d'usage principal : l'equipe de validation dispose d'un document d'exigences et souhaite generer les cas de test correspondants. 

- Le mode _Video seul_ permet d'exploiter des videos de conduite reelle pour en extraire des scenarios de test bases sur un raisonnement causal (cause, effet, consequence).

- Le mode _Excel + Video_ combine les deux approches : les cas de test generes a partir des exigences sont enrichis par les observations extraites de la video.

Cette distinction entre modes se materialise au niveau du graphe par un routage conditionnel des le premier noeud, orientant le flux de traitement vers les branches appropriees.
#intro-section[Architecture technique globale]
Le systeme ADAS-R2T s'articule autour d'un noyau central _le pipeline d'orchestration _qui coordonne l'ensemble des composants techniques. Chaque composant remplit un role precis et communique avec le pipeline via des interfaces bien definies.
#intro-subsection[Vue des composants]
#agentic-ai-architecture-diagram()
Le schema ci-dessus fait apparaitre huit composants principaux, organises autour du pipeline d'orchestration. Nous les decrivons ci-dessous en suivant le flux d'une requete typique.
#intro-subsection[Pipeline d'orchestration (LangGraph)]
Le coeur du systeme est un graphe d'execution construit avec LangGraph, le framework d'orchestration d'agents de LangChain. Ce graphe definit l'enchainement des dix-neuf noeuds de traitement, gere le parallelisme, et assure la persistance de l'etat entre les etapes. C'est lui qui decide quel noeud s'execute, dans quel ordre, et comment les resultats circulent d'un agent a l'autre.

Le choix de LangGraph, plutot qu'un enchainement sequentiel de prompts, permet de beneficier de mecanismes avances : execution parallele via `Send()`, interruptions pour la revue humaine, retour arrière (Time Travel) sans perte de contexte, et reprise automatique apres une panne.

#intro-subsection[Modeles de langage (LLM APIs)]

Le systeme fait appel a des modeles de langage pour les taches d'analyse, de generation et d'evaluation. Deux fournisseurs sont supportes : OpenAI (GPT-4o) pour les taches textuelles, et Google Gemini (Gemini 2.5 Flash) pour l'analyse video grace a ses capacites multimodales.

Cette dualite n'est pas figee : chaque noeud du pipeline peut etre configure independamment pour utiliser l'un ou l'autre fournisseur, via les variables d'environnement. Cette flexibilite permet d'adapter le choix du modele au rapport cout-performance de chaque tache. Le mecanisme de retry avec backoff exponentiel (via Tenacity) assure la robustesse face aux erreurs transitoires des API externes.

#intro-subsection[Ingenierie des prompts]

Les instructions envoyees aux modeles de langage ne sont pas codees en dur dans le code source. Chaque noeud charge son prompt depuis un fichier Markdown dedie, stocke dans un repertoire centralise. Cette separation entre logique de traitement et contenu des prompts facilite l'iteration rapide : un ingenieur peut modifier un prompt sans toucher au code Python, et chaque modification est tracable dans l'historique Git.

Les prompts s'appuient sur les principes du framework MISBAH, qui structure les instructions en sections claires : contexte metier, format de sortie attendu, exemples, et contraintes a respecter.

#intro-subsection[Memoire et persistance (PostgreSQL)]

Le systeme exploite PostgreSQL pour deux fonctions distinctes de memoire :

La *memoire de session* (courte duree) est assuree par le checkpointer de LangGraph. A chaque etape du pipeline, l'etat complet est sauvegarde dans PostgreSQL sous forme de checkpoint chiffre (AES). Ce mecanisme rend possible l'interruption pour revue humaine, le retour arriere (Time Travel), et la reprise apres panne sans perte de travail.

La *memoire a long terme* (cross-session) stocke les connaissances acquises au fil des utilisations. Elle se decline en trois portees : semantique applicative (regles partagees par tous les utilisateurs), semantique utilisateur (preferences individuelles), et episodique (historique des revues). La recherche dans cette memoire s'appuie sur des embeddings vectoriels (pgvector) pour retrouver les connaissances pertinentes par similarite semantique.

#intro-subsection[Observabilite (Langfuse, Prometheus, Grafana)]

L'observabilite du systeme repose sur trois piliers complementaires :

*Langfuse* capture chaque appel LLM avec ses parametres, sa duree, ses tokens consommes et sa reponse. Ce tracage fin permet d'identifier les prompts sous-performants, de mesurer les couts, et de debugger les cas de generation insatisfaisants.

*Prometheus* collecte les metriques operationnelles du systeme : nombre de pipelines executes, duree par noeud, taux d'erreur, decisions HITL, et operations memoire. Ces metriques sont exposees via un endpoint `/metrics` au format standard.

*Grafana* consomme les metriques de Prometheus et les presente sous forme de tableaux de bord visuels. Un dashboard dedie "ADAS-R2T Pipeline Monitor" offre une vue en temps reel sur la sante et les performances du systeme.

Le logging structure, assure par structlog, complete ce dispositif en produisant des logs au format JSON exploitables par des outils d'analyse.

#intro-subsection[Validation et evaluation]

Le module d'evaluation constitue le gardien de la qualite du systeme. 


#intro-subsection[Choix techniques et justifications]

// #table(
//   columns: (1fr, 1fr, 2fr),
//   align: (left, left, left),
//   [*Composant*], [*Technologie*], [*Justification*],
//   [Orchestration], [LangGraph], [Graphe d'agents avec parallelisme, interruptions, et persistance native],
//   [API], [FastAPI], [Performance async, documentation auto, ecosysteme Python],
//   [Base de donnees], [PostgreSQL + pgvector], [Robustesse, support vectoriel pour la recherche semantique],
//   [Monitoring], [Prometheus + Grafana], [Standard industriel, dashboards personnalisables],
//   [LLM tracing], [Langfuse], [Specialise LLMOps, open source, integre LangChain],
//   [Logging], [structlog], [Logs structures JSON, decorateurs de noeud],
//   [Conteneurisation], [Docker Compose], [Deploiement reproductible, isolation des services],
//   [Securite], [JWT + API Key + AES], [Authentification double, chiffrement au repos],
// )
#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 8.6pt,
    )

    #table(
      columns: (3.1cm, 3.4cm, 9.7cm),
      inset: (x: 5pt, y: 6pt),
      stroke: none,
      align: (left, left, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Composant]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Technologie]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Justification]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        #text(weight: "bold", fill: ENIADBlue)[Orchestration]
      ],
      [
        LangGraph
      ],
      [
        Graphe d’agents avec parallélisme, interruptions et persistance native
      ],

      // Row 2 - Zebra
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[API]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        FastAPI
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Performance async, documentation automatique, écosystème Python
      ],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[Base de données]
      ],
      [
        PostgreSQL + pgvector
      ],
      [
        Robustesse, support vectoriel pour la recherche sémantique
      ],

      // Row 4 - Zebra
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Monitoring]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Prometheus + Grafana
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Standard industriel, dashboards personnalisables
      ],

      // Row 5
      [
        #text(weight: "bold", fill: ENIADBlue)[LLM tracing]
      ],
      [
        Langfuse
      ],
      [
        Spécialisé LLMOps, open source, intégré LangChain
      ],

      // Row 6 - Zebra
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Logging]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        structlog
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Logs structurés JSON, décorateurs de nœud
      ],

      // Row 7
      [
        #text(weight: "bold", fill: ENIADBlue)[Conteneurisation]
      ],
      [
        Docker Compose
      ],
      [
        Déploiement reproductible, isolation des services
      ],

      // Row 8 - Zebra
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Sécurité]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        JWT + API Key + AES
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Authentification double, chiffrement au repos
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Choix technologiques retenus pour l’architecture ADAS-R2T],
  kind: table,
) <tab:choix-technologiques>
``
#intro-section[Architecture multi-scope]

Le systeme ADAS-R2T adopte une architecture a trois niveaux, ou chaque couche assume une responsabilite distincte. Cette separation nette entre presentation, logique metier, et intelligence artificielle favorise le developpement parallele par deux equipes independantes et facilite l'evolution de chaque couche sans impact sur les autres.








#intro-section[Vue d'ensemble]
#intro-subsection[ Flux global]#intro-section[Vue d'ensemble]
#intro-subsection[ Flux global]
#intro-section[Vue d'ensemble]
#intro-subsection[ Flux global]
#pagebreak()
``


















// #set page(header: report-header, footer: report-footer)
