// #import "../components.typ": *

// #eniad-chapter(
//   "3",
//   [Architecture Générale du Projet]
// )


// #import "../components.typ": *
// #import "@preview/cetz:0.5.2"
// #import "../components.typ": *
// #set page(
// )

// #set text(
//   font: "Times New Roman",
//   size: 12pt,
// )
// #set par(
//   justify: true,
//   leading: 1.15em,
  
// )

// // =====================================================
// // Style du titre principal
// // =====================================================

// #show heading.where(level: 1): it => [
//   #v(-3cm)

//   #text(
//     font: "Times New Roman",
//     size: 24pt,
//     weight: "bold",
//     fill: ENIADBlue,
//   )[
//     #it.body
//   ]

//   #v(0cm)

//   #line(
//     length: 100%,
//     stroke: 1.4pt + ENIADOrange,
//   )

//   #v(0.1cm)
// ]

// // =====================================================
// // Compteurs dynamiques pour l'introduction
// // Sections : 0.1, 0.2, 0.3 ...
// // Sous-sections : 0.1.1, 0.1.2 ...
// // =====================================================

// #let intro-section-counter = counter("intro-section")
// #let intro-subsection-counter = counter("intro-subsection")

// #intro-section-counter.update(0)
// #intro-subsection-counter.update(0)

// #let intro-section(title) = [
//   #intro-section-counter.step()
//   #intro-subsection-counter.update(0)

//   #context {
//     let chapter = counter(heading).get().first() // chapitre
//     let section = intro-section-counter.get().first()

//     [
//       #hide[
//         #heading(
//           level: 2,
//           numbering: none,
//           outlined: true,
//         )[ #chapter.#section #title ]
//       ]

//       #v(0.1cm)

//       #text(
//         size: 17pt,
//         weight: "bold",
//         fill: ENIADBlue,
//       )[
//         #chapter.#section #h(0.6cm) #title
//       ]

//       #v(0.35cm)

//       #line(
//         length: 100%,
//         stroke: 0.6pt + ENIADBlue.lighten(65%),
//       )

//       #v(0cm)
//     ]
//   }
// ]
// #let intro-subsection(title) = [
//   #intro-subsection-counter.step()

//   #context {
//     let chapter = counter(heading).get().first()
//     let section = intro-section-counter.get().first()
//     let subsection = intro-subsection-counter.get().first()

//     [
//       #hide[
//         #heading(
//           level: 3,
//           numbering: none,
//           outlined: true,
//         )[ #chapter.#section.#subsection #title ]
//       ]

//       #v(0.2cm)

//       #text(
//         size: 13pt,
//         weight: "bold",
//       )[
//         #chapter.#section.#subsection #h(0.45cm) #title
//       ]

//       #v(0.2cm)
//     ]
//   }
// ]
// ``
// Ce chapitre presente l'architecture du systeme ADAS-R2T selon une approche descendante : nous partons d'une vue macroscopique du pipeline, puis nous detaillons progressivement chaque couche technique jusqu'aux mecanismes internes du graphe agentique.

// #intro-section[Vue d'ensemble]
// Le systeme ADAS-R2T repose sur un principe simple : transformer des entrees metier (exigences fonctionnelles, videos de conduite) en sorties exploitables (cas de test structures, scenarios de validation). Entre ces deux extremites, un pipeline intelligent orchestre le travail de dix-neuf nodes specialises.

// #intro-subsection[ Flux global]
// A son niveau le plus abstrait, le systeme fonctionne comme une chaine de transformation en trois temps :

// - *Entree* : l'utilisateur fournit un fichier Excel contenant les exigences fonctionnelles ADAS (et eventuellement une video de conduite reelle).
// - *Traitement* : le pipeline agentique analyse, planifie, genere et evalue les cas de test de maniere autonome.
// - *Sortie* : un fichier Excel structure contenant les cas de test prets a etre executes par l'equipe de validation.
// #adas-r2t-pipeline-stages()


// #v(1cm)
// Ce flux, en apparence lineaire, cache en realite une mecanique bien plus riche. Le pipeline ne se contente pas de « traduire » des exigences en tests : il analyse chaque exigence sous plusieurs angles, planifie la couverture de test, genere les cas en parallele, les evalue automatiquement, puis les soumet a l'utilisateur pour validation avant de produire le livrable final.
// #intro-subsection[ Les quatre etapes du pipeline]
// Le traitement interne se decompose en quatre grandes etapes, chacune correspondant a un ensemble des noeuds dans le graphe agentique :
// #adas-r2t-pipeline-stages_1()
// #v(1cm)
// *Etape 1 : Extraction des entrees.* Le systeme ingere le fichier Excel, identifie la structure du document (en-tetes, colonnes, flow table), et extrait les exigences fonctionnelles sous une forme structuree exploitable par les etapes suivantes.

// *Etape 2 : Analyse semantique.* Chaque exigence est soumise a cinq analyseurs specialises fonctionnant en parallele : transitions d'etats, contraintes temporelles, interactions homme-machine, logique de calcul, et analyse generique. Cette analyse multi-dimensionnelle permet de capturer la richesse semantique de chaque exigence.

// *Etape 3 : Generation des cas de test.* Un planificateur determine la strategie de couverture pour chaque exigence (cas nominaux, limites, negatifs, rares), puis des workers paralleles generent les cas de test correspondants. Un synthetiseur elimine ensuite les doublons et consolide les resultats.

// *Etape 4 : Evaluation et sortie.* Chaque cas de test genere est evalue automatiquement (detection de contradictions, verification du perimetre, coherence des valeurs). Les resultats sont ensuite soumis a une revue humaine avant *HITL* d'etre exportes au format Excel.
// #intro-subsection[Les trois modes d'entree]

// Le systeme supporte trois modes de fonctionnement, offrant une flexibilite adaptee a differents contextes d'utilisation :

// #figure(
//   block[
//     #set text(
//       font: "Times New Roman",
//       size: 10pt,
//     )

//     #table(
//       columns: (3.5cm, 6.2cm, 6.4cm),
//       inset: (x: 5pt, y: 6pt),
//       stroke: none,
//       align: (center, left, left),

//       // Top rule
//       table.hline(stroke: 0.8pt + black),

//       // Header
//       table.header(
//         table.cell(fill: rgb("#DCE6F1"))[
//           #align(center)[
//             #text(weight: "bold", fill: ENIADBlue)[Mode]
//           ]
//         ],
//         table.cell(fill: rgb("#DCE6F1"))[
//           #align(center)[
//             #text(weight: "bold", fill: ENIADBlue)[Entrées]
//           ]
//         ],
//         table.cell(fill: rgb("#DCE6F1"))[
//           #align(center)[
//             #text(weight: "bold", fill: ENIADBlue)[Sorties]
//           ]
//         ],
//       ),

//       // Mid rule
//       table.hline(stroke: 0.45pt + black),

//       // Row 1
//       [
//         #text(weight: "bold", fill: ENIADBlue)[Excel seule]
//       ],
//       [
//         Fichier d’exigences fonctionnelles
//       ],
//       [
//         Cas de test structurés
//       ],

//       // Row 2 - Zebra
//       table.cell(fill: rgb("#F3F8FC"))[
//         #text(weight: "bold", fill: ENIADBlue)[Vidéo seule]
//       ],
//       table.cell(fill: rgb("#F3F8FC"))[
//         Vidéo de conduite réelle
//       ],
//       table.cell(fill: rgb("#F3F8FC"))[
//         Scénarios de test avec raisonnement causal
//       ],

//       // Row 3
//       [
//         #text(weight: "bold", fill: ENIADBlue)[Excel + Vidéo]
//       ],
//       [
//         Exigences + vidéo
//       ],
//       [
//         Cas de test enrichis par les scénarios vidéo
//       ],

//       // Bottom rule
//       table.hline(stroke: 0.8pt + black),
//     )
//   ],
//   caption: [Modes d’entrée et sorties générées par ADAS-R2T],
//   kind: table,
// ) <tab:modes-entrees-sorties>
// - Le mode _Excel seul_ constitue le cas d'usage principal : l'equipe de validation dispose d'un document d'exigences et souhaite generer les cas de test correspondants. 

// - Le mode _Video seul_ permet d'exploiter des videos de conduite reelle pour en extraire des scenarios de test bases sur un raisonnement causal (cause, effet, consequence).

// - Le mode _Excel + Video_ combine les deux approches : les cas de test generes a partir des exigences sont enrichis par les observations extraites de la video.

// Cette distinction entre modes se materialise au niveau du graphe par un routage conditionnel des le premier noeud, orientant le flux de traitement vers les branches appropriees.
// #intro-section[Architecture technique globale]
// Le systeme ADAS-R2T s'articule autour d'un noyau central _le pipeline d'orchestration _qui coordonne l'ensemble des composants techniques. Chaque composant remplit un role precis et communique avec le pipeline via des interfaces bien definies.
// #intro-subsection[Vue des composants]
// #agentic-ai-architecture-diagram()
// Le schema ci-dessus fait apparaitre huit composants principaux, organises autour du pipeline d'orchestration. Nous les decrivons ci-dessous en suivant le flux d'une requete typique.
// #intro-subsection[Pipeline d'orchestration (LangGraph)]
// Le coeur du systeme est un graphe d'execution construit avec LangGraph, le framework d'orchestration d'agents de LangChain. Ce graphe definit l'enchainement des dix-neuf noeuds de traitement, gere le parallelisme, et assure la persistance de l'etat entre les etapes. C'est lui qui decide quel noeud s'execute, dans quel ordre, et comment les resultats circulent d'un agent a l'autre.

// Le choix de LangGraph, plutot qu'un enchainement sequentiel de prompts, permet de beneficier de mecanismes avances : execution parallele via `Send()`, interruptions pour la revue humaine, retour arrière (Time Travel) sans perte de contexte, et reprise automatique apres une panne.

// #intro-subsection[Modeles de langage ]

