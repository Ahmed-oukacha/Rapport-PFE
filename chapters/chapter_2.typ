#import "../components.typ": *

#eniad-chapter(
  "2",
  [État de l'art]
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

#intro-section[De l'IA Générative à l'IA Agentique]

#intro-subsection[L'IA Générative]

L’intelligence artificielle générative constitue une rupture importante par rapport aux approches classiques de l’IA. Les modèles traditionnels étaient principalement conçus pour accomplir des tâches d’analyse, de classification ou de prédiction, comme reconnaître un objet dans une image ou estimer une valeur à partir de données existantes.
Les modèles génératifs introduisent une logique différente. Au lieu de se limiter à l’identification de catégories ou à la production de résultats prédictifs, ils apprennent les régularités profondes présentes dans les données d’entraînement. Cette capacité leur permet ensuite de générer de nouveaux contenus, qu’il s’agisse de texte, d’images, de code, d’audio ou d’autres formats numériques.
Les grands modèles de langage, tels que *GPT-4, Claude ou Gemini*, représentent l’une des applications les plus visibles de cette évolution. Ils peuvent produire des documents structurés, résumer des textes volumineux, traduire entre plusieurs langues ou encore générer du code informatique.
#v(0.6em)
Toutefois, malgré leurs performances, ces modèles restent limités par une logique fondamentalement réactive : ils répondent à une consigne, produisent une sortie, puis interrompent leur action.
Ils ne disposent donc pas, par défaut, d’une capacité d’initiative autonome. Ils ne surveillent pas continuellement les résultats obtenus, ne planifient pas spontanément une suite 
#set page(header: report-header, footer: report-footer)
d’actions et ne corrigent pas leurs erreurs sans nouvelle intervention humaine. Cette limite explique l’émergence progressive des agents intelligents, qui cherchent à dépasser le simple modèle conversationnel pour aller vers des systèmes capables d’observer, décider et agir de manière plus autonome.


#intro-subsection[L'IA Agentique]
L'IA Agentique représente l'étape suivante : le passage de la _création de contenu_ à l'_exécution d'objectifs_. Un agent IA ne reçoit pas une liste de tâches séquentielles — il reçoit un objectif de haut niveau et conduit autonomement le processus pour l'atteindre.

Cette transition repose sur quatre piliers fondamentaux :

- *L'autonomie :* L’autonomie : l’agent est capable de prendre certaines décisions et d’exécuter des actions sans attendre une instruction humaine à chaque étape. Cette autonomie peut concerner l’exécution des tâches, le choix des actions ou encore l’utilisation d’outils externes. Elle doit cependant rester encadrée par des règles, des autorisations et, lorsque c’est nécessaire, une validation humaine.
#v(0.6em)
- *Goal Oriented : *l’agent travaille à partir d’un objectif persistant. Cet objectif sert de direction principale à toutes ses actions. Par exemple, si l’objectif est de recruter un profil technique, l’agent garde ce but en mémoire et organise ses décisions autour de celui-ci, tout en respectant les contraintes définies comme le budget, les compétences demandées ou les délais.
#v(0.6em)
- *La planification : * l’agent décompose un objectif complexe en étapes plus simples et plus concrètes. Il peut proposer plusieurs plans possibles, comparer leurs avantages et leurs limites, puis sélectionner la stratégie la plus adaptée selon les ressources disponibles, les risques, les coûts et les contraintes de départ.
#v(0.6em)
- *Le raisonnement : * l’agent ne se limite pas à exécuter des actions. Il analyse les informations, compare les options, interprète les résultats intermédiaires et choisit les décisions les plus pertinentes.
#v(0.6em)
- *L'adaptabilité : * Lorsqu'un événement imprévu survient ou qu'une stratégie ne donne pas les résultats escomptés, l'agent peut adapter son plan. Il peut modifier sa tactique, proposer une alternative ou solliciter une intervention humaine. L'important est de rester fidèle à l'objectif principal, même face à l'évolution de la situation.
#v(0.6em)
- *Context Awareness : * Le système conserve et exploite les informations importantes tout au long du processus. Il prend en compte l'objectif initial, les actions réalisées, les préférences de l'utilisateur, les conditions environnementales, les réactions des outils et les règles à suivre. Cette mémoire contextuelle permet d'éviter les répétitions et de maintenir la cohérence logique entre les différentes étapes.
#v(0.5cm)
#info-box("Distinction fondamentale")[
  L'IA Générative est une *capacité* — la faculté de raisonner et créer. L'IA Agentique est un *comportement* — la capacité d'utiliser cette faculté comme moteur d'exécution. Le LLM n'est pas remplacé : il est _enveloppé_ de mémoire, d'outils et d'un planificateur.
]
#v(0.5cm)
#genai-vs-agentic-radar()

