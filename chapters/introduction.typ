// #import "../components.typ": *

// #set page(header: [])

// #outline-chapter[Introduction générale]

// #chapter-cover(
//   "1",
//   "Introduction générale",
//   subtitle: "Contexte, objectifs et organisation du mémoire",
// )


// #import "../components.typ": *

// #set page(header: [])

// #outline-chapter[Introduction générale]

// #chapter-cover(
//   "1",
//    text(
//     fill: rgb("#000000"),
//     font:"Serif",
//   )[Introduction générale]
//   ,
//   subtitle: "Contexte, problématique, objectifs et organisation du mémoire",
// )
// #v(-1cm)
//  #text(
//     font:"Serif",
//   )[== Contexte général]
// #set par(leading: 1.2em,
//   justify: true,
// )
//  #text(
//     size: 12pt,
//     font:"Serif",
//   )[L'industrie automobile traverse une transformation profonde portée par l'intégration croissante de systèmes intelligents dans les véhicules. Parmi ces avancées, les systèmes avancés d'aide à la conduite (ADAS) occupent une place centrale. Ces systèmes — régulateur de vitesse adaptatif (ACC), freinage d'urgence automatique (AEB), aide au maintien de voie (LKA) — contribuent à la réduction des accidents et à l'amélioration du confort de conduite. Leur complexité fonctionnelle ne cesse cependant de croître, imposant des processus de validation de plus en plus rigoureux.

// Dans ce contexte, la vérification des exigences fonctionnelles ADAS représente un enjeu stratégique pour les équipementiers et constructeurs automobiles. Chaque fonction ADAS est définie par un ensemble d'exigences formelles qui décrivent les conditions d'activation, les seuils de déclenchement, les comportements attendus, les contraintes temporelles et les messages conducteur. À partir de ces exigences, les équipes de validation doivent concevoir des cas de test exhaustifs couvrant les scénarios nominaux, les cas limites, les situations d'erreur et les scénarios rares.

// Ce stage de fin d'études s'inscrit dans cette problématique et a été réalisé au sein de *Capgemini Engineering*, acteur majeur du conseil et de l'ingénierie dans le secteur automobile.]

// #text(
//     font:"Serif",
//   )[== Problématique]

// #set par(leading: 1.2em,
//   justify: true,
// )
//  #text(
//     size: 12pt,
//     font:"Serif",
//   )[
// Le processus actuel de génération des cas de test ADAS présente plusieurs limitations structurelles qui motivent cette recherche :

// *Génération manuelle.* Les cas de test sont aujourd'hui rédigés manuellement par les ingénieurs de validation, à partir de leur lecture et interprétation des exigences fonctionnelles. Ce processus est chronophage, sujet aux erreurs d'interprétation et difficilement reproductible.

// *Couverture incomplète.* La conception manuelle tend à privilégier les scénarios nominaux au détriment des cas limites (_boundary_), des scénarios négatifs et des situations
// #set page(header: report-header, footer: report-footer)

//  rares, ce sont précisément ces cas qui révèlent les défauts les plus critiques dans les systèmes de sécurité.

// *Absence de traçabilité structurée.* Le lien entre une exigence source et les cas de test qui la couvrent n'est pas toujours formalisé, rendant difficile l'analyse de couverture et la maintenance des suites de tests.

// *Temps de cycle élevé.* Le cycle complet — de la réception des exigences à la livraison des cas de test validés — peut s'étendre sur plusieurs semaines, retardant la mise sur le marché des fonctions ADAS.

// *Pas d'exploitation des données de conduite.* Les vidéos de conduite réelle, riches en scénarios de terrain, ne sont pas exploitées pour enrichir la conception des tests.

// La problématique centrale de ce travail peut ainsi se formuler :
// #v(0.4cm)
// #info-box("Problématique")[
//   Comment automatiser la génération de cas de test ADAS à partir d'exigences fonctionnelles en langage naturel, tout en garantissant une couverture complète, une traçabilité rigoureuse et une qualité conforme aux standards de l'industrie automobile ?
// ]

// == Objectifs du projet

// Pour répondre à cette problématique, le projet ADAS-R2T (_Requirements to Tests_) poursuit les objectifs suivants :

// + *Automatiser la chaîne complète* de transformation des exigences en cas de test : de l'ingestion du fichier Excel source jusqu'à la génération du fichier Excel de sortie contenant les cas de test structurés.

// + *Garantir une couverture exhaustive* en analysant chaque exigence selon cinq dimensions complémentaires (transitions d'état, contraintes temporelles, messages HMI, calculs, cas génériques) et en générant systématiquement quatre catégories de tests : nominal, boundary, negative et rare.

// + *Assurer la traçabilité* entre chaque cas de test généré et l'exigence source, avec un identifiant unique et un lien explicite.

// + *Intégrer l'analyse vidéo* pour enrichir les cas de test avec des scénarios extraits de vidéos de conduite réelle, apportant un réalisme que la seule lecture des exigences ne peut fournir.

// + *Concevoir un système vendor-agnostic* capable de fonctionner avec différents fournisseurs de modèles de langage (OpenAI, Ollama, Gemini) sans modification du code.
// #v(-0.1cm)
// == Choix de l'approche : IA Agentique
// #v(-0.1cm)

// Une question fondamentale s'est posée dès le début du projet : faut-il utiliser l'IA Générative (GenAI) classique ou l'IA Agentique pour résoudre ce problème ?

// Pour trancher, nous avons appliqué une *matrice de décision à cinq questions* issue de la littérature :

// #v(0.157cm)

// #figure(
//   table(
//     columns: (auto, 1fr, auto),
//     inset: 8pt,
//     stroke: 0.5pt + rgb("#D1D5DB"),
//     fill: (x, y) => if y == 0 { rgb(94, 177, 163) } else if calc.odd(y) { rgb("#F8FAFC") } else { white },
//     align: (center, left, center),
//     table.header(
//       text(fill: white, weight: "bold")[Critère],
//       text(fill: white, weight: "bold")[Analyse du projet],
//       text(fill: white, weight: "bold")[Résultat],
//     ),
//     [*Sortie*], [Le projet demande un résultat exécuté (fichier Excel structuré, KPIs de couverture), pas seulement du texte généré.], [Agentique],
//     [*Trajectoire*], [Le flux est dynamique et cyclique : générer → évaluer → corriger → régénérer. Les étapes ne sont pas linéaires.], [Agentique],
//     [*Erreur*], [Le système doit s'auto-corriger : si la couverture est insuffisante, il relance la génération ciblée sans intervention humaine.], [Agentique],
//     [*Interaction*], [L'humain définit l'objectif (les exigences) et le système conduit le processus complet de bout en bout.], [Agentique],
//     [*État*], [Le système modifie l'environnement : il lit des fichiers, exécute des analyses, génère des fichiers de sortie.], [Agentique],
//   ),
//   caption: [Application de la matrice de décision GenAI vs Agentique au projet ADAS-R2T.],
// ) <tab:decision-matrix>
// #v(0.5cm)
// Le résultat est unanime : #text("5 critères sur 5", weight: "bold",fill: rgb(94, 177, 163)) orientent vers l'IA Agentique. Le système ne se contente pas de générer du contenu — il planifie, exécute, évalue et corrige de manière autonome.

