// #import "../components.typ": *

// #set page(header: [])

// #outline-chapter[État de l'art]

// #chapter-cover_2(
//   "2",
//   "État de l'art",
//   subtitle: "Contexte, objectifs et organisation du mémoire",
// )

// #set page(header: report-header, footer: report-footer)






#import "../components.typ": *

#set page(header: [])

#outline-chapter[État de l'art]

#chapter-cover_2(
  "2",
  "État de l'art",
  subtitle: "Fondements théoriques, patrons architecturaux et technologies",
)
#v(-1cm)
== De l'IA Générative à l'IA Agentique

=== L'IA Générative 

L’intelligence artificielle générative constitue une rupture importante par rapport aux approches classiques de l’IA. Les modèles traditionnels étaient principalement conçus pour accomplir des tâches d’analyse, de classification ou de prédiction, comme reconnaître un objet dans une image ou estimer une valeur à partir de données existantes.
Les modèles génératifs introduisent une logique différente. Au lieu de se limiter à l’identification de catégories ou à la production de résultats prédictifs, ils apprennent les régularités profondes présentes dans les données d’entraînement. Cette capacité leur permet ensuite de générer de nouveaux contenus, qu’il s’agisse de texte, d’images, de code, d’audio ou d’autres formats numériques.
Les grands modèles de langage, tels que *GPT-4, Claude ou Gemini*, représentent l’une des applications les plus visibles de cette évolution. Ils peuvent produire des documents structurés, résumer des textes volumineux, traduire entre plusieurs langues ou encore générer du code informatique. Toutefois, malgré leurs performances, ces modèles restent limités par une logique fondamentalement réactive : ils répondent à une consigne, produisent une sortie, puis interrompent leur action.
Ils ne disposent donc pas, par défaut, d’une capacité d’initiative autonome. Ils ne surveillent pas continuellement les résultats obtenus, ne planifient pas spontanément une suite d’actions et ne corrigent pas leurs erreurs sans nouvelle intervention humaine. Cette limite explique l’émergence progressive des agents intelligents, qui cherchent à dépasser le simple modèle conversationnel pour aller vers des systèmes capables d’observer, décider et agir de manière plus autonome.

=== L'IA Agentique 
#capgemini-history-timeline-clean()
L'IA Agentique représente l'étape suivante : le passage de la _création de contenu_ à l'_exécution d'objectifs_. Un agent IA ne reçoit pas une liste de tâches séquentielles — il reçoit un objectif de haut niveau et conduit autonomement le processus pour l'atteindre.

Cette transition repose sur quatre piliers fondamentaux :

- *L'autonomie :* L’autonomie : l’agent est capable de prendre certaines décisions et d’exécuter des actions sans attendre une instruction humaine à chaque étape. Cette autonomie peut concerner l’exécution des tâches, le choix des actions ou encore l’utilisation d’outils externes. Elle doit cependant rester encadrée par des règles, des autorisations et, lorsque c’est nécessaire, une validation humaine.

- *Goal Oriented : *l’agent travaille à partir d’un objectif persistant. Cet objectif sert de direction principale à toutes ses actions. Par exemple, si l’objectif est de recruter un profil technique, l’agent garde ce but en mémoire et organise ses décisions autour de celui-ci, tout en respectant les contraintes définies comme le budget, les compétences demandées ou les délais.

- *La planification : * l’agent décompose un objectif complexe en étapes plus simples et plus concrètes. Il peut proposer plusieurs plans possibles, comparer leurs avantages et leurs limites, puis sélectionner la stratégie la plus adaptée selon les ressources disponibles, les risques, les coûts et les contraintes de départ.

#set page(header: report-header, footer: report-footer)

- *Le raisonnement : * l’agent ne se limite pas à exécuter des actions. Il analyse les informations, compare les options, interprète les résultats intermédiaires et choisit les décisions les plus pertinentes.

- *L'adaptabilité : * Lorsqu'un événement imprévu survient ou qu'une stratégie ne donne pas les résultats escomptés, l'agent peut adapter son plan. Il peut modifier sa tactique, proposer une alternative ou solliciter une intervention humaine. L'important est de rester fidèle à l'objectif principal, même face à l'évolution de la situation.