#intro-subsection[Les composants d'un système d'IA Agentique ]

Les composants d’un système d’IA agentique
Pour comprendre le fonctionnement d’un agent IA, il faut dépasser l’idée d’un simple modèle de langage qui génère des réponses. Un système agentique repose sur une architecture plus riche, composée de plusieurs éléments qui travaillent ensemble. Chacun joue un rôle précis : comprendre l’objectif, organiser les actions, utiliser les bons outils, conserver le contexte et maintenir le système sous contrôle.\
On peut généralement distinguer cinq composants principaux : *le Brain, l’Orchestrator, les Tools, la Memory et le Supervisor. @Agentic_ai-gen_ai*

*- Le Brain* :ou cerveau de l’agent, est la partie qui interprète la demande de l’utilisateur. Il transforme une instruction parfois générale ou ambiguë en objectif clair et exploitable. C’est à ce niveau que l’agent commence à comprendre la situation, à analyser les contraintes et à construire une première stratégie.
#v(0.6em)
*- L’Orchestrator* : L’Orchestrator, ou orchestrateur, prend le relais lorsque les    actions doivent être exécutées. Si le Brain définit ce qu’il faut faire, l’Orchestrator organise concrètement la manière de le faire.
Il commence par structurer l’ordre des tâches. Il détermine quelle action doit être lancée en premier, laquelle doit suivre, et comment le processus doit évoluer. Dans un système agentique, cette organisation est essentielle, car une tâche complexe ne se réalise presque jamais en une seule étape.
#v(0.6em)
*- Les Tools* : ou outils, donnent à l’agent la possibilité de dépasser le simple échange conversationnel. Grâce à eux, il ne se contente plus de produire des réponses : il peut interagir avec son environnement et exécuter des actions concrètes.
#v(0.6em)
*- La Memory* : ou mémoire, permet à l’agent de garder le fil au fil des interactions. Sans mémoire, chaque échange serait traité comme un événement isolé. Avec elle, l’agent peut suivre une tâche dans le temps et conserver les informations importantes.
On distingue généralement deux types de mémoire: 
 - La mémoire à court terme conserve le contexte immédiat : les derniers messages, les décisions récentes, les résultats des appels aux outils et l’état actuel de la tâche. Elle aide l’agent à rester cohérent pendant une session.
 - La mémoire à long terme conserve des informations plus durables : les préférences de l’utilisateur, les objectifs récurrents, les décisions importantes ou certaines données issues d’interactions précédentes. Elle permet à l’agent de personnaliser davantage ses actions et d’éviter de redemander des informations déjà connues.
#v(0.6em)
*- Le Supervisor* : Le Supervisor, ou superviseur, encadre le comportement de l’agent. Son rôle est indispensable, car un agent autonome ne doit pas pouvoir agir librement dans toutes les situations.
Le superviseur intervient notamment à travers les mécanismes de validation humaine, souvent appelés Human-in-the-Loop. Certaines actions peuvent être préparées automatiquement, mais nécessitent une approbation avant d’être exécutées. Par exemple, un agent peut rédiger une offre ou préparer un e-mail, mais ne pas l’envoyer sans validation humaine.

#intro-section[Patrons architecturaux des systèmes agentiques]
#intro-subsection[Quand utiliser des agents AI et LLM Workflows]
La littérature distingue deux grandes familles d'architectures au sein des systèmes agentiques :
 
- *Workflows:* sont des systèmes où les grands modèles de langage (LLM) et les outils sont contrôlés par du code prédéfini. 
- *AI agents:* Le terme “agent” a plusieurs définitions. Certains clients définissent un agent comme un système autonome qui fonctionne seul pendant longtemps et utilise différents outils pour effectuer des tâches complexes. D'autres utilisent ce terme pour décrire des systèmes plus stricts qui suivent des processus prédéfinis. D'aprés Anthropic, nous considérons toutes ces variations comme des systèmes basés sur des agents, mais nous faisons une distinction importante entre les flux de travail et les agents. 
#v(0.6em)
--Lorsque vous développez des applications avec des LLM, nous recommandons de choisir la solution la plus simple possible et d'ajouter de la complexité uniquement si cela est nécessaire. Parfois, il n'est pas nécessaire de développer des systèmes basés sur des agents. Les systèmes multi-agents donnent souvent la priorité à l'efficacité des tâches plutôt qu'à la latence et au coût, il est donc important d'évaluer si ce compromis en vaut la peine @Building_effective_agents.
#v(0.6em)
--Lorsque la complexité est nécessaire, les flux de travail offrent prévisibilité et cohérence pour les tâches bien définies, tandis que les agents sont meilleurs lorsque la flexibilité et la prise de décision basée sur un modèle sont nécessaires à grande échelle. Cependant, pour de nombreuses applications, optimiser les appels LLM individuels avec récupération et exemples contextuels est souvent suffisant @Building_effective_agents.