// Lors de la conception du système, une question pratique importante s'est posée : et si demain nous souhaitions utiliser un modèle de langage d'une autre entreprise que celle de départ ? Devrions-nous réécrire de larges pans du code ? C'était un véritable problème, car chaque fournisseur de services avait sa propre méthode de communication.
// Le problème : Traiter séparément avec chaque fournisseur aurait rendu le code complexe et difficile à maintenir. Chaque simple modification aurait nécessité des modifications à plusieurs endroits, un véritable cauchemar pour tout programmeur.
// La solution astucieuse : La solution a consisté à implémenter une astuce de programmation élégante appelée « Factory Pattern ». L'idée est simple et efficace : au lieu de communiquer directement avec OpenAI ou Cohere, les composants système communiquent avec un seul intermédiaire, la LLMProviderFactory. Cet intermédiaire est seul responsable de la communication avec chaque fournisseur. Grâce à un simple paramètre dans le fichier de configuration, cette « fabrique » génère l'expert approprié et le met à contribution.
// L'avantage immédiat : changer de modèle d'IA est devenu aussi simple que de changer de chaîne de télévision. Si nous souhaitons ajouter un nouveau modèle ultérieurement, il nous suffit d'apprendre à l'« usine » comment communiquer avec lui, sans toucher au reste du système. C'est une solution simple et claire qui rend le système robuste et facile à développer.


// Cette dualite n'est pas figee : chaque noeud du pipeline peut etre configure independamment pour utiliser l'un ou l'autre fournisseur, via les variables d'environnement. Cette flexibilite permet d'adapter le choix du modele au rapport cout-performance de chaque tache. Le mecanisme de retry avec backoff exponentiel (via Tenacity) assure la robustesse face aux erreurs transitoires des API externes.

// #intro-subsection[Ingenierie des prompts]

// Les instructions envoyees aux modeles de langage ne sont pas codees en dur dans le code source. Chaque noeud charge son prompt depuis un fichier Markdown dedie, stocke dans un repertoire centralise. Cette separation entre logique de traitement et contenu des prompts facilite l'iteration rapide : un ingenieur peut modifier un prompt sans toucher au code Python, et chaque modification est tracable dans l'historique Git.

// Les prompts s'appuient sur les principes du framework MISBAH, qui structure les instructions en sections claires : contexte metier, format de sortie attendu, exemples, et contraintes a respecter.

// #intro-subsection[Memoire et persistance (PostgreSQL)]

// Le systeme exploite PostgreSQL pour deux fonctions distinctes de memoire :

// La *memoire de session* (courte duree) est assuree par le checkpointer de LangGraph. A chaque etape du pipeline, l'etat complet est sauvegarde dans PostgreSQL sous forme de checkpoint chiffre (AES). Ce mecanisme rend possible l'interruption pour revue humaine, le retour arriere (Time Travel), et la reprise apres panne sans perte de travail.

// La *memoire a long terme* (cross-session) stocke les connaissances acquises au fil des utilisations. Elle se decline en trois portees : semantique applicative (regles partagees par tous les utilisateurs), semantique utilisateur (preferences individuelles), et episodique (historique des revues). La recherche dans cette memoire s'appuie sur des embeddings vectoriels (pgvector) pour retrouver les connaissances pertinentes par similarite semantique.

// #intro-subsection[Observabilite (Langfuse, Prometheus, Grafana)]

// L'observabilite du systeme repose sur trois piliers complementaires :

// *Langfuse* capture chaque appel LLM avec ses parametres, sa duree, ses tokens consommes et sa reponse. Ce tracage fin permet d'identifier les prompts sous-performants, de mesurer les couts, et de debugger les cas de generation insatisfaisants.

// *Prometheus* collecte les metriques operationnelles du systeme : nombre de pipelines executes, duree par noeud, taux d'erreur, decisions HITL, et operations memoire. Ces metriques sont exposees via un endpoint `/metrics` au format standard.

// *Grafana* consomme les metriques de Prometheus et les presente sous forme de tableaux de bord visuels. Un dashboard dedie "ADAS-R2T Pipeline Monitor" offre une vue en temps reel sur la sante et les performances du systeme.

// Le logging structure, assure par structlog, complete ce dispositif en produisant des logs au format JSON exploitables par des outils d'analyse.

// #intro-subsection[Validation et evaluation]

// Le module d'evaluation constitue le gardien de la qualite du systeme. 


// #intro-subsection[Choix techniques et justifications]


// #figure(
//   block[
//     #set text(
//       font: "Times New Roman",
//       size: 8.6pt,
//     )

//     #table(
//       columns: (3.1cm, 3.4cm, 9.7cm),
//       inset: (x: 5pt, y: 6pt),
//       stroke: none,
//       align: (left, left, left),

//       // Top rule
//       table.hline(stroke: 0.8pt + black),

//       // Header
//       table.header(
//         table.cell(fill: rgb("#DCE6F1"))[
//           #align(center)[
//             #text(weight: "bold", fill: ENIADBlue)[Composant]
//           ]
//         ],
//         table.cell(fill: rgb("#DCE6F1"))[
//           #align(center)[
//             #text(weight: "bold", fill: ENIADBlue)[Technologie]
//           ]
//         ],
//         table.cell(fill: rgb("#DCE6F1"))[
//           #align(center)[
//             #text(weight: "bold", fill: ENIADBlue)[Justification]
//           ]
//         ],
//       ),

//       // Mid rule
//       table.hline(stroke: 0.45pt + black),

//       // Row 1
//       [
//         #text(weight: "bold", fill: ENIADBlue)[Orchestration]
//       ],
//       [
//         LangGraph
//       ],
//       [
//         Graphe d’agents avec parallélisme, interruptions et persistance native
//       ],

//       // Row 2 - Zebra
//       table.cell(fill: rgb("#F3F8FC"))[
//         #text(weight: "bold", fill: ENIADBlue)[API]
//       ],
//       table.cell(fill: rgb("#F3F8FC"))[
//         FastAPI
//       ],
//       table.cell(fill: rgb("#F3F8FC"))[
//         Performance async, documentation automatique, écosystème Python
//       ],

//       // Row 3
//       [
//         #text(weight: "bold", fill: ENIADBlue)[Base de données]
//       ],
//       [
//         PostgreSQL + pgvector
//       ],
//       [
//         Robustesse, support vectoriel pour la recherche sémantique
//       ],

//       // Row 4 - Zebra
//       table.cell(fill: rgb("#F3F8FC"))[
//         #text(weight: "bold", fill: ENIADBlue)[Monitoring]
//       ],
//       table.cell(fill: rgb("#F3F8FC"))[
//         Prometheus + Grafana
//       ],
//       table.cell(fill: rgb("#F3F8FC"))[
//         Standard industriel, dashboards personnalisables
//       ],

//       // Row 5
//       [
//         #text(weight: "bold", fill: ENIADBlue)[LLM tracing]
//       ],
//       [
//         Langfuse
//       ],
//       [
//         Spécialisé LLMOps, open source, intégré LangChain
//       ],

//       // Row 6 - Zebra
//       table.cell(fill: rgb("#F3F8FC"))[
//         #text(weight: "bold", fill: ENIADBlue)[Logging]
//       ],
//       table.cell(fill: rgb("#F3F8FC"))[
//         structlog
//       ],
//       table.cell(fill: rgb("#F3F8FC"))[
//         Logs structurés JSON, décorateurs de nœud
//       ],

//       // Row 7
//       [
//         #text(weight: "bold", fill: ENIADBlue)[Conteneurisation]
//       ],
//       [
//         Docker Compose
//       ],
//       [
//         Déploiement reproductible, isolation des services
//       ],

//       // Row 8 - Zebra
//       table.cell(fill: rgb("#F3F8FC"))[
//         #text(weight: "bold", fill: ENIADBlue)[Sécurité]
//       ],
//       table.cell(fill: rgb("#F3F8FC"))[
//         JWT + API Key + AES
//       ],
//       table.cell(fill: rgb("#F3F8FC"))[
//         Authentification double, chiffrement au repos
//       ],

//       // Bottom rule
//       table.hline(stroke: 0.8pt + black),
//     )
//   ],
//   caption: [Choix technologiques retenus pour l’architecture ADAS-R2T],
//   kind: table,
// ) <tab:choix-technologiques>
// ``
// #intro-section[Architecture du graphe agentique]
// Le pipeline de traitement constitue le coeur technique du systeme. Il prend la forme d'un graphe oriente, construit avec LangGraph, ou chaque noeud represente un agent specialise dans une tache precise. Ce graphe ne se parcourt pas de maniere lineaire : selon le mode d'entree choisi, certaines branches s'activent et d'autres sont ignorees. Des mecanismes de parallelisme, de boucle, et d'interruption viennent enrichir ce parcours.
// #intro-subsection[ Vue d'ensemble du graphe]
// #pipeline-routing-modes-diagram()
// Le graphe opere a l'interieur de trois niveaux d'encapsulation, visibles sur la figure ci-dessus :
// - Le *scope session* englobe l'execution d'un pipeline unique. C'est a ce niveau que le checkpointer sauvegarde l'etat a chaque etape, rendant possibles l'interruption et la reprise.
// - Le *scope utilisateur* regroupe l'ensemble des sessions d'un meme utilisateur. La memoire semantique et episodique de l'utilisateur persiste a ce niveau.
// - Le *scope application* couvre l'ensemble du systeme. Les regles de qualite apprises et partagees par tous les utilisateurs sont stockees a ce niveau.
// #intro-subsection[ Agent 1 : Extraction des entrées ]


// La premiere etape gere l'ingestion des fichiers fournis par l'utilisateur. Selon le mode d'entree, le graphe active l'une ou plusieurs des branches suivantes :

// - *ingest excel* - Ce noeud prend en charge la lecture du fichier Excel. Il identifie la structure du document (en-tetes, colonnes des donnees, flow table), extrait un apercu des premieres lignes, et prepare les donnees brutes pour l'etape suivante. Ce noeud ne fait pas appel au LLM : son traitement est entierement deterministe, base sur la bibliotheque openpyxl.

// - *extract and structure* - A partir des donnees brutes, ce noeud fait appel au LLM pour transformer le contenu des cellules en exigences structurees. Chaque exigence se voit attribuer un identifiant unique, un texte normalise, et des metadonnees (variables, conditions, seuils). C'est ici que le passage du langage naturel a une representation exploitable s'opere.

// #excel-branch-ingestion-graph()
// #intro-subsection[ Agent Video  : analyse et mutations ]

// Lorsque l'utilisateur fournit une video de conduite, une branche parallele s'active. Elle se compose de quatre noeuds :

// - * analyze video* : Ce noeud extrait les frames cles de la video a intervalles reguliers, puis applique un algorithme de detection de changement de scene (base sur la difference de pixels entre frames consecutives) pour ne retenir que les moments significatifs. Le resultat est un ensemble de frames cles accompagnees de leurs timestamps.

