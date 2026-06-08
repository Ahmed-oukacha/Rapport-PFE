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

=== L'IA Générative : capacité de création

L'IA Générative représente un changement de paradigme par rapport à l'IA traditionnelle. Là où les modèles classiques se limitaient à la classification ou la régression — identifier si une image contient un chat —, les modèles génératifs apprennent la _distribution sous-jacente_ des données et peuvent créer du contenu entièrement nouveau : texte, images, code, audio.

Les grands modèles de langage (LLM) comme GPT-4, Claude ou Gemini incarnent cette révolution. Ils sont capables de rédiger des documents, résumer des textes, traduire et générer du code. Cependant, leur mode de fonctionnement reste fondamentalement _réactif_ : le modèle attend un prompt, produit une réponse, et s'arrête. Il ne prend jamais l'initiative, ne surveille pas les résultats et ne corrige pas ses erreurs.
#genai-vs-agentic-radar()

=== L'IA Agentique : capacité d'exécution

L'IA Agentique représente l'étape suivante : le passage de la _création de contenu_ à l'_exécution d'objectifs_. Un agent IA ne reçoit pas une liste de tâches séquentielles — il reçoit un objectif de haut niveau et conduit autonomement le processus pour l'atteindre.

Cette transition repose sur quatre piliers fondamentaux :

+ *Proactivité* — l'agent prend l'initiative plutôt que d'attendre passivement une commande. Si un processus stagne, il identifie le problème et propose une solution.

+ *Planification* — l'agent décompose un objectif complexe en étapes exécutables, en adaptant dynamiquement son plan en fonction des résultats intermédiaires.

+ *Conscience du contexte (mémoire)* — l'agent maintient un état persistant à travers les étapes, se souvenant des actions passées et des objectifs à long terme.

+ *Adaptabilité* — lorsqu'une stratégie échoue, l'agent identifie l'échec et emprunte un chemin alternatif.

#info-box("Distinction fondamentale")[
  L'IA Générative est une *capacité* — la faculté de raisonner et créer. L'IA Agentique est un *comportement* — la capacité d'utiliser cette faculté comme moteur d'exécution. Le LLM n'est pas remplacé : il est _enveloppé_ de mémoire, d'outils et d'un planificateur.
]

=== Le LLM Augmenté : unité de base

Avant de construire des systèmes complexes, il faut comprendre l'unité atomique : le LLM Augmenté. Un LLM brut est un processeur de texte sophistiqué. Augmenté de trois capacités, il devient un participant actif dans un environnement numérique :

- *Récupération (Retrieval)* — capacité d'ingérer du contexte depuis des documents externes ou des bases de données, via des techniques comme le RAG (Retrieval-Augmented Generation).

- *Outils (Tools)* — interface permettant au modèle d'interagir avec des logiciels : calculatrices, moteurs de recherche, interpréteurs de code, API externes.

- *Mémoire (Memory)* — mécanisme de rétention de l'état entre les tours de conversation, maintenant le contexte à long terme.

== Patrons architecturaux des systèmes agentiques

La littérature distingue deux grandes familles d'architectures au sein des systèmes agentiques : les _flux de travail structurés_ (Workflows) et les _agents autonomes_. Cette distinction est fondamentale pour le choix architectural.

=== Flux de travail structurés

Dans les workflows, les LLM et les outils sont orchestrés via des *chemins de code prédéfinis*. Le système suit une trajectoire prévisible et établie. Cinq patrons majeurs ont été identifiés :

*Chaînage de prompts (_Prompt Chaining_).* Décomposition d'une tâche en séquence linéaire d'étapes, où la sortie d'un appel devient l'entrée du suivant. L'architecte échange intentionnellement la latence contre la précision en réduisant la portée de chaque appel.

*Routage (_Routing_).* Classification de l'entrée et orientation vers une tâche ou un modèle spécialisé. Ce patron garantit la séparation des préoccupations et permet d'utiliser des modèles de complexité différente selon les besoins.

*Parallélisation (_Parallelization_).* Traitement simultané de plusieurs aspects d'un problème, selon deux modèles : le _sectionnement_ (chaque branche traite un aspect différent) et le _vote_ (plusieurs branches traitent la même entrée pour fiabiliser le résultat).

*Orchestrateur-Travailleurs (_Orchestrator-Workers_).* Un LLM principal décompose dynamiquement une tâche complexe, délègue les sous-tâches à des LLM travailleurs et synthétise leurs résultats. Contrairement à la parallélisation, les sous-tâches ne sont pas prédéfinies — elles sont déterminées à la volée.

*Évaluateur-Optimiseur (_Evaluator-Optimizer_).* Création d'une boucle de rétroaction où un LLM génère un résultat et un autre le critique pour l'affiner. Ce patron convient lorsqu'il existe des critères d'évaluation clairs.

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

Pour ce projet, nous avons adopté le framework *مِصْبَاح (MISBAH)*, un cadre méthodologique en cinq étapes pour la construction de contextes LLM de haute qualité :

+ *م — المبدأ (Le Principe)* — alignement de l'intention : définir l'objectif stratégique unique que le modèle doit poursuivre, élevant la qualité de « statistiquement probable » à « stratégiquement ciblé ».

+ *ص — الصياغة (La Formulation)* — amorçage comportemental (_behavioral priming_) : activer les réseaux neuronaux du modèle associés à un profil d'expert spécifique, reproduisant non seulement ses connaissances mais son mode de raisonnement.

+ *ب — البروتوكول (Le Protocole)* — raisonnement structuré (_chain-of-thought_) : imposer des étapes analytiques strictes et séquentielles pour réduire les erreurs logiques et améliorer la cohérence.

+ *أ — الأصول (Les Standards)* — guidage négatif : spécifier explicitement les comportements interdits, éliminant des catégories entières de sorties faibles.

+ *ح — الحصيلة (Le Résultat)* — format de sortie : définir la structure exacte attendue pour garantir des résultats cohérents et exploitables par le code.

L'application de ce framework aux prompts du projet a démontré des améliorations significatives, notamment la réduction des descriptions vides de 52\% à 0\% et l'élimination complète des erreurs de formatage.

== Travaux connexes

=== Génération automatique de tests

La génération automatique de cas de test est un domaine de recherche actif. Les approches traditionnelles reposent sur des techniques formelles (model-based testing, tables de décision) ou sur l'analyse de code source (test unitaire automatisé). L'application des LLM à ce domaine est plus récente et ouvre de nouvelles possibilités, notamment pour les spécifications en langage naturel.

=== Validation ADAS et normes

La validation des systèmes ADAS s'inscrit dans un cadre normatif strict, notamment la norme ISO 26262 qui définit les niveaux d'intégrité de sécurité automobile (ASIL). La génération automatisée de tests doit respecter les exigences de traçabilité et de couverture imposées par ces normes.

=== Positionnement du projet

Notre travail se distingue des approches existantes par la combinaison de trois aspects rarement réunis : l'utilisation d'une architecture agentique multi-nœuds (et non un simple prompt unique), l'analyse multidimensionnelle des exigences (cinq dimensions en parallèle) et l'enrichissement par vidéo de conduite réelle.