#intro-subsection[Modèles de conception d'agents d'IA et LLM Workflows]
Dans les workflows, les LLM et les outils sont orchestrés via des *chemins de code prédéfinis*. Le système suit une trajectoire prévisible et établie. Cinq patrons majeurs ont été identifiés :

*Chaînage de prompts:* Décomposition d'une tâche en séquence linéaire d'étapes, où la sortie d'un appel devient l'entrée du suivant. L'architecte échange intentionnellement la latence contre la précision en réduisant la portée de chaque appel.
#v(1cm)
#prompt-chain-gate-diagram()
#v(1cm)
*Routage:* Classification de l'entrée et orientation vers une tâche ou un modèle spécialisé. Ce patron garantit la séparation des préoccupations et permet d'utiliser des modèles de complexité différente selon les besoins.
#v(1cm)
#routing-workflow-diagram()
#v(1cm)

*Parallélisation:* Traitement simultané de plusieurs aspects d'un problème, selon deux modèles : le _sectionnement_ (chaque branche traite un aspect différent) et le _vote_ (plusieurs branches traitent la même entrée pour fiabiliser le résultat).

#v(1cm)
#parallelization-workflow-diagram()
#v(1cm)


*Orchestrateur-Travailleurs:* Un LLM principal décompose dynamiquement une tâche complexe, délègue les sous-tâches à des LLM travailleurs et synthétise leurs résultats. Contrairement à la parallélisation, les sous-tâches ne sont pas prédéfinies — elles sont déterminées à la volée.
#v(1cm)
#orchestrator-workers-workflow-diagram()
#v(1cm)
*Évaluateur-Optimiseur:* Création d'une boucle de rétroaction où un LLM génère un résultat et un autre le critique pour l'affiner. Ce patron convient lorsqu'il existe des critères d'évaluation clairs.
#v(1cm)
#evaluator-optimizer-workflow-diagram()
#v(1cm)

#intro-subsection[Agents autonomes]
Là où les workflows sont des scripts, les agents autonomes sont des explorateurs. Ils opèrent via une boucle d'action-observation : à chaque étape, l'agent entreprend une action, observe le résultat de l'environnement (la _vérité terrain_), et ajuste son plan en conséquence.
#v(0.6em)
Le cycle de vie d'un agent comprend : instruction → planification → action → feedback → itération → point de contrôle humain → terminaison. L'autonomie des agents implique cependant des coûts plus élevés et un risque d'erreurs composées, où une erreur précoce se propage à travers toute la chaîne @Building_effective_agents.

#intro-subsection[Choix architectural pour ADAS-R2T]
Pour notre projet, nous avons opté pour une approche hybride : un *flux de travail structuré* combinant quatre des cinq patrons (routage, parallélisation, orchestrateur-travailleurs, évaluateur-optimiseur). Ce choix offre la prévisibilité d'un workflow avec la puissance d'exécution d'un système agentique. Le chaînage simple a été écarté car le pipeline nécessite des branchements conditionnels et du parallélisme.
#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 10pt,
    )

    #table(
      columns: (5cm, 9cm, 2cm),
      inset: (x: 5pt, y: 5pt),
      stroke: none,
      align: (center, left, center),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Patron]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Application dans ADAS-R2T]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Retenu]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        Chaînage
      ],
      [
        Pipeline partiellement linéaire (ingest → extract)
      ],
      [
        Partiel
      ],

      // Row 2
      table.cell(fill: rgb("#F3F8FC"))[
        Routage
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Route chaque exigence vers les analyseurs pertinents
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold")[✓]
      ],

      // Row 3
      [
        Parallélisation
      ],
      [
        Analyseurs simultanés + N workers simultanés
      ],
      [
        #text(weight: "bold")[✓]
      ],

      // Row 4
      table.cell(fill: rgb("#F3F8FC"))[
        Orchestrateur-Workers
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Coverage planner → workers de génération
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold")[✓]
      ],

      // Row 5
      [
        Évaluateur-Optimiseur
      ],
      [
        Evaluator → retry vers le planner
      ],
      [
        #text(weight: "bold")[✓]
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Correspondance entre les patrons architecturaux et leur usage dans ADAS-R2T.],
  kind: table,
) <tab:patterns-adas-r2t>