// - * video frame analyzer* : Chaque frame cle est analysee individuellement par un LLM multimodal (Gemini 2.5 Flash). L'analyse produit pour chaque frame : une description de la scene, la vitesse estimee du vehicule ego, les objets detectes (vehicules, pietons, panneaux), les conditions environnementales, et l'action en cours du vehicule. Les frames sont analysees en parallele grace a un semaphore qui controle la concurrence.

// - * video scenario builder* : A partir des analyses de frames, ce noeud reconstruit des scenarios complets en etablissant des chaines causales. Chaque scenario se structure en trois temps : la cause (ce qui declenche la situation), l'effet (la reaction immediate), et la consequence (l'impact sur la securite). Cette approche, inspiree de la methode Txt2Sce, donne aux scenarios une profondeur que ne permettrait pas une simple description factuelle.

// - * video scenario mutator *: Le dernier noeud de la branche video genere des variations realistes a partir de chaque scenario de base. Cinq strategies de mutation sont appliquees : variation de la cause, variation de l'effet, augmentation de la complexite, changement d'environnement, et inversion des roles. Ce processus produit entre quinze et vingt-cinq scenarios derives pour chaque scenario source, couvrant ainsi un large spectre de situations de conduite.
// #video-branch-analysis-graph()
// #intro-subsection[ Agent 2 : Analyse semantique ]

// Une fois les exigences structurees, chaque exigence est soumise a un ensemble d'analyseurs specialises. Le noeud `route_requirement` examine le contenu de l'exigence et l'oriente vers les analyseurs pertinents.

// Cinq analyseurs fonctionnent en parallele :

// - *state analyzer* : Identifie les transitions d'etats decrites dans l'exigence (par exemple : ACC passe de Off a Active lorsque le bouton est presse). Il extrait les etats initiaux, les evenements declencheurs, et les etats finaux.

// - *timing analyzer* : Detecte les contraintes temporelles (delais, durees, timeouts) et les traduit en conditions de test verifiables (par exemple : « l'activation doit se produire en moins de 500 ms »).

// - *hmi analyzer* : Repere les interactions homme-machine : boutons, affichages, alertes sonores, temoins lumineux. Il identifie les entrees utilisateur et les retours attendus de l'interface.

// - *computation analyzer* : Extrait la logique de calcul et les formules.

// - *generic analyzer* : Capture les aspects qui n'entrent dans aucune des categories precedentes : conditions environnementales, contraintes de perimetre, cas aux limites.

// - * merge analyses * : consolide les resultats de tous les analyseurs en une synthese unique par exigence, creant ainsi un contexte riche pour la generation des cas de test.
// #semantic-analysis-graph()

// #intro-subsection[Agent 3 : Géneration des cas de test]
// La generation se decompose en quatre noeuds qui operent selon un schema planificateur-workers :

// - *coverage planner* : Ce noeud deterministe (sans appel LLM) elabore la strategie de couverture pour chaque exigence. Il determine combien de cas de test sont necessaires et de quel type : nominaux (fonctionnement normal), aux limites (valeurs seuils), negatifs (conditions de defaillance), et rares (combinaisons inhabituelles). Ce planificateur s'appuie sur la richesse de l'analyse semantique pour ne rien laisser de cote.

// - *plan single req* : Pour chaque exigence, ce noeud genere les blueprints (plans detailles) des cas de test via le LLM. Il recoit en entree l'exigence structuree, les resultats d'analyse,  et le cas echeant les observations video. Plusieurs instances s'executent en parallele grace au mecanisme `Send()` de LangGraph, controlees par un semaphore (`PLAN_CONCURRENCY`).
// C'est a ce niveau que la memoire a long terme est injectee : les preferences de l'utilisateur et les regles apprises enrichissent le prompt.

// - *dispatch tc workers* : Ce noeud de synchronisation collecte les blueprints produits par les instances paralleles de `plan_single_req`, puis les redistribue vers les workers de generation.

// - *generate tc* : Chaque blueprint est transforme en cas de test complet par le LLM : preconditions detaillees, actions pas a pas, et resultats attendus avec des valeurs precises. Comme pour la planification, plusieurs workers operent en parallele (`GENERATE_CONCURRENCY`).

// - *synthesizer* : recoit l'ensemble des cas de test generes et effectue un traitement en trois passes : deduplication exacte (texte identique), deduplication floue (similarite semantique au-dela d'un seuil de 75%), et deduplication par recouvrement des resultats attendus. Ce filtrage assure que le livrable final ne contient pas de tests redondants.
// #test-case-generation-graph()
// #intro-subsection[Agent 4 :Evaluation et sortie]
// - *Evaluator* : Ce noeud constitue le gardien de qualite du systeme. Il opere en deux phases complementaires. 

//  - La phase A applique des regles deterministes : detection de contradictions entre resultats attendus, verification que chaque test reste dans le perimetre de l'exigence source, et controle de la precision des valeurs limites. 

//  - La phase B soumet les cas ayant passe la phase A a une evaluation par LLM, qui verifie la coherence globale, la pertinence, et la completude. L'ensemble du processus garantit que cent pour cent des cas sont evalues.

// - *Human review* : Ce noeud marque le point d'intervention humaine. Le pipeline se met en pause grace a la fonction `interrupt()` de LangGraph et presente les resultats a l'utilisateur. L'execution ne reprend que lorsque l'utilisateur a transmis ses decisions. Ce mecanisme est detaille dans la section 3.5.

// - *Process review* : Ce noeud interprete les decisions de l'utilisateur et oriente la suite du flux : vers la sortie si tout est approuve, ou vers un nouveau cycle de generation si des cas ont ete rejetes.

// - *Output excel* et *Video output excel* : Ces noeuds produisent le livrable final au format Excel. Le nom du fichier inclut un numero de version (v1, v2, v3) qui s'incremente a chaque cycle de revue, assurant la tracabilite des iterations.
// #evaluation-hitl-output-graph() 


// #intro-subsection[Parallelisme et controle de concurrence]

// Le pipeline exploite deux niveaux de parallelisme :

// Le premier niveau utilise le mecanisme *"Send()"* de LangGraph pour distribuer le travail. Lorsque le planificateur identifie dix exigences a traiter, il cree dix instances paralleles de `plan_single_req`. Chaque instance opere de maniere independante, avec son propre contexte et ses propres appels LLM.

// Le second niveau intervient au sein des noeuds eux-memes. L'analyse des frames video, par exemple, lance les appels LLM en parallele via *"asyncio.gather()"*.
// #intro-subsection[Deroulement temporel d'une execution]
// Pour mieux apprecier l'enchainement des echanges entre les differentes couches du systeme, le diagramme de sequence ci-dessous retrace le parcours complet d'une requete, depuis le chargement du fichier par l'utilisateur jusqu'a la mise en pause du pipeline pour revue humaine.
// #adas-r2t-sequence-excel-generation()

// #intro-section[Architecture HITL et Time Travel]
// L'une des contributions majeures de ce travail est l'integration d'une boucle de controle humain directement dans le graphe d'execution. Contrairement a une approche ou l'utilisateur decouvre les resultats une fois le traitement termine, ici le pipeline s'interrompt volontairement pour solliciter l'avis de l'expert avant de poursuivre.
// #hitl-review-round1-sequence()

// #intro-subsection[ Le principe d'interruption]
// Le mecanisme repose sur la fonction `interrupt()` de LangGraph. Lorsque le pipeline atteint le noeud `human_review`, il sauvegarde son etat complet dans PostgreSQL et se met en pause. L'execution ne reprend que lorsque l'utilisateur a transmis ses decisions via l'API. Ce comportement est rendu possible par le checkpointer, qui preserve l'integralite du contexte entre la pause et la reprise.

// Du point de vue de l'utilisateur, l'experience est fluide : il recoit les cas de test generes, les examine a son rythme, et soumet ses decisions. Du point de vue du pipeline, rien n'est perdu : lorsqu'il reprend, il dispose exactement du meme etat qu'au moment de la pause.

// #intro-subsection[Les decisions de l'utilisateur]
// Pour chaque cas de test presente, l'utilisateur dispose de trois actions possibles :
// - *Approve :* le cas de test est valide et sera conserve tel quel dans le livrable final. Un commentaire optionnel peut etre ajoute.
// - *Reject :* le cas de test est insatisfaisant. L'utilisateur fournit obligatoirement un feedback expliquant ce qui doit etre ameliore. Ce cas sera regenere par le pipeline en tenant compte du feedback.
// - *Delete :* le cas de test est hors sujet ou redondant. Il sera supprime definitivement du livrable.

// Les cas de test pour lesquels l'utilisateur ne se prononce pas sont automatiquement consideres comme approuves. Cette convention evite de contraindre l'utilisateur a examiner chaque element lorsque la majorite des resultats est satisfaisante.
// #hitl-final-approval-sequence()

// #intro-subsection[  Regeneration selective par *"Time Travel"*]

// Lorsque l'utilisateur rejette certains cas de test, le pipeline ne repart pas de zero. Grace au mecanisme de Time Travel de LangGraph, il revient au noeud `coverage_planner` en conservant l'integralite du contexte accumule : exigences structurees, resultats d'analyse, flow table, et observations video.

// Seuls les cas rejetes sont regeneres. Les cas approuves restent rigoureusement inchanges  aucun appel LLM supplementaire ne leur est consacre. Le planificateur recoit les feedbacks de l'utilisateur et les integre dans le prompt de generation, produisant ainsi des cas de test ameliores qui repondent specifiquement aux remarques formulees.
// Ce mecanisme presente un avantage considerable en termes de cout et de temps : regenerer deux cas de test sur vingt ne consomme qu'un dixieme des ressources d'une regeneration complete.
// #intro-subsection[ Regeneration globale]
// L'utilisateur peut egalement demander une regeneration de l'ensemble des cas de test, accompagnee d'un feedback global (par exemple : « je veux des cas plus detailles avec des valeurs limites plus precises »). Dans ce cas, le pipeline revient egalement au `coverage_planner`, mais planifie la generation pour toutes les exigences en integrant le feedback global dans chaque prompt.

// #intro-subsection[Retour à HITL]