// == Organisation du mémoire

// Ce mémoire est structuré en cinq chapitres :

// *Chapitre 2 — État de l'art.* Présente les fondements théoriques nécessaires : l'évolution de l'IA générative vers l'IA agentique, les patrons architecturaux des systèmes multi-agents, les frameworks d'orchestration (LangGraph) et les travaux existants en génération automatique de tests.

// *Chapitre 3 — Architecture du système.* Détaille l'architecture complète du pipeline ADAS-R2T : les 18 nœuds, les quatre stages, les mécanismes de parallélisation, le routage conditionnel et la boucle d'évaluation-correction.

// *Chapitre 4 — Implémentation.* Décrit les choix techniques, la couche LLM vendor-agnostic, le framework مِصْبَاح pour l'ingénierie des prompts, l'intégration de l'analyse vidéo et le déploiement via FastAPI.

// *Chapitre 5 — Évaluation.* Présente les résultats quantitatifs et qualitatifs, l'évolution des métriques de qualité au fil des itérations et les limites identifiées.

// *Conclusion.* Synthétise les contributions, discute les limitations et propose des perspectives d'évolution.
// ]


// #import "../components.typ": *

// #place(
//   top + left,
//   dx: -2.2cm,
//   dy: -2cm,
// )[
//   #rect(
//     width: 1cm,
//     height: 120%,
//     fill: rgb("#70b2ca15"),
//   )
// ]
// #frontmatter-banner("Introduction générale")

// #set text(
//   font: "Times New Roman",
//   size: 12pt,
// )
// #set par(spacing: 1.5em)

// #set par(
//   justify: true,
//   leading: 1.15em,
// )

// #text[
// L'industrie automobile traverse actuellement une période charnière, marquée par la transformation des véhicules en plateformes mobiles intelligentes. Au cœur de cette révolution se trouvent les systèmes avancés d'aide à la conduite (ADAS), piliers indispensables pour redéfinir la sécurité routière et offrir une expérience de conduite plus confortable et plus sûre. Ces systèmes englobent un large éventail de technologies essentielles, du régulateur de vitesse adaptatif (ACC) et du freinage d'urgence automatique (AEB) à l'assistance au maintien de voie (LKA), à l'alerte de collision frontale (FCW) et à la reconnaissance des panneaux de signalisation (TSR). Malgré leurs fonctions variées, leur objectif est unique : analyser l'environnement du véhicule, le relief de la route et intervenir en temps opportun pour protéger le conducteur. Cependant, cette intelligence représente un défi d'ingénierie : la complexité fonctionnelle de ces systèmes croît rapidement. Chaque fonction ADAS est régie par un cahier des charges technique rigoureux qui définit précisément les conditions d'activation, les seuils de réponse, les changements d'état, les messages d'avertissement et les contraintes temporelles. Ceci souligne l'importance cruciale de la phase de validation dans le cycle de développement du véhicule. Sans elle, la sécurité et la fiabilité de ces fonctions critiques ne peuvent être garanties. En réalité, l'élaboration de plans et de scénarios de test est la pierre angulaire des équipes de vérification. C'est une tâche exigeante qui requiert une analyse minutieuse de chaque exigence fonctionnelle afin de surveiller les scénarios normaux, les situations critiques et les conditions rares. Cependant, ce processus reste largement manuel dans de nombreux environnements industriels, ce qui le rend chronophage, dépendant de l'expertise individuelle des ingénieurs et sujet aux erreurs d'interprétation ou à une couverture incomplète des exigences. C'est pourquoi les technologies d'intelligence artificielle, et plus particulièrement les grands modèles de langage (LLM), représentent une option prometteuse pour le développement et l'automatisation des processus de test, grâce à leur grande capacité d'analyse du langage naturel et d'extraction de données structurées. Mais dans un secteur aussi sensible que l'automobile, la simple « génération de texte » ne suffit pas ; nous avons absolument besoin d'un environnement de travail qui garantisse un suivi, une correction et une traçabilité rigoureux des résultats. Dans cette optique, notre projet de fin d'études, conçu au sein de Capgemini Engineering, vise à construire et développer une plateforme intelligente que nous avons nommée ADAS-R2T (Exigences vers Tests). La plateforme vise à assister les ingénieurs ADAS en convertissant automatiquement les exigences de leurs projets en plans et tests structurés et interconnectés. Notre solution repose sur une approche d'IA multi-agents, où le travail est réparti entre un réseau d'agents numériques spécialisés. Chaque agent logiciel prend en charge une tâche spécifique, de l'analyse des exigences et l'extraction d'indicateurs à la formulation des plans de test, l'évaluation des taux de couverture et l'amélioration des résultats. Cette approche dépasse la génération aveugle traditionnelle et s'inscrit dans le domaine de la planification et de l'auto-surveillance. Sur le plan structurel, ces modèles de langage sont intégrés au framework LangGraph pour gérer le dialogue et la coordination entre les agents. Forts de cette dynamique technologique, nous avons veillé à intégrer le principe de « l'humain dans la boucle » afin que la décision finale revienne à l'expert humain. L'objectif n'est pas de remplacer l'ingénieur, mais de lui fournir un outil intelligent qui lui permette de gagner du temps et assure un suivi précis entre l'état initial et l'état final du test. Techniquement, la plateforme repose sur une architecture logicielle flexible et évolutive, s'appuyant sur les services backend FastAPI et fonctionnant dans des conteneurs Docker pour faciliter son déploiement en milieu industriel. Elle est optimisée par un système de surveillance et d'analyse continue des performances. La valeur ajoutée de ce travail réside dans la création d'un parcours intelligent intégré pour l'automatisation des tests ADAS, l'augmentation de la couverture fonctionnelle et la garantie d'un suivi complet des exigences, tout en préservant le rôle de la supervision humaine à l'ère de l'intelligence artificielle. Cette recherche est divisée en cinq chapitres principaux : 


// - *Chapitre 1* : Contexte général du projet, problématique, objectifs et méthodologie.