#intro-section[LangGraph : framework d'orchestration]
#intro-subsection[Pourquoi LangGraph] 

LangGraph est un framework d’orchestration conçu pour construire des workflows basés sur les grands modèles de langage (*LLM*) qui sont à la fois *stateful*, multi-étapes et orientés événements. Contrairement à une simple chaîne linéaire d’appels à un modèle de langage, LangGraph permet de représenter une application comme un graphe composé de nœuds, d’arêtes et de transitions conditionnelles.
#v(0.6em)
Dans ce contexte, chaque nœud du graphe représente une étape de traitement, telle que l’analyse d’une exigence, l’extraction d’informations, la génération d’un cas de test, l’évaluation d’un résultat ou encore la correction d’une sortie. Les arêtes définissent les connexions entre ces étapes, tandis que la logique de transition permet de choisir dynamiquement le prochain traitement à exécuter .
#v(0.6em)
LangGraph peut être considéré comme un moteur de workflow pour applications LLM. Il prend en charge des fonctionnalités essentielles pour les systèmes intelligents robustes, notamment la gestion de l’état, les branchements conditionnels, les boucles, les mécanismes de pause et de reprise, ainsi que la récupération après erreur. Ces caractéristiques sont particulièrement importantes dans un contexte industriel, où les résultats générés doivent être contrôlés, traçables et améliorables @Agentic_ai-gen_ai.
#v(0.6em)
Dans le cadre du projet *ADAS-R2T*, LangGraph constitue un choix pertinent car le processus de génération des tests ADAS n’est pas strictement linéaire. Le pipeline doit être capable d’analyser les exigences, de générer des cas de test, de les évaluer, de détecter les incohérences, de demander une validation humaine et, si nécessaire, de régénérer uniquement les éléments rejetés. Cette logique correspond naturellement à une architecture sous forme de graphe.

#intro-subsection[LangGraph vs LangChain ?]

LangChain reste adapté aux workflows simples et linéaires, par exemple lorsqu’il s’agit d’enchaîner quelques appels successifs à un modèle de langage, de construire un système de résumé ou de mettre en place un mécanisme de recherche documentaire basique. Dans ce type de cas, le traitement suit généralement une séquence fixe et prévisible @LangGraph_overview.
#v(0.6em)
En revanche, LangGraph devient plus approprié lorsque le cas d’usage implique des workflows complexes et non linéaires. Il est particulièrement utile lorsque l’application nécessite :

#set list(
  marker: [•],
  indent: 1.3em,
  body-indent: 0.6em,
  spacing: 0.35em,
)

- des chemins conditionnels selon la qualité ou le type des données traitées ;
\
- des boucles d’amélioration ou de régénération ;
\
- des étapes de validation humaine (*Human-in-the-Loop*) ;
\
- une coordination entre plusieurs agents spécialisés ;
\
- une exécution asynchrone ou orientée événements ;
\
- une gestion persistante de l’état du workflow.

Dans notre projet, ces besoins sont présents à plusieurs niveaux. Par exemple, un cas de test rejeté par l’utilisateur ne doit pas entraîner la relance complète du pipeline. Il doit uniquement déclencher une branche de correction ou de régénération ciblée. De même, l’évaluation automatique des cas générés peut conduire à différentes décisions : validation, correction, rejet, ou demande d’intervention humaine.
#intro-subsection[Complémentarité entre LangGraph et LangChain]

LangGraph ne remplace pas LangChain. Il s’appuie au contraire sur ses composants pour construire les différentes étapes du workflow. LangChain fournit les briques de base nécessaires à l’interaction avec les modèles de langage et les ressources externes, tandis que LangGraph organise ces briques dans un graphe d’exécution contrôlé.
#v(0.6em)
Ainsi, dans une architecture basée sur LangGraph, il reste possible d’utiliser des composants LangChain tels que :

#set list(
  marker: [•],
  indent: 1.3em,
  body-indent: 0.6em,
  spacing: 0.35em,
)