// Apres le telechargement du fichier Excel, l'utilisateur peut revenir a la page de revue pour lancer un nouveau cycle d'amelioration. Cette fonctionnalite utilise le mecanisme `aupdate_state()` de LangGraph pour repositionner le graphe au noeud `human_review`, permettant une nouvelle iteration sans relancer le pipeline depuis le debut.

// Chaque cycle de revue produit une nouvelle version du fichier (v1, v2, v3), assurant une tracabilite complete de l'evolution des resultats.
// #hitl-reentry-sequence()

// #intro-section[Architecture memoire]
// Un systeme agentique qui ne retient rien de ses interactions passees reproduit les memes erreurs a chaque execution. Pour depasser cette limite, ADAS-R2T integre une architecture memoire a trois niveaux, chacun repondant a un besoin de persistance different.
// #intro-subsection[Les trois niveaux de memoire]
// #memory-architecture-diagram()


// // La @fig-memoire illustre l'imbrication des trois niveaux. Chaque niveau englobe le precedent, elargissant progressivement la portee des connaissances conservees.
// - *Memoire de session (courte duree)* :La memoire de session couvre une execution unique du pipeline. A chaque noeud traverse, le checkpointer de LangGraph sauvegarde l'etat complet du graphe dans PostgreSQL sous forme de checkpoint chiffre. Cet etat inclut les exigences structurees, les resultats d'analyse, les cas de test generes, et les decisions de revue.Cette memoire rend possibles trois mecanismes essentiels. L'interruption permet au pipeline de se mettre en pause au noeud de revue humaine et de reprendre exactement la ou il s'etait arrete. Le Time Travel permet de revenir a un noeud anterieur pour regenerer des resultats sans perdre le contexte accumule. La reprise apres panne garantit que si le serveur redemarre en cours de traitement, le pipeline reprend au dernier checkpoint sauvegarde plutot que de repartir de zero.Les checkpoints sont chiffres au repos par l'algorithme AES, protegeant ainsi les donnees sensibles des exigences clients stockees dans la base. La duree de retention est configurable via la variable `CHECKPOINT_CLEANUP_DAYS`.
// - *Memoire utilisateur (longue duree)*:La memoire utilisateur persiste au-dela des sessions individuelles. Elle capture les connaissances propres a chaque utilisateur et les reutilise lors des executions futures.Cette memoire se decline en deux types:

//   - *La memoire semantique*: stocke les preferences et habitudes extraites des feedbacks de l'utilisateur. Par exemple, si un utilisateur rejette regulierement des cas de test pour cause de preconditions insuffisantes, le systeme enregistre cette preference et l'integre automatiquement dans les prompts de generation lors des sessions suivantes. Chaque preference est assortie d'un indice de confiance (low, medium, high) qui croit avec la repetition.

//   - *La memoire episodique*: conserve l'historique factuel des revues effectuees par l'utilisateur : combien de cas ont ete approuves, rejetes, ou supprimes, et pour quelles raisons. Ce journal permet au systeme d'anticiper les attentes de l'utilisateur et d'adapter sa generation en consequence.
// - *Memoire applicative (longue duree partagee)* :La memoire applicative constitue le niveau le plus large. Elle stocke les regles de qualite qui transcendent les preferences individuelles et s'appliquent a l'ensemble des utilisateurs du systeme.Lorsqu'un feedback est recu, un modele de langage le classifie automatiquement. Les remarques portant sur des standards du domaine (par exemple : « les vitesses doivent etre exprimees en km/h ») sont orientees vers la memoire applicative. Les preferences personnelles restent dans la memoire utilisateur.
// Une regle fondamentale gouverne la cohabitation entre ces deux niveaux : une connaissance presente dans la memoire applicative n'est jamais dupliquee dans la memoire utilisateur. Cette regle evite la redondance et garantit qu'une regle partagee est modifiee en un seul endroit.

// - *Recherche semantique* et gestion du contexte :La recuperation des connaissances ne se fait pas de maniere exhaustive. Lorsque le pipeline traite une exigence portant sur l'ACC, il est inutile de lui rappeler des regles propres a l'AEB. La recherche s'appuie sur des embeddings vectoriels (via pgvector) pour identifier par similarite semantique les connaissances pertinentes pour l'exigence en cours.Le volume de connaissances injectees dans le prompt est controle dynamiquement. Le systeme calcule le budget disponible en fonction de la fenetre de contexte du modele utilise et d'un ratio configurable (`MEMORY_CONTEXT_RATIO`). Si les connaissances recuperees depassent ce budget, elles sont automatiquement resumees par un appel LLM avant injection, preservant l'essentiel sans saturer le contexte.


// #intro-subsection[ Flux d'ecriture et de lecture]

// Le cycle de vie des connaissances suit deux chemins distincts :

// *Ecriture* : Apres chaque revue humaine, le noeud "process_review" extrait les feedbacks des cas rejetes. Chaque feedback est classifie (applicatif ou utilisateur), verifie contre les doublons existants, puis stocke dans le niveau approprie. Un evenement episodique est simultanement enregistre.

// *Lecture* : Avant chaque generation, le noeud "plan_single_req" interroge les trois niveaux de memoire. Les connaissances pertinentes sont formatees en une section dediee du prompt, precedee d'une instruction explicite : « applique toutes les regles et preferences ci-dessous ».

// #intro-section[Architectured'observabilite]
// Un systeme qui fait appel a des modeles de langage externes introduit une part d'imprevisibilite que les applications traditionnelles ne connaissent pas. Un prompt qui fonctionnait hier peut produire des resultats differents aujourd'hui. Un appel API peut echouer sans raison apparente. Pour maitriser cette complexite, ADAS-R2T met en place trois piliers d'observabilite complementaires.
// #intro-subsection[Tracage LLM *"Langfuse"*]
// Langfuse est une plateforme open source specialisee dans le suivi des applications basees sur des modeles de langage. Chaque appel LLM effectue par le pipeline est automatiquement trace : le prompt envoye, la reponse recue, le nombre de tokens consommes, la duree de l'appel, et le modele utilise.

// Ce niveau de detail permet d'identifier les prompts qui produisent des resultats insatisfaisants, de mesurer les couts par execution, et de comparer les performances entre differents modeles. Lorsqu'un cas de test genere est rejete par l'utilisateur, l'equipe peut remonter dans Langfuse jusqu'au prompt exact qui l'a produit et comprendre pourquoi.

// L'integration est transparente : un callback LangChain enregistre automatiquement chaque interaction sans modifier le code des noeuds. La fonctionnalite s'active ou se desactive par simple configuration (`LANGFUSE_ENABLED`).

// #intro-subsection[Metriques operationnelles *"Prometheus et Grafana"*]
// Prometheus collecte les metriques quantitatives du systeme a intervalles reguliers. Un middleware instrumente chaque requete HTTP, et des compteurs dedies suivent les indicateurs specifiques au pipeline :

// - Nombre de pipelines executes, par mode et par statut (termine, echoue, en pause).
// - Duree d'execution de chaque noeud du graphe.
// - Nombre et duree des appels LLM, par fournisseur et par modele.
// - Decisions HITL : nombre d'approbations, de rejets, et de suppressions.
// - Operations memoire : ecritures, lectures, et doublons evites.
// - Taux d'erreur par noeud et par type d'exception.

// Grafana consomme ces metriques et les restitue sous forme de tableaux de bord. Le dashboard « ADAS-R2T Pipeline Monitor » offre une vue en temps reel organisee en sections : vue d'ensemble, performance par noeud, utilisation LLM, activite HITL, operations memoire, et sante de l'infrastructure.

// L'ensemble est deploye via Docker Compose. Node Exporter collecte les metriques systeme (CPU, memoire, disque), tandis que PostgreSQL Exporter remonte les indicateurs de la base de donnees (connexions actives, temps de reponse des requetes).
// #intro-subsection[Logging structure *"structlog"*]
// Le troisieme pilier est le logging structure. Contrairement aux logs textuels classiques, structlog produit des logs au format JSON ou chaque information est un champ exploitable : nom du noeud, duree d'execution, identifiant de session, nombre de resultats.

// Un decorateur *"log_node"* enveloppe chaque noeud du graphe. Il enregistre automatiquement le debut et la fin de l'execution, la duree, et en cas d'erreur, le type d'exception et sa trace. Ce mecanisme ne necessite aucune modification du code metier des noeuds : il suffit d'appliquer le decorateur.

// Les logs structures alimentent egalement les metriques Prometheus : le decorateur incremente les compteurs de duree et d'erreurs a chaque execution de noeud, assurant la coherence entre les deux sources d'information.
// #intro-section[Securite et resilience]
// Un systeme destine a traiter des exigences fonctionnelles de securite automobile ne peut se permettre de negliger sa propre securite. Cette section presente les mecanismes mis en place pour proteger les donnees, garantir la disponibilite, et assurer l'isolation entre utilisateurs.
// #intro-subsection[Authentification]

// L'acces au pipeline est protege par deux mecanismes complementaires adaptes a deux contextes d'usage differents.

// La communication machine-a-machine entre le backend BFF et le pipeline IA utilise une cle API transmise dans l'en-tete . Cette approche, simple et performante, convient aux echanges entre services internes ou la cle est stockee de maniere securisee dans les variables d'environnement.

// L'authentification des utilisateurs finaux repose sur des jetons JWT (JSON Web Tokens). Chaque utilisateur s'authentifie avec ses identifiants, recoit un jeton signe, et le presente a chaque requete subsequente. Le jeton contient l'identifiant de l'utilisateur et son role, permettant un controle d'acces sans interroger la base a chaque requete.
// #intro-subsection[Execution durable et tolerance aux pannes
// ]
// L'execution durable est une propriete native de LangGraph lorsqu'il est couple a un checkpointer. Si le serveur s'arrete brutalement au milieu d'un pipeline --- coupure reseau, redemarrage du conteneur, erreur systeme --- le travail effectue n'est pas perdu. Au redemarrage, le pipeline reprend au dernier checkpoint sauvegarde.

// La tolerance aux pannes intervient egalement au niveau du parallelisme. Lorsque plusieurs noeuds s'executent en parallele via `Send()` et que l'un d'entre eux echoue (par exemple, un timeout de l'API LLM), les resultats des noeuds reussis sont preserves. Seul le noeud en echec est relance, sans reprendre les traitements deja termines.
// #intro-subsection[Limitation de debit *"Rate Limiting"*]
// Le rate limiting protege le systeme contre la surcharge, qu'elle soit accidentelle ou malveillante. Chaque point d'acces est soumis a des limites configurables :
// #figure(
//   block[
//     #set text(
//       font: "Times New Roman",
//       size: 8.8pt,
//     )