// - *Chapitre 2* : Contexte de l'étude et dernières avancées scientifiques dans les domaines des systèmes ADAS, de l'intelligence artificielle générative et des systèmes multi-agents. 

// - *Chapitre 3* : Architecture structurelle de la plateforme ADAS-R2T et mécanismes de coordination entre ses agents. 

// - *Chapitre 4* : Aborde les aspects pratiques, les outils de développement et les options logicielles. 

// - *Chapitre 5* : Analyse les résultats obtenus, évalue les performances du système et ouvre des perspectives de développement futur.
// ]

// #pagebreak()

// #import "../components.typ": *

// #set page(
//   header: [],
//   footer: [],
// )

// #set text(
//   font: "Times New Roman",
//   size: 12pt,
// )

// #set par(
//   justify: true,
//   leading: 1.15em,
//   first-line-indent: 0.6cm,
// )

// // =====================================================
// // Style du titre principal : Introduction Générale
// // =====================================================

// #show heading.where(level: 1): it => [
//   #v(1.2cm)

//   #text(
//     font: "Times New Roman",
//     size: 24pt,
//     weight: "bold",
//     fill: rgb("#0B1F3A"),
//   )[
//     #it.body
//   ]

//   #v(0.7cm)

//   #line(
//     length: 100%,
//     stroke: 1.4pt + rgb("#F28C28"),
//   )

//   #v(1cm)
// ]

// // =====================================================
// // Compteur dynamique pour les sections de l'introduction
// // Donne : 0.1, 0.2, 0.3 ...
// // =====================================================

// #let intro-section-counter = counter("intro-section")

// // Reset du compteur au début de l'introduction
// #intro-section-counter.update(0)

// #let intro-section(title) = [
//   #intro-section-counter.step()

//   #context {
//     let n = intro-section-counter.get().at(0)

//     [
//       #v(0.9cm)

//       #text(
//         font: "Times New Roman",
//         size: 17pt,
//         weight: "bold",
//         fill: rgb("#004B8D"),
//       )[
//         #("0." + str(n)) #h(0.6cm) #title
//       ]

//       #v(0.55cm)

//       #line(
//         length: 100%,
//         stroke: 0.8pt + rgb("#B8CADC"),
//       )

//       #v(0.55cm)
//     ]
//   }
// ]

// // =====================================================
// // Note box style
// // =====================================================

// #let eniad-note(body) = block(
//   width: 100%,
//   inset: 0pt,
//   stroke: 0.8pt + rgb("#004B8D"),
//   radius: 4pt,
// )[
//   #block(
//     width: 100%,
//     inset: (x: 8pt, y: 4pt),
//     fill: rgb("#004B8D"),
//     radius: (top-left: 4pt, top-right: 4pt),
//   )[
//     #text(
//       font: "Times New Roman",
//       size: 10.5pt,
//       weight: "bold",
//       fill: white,
//     )[
//       ⓘ Note
//     ]
//   ]

//   #block(
//     width: 100%,
//     inset: 10pt,
//     fill: rgb("#EAF4FF"),
//     radius: (bottom-left: 4pt, bottom-right: 4pt),
//   )[
//     #set par(
//       justify: true,
//       leading: 1.1em,
//       first-line-indent: 0cm,
//     )

//     #text(
//       font: "Times New Roman",
//       size: 11pt,
//       fill: black,
//     )[
//       #body
//     ]
//   ]
// ]

// // =====================================================
// // Introduction Générale
// // =====================================================

// #heading(
//   level: 1,
//   numbering: none,
//   outlined: true,
// )[Introduction Générale]

// La révolution numérique et l’essor de l’intelligence artificielle transforment profondément les pratiques industrielles et scientifiques. Dans ce contexte, les ingénieurs en *Intelligence Artificielle et Digital* sont appelés à concevoir des solutions innovantes pour des problématiques réelles et complexes.

// Le présent rapport décrit le travail réalisé au sein de *Capgemini Engineering*, sous la direction de *Nom du Professeur 3* et l’encadrement industriel de *M./Mme Prénom NOM, Titre*.

// #intro-section[Présentation Générale]

// Cette section présente le contexte général du projet : l’organisme d’accueil, la problématique traitée et les objectifs visés. Une bonne introduction doit permettre au lecteur de comprendre l’enjeu du travail.

// #eniad-note[
//   Le rapport est organisé en *cinq chapitres*. Le premier présente le contexte général du projet, le second détaille l’état de l’art, le troisième décrit l’architecture proposée, le quatrième présente l’implémentation technique, et le dernier expose les résultats obtenus ainsi que les perspectives d’amélioration.
// ]

// #intro-section[Contexte du Projet]

// Le projet s’inscrit dans le domaine des systèmes avancés d’aide à la conduite, appelés *ADAS* (*Advanced Driver Assistance Systems*). Ces systèmes jouent un rôle essentiel dans l’amélioration de la sécurité routière, du confort de conduite et de l’assistance au conducteur.

// Dans un environnement industriel, la validation des fonctions ADAS repose sur l’analyse d’exigences fonctionnelles, la conception de plans de test et la génération de cas de test couvrant différents scénarios de conduite. Toutefois, ces activités restent souvent réalisées manuellement, ce qui peut entraîner une charge importante pour les ingénieurs, des délais élevés et une couverture fonctionnelle parfois incomplète.

// #intro-section[Problématique Générale]

// La génération manuelle des cas de test ADAS présente plusieurs limites. Elle demande une expertise importante, nécessite un temps considérable et peut conduire à des erreurs d’interprétation ou à l’oubli de scénarios rares mais critiques. De plus, la traçabilité entre les exigences sources et les cas de test générés n’est pas toujours garantie de manière systématique.

// Dans ce contexte, la problématique principale de ce projet consiste à automatiser la transformation des exigences fonctionnelles ADAS en plans et cas de test structurés, tout en assurant la qualité, la couverture et la traçabilité des résultats produits.

// #intro-section[Objectifs du Projet]

// Les objectifs principaux du projet sont les suivants :

// #set list(
//   marker: [•],
//   indent: 1.3em,
//   body-indent: 0.6em,
//   spacing: 0.35em,
// )

// - *Automatiser* la génération des cas de test à partir d’exigences fonctionnelles ADAS.
// - *Améliorer* la couverture des scénarios de validation, notamment les cas limites, négatifs et rares.
// - *Garantir* la traçabilité entre les exigences sources et les cas de test produits.
// - *Intégrer* une approche d’intervention humaine afin de permettre à l’expert de valider les résultats.
// - *Réduire* le temps nécessaire à la préparation des campagnes de validation.

// #intro-section[Approche Proposée]