- `ChatOpenAI` ou d’autres connecteurs vers des modèles de langage ;
\
- `PromptTemplate` pour structurer les instructions envoyées au modèle ;
\
- les *retrievers* pour récupérer des informations pertinentes ;
\
- les *document loaders* pour charger des documents ou fichiers d’entrée ;
\
- les *tools* pour connecter le système à des services externes ou à des fonctions spécifiques.
#v(0.6em)
De ce fait, LangChain peut être vu comme une bibliothèque de composants, tandis que LangGraph joue le rôle d’un orchestrateur de workflow. Cette complémentarité permet de concevoir une architecture plus robuste, modulaire et adaptée aux exigences du projet *ADAS-R2T*.
#v(0.6em)
#eniad-note[
  Dans ADAS-R2T, LangGraph est utilisé comme couche d’orchestration principale. Il permet de coordonner les agents spécialisés, de gérer l’état du pipeline, d’intégrer la validation humaine et de contrôler les boucles de correction ou de régénération des cas de test.
]


#intro-subsection[Concepts fondamentaux]
Un graphe LangGraph se compose de trois éléments :
 les *nœuds* (fonctions async qui lisent et écrivent dans l'état partagé), 
 les *arêtes* (transitions entre nœuds, linéaires ou conditionnelles).
 l'*état* (un TypedDict partagé qui accumule les résultats au fil de l'exécution).
#v(0.6em)
Le concept de _reducer_ est particulièrement important pour les systèmes parallèles : lorsque plusieurs nœuds écrivent simultanément dans le même champ (par exemple, plusieurs workers ajoutant des cas de test), le reducer (typiquement `operator.add` pour les listes) fusionne les résultats sans conflit.

#intro-section[Ingénierie des prompts et du contexte]
  
#intro-subsection[Du prompt engineering au context engineering] 
L'ingénierie des prompts traditionnelle consiste à formuler des instructions claires pour le LLM. L'ingénierie du contexte va plus loin : elle conçoit l'_environnement complet_ dans lequel le LLM opère , connaissances, contraintes, format de sortie @Misbah.
#v(0.6em)
Pour ce projet, nous avons adopté le framework * (MISBAH)* , un cadre méthodologique en cinq étapes pour la construction de contextes LLM de haute qualité :
#v(0.6em)
+ * Le Principe* — alignement de l'intention : définir l'objectif stratégique unique que le modèle doit poursuivre, élevant la qualité de « statistiquement probable » à « stratégiquement ciblé ».

+ *La Formulation* — amorçage comportemental (_behavioral priming_) : activer les réseaux neuronaux du modèle associés à un profil d'expert spécifique, reproduisant non seulement ses connaissances mais son mode de raisonnement.

+ *Le Protocole* — raisonnement structuré (_chain-of-thought_) : imposer des étapes analytiques strictes et séquentielles pour réduire les erreurs logiques et améliorer la cohérence.

+ *Les Standards* — guidage négatif : spécifier explicitement les comportements interdits, éliminant des catégories entières de sorties faibles.

+ *Le Résultat* — format de sortie : définir la structure exacte attendue pour garantir des résultats cohérents et exploitables par le code.

L'application de ce framework aux prompts du projet a démontré des améliorations significatives, notamment la réduction des descriptions vides de 52\% à 0\% et l'élimination complète des erreurs de formatage.


#intro-section[Travaux connexes]

La génération automatique de scénarios et de cas de test pour les systèmes ADAS/ADS constitue aujourd’hui un axe de recherche important, en raison de la complexité croissante des fonctions de conduite automatisée et de la difficulté de couvrir l’ensemble des situations de conduite possibles. Les travaux existants peuvent être regroupés en plusieurs familles : les approches fondées sur les scénarios et les critères de couverture, les méthodes exploitant les descriptions textuelles, les approches basées sur les grands modèles de langage, ainsi que les solutions industrielles alignées avec les standards ASAM.

#intro-subsection[Validation ADAS/ADS et génération de scénarios conformes à SOTIF]