//     #table(
//       columns: (9.2cm, 7.2cm),
//       inset: (x: 5pt, y: 7pt),
//       stroke: none,
//       align: (left, left),

//       // Top rule
//       table.hline(stroke: 0.8pt + black),

//       // Header
//       table.header(
//         table.cell(fill: rgb("#DCE6F1"))[
//           #align(left)[
//             #text(weight: "bold", fill: ENIADBlue)[Point d’accès]
//           ]
//         ],
//         table.cell(fill: rgb("#DCE6F1"))[
//           #align(left)[
//             #text(weight: "bold", fill: ENIADBlue)[Limite]
//           ]
//         ],
//       ),

//       // Mid rule
//       table.hline(stroke: 0.45pt + black),

//       // Row 1
//       [
//         #text(weight: "bold", fill: ENIADBlue)[Endpoints généraux]
//       ],
//       [
//         100 requêtes / minute
//       ],

//       // Row 2 - Zebra
//       table.cell(fill: rgb("#F3F8FC"))[
//         #text(weight: "bold", fill: ENIADBlue)[Pipeline \(run, resume\)]
//       ],
//       table.cell(fill: rgb("#F3F8FC"))[
//         10 requêtes / heure
//       ],

//       // Row 3
//       [
//         #text(weight: "bold", fill: ENIADBlue)[Authentification]
//       ],
//       [
//         20 requêtes / minute
//       ],

//       // Bottom rule
//       table.hline(stroke: 0.8pt + black),
//     )
//   ],
//   caption: [Limites de requêtes appliquées aux points d’accès de l’API],
//   kind: table,
// ) <tab:rate-limits-api>
// Ces limites sont appliquees par utilisateur et non globalement. Ainsi, un utilisateur qui atteint sa limite n'affecte pas les autres utilisateurs du systeme. La cle de limitation est derivee de l'identifiant de l'utilisateur authentifie.


// #adas-r2t-sequence-excel-generation()

// // #intro-section[Vue d'ensemble]
// // #intro-subsection[ Flux global]
// // #intro-section[Vue d'ensemble]
// // #intro-subsection[ Flux global]
// #pagebreak()
// ``

// // #set page(header: report-header, footer: report-footer)



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
Ce chapitre présente l'architecture du système ADAS-R2T selon une approche descendante : nous partons d'une vue macroscopique du pipeline, puis nous détaillons progressivement chaque couche technique jusqu'aux mécanismes internes du graphe agentique.

#intro-section[Vue d'ensemble]
Le système *ADAS-R2T* repose sur un principe simple : transformer des *entrées métier* (exigences fonctionnelles, vidéos de conduite) en *sorties exploitables* (cas de test structurés, scénarios de validation). Entre ces deux extrémités, un *"pipeline intelligent"* orchestre le travail de dix-neuf nœuds spécialisés.

#intro-subsection[ Flux global]
À son niveau le plus abstrait, le système fonctionne comme une chaîne de transformation en trois temps :

- *Entrée* : l'utilisateur fournit un fichier Excel contenant les exigences fonctionnelles ADAS (et éventuellement une vidéo de conduite réelle).
- *Traitement* : le "pipeline" agentique analyse, planifie, génère et évalue les cas de test de manière autonome.
- *Sortie* : un fichier Excel structuré contenant les cas de test prêts à être exécutés par l'équipe de validation.
#set page(header: report-header, footer: report-footer)
#adas-r2t-pipeline-stages()


#v(1cm)
Ce flux, en apparence linéaire, cache en réalité une mécanique bien plus riche. Le "pipeline" ne se contente pas de « traduire » des exigences en tests : il analyse chaque exigence sous plusieurs angles, planifie la couverture de test, génère les cas en parallèle, les évalue automatiquement, puis les soumet à l'utilisateur pour validation avant de produire le livrable final.
#intro-subsection[Les quatre étapes du pipeline]

Le traitement interne se décompose en quatre grandes étapes, chacune correspondant à un ensemble de nœuds dans le graphe agentique :

#adas-r2t-pipeline-stages_1()

#v(1cm)

*Étape 1 : Extraction des entrées.* Le système ingère le fichier Excel, identifie la structure du document (en-têtes, colonnes, "flow table"), et extrait les exigences fonctionnelles sous une forme structurée exploitable par les étapes suivantes.

*Étape 2 : Analyse sémantique.* Chaque exigence est soumise à cinq analyseurs spécialisés fonctionnant en parallèle : transitions d'états, contraintes temporelles, interactions homme-machine, logique de calcul et analyse générique. Cette analyse multidimensionnelle permet de capturer la richesse sémantique de chaque exigence.

*Étape 3 : Génération des cas de test.* Un planificateur détermine la stratégie de couverture pour chaque exigence (cas nominaux, limites, négatifs, rares), puis des "workers" parallèles génèrent les cas de test correspondants. Un synthétiseur élimine ensuite les doublons et consolide les résultats.

*Étape 4 : Évaluation et sortie.* Chaque cas de test généré est évalué automatiquement (détection de contradictions, vérification du périmètre, cohérence des valeurs). Les résultats sont ensuite soumis à une revue humaine avant *"HITL"* d'être exportés au format Excel.
#intro-subsection[Les trois modes d'entrée]

Le système supporte trois modes de fonctionnement, offrant une flexibilité adaptée à différents contextes d'utilisation :

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
        #text(weight: "bold", fill: ENIADBlue)[Excel seul]
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
  caption: [Modes d’entrée et sorties générées par **"ADAS-R2T"**],
  kind: table,
) <tab:modes-entrees-sorties>
#v(1cm)
- Le mode _Excel seul_ constitue le cas d'usage principal : l'équipe de validation dispose d'un document d'exigences et souhaite générer les cas de test correspondants.

- Le mode _Vidéo seule_ permet d'exploiter des vidéos de conduite réelle pour en extraire des scénarios de test basés sur un raisonnement causal (cause, effet, conséquence).

- Le mode _Excel + Vidéo_ combine les deux approches : les cas de test générés à partir des exigences sont enrichis par les observations extraites de la vidéo.

Cette distinction entre modes se matérialise au niveau du graphe par un routage conditionnel dès le premier nœud, orientant le flux de traitement vers les branches appropriées.

#intro-section[Architecture technique globale]

Le système **"ADAS-R2T"** s'articule autour d'un noyau central _le pipeline d'orchestration_ qui coordonne l'ensemble des composants techniques. Chaque composant remplit un rôle précis et communique avec le "pipeline" via des interfaces bien définies.

#intro-subsection[Vue des composants]

#agentic-ai-architecture-diagram()

Le schéma ci-dessus fait apparaître huit composants principaux, organisés autour du "pipeline" d'orchestration. Nous les décrivons ci-dessous en suivant le flux d'une requête typique.

#intro-subsection[Pipeline d'orchestration LangGraph]

Le cœur du système est un graphe d'exécution construit avec "LangGraph", le framework d'orchestration d'agents de "LangChain". Ce graphe définit l'enchaînement des dix-neuf nœuds de traitement, gère le parallélisme et assure la persistance de l'état entre les étapes. C'est lui qui décide quel nœud s'exécute, dans quel ordre, et comment les résultats circulent d'un agent à l'autre.

Le choix de "LangGraph", plutôt qu'un enchaînement séquentiel de prompts, permet de bénéficier de mécanismes avancés : exécution parallèle via `"Send()"`, interruptions pour la revue humaine, retour arrière `"Time Travel"` sans perte de contexte, et reprise automatique après une panne.

#intro-subsection[Modèles de langage]

Lors de la conception du système, une question pratique importante s'est posée : et si demain nous souhaitions utiliser un modèle de langage d'une autre entreprise que celle de départ ? Devrions-nous réécrire de larges pans du code ? C'était un véritable problème, car chaque fournisseur de services avait sa propre méthode de communication.

Le problème : traiter séparément avec chaque fournisseur aurait rendu le code complexe et difficile à maintenir. Chaque simple modification aurait nécessité des changements à plusieurs endroits, un véritable cauchemar pour tout programmeur.

La solution astucieuse : la solution a consisté à implémenter une astuce de programmation élégante appelée `"Factory Pattern"`. L'idée est simple et efficace : au lieu de communiquer directement avec `"OpenAI"` ou `"Cohere"`, les composants du système communiquent avec un seul intermédiaire, `"LLMProviderFactory"`. Cet intermédiaire est seul responsable de la communication avec chaque fournisseur. Grâce à un simple paramètre dans le fichier de configuration, cette « fabrique » génère l'expert approprié et le met à contribution.

L'avantage immédiat : changer de modèle d'IA est devenu aussi simple que de changer de chaîne de télévision. Si nous souhaitons ajouter un nouveau modèle ultérieurement, il nous suffit d'apprendre à l'« usine » comment communiquer avec lui, sans toucher au reste du système. C'est une solution simple et claire qui rend le système robuste et facile à développer.

Cette dualité n'est pas figée : chaque nœud du `"pipeline"` peut être configuré indépendamment pour utiliser l'un ou l'autre fournisseur, via les variables d'environnement. Cette flexibilité permet d'adapter le choix du modèle au rapport coût-performance de chaque tâche. Le mécanisme de `"retry"` avec `"backoff"` exponentiel (via `"Tenacity"`) assure la robustesse face aux erreurs transitoires des API externes.

#intro-subsection[Ingénierie des prompts]

Les instructions envoyées aux modèles de langage ne sont pas codées en dur dans le code source. Chaque nœud charge son prompt depuis un fichier `"Markdown"` dédié, stocké dans un répertoire centralisé. Cette séparation entre logique de traitement et contenu des prompts facilite l'itération rapide : un ingénieur peut modifier un prompt sans toucher au code Python, et chaque modification est traçable dans l'historique `"Git"`.

Les prompts s'appuient sur les principes du framework `"MISBAH"`, qui structure les instructions en sections claires : contexte métier, format de sortie attendu, exemples et contraintes à respecter.

#intro-subsection[Mémoire et persistance ]

Le système exploite `"PostgreSQL"` pour deux fonctions distinctes de mémoire :