// Pour répondre à cette problématique, le projet adopte une approche basée sur l’*IA agentique*. Contrairement à une approche d’IA générative classique, qui se limite principalement à produire du contenu textuel, l’IA agentique repose sur la coordination de plusieurs agents spécialisés capables de planifier, exécuter, évaluer et corriger différentes étapes du processus.

// Dans le cadre de ce projet, chaque agent prend en charge une tâche spécifique : analyse des exigences, extraction des informations clés, génération des plans de test, production des cas de test, évaluation de la couverture et amélioration des résultats. Cette organisation permet de rendre le système plus robuste, plus contrôlable et mieux adapté aux contraintes du domaine automobile.

// L’architecture de la plateforme s’appuie sur des grands modèles de langage (*LLM*) et sur le framework *LangGraph* pour orchestrer les interactions entre les différents agents. Une approche *Human-in-the-Loop* est également intégrée afin de maintenir l’expert humain comme décideur final dans le processus de validation.

// #intro-section[Organisation du Mémoire]

// Le présent mémoire est structuré comme suit :

// #set list(
//   marker: ([•], [—]),
//   indent: 1.3em,
//   body-indent: 0.6em,
//   spacing: 0.35em,
// )

// - *Chapitre 1 :* Contexte général du projet, présentation de l’organisme d’accueil, problématique, cahier des charges et méthodologie de travail.
// - *Chapitre 2 :* État de l’art relatif aux systèmes ADAS, à l’intelligence artificielle générative, aux grands modèles de langage et aux architectures agentiques.
// - *Chapitre 3 :* Présentation de l’architecture globale de la plateforme ADAS-R2T et des différents agents qui la composent.
// - *Chapitre 4 :* Implémentation technique de la solution, outils utilisés, backend, orchestration, déploiement et supervision.
// - *Chapitre 5 :* Évaluation des résultats obtenus, analyse des performances, limites identifiées et perspectives d’amélioration.

// #pagebreak()

// #import "../components.typ": *

// #set page(
//   header: [],
//   footer: report-footer,
// )

// #set text(
//   font: "Times New Roman",
//   size: 12pt,
// )

// #set par(
//   justify: true,
//   leading: 1.15em,
//   first-line-indent: 0.6cm,
// )

// // =====================================================
// // Style du titre principal
// // =====================================================

// #show heading.where(level: 1): it => [
//   #v(1.2cm)

//   #text(
//     font: "Times New Roman",
//     size: 24pt,
//     weight: "bold",
//     fill: ENIADBlue,
//   )[
//     #it.body
//   ]

//   #v(0.6cm)

//   #line(
//     length: 100%,
//     stroke: 1.4pt + ENIADOrange,
//   )

//   #v(1cm)
// ]

// // =====================================================
// // Compteur dynamique 0.1, 0.2, ...
// // =====================================================

// #let intro-section-counter = counter("intro-section")
// #intro-section-counter.update(0)

// #let intro-section(title) = [
//   #intro-section-counter.step()

//   #context {
//     let n = intro-section-counter.get().at(0)

//     [
//       #v(0.9cm)

//       #text(
//         font: "Times New Roman",
//         size: 17pt,
//         weight: "bold",
//         fill: ENIADBlue,
//       )[
//         #("0." + str(n)) #h(0.6cm) #title
//       ]

//       #v(0.35cm)

//       #line(
//         length: 100%,
//         stroke: 0.6pt + ENIADBlue.lighten(65%),
//       )

//       #v(0.55cm)
//     ]
//   }
// ]

// // =====================================================
// // Introduction Générale
// // =====================================================

// #heading(
//   level: 1,
//   numbering: none,
//   outlined: true,
// )[Introduction Générale]

// L'industrie automobile traverse actuellement une période charnière, marquée par la transformation des véhicules en plateformes mobiles intelligentes. Au cœur de cette révolution se trouvent les systèmes avancés d'aide à la conduite (ADAS), piliers indispensables pour redéfinir la sécurité routière et offrir une expérience de conduite plus confortable et plus sûre. Ces systèmes englobent un large éventail de technologies essentielles, du régulateur de vitesse adaptatif (ACC) et du freinage d'urgence automatique (AEB) à l'assistance au maintien de voie (LKA), à l'alerte de collision frontale (FCW) et à la reconnaissance des panneaux de signalisation (TSR). Malgré leurs fonctions variées, leur objectif est unique : analyser l'environnement du véhicule, le relief de la route et intervenir en temps opportun pour protéger le conducteur. Cependant, cette intelligence représente un défi d'ingénierie : la complexité fonctionnelle de ces systèmes croît rapidement. Chaque fonction ADAS est régie par un cahier des charges technique rigoureux qui définit précisément les conditions d'activation, les seuils de réponse, les changements d'état, les messages d'avertissement et les contraintes temporelles. Ceci souligne l'importance cruciale de la phase de validation dans le cycle de développement du véhicule. Sans elle, la sécurité et la fiabilité de ces fonctions critiques ne peuvent être garanties. En réalité, l'élaboration de plans et de scénarios de test est la pierre angulaire des équipes de vérification. C'est une tâche exigeante qui requiert une analyse minutieuse de chaque exigence fonctionnelle afin de surveiller les scénarios normaux, les situations critiques et les conditions rares. Cependant, ce processus reste largement manuel dans de nombreux environnements industriels, ce qui le rend chronophage, dépendant de l'expertise individuelle des ingénieurs et sujet aux erreurs d'interprétation ou à une couverture incomplète des exigences. C'est pourquoi les technologies d'intelligence artificielle, et plus particulièrement les grands modèles de langage (LLM), représentent une option prometteuse pour le développement et l'automatisation des processus de test, grâce à leur grande capacité d'analyse du langage naturel et d'extraction de données structurées. Mais dans un secteur aussi sensible que l'automobile, la simple « génération de texte » ne suffit pas ; nous avons absolument besoin d'un environnement de travail qui garantisse un suivi, une correction et une traçabilité rigoureux des résultats. Dans cette optique, notre projet de fin d'études, conçu #set page(header: report-header, footer: report-footer)  