La validation des systèmes avancés d’aide à la conduite et des systèmes de conduite automatisée repose de plus en plus sur le *scenario-based testing*. Cette approche consiste à évaluer le comportement du système sous test dans des situations représentatives de l’environnement réel, incluant l’infrastructure routière, les acteurs dynamiques, les conditions météorologiques et les interactions entre véhicules.
#v(0.6em)
Dans ce contexte, la norme *SOTIF* (*Safety of the Intended Functionality*, ISO 21448) souligne l’importance de générer des suites de scénarios capables de couvrir l’espace opérationnel du système tout en identifiant les situations potentiellement dangereuses. Cependant, plusieurs travaux montrent que la norme ne définit pas précisément comment sélectionner les scénarios, comment mesurer leur couverture, ni comment évaluer leur capacité à révéler des défaillances. Cette limite rend son application pratique difficile dans des environnements industriels complexes.
#v(0.6em)
Des travaux récents proposent donc d’utiliser des modèles de variabilité, des stratégies de sampling et des critères de couverture pour représenter l’espace des scénarios et générer des suites de tests plus efficaces. Par exemple, les approches combinatoires permettent de couvrir systématiquement différentes interactions entre entités de scénario, tandis que les stratégies de *selective sampling* tiennent compte de la complexité des scénarios. L’évaluation par *mutation testing* permet ensuite d’estimer la capacité d’une suite de scénarios à détecter des fautes potentielles dans le système sous test @birkemeyer_scenario_generation.
#v(0.6em)
Ces approches sont particulièrement intéressantes pour notre projet, car elles mettent en évidence deux exigences essentielles : la couverture des scénarios possibles et la capacité à détecter des comportements dangereux. Toutefois, elles se concentrent principalement sur la génération de scénarios à partir d’espaces formalisés ou de paramètres de simulation, alors que notre projet part d’un autre type d’entrée : les exigences fonctionnelles ADAS rédigées en langage naturel.

#intro-subsection[Génération de scénarios à partir de descriptions textuelles]

Une autre famille de travaux s’intéresse à la génération de scénarios de test à partir de descriptions textuelles, notamment des rapports d’accidents, des récits de trafic ou des descriptions formulées par des experts. Cette orientation est particulièrement pertinente, car les textes décrivent souvent des relations causales, des interactions dynamiques et des contextes de conduite qui ne sont pas toujours faciles à extraire à partir de données visuelles.\
#v(0.6em)
Le système *Txt2Sce* illustre cette tendance. Il exploite des rapports d’accidents impliquant des véhicules autonomes afin de générer des fichiers *OpenSCENARIO*. Le processus consiste d’abord à extraire les éléments clés du rapport textuel à l’aide d’un LLM, puis à produire un scénario initial conforme au standard OpenSCENARIO. Ensuite, le système applique des opérations de désassemblage, de mutation et de réassemblage afin de construire des arbres de scénarios plus diversifiés. Les auteurs montrent que cette méthode permet de produire plusieurs milliers de scénarios valides et de détecter différents comportements inattendus d’Autoware, notamment en matière de sécurité, de fluidité et de prise de décision @txt2sce.
#v(0.6em)
Cette approche présente plusieurs avantages : elle exploite des descriptions issues du monde réel, produit des fichiers standards réutilisables, et permet d’analyser les conditions qui déclenchent des comportements inattendus. Toutefois, elle se focalise principalement sur les rapports d’accidents et la génération de scénarios de simulation. Dans notre cas, l’objectif est différent : il s’agit de transformer des exigences fonctionnelles ADAS en plans et cas de test structurés, tout en garantissant la traçabilité entre chaque exigence et les tests générés.

#intro-subsection[Apport des LLMs dans la génération de scénarios de test]

Les grands modèles de langage ouvrent de nouvelles perspectives pour l’automatisation des tâches liées à l’ingénierie des exigences et à la génération de scénarios. Leur capacité à comprendre le langage naturel, à extraire des entités, à structurer des informations et à produire des sorties semi-formalisées les rend particulièrement adaptés aux domaines où les spécifications sont majoritairement textuelles.
 #v(0.6em)

Le framework *Text2Scenario* propose une approche où un LLM agit comme parser de descriptions textuelles de scénarios. Le système s’appuie sur un référentiel hiérarchique de composants de scénario, comprenant notamment la topologie de la route, les infrastructures, les changements temporaires, les participants au trafic, le climat et le véhicule ego. À partir d’une description textuelle, le LLM sélectionne les éléments correspondants, puis un générateur basé sur DSL assemble ces éléments pour produire des fichiers exécutables dans un simulateur. Les auteurs mettent également en avant un pipeline de *prompt engineering* comprenant le *role setting*, le *few-shot learning*, le *chain-of-thought*, la vérification syntaxique et la *self-consistency* @text2scenario.
 #v(0.6em)

Les résultats de cette approche montrent que l’utilisation d’un LLM avancé, notamment GPT-4, améliore fortement la qualité de l’extraction des éléments de scénario et réduit le temps de construction par rapport à des experts humains. Néanmoins, la génération reste limitée par la robustesse du LLM, la dépendance à un référentiel d’éléments préexistant et la nécessité de vérifier la faisabilité des fichiers produits.
 #v(0.6em)

Ces constats sont directement liés à notre projet. En effet, ADAS-R2T ne doit pas se contenter d’un simple appel à un LLM. Le système doit intégrer des mécanismes de contrôle, de validation, de correction et de supervision humaine afin de réduire les risques d’hallucination, d’incohérence ou de génération hors périmètre.