La *mémoire de session* (courte durée) est assurée par le checkpointer de LangGraph. À chaque étape du pipeline, l'état complet est sauvegardé dans PostgreSQL sous forme de checkpoint chiffré `"AES"`. Ce mécanisme rend possible l'interruption pour revue humaine, le retour arrière (`"Time Travel"`), et la reprise après panne sans perte de travail.

La *mémoire à long terme* `"cross-session"` stocke les connaissances acquises au fil des utilisations. Elle se décline en trois portées : sémantique applicative règles partagées par tous les utilisateurs, sémantique utilisateur préférences individuelles, et épisodique historique des revues. La recherche dans cette mémoire s'appuie sur des `"embeddings"` vectoriels `"pgvector"` pour retrouver les connaissances pertinentes par similarité sémantique.

#intro-subsection[Observabilité Langfuse, Prometheus, Grafana)]

L'observabilité du système repose sur trois piliers complémentaires :

- *Langfuse* capture chaque appel LLM avec ses paramètres, sa durée, ses tokens consommés et sa réponse. Ce traçage fin permet d'identifier les prompts sous-performants, de mesurer les coûts, et de déboguer les cas de génération insatisfaisants.

- *Prometheus* collecte les métriques opérationnelles du système : nombre de pipelines exécutés, durée par nœud, taux d'erreur, décisions `"HITL"`, et opérations mémoire. Ces métriques sont exposées via un `"endpoint"` `"/metrics"` au format standard.

- *Grafana* consomme les métriques de `"Prometheus"` et les présente sous forme de tableaux de bord visuels. Un `"dashboard"` dédié `"ADAS-R2T Pipeline Monitor"` offre une vue en temps réel sur la santé et les performances du système.

Le logging structuré, assuré par `"structlog"`, complète ce dispositif en produisant des logs au format `"JSON"` exploitables par des outils d'analyse.

#intro-subsection[Validation et évaluation]

Le module d'évaluation constitue le gardien de la qualité du système.
#intro-subsection[Choix techniques et justifications]

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
        `FastAPI`
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Performance async, documentation automatique, écosystème `Python`
      ],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[Base de données]
      ],
      [
        PostgreSQL  pgvector
      ],
      [
        Robustesse, support vectoriel pour la recherche sémantique
      ],

      // Row 4 - Zebra
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Monitoring]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        `Prometheus`  `"Grafana"`
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
        Spécialisé LLMOps, open source, intégré à LangChain
      ],

      // Row 6 - Zebra
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Logging]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        structlog
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        Logs structurés `JSON`, décorateurs de nœud
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
  caption: [Choix technologiques retenus pour l’architecture **`ADAS-R2T`**],
  kind: table,
) <tab:choix-technologiques>

#intro-section[Architecture du graphe agentique]

Le `"pipeline"` de traitement constitue le cœur technique du système. Il prend la forme d'un graphe orienté, construit avec `"LangGraph"`, où chaque nœud représente un agent spécialisé dans une tâche précise. Ce graphe ne se parcourt pas de manière linéaire : selon le mode d'entrée choisi, certaines branches s'activent et d'autres sont ignorées. Des mécanismes de parallélisme, de boucle et d'interruption viennent enrichir ce parcours.

#intro-subsection[Vue d'ensemble du graphe]
#v(-0.4cm)
#pipeline-routing-modes-diagram()

Le graphe opère à l'intérieur de trois niveaux d'encapsulation, visibles sur la figure ci-dessus :

- Le *scope session* englobe l'exécution d'un `"pipeline"` unique. C'est à ce niveau que le `"checkpointer"` sauvegarde l'état à chaque étape, rendant possibles l'interruption et la reprise.

- Le *scope utilisateur* regroupe l'ensemble des sessions d'un même utilisateur. La mémoire sémantique et épisodique de l'utilisateur persiste à ce niveau.

- Le *scope application* couvre l'ensemble du système. Les règles de qualité apprises et partagées par tous les utilisateurs sont stockées à ce niveau.

#intro-subsection[Agent 1 : Extraction des entrées]

La première étape gère l'ingestion des fichiers fournis par l'utilisateur. Selon le mode d'entrée, le graphe active l'une ou plusieurs des branches suivantes :

- *ingest excel* : Ce nœud prend en charge la lecture du fichier Excel. Il identifie la structure du document (en-têtes, colonnes des données, `"flow table"`), extrait un aperçu des premières lignes, et prépare les données brutes pour l'étape suivante. Ce nœud ne fait pas appel au LLM : son traitement est entièrement déterministe, basé sur la bibliothèque openpyxl.

- *extract and structure* : À partir des données brutes, ce nœud fait appel au LLM pour transformer le contenu des cellules en exigences structurées. Chaque exigence se voit attribuer un identifiant unique, un texte normalisé, et des métadonnées (variables, conditions, seuils). C'est ici que le passage du langage naturel à une représentation exploitable s'opère.
#excel-branch-ingestion-graph()
#intro-subsection[Agent vidéo : analyse et mutations]

Lorsque l'utilisateur fournit une vidéo de conduite, une branche parallèle s'active. Elle se compose de quatre nœuds :

- *analyze video* : Ce nœud extrait les frames clés de la vidéo à intervalles réguliers, puis applique un algorithme de détection de changement de scène (basé sur la différence de pixels entre frames consécutives) pour ne retenir que les moments significatifs. Le résultat est un ensemble de frames clés accompagnées de leurs timestamps.

- *video frame analyzer* : Chaque frame clé est analysée individuellement par un LLM multimodal . L'analyse produit pour chaque frame : une description de la scène, la vitesse estimée du véhicule ego, les objets détectés (véhicules, piétons, panneaux), les conditions environnementales, et l'action en cours du véhicule. Les frames sont analysées en parallèle grâce à un semaphore qui contrôle la concurrence.

- *video scenario builder* : À partir des analyses de frames, ce nœud reconstruit des scénarios complets en établissant des chaînes causales. Chaque scénario se structure en trois temps : la cause (ce qui déclenche la situation), l'effet (la réaction immédiate), et la conséquence (l'impact sur la sécurité). Cette approche, inspirée de la méthode `"Txt2Sce"`, donne aux scénarios une profondeur que ne permettrait pas une simple description factuelle.

- *video scenario mutator* : Le dernier nœud de la branche vidéo génère des variations réalistes à partir de chaque scénario de base. Cinq stratégies de mutation sont appliquées : variation de la cause, variation de l'effet, augmentation de la complexité, changement d'environnement, et inversion des rôles. Ce processus produit entre quinze et vingt-cinq scénarios dérivés pour chaque scénario source, couvrant ainsi un large spectre de situations de conduite.
#video-branch-analysis-graph()
#intro-subsection[Agent 2 : Analyse sémantique]

Une fois les exigences structurées, chaque exigence est soumise à un ensemble d'analyseurs spécialisés. Le nœud `"route_requirement"` examine le contenu de l'exigence et l'oriente vers les analyseurs pertinents.

Cinq analyseurs fonctionnent en parallèle :

- *state analyzer* : Identifie les transitions d'états décrites dans l'exigence (par exemple : "ACC" passe de "Off" à "Active" lorsque le bouton est pressé). Il extrait les états initiaux, les événements déclencheurs, et les états finaux.

- *timing analyzer* : Détecte les contraintes temporelles (délais, durées, `"timeouts"`) et les traduit en conditions de test vérifiables (par exemple : « l'activation doit se produire en moins de 500 ms »).

- *hmi analyzer* : Repère les interactions homme-machine : boutons, affichages, alertes sonores, témoins lumineux. Il identifie les entrées utilisateur et les retours attendus de l'interface.

- *computation analyzer* : Extrait la logique de calcul et les formules.

- *generic analyzer* : Capture les aspects qui n'entrent dans aucune des catégories précédentes : conditions environnementales, contraintes de périmètre, cas aux limites.

- *merge analyses* : Consolide les résultats de tous les analyseurs en une synthèse unique par exigence, créant ainsi un contexte riche pour la génération des cas de test.
#semantic-analysis-graph()

#intro-subsection[Agent 3 : Génération des cas de test]

La génération se décompose en quatre nœuds qui opèrent selon un schéma planificateur-workers :

- *coverage planner* : Ce nœud déterministe (sans appel `"LLM"`) élabore la stratégie de couverture pour chaque exigence. Il détermine combien de cas de test sont nécessaires et de quel type : nominaux (fonctionnement normal), aux limites (valeurs seuils), négatifs (conditions de défaillance), et rares (combinaisons inhabituelles). Ce planificateur s'appuie sur la richesse de l'analyse sémantique pour ne rien laisser de côté.

- *plan single req* : Pour chaque exigence, ce nœud génère les blueprints (plans détaillés) des cas de test via le LLM. Il reçoit en entrée l'exigence structurée, les résultats d'analyse, et le cas échéant les observations vidéo. Plusieurs instances s'exécutent en parallèle grâce au mécanisme `"Send()"` de LangGraph, contrôlées par un `"semaphore"` `"PLAN_CONCURRENCY"`.

C'est à ce niveau que la mémoire à long terme est injectée : les préférences de l'utilisateur et les règles apprises enrichissent le prompt.

- *dispatch tc workers* : Ce nœud de synchronisation collecte les `"blueprints"` produits par les instances parallèles de `"plan_single_req"`, puis les redistribue vers les `"workers"` de génération.

- *generate tc* : Chaque blueprint est transformé en cas de test complet par le LLM : préconditions détaillées, actions pas à pas, et résultats attendus avec des valeurs précises. Comme pour la planification, plusieurs workers opèrent en parallèle `"GENERATE_CONCURRENCY"`.

- *synthesizer* : Reçoit l'ensemble des cas de test générés et effectue un traitement en trois passes : `"deduplication"` exacte (texte identique), deduplication floue (similarité sémantique au-delà d'un seuil de 75 %), et deduplication par recouvrement des résultats attendus. Ce filtrage assure que le livrable final ne contient pas de tests redondants.
#test-case-generation-graph()
#intro-subsection[Agent 4 : Évaluation et sortie]

- *Evaluator* : Ce nœud constitue le gardien de qualité du système. Il opère en deux phases complémentaires.

 - La phase A applique des règles déterministes : détection de contradictions entre résultats attendus, vérification que chaque test reste dans le périmètre de l'exigence source, et contrôle de la précision des valeurs limites.

 - La phase B soumet les cas ayant passé la phase A à une évaluation par LLM, qui vérifie la cohérence globale, la pertinence, et la complétude. L'ensemble du processus garantit que cent pour cent des cas sont évalués.