// au sein de Capgemini Engineering, vise à construire et développer une plateforme intelligente que nous avons nommée ADAS-R2T (Exigences vers Tests). La plateforme vise à assister les ingénieurs ADAS en convertissant automatiquement les exigences de leurs projets en plans et tests structurés et interconnectés. Notre solution repose sur une approche d'IA multi-agents, où le travail est réparti entre un réseau d'agents numériques spécialisés. Chaque agent logiciel prend en charge une tâche spécifique, de l'analyse des exigences et l'extraction d'indicateurs à la formulation des plans de test, l'évaluation des taux de couverture et l'amélioration des résultats. Cette approche dépasse la génération aveugle traditionnelle et s'inscrit dans le domaine de la planification et de l'auto-surveillance. Sur le plan structurel, ces modèles de langage sont intégrés au framework LangGraph pour gérer le dialogue et la coordination entre les agents. Forts de cette dynamique technologique, nous avons veillé à intégrer le principe de « l'humain dans la boucle » afin que la décision finale revienne à l'expert humain. L'objectif n'est pas de remplacer l'ingénieur, mais de lui fournir un outil intelligent qui lui permette de gagner du temps et assure un suivi précis entre l'état initial et l'état final du test. Techniquement, la plateforme repose sur une architecture logicielle flexible et évolutive, s'appuyant sur les services backend FastAPI et fonctionnant dans des conteneurs Docker pour faciliter son déploiement en milieu industriel. Elle est optimisée par un système de surveillance et d'analyse continue des performances. La valeur ajoutée de ce travail réside dans la création d'un parcours intelligent intégré pour l'automatisation des tests ADAS, l'augmentation de la couverture fonctionnelle et la garantie d'un suivi complet des exigences, tout en préservant le rôle de la supervision humaine à l'ère de l'intelligence artificielle.

// Le présent rapport décrit le travail réalisé au sein de *#pfeCompanyName*.

// #intro-section[Présentation de Capgemini Engineering]

// === Historique et positionnement
//     Capgemini et Altran ont annoncé, le 24 juin 2019, un accord portant sur l’acquisition
// de la société Altran par Capgemini. Le 1er avril 2020, l’OPA amicale de Capgemini
// sur Altran a été finalisée. Dominique Cerutti, directeur général d’Altran, a confirmé
// que cette acquisition allait créer un leader mondial de l’industrie intelligente au service
// de la transformation numérique des entreprises. En avril 2021, Altran est devenue
// *Capgemini Engineering*.

// #intro-section[Contexte du Projet]

// Le projet s’inscrit dans le domaine des systèmes avancés d’aide à la conduite, appelés *ADAS* (*Advanced Driver Assistance Systems*). Ces systèmes jouent un rôle essentiel dans l’amélioration de la sécurité routière, du confort de conduite et de l’assistance au conducteur.

// Dans un environnement industriel, la validation des fonctions ADAS repose sur l’analyse d’exigences fonctionnelles, la conception de plans de test et la génération de cas de test couvrant différents scénarios de conduite. Toutefois, ces activités restent souvent réalisées manuellement, ce qui peut entraîner une charge importante pour les ingénieurs, des délais élevés et une couverture fonctionnelle parfois incomplète.

// #intro-section[Objectifs du Projet]

// Les objectifs principaux du projet sont :

// #set list(
//   marker: [•],
//   indent: 1.3em,
//   body-indent: 0.6em,
//   spacing: 0.35em,
// )

// - *Automatiser* la génération des cas de test à partir d’exigences fonctionnelles ADAS.
// - *Améliorer* la couverture des scénarios de validation.
// - *Garantir* la traçabilité entre les exigences sources et les cas de test produits.
// - *Intégrer* une approche Human-in-the-Loop pour maintenir l’expert au centre du processus.
// - *Réduire* le temps nécessaire à la préparation des campagnes de validation.

// #intro-section[Organisation du Mémoire]

// Le présent mémoire est structuré comme suit :

// - *Chapitre 1 :* Contexte général du projet, présentation de l’organisme d’accueil, problématique, cahier des charges et méthodologie de travail.
// - *Chapitre 2 :* État de l’art relatif aux systèmes ADAS, à l’intelligence artificielle générative, aux grands modèles de langage et aux architectures agentiques.
// - *Chapitre 3 :* Présentation de l’architecture globale de la plateforme ADAS-R2T.
// - *Chapitre 4 :* Implémentation technique de la solution.
// - *Chapitre 5 :* Évaluation des résultats obtenus, limites et perspectives.

// #pagebreak()
// ``
// 
#import "../components.typ": *
#import "@preview/cetz:0.5.2"
#import "../components.typ": *
#set page(
  header: [],
  footer: report-footer,
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
  #v(1.2cm)

  #text(
    font: "Times New Roman",
    size: 24pt,
    weight: "bold",
    fill: ENIADBlue,
  )[
    #it.body
  ]

  #v(0.6cm)

  #line(
    length: 100%,
    stroke: 1.4pt + ENIADOrange,
  )

  #v(1cm)
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

// =====================================================
// Section dynamique : 0.1, 0.2, 0.3 ...
// =====================================================

// #let intro-section(title) = [
//   #intro-section-counter.step()
//   #intro-subsection-counter.update(0)

//   #context {
//     let n = intro-section-counter.get().at(0)

//     [
//       #v(0.9cm)

//       #text(
//         font: "Times New Roman",
//         size: 17pt,
//         weight: "bold",
//         fill: ENIADBlue,
//       )[
//         #("0." + str(n)) #h(0.6cm) #title
//       ]

//       #v(0.35cm)

//       #line(
//         length: 100%,
//         stroke: 0.6pt + ENIADBlue.lighten(65%),
//       )

//       #v(0.55cm)
//     ]
//   }
// ]

#let intro-section(title) = [
  #intro-section-counter.step()
  #intro-subsection-counter.update(0)

  #context {
    let n = intro-section-counter.get().at(0)

    [
      #heading(
        level: 1,
        numbering: none,
        outlined: true,
      )[0.#n #title]

      #v(0.9cm)

      #text(
        size: 17pt,
        weight: "bold",
        fill: ENIADBlue,
      )[
        #("0." + str(n)) #h(0.6cm) #title
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

// =====================================================
// Sous-section dynamique : 0.1.1, 0.1.2 ...
// =====================================================

// #let intro-subsection(title) = [
//   #intro-subsection-counter.step()

//   #context {
//     let s = intro-section-counter.get().at(0)
//     let ss = intro-subsection-counter.get().at(0)

//     [
//       #v(0.45cm)

//       #text(
//         font: "Times New Roman",
//         size: 13pt,
//         weight: "bold",
//         fill: ENIADDark,
//       )[
//         #("0." + str(s) + "." + str(ss)) #h(0.45cm) #title
//       ]

//       #v(0.25cm)
//     ]
//   }
// ]

#let intro-subsection(title) = [
  #intro-subsection-counter.step()

  #context {
    let s = intro-section-counter.get().at(0)
    let ss = intro-subsection-counter.get().at(0)

    [
      #heading(
        level: 2,
        numbering: none,
        outlined: true,
      )[0.#s.#ss #title]

      #v(0.45cm)

      #text(
        size: 13pt,
        weight: "bold",
      )[
        #("0." + str(s) + "." + str(ss)) #h(0.45cm) #title
      ]

      #v(0.25cm)
    ]
  }
]