#intro-subsection[Exploitation des sources ouvertes et OSINT pour les scénarios ADAS]

Certains travaux explorent également l’utilisation de sources ouvertes, telles que les données publiques disponibles sur Internet, pour enrichir la génération de scénarios AD/ADAS. L’approche OSINT combinée aux LLMs consiste à collecter des descriptions d’incidents de trafic à l’aide de techniques de web scraping, puis à structurer ces informations dans un format compatible avec un langage de description de scénarios tel qu’OpenSCENARIO.

Une étude récente propose un pipeline combinant web scraping, LLMs et OpenSCENARIO XML v1.2.0. Le système identifie des sources publiques, extrait des informations qualitatives sur les incidents de trafic, puis utilise des LLMs pour structurer et compléter les scénarios. L’étude distingue deux niveaux de validation : une validation syntaxique basée sur le schéma XSD d’OpenSCENARIO et une validation sémantique portant sur la cohérence, la complétude, la clarté et la conformité du scénario généré à la description originale @zorin_mercier_osint_llm.
 #v(0.6em)

Cette approche est intéressante car elle montre que les données ouvertes peuvent constituer une source complémentaire pour identifier des scénarios réalistes et potentiellement rares. Cependant, elle présente plusieurs limites : l’accès aux sources est contraint par des considérations légales et éthiques, la qualité des textes disponibles varie fortement, et la génération par LLM nécessite une validation rigoureuse pour éviter les hallucinations et les incohérences.
 #v(0.6em)

Dans ADAS-R2T, l’intégration de vidéos de conduite et de feedback utilisateur peut jouer un rôle similaire à celui des sources ouvertes : enrichir la base des scénarios et rapprocher les tests générés des situations réelles, tout en maintenant un cadre contrôlé et traçable.

#intro-subsection[Standards ASAM et interopérabilité des scénarios]

Les standards ASAM jouent un rôle important dans la génération, la gestion et l’exécution des scénarios ADAS/ADS. *OpenSCENARIO* permet de décrire les scénarios dynamiques, *OpenDRIVE* fournit une représentation standardisée du réseau routier, tandis qu’*OpenLABEL* facilite l’organisation et l’annotation des données de scénarios.
 #v(0.6em)

Une application industrielle présentée par ASAM et IAV montre l’intérêt d’une génération de scénarios assistée par IA. Dans cette approche, des LLMs sont utilisés pour transformer des spécifications de tests, des rapports d’accidents, des exigences internes ou des connaissances d’experts en scénarios compatibles avec les chaînes d’outils de simulation. Le système s’appuie également sur des étapes de prétraitement et de post-traitement afin d’améliorer la qualité, la modifiabilité et la paramétrisation des scénarios générés @asam_iav_ai_adas.
 #v(0.6em)

Cette approche industrielle confirme plusieurs éléments importants pour notre projet : premièrement, l’utilisation d’un LLM doit être intégrée dans un pipeline contrôlé ; deuxièmement, les standards ASAM facilitent l’interopérabilité entre les outils ; troisièmement, la gestion des scénarios ne se limite pas à leur génération, mais inclut leur organisation, leur paramétrage, leur réutilisation et leur analyse.
 #v(0.6em)

Bien que notre projet ne vise pas directement la génération de fichiers OpenSCENARIO dans sa première version, l’orientation vers des formats standards constitue une perspective importante. À terme, ADAS-R2T pourrait exploiter les cas de test générés pour produire des scénarios compatibles avec des environnements de simulation tels que CARLA ou des toolchains basées sur les standards ASAM.

#intro-subsection[Analyse comparative des travaux étudiés]