- *Human review* : Ce nœud marque le point d'intervention humaine. Le pipeline se met en pause grâce à la fonction `"interrupt()"` de LangGraph et présente les résultats à l'utilisateur. L'exécution ne reprend que lorsque l'utilisateur a transmis ses décisions. Ce mécanisme est détaillé dans la section 3.5.

- *Process review* : Ce nœud interprète les décisions de l'utilisateur et oriente la suite du flux : vers la sortie si tout est approuvé, ou vers un nouveau cycle de génération si des cas ont été rejetés.

- *Output excel* et *Video output excel* : Ces nœuds produisent le livrable final au format Excel. Le nom du fichier inclut un numéro de version (`"v1"`, `"v2"`, `"v3"`) qui s'incrémente à chaque cycle de revue, assurant la traçabilité des itérations.
#evaluation-hitl-output-graph() 
#intro-subsection[Parallélisme et contrôle de concurrence]

Le pipeline exploite deux niveaux de parallélisme :

Le premier niveau utilise le mécanisme *`"Send()"`* de LangGraph pour distribuer le travail. Lorsque le planificateur identifie dix exigences à traiter, il crée dix instances parallèles de `"plan_single_req"`. Chaque instance opère de manière indépendante, avec son propre contexte et ses propres appels LLM.

Le second niveau intervient au sein des nœuds eux-mêmes. L'analyse des frames vidéo, par exemple, lance les appels LLM en parallèle via *`"asyncio.gather()"`*.

#intro-subsection[Déroulement temporel d'une exécution]

Pour mieux apprécier l'enchaînement des échanges entre les différentes couches du système, le diagramme de séquence ci-dessous retrace le parcours complet d'une requête, depuis le chargement du fichier par l'utilisateur jusqu'à la mise en pause du pipeline pour revue humaine.
#adas-r2t-sequence-excel-generation()

#intro-section[Architecture HITL et Time Travel]

L'une des contributions majeures de ce travail est l'intégration d'une boucle de contrôle humain directement dans le graphe d'exécution. Contrairement à une approche où l'utilisateur découvre les résultats une fois le traitement terminé, ici le pipeline s'interrompt volontairement pour solliciter l'avis de l'expert avant de poursuivre.
#hitl-review-round1-sequence()

#intro-subsection[Le principe d'interruption]

Le mécanisme repose sur la fonction `"interrupt()"` de LangGraph. Lorsque le pipeline atteint le nœud `"human_review"`, il sauvegarde son état complet dans PostgreSQL et se met en pause. L'exécution ne reprend que lorsque l'utilisateur a transmis ses décisions via l'API. Ce comportement est rendu possible par le checkpointer, qui préserve l'intégralité du contexte entre la pause et la reprise.

Du point de vue de l'utilisateur, l'expérience est fluide : il reçoit les cas de test générés, les examine à son rythme, et soumet ses décisions. Du point de vue du pipeline, rien n'est perdu : lorsqu'il reprend, il dispose exactement du même état qu'au moment de la pause.

#intro-subsection[Les décisions de l'utilisateur]

Pour chaque cas de test présenté, l'utilisateur dispose de trois actions possibles :

- *Approve :* le cas de test est validé et sera conservé tel quel dans le livrable final. Un commentaire optionnel peut être ajouté.

- *Reject :* le cas de test est insatisfaisant. L'utilisateur fournit obligatoirement un feedback expliquant ce qui doit être amélioré. Ce cas sera régénéré par le pipeline en tenant compte du feedback.

- *Delete :* le cas de test est hors sujet ou redondant. Il sera supprimé définitivement du livrable.

Les cas de test pour lesquels l'utilisateur ne se prononce pas sont automatiquement considérés comme approuvés. Cette convention évite de contraindre l'utilisateur à examiner chaque élément lorsque la majorité des résultats est satisfaisante.
#hitl-final-approval-sequence()

#intro-subsection[Régénération sélective ]

Lorsque l'utilisateur rejette certains cas de test, le pipeline ne repart pas de zéro. Grâce au mécanisme de `"Time Travel"` de LangGraph, il revient au nœud `"coverage_planner"` en conservant l'intégralité du contexte accumulé : exigences structurées, résultats d'analyse, `"flow table"`, et observations vidéo.

Seuls les cas rejetés sont régénérés. Les cas approuvés restent rigoureusement inchangés : aucun appel LLM supplémentaire ne leur est consacré. Le planificateur reçoit les `"feedbacks"` de l'utilisateur et les intègre dans le prompt de génération, produisant ainsi des cas de test améliorés qui répondent spécifiquement aux remarques formulées.

Ce mécanisme présente un avantage considérable en termes de coût et de temps : régénérer deux cas de test sur vingt ne consomme qu'un dixième des ressources d'une régénération complète.

#intro-subsection[Régénération globale]

L'utilisateur peut également demander une régénération de l'ensemble des cas de test, accompagnée d'un feedback global par exemple : « je veux des cas plus détaillés avec des valeurs limites plus précises ». Dans ce cas, le pipeline revient également au `"coverage_planner"`, mais planifie la génération pour toutes les exigences en intégrant le feedback global dans chaque prompt.

#intro-subsection[Retour à HITL]

Après le téléchargement du fichier Excel, l'utilisateur peut revenir à la page de revue pour lancer un nouveau cycle d'amélioration. Cette fonctionnalité utilise le mécanisme `"aupdate_state()"` de LangGraph pour repositionner le graphe au nœud `"human_review"`, permettant une nouvelle itération sans relancer le pipeline depuis le début.

Chaque cycle de revue produit une nouvelle version du fichier (`"v1"`, `"v2"`, `"v3"`), assurant une traçabilité complète de l'évolution des résultats.
#hitl-reentry-sequence()
#intro-section[Architecture mémoire]

Un système agentique qui ne retient rien de ses interactions passées reproduit les mêmes erreurs à chaque exécution. Pour dépasser cette limite, *`"ADAS-R2T"`* intègre une architecture mémoire à trois niveaux, chacun répondant à un besoin de persistance différent.

#intro-subsection[Les trois niveaux de mémoire]
#memory-architecture-diagram()
#v(1cm)
- *Mémoire de session (courte durée)* : La mémoire de session couvre une exécution unique du pipeline. À chaque nœud traversé, le checkpointer de LangGraph sauvegarde l'état complet du graphe dans PostgreSQL sous forme de checkpoint chiffré. Cet état inclut les exigences structurées, les résultats d'analyse, les cas de test générés, et les décisions de revue. Cette mémoire rend possibles trois mécanismes essentiels. L'interruption permet au pipeline de se mettre en pause au nœud de revue humaine et de reprendre exactement là où il s'était arrêté. Le `"Time Travel"` permet de revenir à un nœud antérieur pour régénérer des résultats sans perdre le contexte accumulé. La reprise après panne garantit que si le serveur redémarre en cours de traitement, le pipeline reprend au dernier checkpoint sauvegardé plutôt que de repartir de zéro. Les checkpoints sont chiffrés au repos par l'algorithme `"AES"`, protégeant ainsi les données sensibles des exigences clients stockées dans la base. La durée de rétention est configurable via la variable `"CHECKPOINT_CLEANUP_DAYS"`.

- *Mémoire utilisateur (longue durée)* : La mémoire utilisateur persiste au-delà des sessions individuelles. Elle capture les connaissances propres à chaque utilisateur et les réutilise lors des exécutions futures. Cette mémoire se décline en deux types :

  - *La mémoire sémantique* : stocke les préférences et habitudes extraites des feedbacks de l'utilisateur. Par exemple, si un utilisateur rejette régulièrement des cas de test pour cause de préconditions insuffisantes, le système enregistre cette préférence et l'intègre automatiquement dans les prompts de génération lors des sessions suivantes. Chaque préférence est assortie d'un indice de confiance (low, medium, high) qui croît avec la répétition.

  - *La mémoire épisodique* : conserve l'historique factuel des revues effectuées par l'utilisateur : combien de cas ont été approuvés, rejetés, ou supprimés, et pour quelles raisons. Ce journal permet au système d'anticiper les attentes de l'utilisateur et d'adapter sa génération en conséquence.

- *Mémoire applicative (longue durée partagée)* : La mémoire applicative constitue le niveau le plus large. Elle stocke les règles de qualité qui transcendent les préférences individuelles et s'appliquent à l'ensemble des utilisateurs du système. Lorsqu'un feedback est reçu, un modèle de langage le classifie automatiquement. Les remarques portant sur des standards du domaine (par exemple : « les vitesses doivent être exprimées en km/h ») sont orientées vers la mémoire applicative. Les préférences personnelles restent dans la mémoire utilisateur.

Une règle fondamentale gouverne la cohabitation entre ces deux niveaux : une connaissance présente dans la mémoire applicative n'est jamais dupliquée dans la mémoire utilisateur. Cette règle évite la redondance et garantit qu'une règle partagée est modifiée en un seul endroit.

- *Recherche sémantique* et gestion du contexte : La récupération des connaissances ne se fait pas de manière exhaustive. Lorsque le pipeline traite une exigence portant sur l'"ACC", il est inutile de lui rappeler des règles propres à l'AEB. La recherche s'appuie sur des embeddings vectoriels via pgvector pour identifier par similarité sémantique les connaissances pertinentes pour l'exigence en cours. Le volume de connaissances injectées dans le prompt est contrôlé dynamiquement. Le système calcule le budget disponible en fonction de la fenêtre de contexte du modèle utilisé et d'un ratio configurable `"MEMORY_CONTEXT_RATIO"`. Si les connaissances récupérées dépassent ce budget, elles sont automatiquement résumées par un appel LLM avant injection, préservant l'essentiel sans saturer le contexte.

#intro-subsection[Flux d'écriture et de lecture]

Le cycle de vie des connaissances suit deux chemins distincts :

*Écriture* : Après chaque revue humaine, le nœud `"process_review"` extrait les `"feedbacks"` des cas rejetés. Chaque feedback est classifié (applicatif ou utilisateur), vérifié contre les doublons existants, puis stocké dans le niveau approprié. Un événement épisodique est simultanément enregistré.