// =====================================================
// Introduction Générale
// =====================================================

#heading(
  level: 1,
  numbering: none,
  outlined: true,
)[Introduction Générale]

L’industrie automobile traverse actuellement une période charnière, marquée par la transformation des véhicules en plateformes mobiles intelligentes. Au cœur de cette révolution se trouvent les systèmes avancés d’aide à la conduite (ADAS), piliers indispensables pour redéfinir la sécurité routière et offrir une expérience de conduite plus confortable et plus sûre.

Ces systèmes englobent un large éventail de technologies essentielles, du régulateur de vitesse adaptatif (ACC) et du freinage d’urgence automatique (AEB) à l’assistance au maintien de voie (LKA), à l’alerte de collision frontale (FCW) et à la reconnaissance des panneaux de signalisation (TSR). Malgré leurs fonctions variées, leur objectif est unique : analyser l’environnement du véhicule, interpréter les situations de conduite et intervenir en temps opportun pour protéger le conducteur.

Cependant, cette intelligence représente un défi d’ingénierie : la complexité fonctionnelle de ces systèmes croît rapidement. Chaque fonction ADAS est régie par un cahier des charges technique rigoureux qui définit précisément les conditions d’activation, les seuils de réponse, les changements d’état, les messages d’avertissement et les contraintes temporelles. Ceci souligne l’importance cruciale de la phase de validation dans le cycle de développement du véhicule. Sans elle, la sécurité et la fiabilité de ces fonctions critiques ne peuvent être garanties.

En réalité, l’élaboration de plans et de scénarios de test est la pierre angulaire des équipes de vérification. C’est une tâche exigeante qui requiert une analyse minutieuse de chaque exigence fonctionnelle afin de couvrir les scénarios nominaux, les situations critiques et les conditions rares. Cependant, ce processus reste largement manuel dans de nombreux environnements industriels, ce qui le rend chronophage, dépendant de l’expertise individuelle des ingénieurs et sujet aux erreurs d’interprétation ou à une couverture incomplète des exigences.

C’est pourquoi les technologies d’intelligence artificielle, et plus particulièrement les grands modèles de langage (LLM), représentent une option prometteuse pour le développement et l’automatisation des processus de test, grâce à leur capacité d’analyse du langage naturel et d’extraction de données structurées. Mais dans un secteur aussi sensible que l’automobile, la #set page(header: report-header, footer: report-footer) 
 simple génération de texte ne suffit pas ; il est nécessaire de disposer d’un environnement de travail garantissant un suivi, une correction et une traçabilité rigoureux des résultats.

Dans cette optique, notre projet de fin d’études, conçu au sein de Capgemini Engineering, vise à construire et développer une plateforme intelligente que nous avons nommée ADAS-R2T (Requirements to Tests). La plateforme vise à assister les ingénieurs ADAS en convertissant automatiquement les exigences fonctionnelles en plans de test et cas de test structurés, cohérents et traçables.

Notre solution repose sur une approche d’IA multi-agents, où le travail est réparti entre un réseau d’agents numériques spécialisés. Chaque agent logiciel prend en charge une tâche spécifique, depuis l’analyse des exigences et l’extraction d’indicateurs jusqu’à la formulation des plans de test, l’évaluation de la couverture et l’amélioration des résultats. Cette approche dépasse la génération traditionnelle et s’inscrit dans une logique de planification, d’évaluation et d’auto-correction.

Techniquement, la plateforme repose sur une architecture logicielle flexible et évolutive, s’appuyant sur les services backend FastAPI et fonctionnant dans des conteneurs Docker pour faciliter son déploiement en milieu industriel. Elle est également optimisée par un système de surveillance et d’analyse continue des performances. La valeur ajoutée de ce travail réside dans la création d’un parcours intelligent intégré pour l’automatisation des tests ADAS, l’augmentation de la couverture fonctionnelle et la garantie d’un suivi complet des exigences, tout en préservant le rôle de la supervision humaine à l’ère de l’intelligence artificielle.

Le présent rapport décrit le travail réalisé au sein de #text(weight: "bold")[#pfeCompanyName].


// =====================================================
// 0.4 Organisation du Mémoire
// =====================================================


Le présent mémoire est structuré comme suit :

#set list(
  marker: ([•], [—]),
  indent: 1.3em,
  body-indent: 0.6em,
  spacing: 0.35em,
)

- *Chapitre 1 :* Contexte général du projet, présentation de l’organisme d’accueil, problématique, cahier des charges et méthodologie de travail.
\
- *Chapitre 2 :* État de l’art relatif aux systèmes ADAS, à l’intelligence artificielle générative, aux grands modèles de langage et aux architectures agentiques.
\
- *Chapitre 3 :* Présentation de l’architecture globale de la plateforme ADAS-R2T.
\
- *Chapitre 4 :* Implémentation technique de la solution.
\
- *Chapitre 5 :* Évaluation des résultats obtenus, limites et perspectives.


// // =====================================================
// // 0.1 Présentation de Capgemini Engineering
// // =====================================================

// #intro-section[Présentation de Capgemini Engineering]

// #intro-subsection[Historique et positionnement]

// Capgemini et Altran ont annoncé, le 24 juin 2019, un accord portant sur l’acquisition de la société Altran par Capgemini. Le 1er avril 2020, l’OPA amicale de Capgemini sur Altran a été finalisée. Dominique Cerutti, directeur général d’Altran, a confirmé que cette acquisition allait créer un leader mondial de l’industrie intelligente au service de la transformation numérique des entreprises. En avril 2021, Altran est devenue *Capgemini Engineering*.
// #v(0.5cm)
// La figure @fig:historique-capgemini présente l’évolution historique de Capgemini Engineering au Maroc:
    

// #align(center)[
//     #v(0.5cm)
// #figure(
//   image(
//     "../img/hst_1.png",
//     width: 100%,
//   ),
//   caption: [historique de Capgemini Engineering],
// ) <fig:historique-capgemini>
// ]
// #v(0.5cm)

// #intro-subsection[Offres des services du Capgemini Engineering]

// Les offres du groupe suivent l’ensemble du cycle de RD : conception, développement,
// test, innovation et prototypage, et accompagne également l’industrialisation, le service
// après-vente et la production. Elle est caractérisée avec son fort et unique savoir-faire en
// matière d’innovation, Capgemini Engineering répond aux besoins de ses clients dans 6
// catégories d’activités :
// *- Consulting :* Accompagne les clients du Groupe dans la transformation de leursopérations, les conseille dans la définition de leurs stratégies en matière d’innovation et de leurs services et produits futurs.
 