- *Context Awareness : * Le système conserve et exploite les informations importantes tout au long du processus. Il prend en compte l'objectif initial, les actions réalisées, les préférences de l'utilisateur, les conditions environnementales, les réactions des outils et les règles à suivre. Cette mémoire contextuelle permet d'éviter les répétitions et de maintenir la cohérence logique entre les différentes étapes.
#v(0.5cm)
#info-box("Distinction fondamentale")[
  L'IA Générative est une *capacité* — la faculté de raisonner et créer. L'IA Agentique est un *comportement* — la capacité d'utiliser cette faculté comme moteur d'exécution. Le LLM n'est pas remplacé : il est _enveloppé_ de mémoire, d'outils et d'un planificateur.
]
#v(0.5cm)
#genai-vs-agentic-radar()

=== Les composants d'un système d'IA Agentique 

Les composants d’un système d’IA agentique
Pour comprendre le fonctionnement d’un agent IA, il faut dépasser l’idée d’un simple modèle de langage qui génère des réponses. Un système agentique repose sur une architecture plus riche, composée de plusieurs éléments qui travaillent ensemble. Chacun joue un rôle précis : comprendre l’objectif, organiser les actions, utiliser les bons outils, conserver le contexte et maintenir le système sous contrôle.\
On peut généralement distinguer cinq composants principaux : *le Brain, l’Orchestrator, les Tools, la Memory et le Supervisor.*

*- Le Brain* :ou cerveau de l’agent, est la partie qui interprète la demande de l’utilisateur. Il transforme une instruction parfois générale ou ambiguë en objectif clair et exploitable. C’est à ce niveau que l’agent commence à comprendre la situation, à analyser les contraintes et à construire une première stratégie.

*- L’Orchestrator* : L’Orchestrator, ou orchestrateur, prend le relais lorsque les    actions doivent être exécutées. Si le Brain définit ce qu’il faut faire, l’Orchestrator organise concrètement la manière de le faire.
Il commence par structurer l’ordre des tâches. Il détermine quelle action doit être lancée en premier, laquelle doit suivre, et comment le processus doit évoluer. Dans un système agentique, cette organisation est essentielle, car une tâche complexe ne se réalise presque jamais en une seule étape.

*- Les Tools* : ou outils, donnent à l’agent la possibilité de dépasser le simple échange conversationnel. Grâce à eux, il ne se contente plus de produire des réponses : il peut interagir avec son environnement et exécuter des actions concrètes.

*- La Memory* : ou mémoire, permet à l’agent de garder le fil au fil des interactions. Sans mémoire, chaque échange serait traité comme un événement isolé. Avec elle, l’agent peut suivre une tâche dans le temps et conserver les informations importantes.
On distingue généralement deux types de mémoire: 
 - La mémoire à court terme conserve le contexte immédiat : les derniers messages, les décisions récentes, les résultats des appels aux outils et l’état actuel de la tâche. Elle aide l’agent à rester cohérent pendant une session.
 - La mémoire à long terme conserve des informations plus durables : les préférences de l’utilisateur, les objectifs récurrents, les décisions importantes ou certaines données issues d’interactions précédentes. Elle permet à l’agent de personnaliser davantage ses actions et d’éviter de redemander des informations déjà connues.

*- Le Supervisor* : Le Supervisor, ou superviseur, encadre le comportement de l’agent. Son rôle est indispensable, car un agent autonome ne doit pas pouvoir agir librement dans toutes les situations.
Le superviseur intervient notamment à travers les mécanismes de validation humaine, souvent appelés Human-in-the-Loop. Certaines actions peuvent être préparées automatiquement, mais nécessitent une approbation avant d’être exécutées. Par exemple, un agent peut rédiger une offre ou préparer un e-mail, mais ne pas l’envoyer sans validation humaine.
== Patrons architecturaux des systèmes agentiques
=== Quand utiliser des agents AI et LLM Workflows

La littérature distingue deux grandes familles d'architectures au sein des systèmes agentiques :
 
