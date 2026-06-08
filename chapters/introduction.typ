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


#import "../components.typ": *

#place(
  top + left,
  dx: -2.2cm,
  dy: -2cm,
)[
  #rect(
    width: 1cm,
    height: 120%,
    fill: rgb("#70b2ca15"),
  )
]
#frontmatter-banner("Introduction générale")

#set text(
  font: "Times New Roman",
  size: 12pt,
)
#set par(spacing: 1.5em)

#set par(
  justify: true,
  leading: 1.15em,
)

#text[
L'industrie automobile traverse actuellement une période charnière, marquée par la transformation des véhicules en plateformes mobiles intelligentes. Au cœur de cette révolution se trouvent les systèmes avancés d'aide à la conduite (ADAS), piliers indispensables pour redéfinir la sécurité routière et offrir une expérience de conduite plus confortable et plus sûre. Ces systèmes englobent un large éventail de technologies essentielles, du régulateur de vitesse adaptatif (ACC) et du freinage d'urgence automatique (AEB) à l'assistance au maintien de voie (LKA), à l'alerte de collision frontale (FCW) et à la reconnaissance des panneaux de signalisation (TSR). Malgré leurs fonctions variées, leur objectif est unique : analyser l'environnement du véhicule, le relief de la route et intervenir en temps opportun pour protéger le conducteur. Cependant, cette intelligence représente un défi d'ingénierie : la complexité fonctionnelle de ces systèmes croît rapidement. Chaque fonction ADAS est régie par un cahier des charges technique rigoureux qui définit précisément les conditions d'activation, les seuils de réponse, les changements d'état, les messages d'avertissement et les contraintes temporelles. Ceci souligne l'importance cruciale de la phase de validation dans le cycle de développement du véhicule. Sans elle, la sécurité et la fiabilité de ces fonctions critiques ne peuvent être garanties. En réalité, l'élaboration de plans et de scénarios de test est la pierre angulaire des équipes de vérification. C'est une tâche exigeante qui requiert une analyse minutieuse de chaque exigence fonctionnelle afin de surveiller les scénarios normaux, les situations critiques et les conditions rares. Cependant, ce processus reste largement manuel dans de nombreux environnements industriels, ce qui le rend chronophage, dépendant de l'expertise individuelle des ingénieurs et sujet aux erreurs d'interprétation ou à une couverture incomplète des exigences. C'est pourquoi les technologies d'intelligence artificielle, et plus particulièrement les grands modèles de langage (LLM), représentent une option prometteuse pour le développement et l'automatisation des processus de test, grâce à leur grande capacité d'analyse du langage naturel et d'extraction de données structurées. Mais dans un secteur aussi sensible que l'automobile, la simple « génération de texte » ne suffit pas ; nous avons absolument besoin d'un environnement de travail qui garantisse un suivi, une correction et une traçabilité rigoureux des résultats. Dans cette optique, notre projet de fin d'études, conçu au sein de Capgemini Engineering, vise à construire et développer une plateforme intelligente que nous avons nommée ADAS-R2T (Exigences vers Tests). La plateforme vise à assister les ingénieurs ADAS en convertissant automatiquement les exigences de leurs projets en plans et tests structurés et interconnectés. Notre solution repose sur une approche d'IA multi-agents, où le travail est réparti entre un réseau d'agents numériques spécialisés. Chaque agent logiciel prend en charge une tâche spécifique, de l'analyse des exigences et l'extraction d'indicateurs à la formulation des plans de test, l'évaluation des taux de couverture et l'amélioration des résultats. Cette approche dépasse la génération aveugle traditionnelle et s'inscrit dans le domaine de la planification et de l'auto-surveillance. Sur le plan structurel, ces modèles de langage sont intégrés au framework LangGraph pour gérer le dialogue et la coordination entre les agents. Forts de cette dynamique technologique, nous avons veillé à intégrer le principe de « l'humain dans la boucle » afin que la décision finale revienne à l'expert humain. L'objectif n'est pas de remplacer l'ingénieur, mais de lui fournir un outil intelligent qui lui permette de gagner du temps et assure un suivi précis entre l'état initial et l'état final du test. Techniquement, la plateforme repose sur une architecture logicielle flexible et évolutive, s'appuyant sur les services backend FastAPI et fonctionnant dans des conteneurs Docker pour faciliter son déploiement en milieu industriel. Elle est optimisée par un système de surveillance et d'analyse continue des performances. La valeur ajoutée de ce travail réside dans la création d'un parcours intelligent intégré pour l'automatisation des tests ADAS, l'augmentation de la couverture fonctionnelle et la garantie d'un suivi complet des exigences, tout en préservant le rôle de la supervision humaine à l'ère de l'intelligence artificielle. Cette recherche est divisée en cinq chapitres principaux : 


- Chapitre 1 : Contexte général du projet, problématique, objectifs et méthodologie.

- Chapitre 2 : Contexte de l'étude et dernières avancées scientifiques dans les domaines des systèmes ADAS, de l'intelligence artificielle générative et des systèmes multi-agents. 

- Chapitre 3 : Architecture structurelle de la plateforme ADAS-R2T et mécanismes de coordination entre ses agents. 

- Chapitre 4 : Aborde les aspects pratiques, les outils de développement et les options logicielles. 

- Chapitre 5 : Analyse les résultats obtenus, évalue les performances du système et ouvre des perspectives de développement futur.
]

#pagebreak()