// *- Digital :* Accompagne les clients dans leur transformation digitale par le biais de
// la capitalisation sur sa connaissance de leurs produits et processus industriels, et
// sur l’expertise de ses ingénieurs spécialisés dans les métiers du numérique.
 
// *- Engineering :* aide les clients du Groupe dans le développement de nouveaux
// produits et système tout en réduisant leurs délais de mise sur le marché et leurs
// coûts, et les accompagne dans l’amélioration de leurs processus industriels et leurs
// systèmes de production.

// *- World Class Centers :* propose les solutions et les services dans des domaines
// de pointe en s’appuyant sur sept centres d’expertise mondiaux regroupant les
// investissements et actifs du Groupe correspondant. 


// *- Industrialized Global Shore :* permet aux clients de bénéficier d’une expertise
// globale et de réunir la compétitivité et les normes de qualité les plus élevés. Cette
// solution industrielle de prestations de services d’ingénierie et de RD du Groupe
// repose sur 5 centres d’ingénierie mondiaux, situés Near- et offshore. 

// *- Cambridge Consultants :* spécialisé dans le développement de produits innovants, accompagné par des équipes scientifiques de haut niveau, et s’appuyant
// sur des laboratoires dédiés aux États-Unis et Royaume-Uni.


// #intro-subsection[Domaine d'activité de Capgemini Engineering ]

// Grâce à une maîtrise avancée des technologies digitales et logicielles, l’entreprise joue
// un rôle clé dans la transformation des industries vers l’Intelligent Industry. Avec plus de
// 55 000 ingénieurs et scientifiques répartis dans plus de 50 pays, Capgemini Engineering
// intervient dans des secteurs variés tels que :
 
//  *— Secteur automobile :* elle travaille principalement STELLANTIS (Ex. PSA),
// Le constructeur automobile WW et BOSCH.
 
//  *— Secteur aéronautique :* SAFRAN, AIRBUS, DASSAULT AVIATION.
 
//  *— Secteur ferroviaire :* ALSTOM, SNCF, BOMBARDIER.
 
//  *— Secteur Sciences de la vie :* SANOFI, GSK.


// // =====================================================
// // 0.2 Contexte du Projet
// // =====================================================

// #intro-subsection[Organisation de Capgemini Engineering au Maroc]
// Capgemini Engineering Maroc adopte une structure organisationnelle articulée autour
// de quatre grands pôles. Cette structuration vise à assurer une gestion optimale des
// projets, tout en favorisant l’expertise et la spécialisation technique [@fig:organisation-capgemini].
// #v(0.5cm)
// #capgemini-entity-direction-diagram() <fig:organisation-capgemini>
// #v(0.5cm)
// Notre stage a été effectué au sein de la division Global Engineering Unit Morocco,
// un pôle stratégique regroupant plusieurs unités d’ingénierie spécialisées. Nous avons
// été intégrés à l’Advanced Intelligent Systems Engineering Unit *(AIS)*, dirigée par M. Moulay El Ghil Hamdouchi. Cette unité est en charge du développement de solutions
// intelligentes pour divers secteurs, notamment l’automobile, en s’appuyant sur des approches innovantes telles que les systèmes embarqués, l’ingénierie des systèmes et les
// technologies avancées. Plus précisément, nous avons rejoint le département *EE ARCHITECTURE & SAFETY* 
// au sein de l’équipe *SDA* [@fig:organisation-ais].
// #v(0.28cm)
// #ais-organization-diagram() <fig:organisation-ais>
// #v(0.5cm)
//  Dans cette organisation, notre travail s’inscrit plus particulièrement dans le sous-groupe *MBSE, RBSE, & System Engineers*, dont les activités sont liées à l’ingénierie des systèmes, à la modélisation des exigences, à la structuration des données techniques et à l’amélioration des processus de validation.
// Ce positionnement nous a permis de travailler dans un environnement fortement orienté vers les systèmes automobiles intelligents et les méthodologies d’ingénierie avancées. Il constitue ainsi un cadre adapté pour le développement de notre projet *ADAS-R2T*, qui vise à assister les ingénieurs dans la transformation des exigences fonctionnelles *ADAS* en plans et cas de test structurés, traçables et exploitables.

// #intro-subsection[Présentation de l'équipe *_SDA_*]
// #v(0.1cm)
// #sda-definition-diagram()
// #v(0.5cm)

// #intro-section[ Présentation du projet ADAS-R2T]
// #intro-subsection[Problématique] 
// #adas-limitations-cards()
// L'approche actuelle de conception et de développement des tests *ADAS* présente plusieurs obstacles structurels qui ont rendu cette recherche indispensable. Les principaux défauts peuvent être résumés comme suit : 

// - *Charge de traitement manuel :* La formulation des cas de test repose entièrement sur le travail manuel des ingénieurs de vérification, basé sur leur interprétation subjective des exigences fonctionnelles. Cette approche est non seulement chronophage, mais elle est aussi source d'erreurs d'interprétation et rend difficile la réplication des tests avec la même précision. 

// - *Lacunes de couverture fonctionnelle :* Tant que la conception est gérée manuellement, l'accent 
//  est naturellement mis sur les scénarios nominaux et idéaux, au détriment des cas limites, des scénarios défavorables et des conditions rares et complexes. Paradoxalement, c'est précisément dans ces environnements négligés que se cachent les erreurs les plus graves, celles qui ont le plus grand impact sur la sécurité des passagers. 
 
// - *Absence de traçabilité systématique :* Le système ne dispose pas d'un lien structurel clair et documenté entre l'exigence fonctionnelle initiale et les cas de test qui en découlent. Cette fragmentation rend l'évaluation de la couverture ou la mise à jour des ensembles de tests suite à une modification technique complexe et aléatoire. 
 
// - *Lenteur du rythme de production et des flux de travail :* L’ensemble du processus, de la réception des exigences à l’approbation de la version finale de test, prend plusieurs semaines, engendrant des goulots d’étranglement opérationnels qui retardent le déploiement sur le marché des fonctionnalités ADAS. 
 
// - *Données de conduite réelles inutilisées :* Bien que les entreprises possèdent des milliers d’heures d’enregistrements vidéo issus de véritables expériences de conduite sur route, cette mine de données en situation réelle reste inexploitée, ne permettant pas d’améliorer la qualité et la portée des tests. Compte tenu de ces facteurs, la problématique centrale de ce travail peut se résumer à la question suivante :
// #v(0.4cm)