*Lecture* : Avant chaque génération, le nœud `"plan_single_req"` interroge les trois niveaux de mémoire. Les connaissances pertinentes sont formatées en une section dédiée du prompt, précédée d'une instruction explicite : « applique toutes les règles et préférences ci-dessous ».

#intro-section[Architecture d'observabilité]

Un système qui fait appel à des modèles de langage externes introduit une part d'imprévisibilité que les applications traditionnelles ne connaissent pas. Un prompt qui fonctionnait hier peut produire des résultats différents aujourd'hui. Un appel API peut échouer sans raison apparente. Pour maîtriser cette complexité, **`"ADAS-R2T"`** met en place trois piliers d'observabilité complémentaires.

#intro-subsection[Traçage LLM *`"Langfuse"`*]

Langfuse est une plateforme open source spécialisée dans le suivi des applications basées sur des modèles de langage. Chaque appel LLM effectué par le pipeline est automatiquement tracé : le prompt envoyé, la réponse reçue, le nombre de tokens consommés, la durée de l'appel, et le modèle utilisé.

Ce niveau de détail permet d'identifier les prompts qui produisent des résultats insatisfaisants, de mesurer les coûts par exécution, et de comparer les performances entre différents modèles. Lorsqu'un cas de test généré est rejeté par l'utilisateur, l'équipe peut remonter dans Langfuse jusqu'au prompt exact qui l'a produit et comprendre pourquoi.

L'intégration est transparente : un `"callback"` LangChain enregistre automatiquement chaque interaction sans modifier le code des nœuds. La fonctionnalité s'active ou se désactive par simple configuration `"LANGFUSE_ENABLED"`.

#intro-subsection[Métriques opérationnelles *Prometheus et Grafana*]

Prometheus collecte les métriques quantitatives du système à intervalles réguliers. Un middleware instrumente chaque requête HTTP, et des compteurs dédiés suivent les indicateurs spécifiques au pipeline :

- Nombre de `"pipelines"` exécutés, par mode et par statut (terminé, échoué, en pause).
- Durée d'exécution de chaque nœud du graphe.
- Nombre et durée des appels LLM, par fournisseur et par modèle.
- Décisions HITL : nombre d'approbations, de rejets, et de suppressions.
- Opérations mémoire : écritures, lectures, et doublons évités.
- Taux d'erreur par nœud et par type d'exception.

Grafana consomme ces métriques et les restitue sous forme de tableaux de bord. Le dashboard « `"ADAS-R2T Pipeline Monitor"` » offre une vue en temps réel organisée en sections : vue d'ensemble, performance par nœud, utilisation LLM, activité HITL, opérations mémoire, et santé de l'infrastructure.

L'ensemble est déployé via `"Docker Compose"`. `"Node Exporter"` collecte les métriques système (`"CPU"`, mémoire, disque), tandis que `"PostgreSQL Exporter"` remonte les indicateurs de la base de données (connexions actives, temps de réponse des requêtes).

#intro-subsection[Logging structuré *`"structlog"`*]

Le troisième pilier est le logging structuré. Contrairement aux logs textuels classiques, `"structlog"` produit des logs au format JSON où chaque information est un champ exploitable : nom du nœud, durée d'exécution, identifiant de session, nombre de résultats.

Un décorateur *`"log_node"`* enveloppe chaque nœud du graphe. Il enregistre automatiquement le début et la fin de l'exécution, la durée, et en cas d'erreur, le type d'exception et sa trace. Ce mécanisme ne nécessite aucune modification du code métier des nœuds : il suffit d'appliquer le décorateur.

Les logs structurés alimentent également les métriques Prometheus : le décorateur incrémente les compteurs de durée et d'erreurs à chaque exécution de nœud, assurant la cohérence entre les deux sources d'information.

#intro-section[Sécurité et résilience]

Un système destiné à traiter des exigences fonctionnelles de sécurité automobile ne peut se permettre de négliger sa propre sécurité. Cette section présente les mécanismes mis en place pour protéger les données, garantir la disponibilité, et assurer l'isolation entre utilisateurs.
#intro-subsection[Flux d'écriture et de lecture]

Le cycle de vie des connaissances suit deux chemins distincts :

*Écriture* : Après chaque revue humaine, le nœud `"process_review"` extrait les feedbacks des cas rejetés. Chaque feedback est classifié (applicatif ou utilisateur), vérifié contre les doublons existants, puis stocké dans le niveau approprié. Un événement épisodique est simultanément enregistré.

*Lecture* : Avant chaque génération, le nœud `"plan_single_req"` interroge les trois niveaux de mémoire. Les connaissances pertinentes sont formatées en une section dédiée du prompt, précédée d'une instruction explicite : « applique toutes les règles et préférences ci-dessous ».

#intro-section[Architecture d'observabilité]

Un système qui fait appel à des modèles de langage externes introduit une part d'imprévisibilité que les applications traditionnelles ne connaissent pas. Un prompt qui fonctionnait hier peut produire des résultats différents aujourd'hui. Un appel API peut échouer sans raison apparente. Pour maîtriser cette complexité, **`"ADAS-R2T"`** met en place trois piliers d'observabilité complémentaires.

#intro-subsection[Traçage LLM *`"Langfuse"`*]

Langfuse est une plateforme open source spécialisée dans le suivi des applications basées sur des modèles de langage. Chaque appel LLM effectué par le pipeline est automatiquement tracé : le prompt envoyé, la réponse reçue, le nombre de tokens consommés, la durée de l'appel, et le modèle utilisé.

Ce niveau de détail permet d'identifier les prompts qui produisent des résultats insatisfaisants, de mesurer les coûts par exécution, et de comparer les performances entre différents modèles. Lorsqu'un cas de test généré est rejeté par l'utilisateur, l'équipe peut remonter dans Langfuse jusqu'au prompt exact qui l'a produit et comprendre pourquoi.

L'intégration est transparente : un callback LangChain enregistre automatiquement chaque interaction sans modifier le code des nœuds. La fonctionnalité s'active ou se désactive par simple configuration `"LANGFUSE_ENABLED"`.

#intro-subsection[Métriques opérationnelles ]

Prometheus collecte les métriques quantitatives du système à intervalles réguliers. Un middleware instrumente chaque requête HTTP, et des compteurs dédiés suivent les indicateurs spécifiques au pipeline :

- Nombre de pipelines exécutés, par mode et par statut (terminé, échoué, en pause).
- Durée d'exécution de chaque nœud du graphe.
- Nombre et durée des appels LLM, par fournisseur et par modèle.
- Décisions HITL : nombre d'approbations, de rejets, et de suppressions.
- Opérations mémoire : écritures, lectures, et doublons évités.
- Taux d'erreur par nœud et par type d'exception.

Grafana consomme ces métriques et les restitue sous forme de tableaux de bord. Le dashboard « `"ADAS-R2T Pipeline Monitor"` » offre une vue en temps réel organisée en sections : vue d'ensemble, performance par nœud, utilisation LLM, activité `"HITL"`, opérations mémoire, et santé de l'infrastructure.

L'ensemble est déployé via `"Docker Compose"`. `"Node Exporter"` collecte les métriques système (`"CPU"`, mémoire, disque), tandis que `"PostgreSQL Exporter"` remonte les indicateurs de la base de données (connexions actives, temps de réponse des requêtes).

#intro-subsection[Logging structuré *`"structlog"`*]

Le troisième pilier est le logging structuré. Contrairement aux logs textuels classiques, `"structlog"` produit des logs au format `"JSON"` où chaque information est un champ exploitable : nom du nœud, durée d'exécution, identifiant de session, nombre de résultats.

Un décorateur *`"log_node"`* enveloppe chaque nœud du graphe. Il enregistre automatiquement le début et la fin de l'exécution, la durée, et en cas d'erreur, le type d'exception et sa trace. Ce mécanisme ne nécessite aucune modification du code métier des nœuds : il suffit d'appliquer le décorateur.

Les logs structurés alimentent également les métriques Prometheus : le décorateur incrémente les compteurs de durée et d'erreurs à chaque exécution de nœud, assurant la cohérence entre les deux sources d'information.

#intro-section[Sécurité et résilience]

Un système destiné à traiter des exigences fonctionnelles de sécurité automobile ne peut se permettre de négliger sa propre sécurité. Cette section présente les mécanismes mis en place pour protéger les données, garantir la disponibilité, et assurer l'isolation entre utilisateurs.
#figure(
  block[
    #set text(
      font: "Times New Roman",
      size: 8.8pt,
    )

    #table(
      columns: (9.2cm, 7.2cm),
      inset: (x: 5pt, y: 7pt),
      stroke: none,
      align: (left, left),

      // Top rule
      table.hline(stroke: 0.8pt + black),

      // Header
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #align(left)[
            #text(weight: "bold", fill: ENIADBlue)[Point d’accès]
          ]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(left)[
            #text(weight: "bold", fill: ENIADBlue)[Limite]
          ]
        ],
      ),

      // Mid rule
      table.hline(stroke: 0.45pt + black),

      // Row 1
      [
        #text(weight: "bold", fill: ENIADBlue)[Endpoints généraux]
      ],
      [
        100 requêtes / minute
      ],

      // Row 2 - Zebra
      table.cell(fill: rgb("#F3F8FC"))[
        #text(weight: "bold", fill: ENIADBlue)[Pipeline \(run, resume\)]
      ],
      table.cell(fill: rgb("#F3F8FC"))[
        10 requêtes / heure
      ],

      // Row 3
      [
        #text(weight: "bold", fill: ENIADBlue)[Authentification]
      ],
      [
        20 requêtes / minute
      ],

      // Bottom rule
      table.hline(stroke: 0.8pt + black),
    )
  ],
  caption: [Limites de requêtes appliquées aux points d’accès de l’`"API"`],
  kind: table,
) <tab:rate-limits-api>
#v(1cm)
Ces limites sont appliquées par utilisateur et non globalement. Ainsi, un utilisateur qui atteint sa limite n'affecte pas les autres utilisateurs du système. La clé de limitation est dérivée de l'identifiant de l'utilisateur authentifié.


#adas-r2t-sequence-excel-generation()
// #intro-section[Vue d'ensemble]
// #intro-subsection[ Flux global]
// #intro-section[Vue d'ensemble]
// #intro-subsection[ Flux global]
#pagebreak()
``

// #set page(header: report-header, footer: report-footer)