- *Workflows:* sont des systèmes où les grands modèles de langage (LLM) et les outils sont contrôlés par du code prédéfini. 
- *AI agents:* Le terme “agent” a plusieurs définitions. Certains clients définissent un agent comme un système autonome qui fonctionne seul pendant longtemps et utilise différents outils pour effectuer des tâches complexes. D'autres utilisent ce terme pour décrire des systèmes plus stricts qui suivent des processus prédéfinis. D'aprés Anthropic, nous considérons toutes ces variations comme des systèmes basés sur des agents, mais nous faisons une distinction importante entre les flux de travail et les agents. 

--Lorsque vous développez des applications avec des LLM, nous recommandons de choisir la solution la plus simple possible et d'ajouter de la complexité uniquement si cela est nécessaire. Parfois, il n'est pas nécessaire de développer des systèmes basés sur des agents. Les systèmes multi-agents donnent souvent la priorité à l'efficacité des tâches plutôt qu'à la latence et au coût, il est donc important d'évaluer si ce compromis en vaut la peine.

--Lorsque la complexité est nécessaire, les flux de travail offrent prévisibilité et cohérence pour les tâches bien définies, tandis que les agents sont meilleurs lorsque la flexibilité et la prise de décision basée sur un modèle sont nécessaires à grande échelle. Cependant, pour de nombreuses applications, optimiser les appels LLM individuels avec récupération et exemples contextuels est souvent suffisant.
=== Modèles de conception d'agents d'IA et LLM Workflows
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
=== Agents autonomes

Là où les workflows sont des scripts, les agents autonomes sont des explorateurs. Ils opèrent via une boucle d'action-observation : à chaque étape, l'agent entreprend une action, observe le résultat de l'environnement (la _vérité terrain_), et ajuste son plan en conséquence.

Le cycle de vie d'un agent comprend : instruction → planification → action → feedback → itération → point de contrôle humain → terminaison. L'autonomie des agents implique cependant des coûts plus élevés et un risque d'erreurs composées, où une erreur précoce se propage à travers toute la chaîne.

=== Choix architectural pour ADAS-R2T

Pour notre projet, nous avons opté pour une approche hybride : un *flux de travail structuré* combinant quatre des cinq patrons (routage, parallélisation, orchestrateur-travailleurs, évaluateur-optimiseur). Ce choix offre la prévisibilité d'un workflow avec la puissance d'exécution d'un système agentique. Le chaînage simple a été écarté car le pipeline nécessite des branchements conditionnels et du parallélisme.

#figure(
  table(
    columns: (auto, 1fr, auto),
    inset: 8pt,
    stroke: 0.5pt + rgb("#D1D5DB"),
    fill: (x, y) => if y == 0 { rgb("#4A148C") } else if calc.odd(y) { rgb("#F8FAFC") } else { white },
    align: (center, left, center),
    table.header(
      text(fill: white, weight: "bold")[Patron],
      text(fill: white, weight: "bold")[Application dans ADAS-R2T],
      text(fill: white, weight: "bold")[Retenu],
    ),
    [Chaînage], [Pipeline partiellement linéaire (ingest → extract)], [Partiel],
    [Routage], [Route chaque exigence vers les analyseurs pertinents], [✓],
    [Parallélisation], [5 analyseurs simultanés + N workers simultanés], [✓],
    [Orchestrateur-Workers], [Coverage planner → workers de génération], [✓],
    [Évaluateur-Optimiseur], [Evaluator → retry vers le planner], [✓],
  ),
  caption: [Correspondance entre les patrons architecturaux et leur usage dans ADAS-R2T.],
) <tab:patterns>

== LangGraph : framework d'orchestration
=== Pourquoi LangGraph

LangGraph est un framework Python développé par LangChain Inc., conçu spécifiquement pour construire des applications multi-agents avec état. Il se distingue des approches purement agentiques (comme AutoGPT) par sa philosophie de _contrôle explicite_ : le développeur définit le graphe d'exécution, les transitions conditionnelles et les points de synchronisation, tout en laissant les LLM prendre les décisions sémantiques au sein de chaque nœud.