// #eniad-warning[
//   Comment concevoir un processus automatisé capable de traduire les exigences fonctionnelles des systèmes ADAS, rédigées en langage naturel, en cas de test précis, sans compromettre l'exhaustivité, tout en garantissant un suivi rigoureux et des normes de qualité conformes aux exigences de l'industrie automobile ? Autrement dit, et plus fondamentalement : comment faire confiance à l'intelligence artificielle générative pour automatiser l'inspection des systèmes critiques pour la sécurité et assurer la surveillance des cas rares et limites, sans que ce système ne devienne une « boîte noire » opaque, dépourvue de tout contrôle humain ?
// ]

// #intro-subsection[Objectifs du projet]
// À cette fin, la feuille de route du projet *ADAS-R2T* a été conçue pour se concentrer sur la réalisation des objectifs stratégiques suivants : 

// - *Flux de travail entièrement automatisé (de bout en bout) :* Nous visons à construire un cycle de traitement intégré qui démarre automatiquement dès l’importation du fichier d’exigences source (Excel) et se poursuit sans interruption jusqu’à la génération et l’extraction, dans le même format, du fichier de résultats structurés contenant 
//  les cas de test finaux. 
 
// - *Couverture complète et multidimensionnelle :* La plateforme ne se limitera pas à une analyse superficielle, mais est conçue pour décomposer chaque condition fonctionnelle selon cinq dimensions techniques (telles que les transitions d’état, les contraintes temporelles et les messages IHM). Cette approche garantit une génération structurée couvrant quatre catégories de tests : de routine, de pointe, inversés et rares. 
 
// - *Traçabilité rigoureuse :* Nous visons à établir un lien structurel indissociable entre chaque cas de test et sa source originale dans le cahier des charges en attribuant des identifiants uniques (identifiants uniques) permettant un audit inversé à tout moment. 
 
// - *Inspection intelligente par analyse vidéo :* L’un de nos principaux objectifs est de s’affranchir de la rigidité du texte en intégrant des scénarios extraits d’enregistrements de conduite réels. Cela confère aux tests un réalisme que les exigences théoriques seules ne peuvent atteindre. 
 
// - *Conception d'une architecture flexible et indépendante des fournisseurs :* nous avons conçu le système avec une architecture logicielle flexible qui lui permet de s'intégrer et de fonctionner de manière transparente avec divers fournisseurs de modèles de langage (tels que OpenAI, Gemini, ou même des modèles locaux via Ollama) sans qu'il soit nécessaire de réécrire ou de modifier le code source.
// #intro-subsection[Expression des besoins]
// Dans le cadre de ce stage, les besoins suivants ont ete identifies en collaboration avec l'equipe encadrante :
// Le tableau  présente une comparaison des frameworks d’apprentissage automatique.

// #requirements-section-tables()











// #intro-section[Contexte du Projet]

// Le projet s’inscrit dans le domaine des systèmes avancés d’aide à la conduite, appelés *ADAS* (*Advanced Driver Assistance Systems*). Ces systèmes jouent un rôle essentiel dans l’amélioration de la sécurité routière, du confort de conduite et de l’assistance au conducteur.

// Dans un environnement industriel, la validation des fonctions ADAS repose sur l’analyse d’exigences fonctionnelles, la conception de plans de test et la génération de cas de test couvrant différents scénarios de conduite. Toutefois, ces activités restent souvent réalisées manuellement, ce qui peut entraîner une charge importante pour les ingénieurs, des délais élevés et une couverture fonctionnelle parfois incomplète.

// #intro-subsection[Limites du processus actuel]

// Le processus actuel présente plusieurs limites. D’une part, la génération manuelle des cas de test nécessite un effort important et dépend fortement de l’expertise des ingénieurs. D’autre part, certains scénarios rares ou critiques peuvent être oubliés lors de la conception manuelle. Enfin, la traçabilité entre les exigences sources et les cas de test produits n’est pas toujours assurée de manière systématique.

// #intro-subsection[Enjeux industriels]

// L’amélioration du processus de validation ADAS constitue un enjeu important pour réduire le temps de développement, améliorer la qualité des tests et accélérer la mise sur le marché des fonctions automobiles. Dans ce contexte, l’intégration de l’intelligence artificielle permet d’envisager de nouvelles approches pour assister les ingénieurs dans leurs tâches quotidiennes.

// // =====================================================
// // 0.3 Objectifs du Projet
// // =====================================================

// #intro-section[Objectifs du Projet]

// Les objectifs principaux du projet sont :

// #set list(
//   marker: [•],
//   indent: 1.3em,
//   body-indent: 0.6em,
//   spacing: 0.35em,
// )

// - *Automatiser* la génération des cas de test à partir d’exigences fonctionnelles ADAS.
// - *Améliorer* la couverture des scénarios de validation.
// - *Garantir* la traçabilité entre les exigences sources et les cas de test produits.
// - *Intégrer* une approche *Human-in-the-Loop* pour maintenir l’expert au centre du processus.
// - *Réduire* le temps nécessaire à la préparation des campagnes de validation.

// #intro-subsection[Objectifs techniques]

// Sur le plan technique, le projet vise à mettre en place une architecture modulaire basée sur des agents spécialisés, intégrée à un backend applicatif et capable d’interagir avec différents modèles de langage. Cette architecture doit également permettre le suivi des performances, la journalisation des traitements et la supervision des résultats.

// #intro-subsection[Objectifs métier]

// Sur le plan métier, le projet vise à faciliter le travail des ingénieurs de validation ADAS en leur fournissant un outil d’aide à la génération des plans et des cas de test. La solution doit contribuer à améliorer la qualité des livrables, réduire les erreurs d’interprétation et renforcer la traçabilité des résultats.

// // =====================================================
// // 0.4 Organisation du Mémoire
// // =====================================================

// #intro-section[Organisation du Mémoire]

// Le présent mémoire est structuré comme suit :

// #set list(
//   marker: ([•], [—]),
//   indent: 1.3em,
//   body-indent: 0.6em,
//   spacing: 0.35em,
// )

// - *Chapitre 1 :* Contexte général du projet, présentation de l’organisme d’accueil, problématique, cahier des charges et méthodologie de travail.
// - *Chapitre 2 :* État de l’art relatif aux systèmes ADAS, à l’intelligence artificielle générative, aux grands modèles de langage et aux architectures agentiques.
// - *Chapitre 3 :* Présentation de l’architecture globale de la plateforme ADAS-R2T.
// - *Chapitre 4 :* Implémentation technique de la solution.
// - *Chapitre 5 :* Évaluation des résultats obtenus, limites et perspectives.

// #pagebreak()