Les travaux étudiés présentent des contributions complémentaires. Les approches fondées sur SOTIF et le sampling se concentrent sur la couverture et l’évaluation des suites de scénarios. Les approches comme Txt2Sce et Text2Scenario exploitent les LLMs pour transformer des descriptions textuelles en scénarios exécutables. Les travaux basés sur l’OSINT montrent l’intérêt des sources ouvertes pour extraire des situations réalistes. Enfin, l’approche ASAM/IAV met en évidence l’importance d’un pipeline industriel standardisé, compatible avec les formats ASAM.
#v(0.25cm)
#figure(
  kind: table,
  [
    #set text(
      font: "Times New Roman",
      size: 8.2pt,
    )

    #table(
      columns: (3cm, 4cm, 4cm, 5cm),
      inset: (x: 4pt, y: 5pt),
      stroke: none,
      align: (left, center, center, center),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #text(weight: "bold", fill: ENIADBlue)[Travail]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Objectif principal]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Méthode]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
            #text(weight: "bold", fill: ENIADBlue)[Limites / différence avec ADAS-R2T]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        #text(weight: "bold", fill: ENIADBlue)[Birkemeyer et al.]
      ],
      [
        Générer des suites de scénarios conformes à SOTIF
      ],
      [
        Feature models, sampling, mutation testing
      ],
      [
        Ne traite pas directement les exigences fonctionnelles textuelles ni la génération de cas de test traçables.
      ],

      // Row 2
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Txt2Sce]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Générer des scénarios à partir de rapports d’accidents
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        LLM, OpenSCENARIO, mutation, scenario tree
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Se concentre sur les rapports d’accidents et les scénarios de simulation plutôt que sur les exigences ADAS.
      ],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[OSINT + LLM]
      ],
      [
        Exploiter des sources ouvertes pour construire des scénarios AD/ADAS
      ],
      [
        Web scraping, LLM, OpenSCENARIO XML
      ],
      [
        Dépend fortement de la disponibilité et de la qualité des sources ouvertes.
      ],

      // Row 4
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Text2Scenario]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Convertir des descriptions textuelles en scénarios exécutables
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        LLM parser, référentiel hiérarchique, DSL, CARLA
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Nécessite un référentiel de composants et une validation de faisabilité des scénarios.
      ],

      // Row 5
      [
        #text(weight: "bold", fill: ENIADBlue)[ASAM / IAV]
      ],
      [
        Industrialiser la génération et la gestion de scénarios ADAS
      ],
      [
        LLM, preprocessing, postprocessing, standards ASAM
      ],
      [
        Approche orientée scénario ; ADAS-R2T se concentre d’abord sur requirements-to-tests.
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Comparaison synthétique des travaux connexes liés à la génération de scénarios et de tests ADAS],
) <tab:travaux-connexes>
#intro-subsection[Positionnement du projet ADAS-R2T]

Au regard des travaux précédents, le projet *ADAS-R2T* se positionne à l’intersection de trois axes : l’ingénierie des exigences, la génération automatique de tests et l’orchestration agentique des workflows LLM.

Contrairement aux approches centrées sur la génération de scénarios de simulation à partir de rapports d’accidents ou de descriptions textuelles, notre projet prend comme entrée principale des exigences fonctionnelles ADAS. L’objectif n’est pas uniquement de produire un scénario de conduite, mais de générer des plans de test et des cas de test exploitables par les ingénieurs de validation.
 #v(0.6em)

De plus, ADAS-R2T se distingue par l’intégration d’une architecture multi-agents orchestrée par LangGraph. Cette architecture permet de répartir le processus entre plusieurs agents spécialisés : analyse des exigences, extraction des dimensions fonctionnelles, génération des cas de test, évaluation automatique, correction, mémorisation des feedbacks et validation humaine.
 #v(0.6em)

Le projet se distingue également par l’importance accordée à la traçabilité. Chaque cas de test généré doit rester lié à son exigence source, ce qui facilite l’audit, la maintenance, la couverture fonctionnelle et l’évolution des tests lors des changements de spécifications. Cette dimension est essentielle dans un contexte automobile où les exigences de sécurité, de qualité et de conformité sont particulièrement strictes.
 #v(0.6em)

Enfin, l’intégration du principe *Human-in-the-Loop* permet de conserver l’expert humain au centre du processus. Les résultats générés par l’IA ne sont pas acceptés automatiquement : ils peuvent être validés, rejetés, supprimés ou régénérés en fonction du feedback de l’utilisateur. Ce mécanisme répond aux limites identifiées dans les travaux existants concernant la fiabilité des LLMs, les hallucinations et la nécessité d’un contrôle métier.
 #v(0.6em)

Ainsi, ADAS-R2T ne remplace pas les approches existantes de génération de scénarios, mais les complète. Il propose une couche intelligente de transformation des exigences vers des tests, avec une perspective d’évolution vers l’intégration de formats standards tels qu’OpenSCENARIO et vers l’exploitation de données réelles issues de vidéos de conduite.

// #eniad-warning[
//   Ce chapitre est un *gabarit pédagogique*. Il ne fait *PAS* partie de votre rapport réel.
//   Supprimez-le et remplacez-le par vos chapitres réels.
// ]



// #v(0.8cm)

// #eniad-synthese[
// Ce chapitre a permis de résumer les points essentiels.
// Le chapitre suivant traitera de [annonce].
// ]

#pagebreak()
``


















// #set page(header: report-header, footer: report-footer)