Les caractéristiques clés de LangGraph qui ont motivé notre choix sont :

- *Graphe d'état typé* — le `StateGraph` utilise un `TypedDict` Python qui définit formellement toutes les données partagées entre les nœuds, avec des réducteurs (_reducers_) pour gérer les écritures concurrentes.

- *Fan-out / Fan-in natif* — le mécanisme `Send()` permet de dispatcher dynamiquement des tâches vers N instances parallèles d'un même nœud, avec synchronisation automatique avant le nœud suivant.

- *Edges conditionnels* — les transitions entre nœuds peuvent être conditionnelles, permettant le routage dynamique et les boucles de retry.

- *Compatibilité LangChain* — intégration native avec les abstractions LangChain (ChatModels, structured output, tools), facilitant le changement de fournisseur LLM.

=== Concepts fondamentaux

Un graphe LangGraph se compose de trois éléments : les *nœuds* (fonctions async qui lisent et écrivent dans l'état partagé), les *arêtes* (transitions entre nœuds, linéaires ou conditionnelles) et l'*état* (un TypedDict partagé qui accumule les résultats au fil de l'exécution).

Le concept de _reducer_ est particulièrement important pour les systèmes parallèles : lorsque plusieurs nœuds écrivent simultanément dans le même champ (par exemple, plusieurs workers ajoutant des cas de test), le reducer (typiquement `operator.add` pour les listes) fusionne les résultats sans conflit.

== Ingénierie des prompts et du contexte

=== Du prompt engineering au context engineering

L'ingénierie des prompts traditionnelle consiste à formuler des instructions claires pour le LLM. L'ingénierie du contexte va plus loin : elle conçoit l'_environnement complet_ dans lequel le LLM opère — rôle, connaissances, contraintes, format de sortie.

Pour ce projet, nous avons adopté le framework * (MISBAH)*, un cadre méthodologique en cinq étapes pour la construction de contextes LLM de haute qualité :

+ * Le Principe* — alignement de l'intention : définir l'objectif stratégique unique que le modèle doit poursuivre, élevant la qualité de « statistiquement probable » à « stratégiquement ciblé ».

+ *La Formulation* — amorçage comportemental (_behavioral priming_) : activer les réseaux neuronaux du modèle associés à un profil d'expert spécifique, reproduisant non seulement ses connaissances mais son mode de raisonnement.

+ *Le Protocole* — raisonnement structuré (_chain-of-thought_) : imposer des étapes analytiques strictes et séquentielles pour réduire les erreurs logiques et améliorer la cohérence.

+ *Les Standards* — guidage négatif : spécifier explicitement les comportements interdits, éliminant des catégories entières de sorties faibles.

+ *Le Résultat* — format de sortie : définir la structure exacte attendue pour garantir des résultats cohérents et exploitables par le code.

L'application de ce framework aux prompts du projet a démontré des améliorations significatives, notamment la réduction des descriptions vides de 52\% à 0\% et l'élimination complète des erreurs de formatage.

== Travaux connexes

=== Génération automatique de tests

La génération automatique de cas de test est un domaine de recherche actif. Les approches traditionnelles reposent sur des techniques formelles (model-based testing, tables de décision) ou sur l'analyse de code source (test unitaire automatisé). L'application des LLM à ce domaine est plus récente et ouvre de nouvelles possibilités, notamment pour les spécifications en langage naturel.

=== Validation ADAS et normes

La validation des systèmes ADAS s'inscrit dans un cadre normatif strict, notamment la norme ISO 26262 qui définit les niveaux d'intégrité de sécurité automobile (ASIL). La génération automatisée de tests doit respecter les exigences de traçabilité et de couverture imposées par ces normes.

=== Positionnement du projet

Notre travail se distingue des approches existantes par la combinaison de trois aspects rarement réunis : l'utilisation d'une architecture agentique multi-nœuds (et non un simple prompt unique), l'analyse multidimensionnelle des exigences (cinq dimensions en parallèle) et l'enrichissement par vidéo de conduite réelle.
