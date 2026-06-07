#import "@preview/cetz:0.5.2"
#import "../components.typ": *

#set page(header: [])

#outline-chapter[Introduction générale]

#chapter-cover(
  "1",
   text(
    fill: rgb("#000000"),
    font:"Serif",
  )[Contexte général du projet]
  ,
  subtitle: "Contexte, problématique, objectifs et Management du projet ",
)
#v(-1cm)
 #text(
    font:"Serif",
  )[== Présentation de Capgemini Engineering]
#set par(leading: 1.2em,
  justify: true,
)
 #text(
    size: 12pt,
    font:"Serif",
  )[
    === Historique et positionnement
    La transformation structurelle qui a façonné l'identité actuelle de l'entreprise remonte au 24 juin 2019, date à laquelle Capgemini et Altran ont annoncé un accord historique prévoyant l'acquisition d'Altran par Capgemini. Quelques mois plus tard, cette opération a abouti à un succès retentissant : le 1er avril 2020, l'introduction en bourse à l'amiable (OPA) a eu lieu. Dominique Cerutti, PDG d'Altran, a alors insisté sur le fait que cette alliance n'était pas une simple fusion, mais la naissance d'un géant mondial, leader du secteur de l'« Industrie Intelligente » et moteur de la transformation numérique des entreprises. Incarnant cette ambition commune, avril 2021 a marqué un tournant décisif : Altran a abandonné son ancien nom pour devenir Capgemini Engineering.
#v(0.5cm)
La figure @fig:historique-capgemini présente l’évolution historique de Capgemini Engineering au Maroc:
    ]

#align(center)[
    #v(0.5cm)
#figure(
  image(
    "../img/hst_1.png",
    width: 100%,
  ),
  caption: [historique de Capgemini Engineering],
) <fig:historique-capgemini>
]
#v(0.5cm)
#text(
    font:"Serif",
  )[=== Offres de services du Capgemini Engineering]

#set par(leading: 1.2em,
  justify: true,
)
 #text(
    size: 12pt,
    font:"Serif",
  )[
Les services du groupe couvrent l'intégralité du cycle de recherche et développement (R&D), englobant non seulement la conception, le développement et les tests, mais aussi l'innovation et le prototypage, ainsi que la fabrication, la production et les services après-vente. Grâce à cette combinaison unique d'expertise et de compétences innovantes, Capgemini Engineering propose des solutions sur mesure qui répondent aux besoins de ses clients dans six domaines d'activité clés :

Conseil : Nous mettons notre expertise à profit pour accompagner nos partenaires dans le développement de leurs processus opérationnels et l'élaboration de stratégies ambitieuses et innovantes qui façonneront leurs futurs produits et services. Solutions numériques : Nous accélérons la transformation numérique de nos clients en nous appuyant sur notre connaissance approfondie de leurs produits et chaînes industrielles, et sur l'expertise de nos ingénieurs spécialisés dans les technologies numériques de pointe. Ingénierie appliquée : Notre rôle consiste à permettre à nos clients d'innover et de développer de nouveaux produits et systèmes, de réduire les coûts et les délais de mise sur le marché, tout en améliorant l'efficacité des lignes de production et des processus industriels. Centres d'excellence mondiaux : Nous proposons des solutions et des services dans les domaines de haute technologie, en nous appuyant sur sept centres d'expertise mondiaux qui consolident les investissements et les actifs stratégiques du Groupe. Infrastructures industrielles mondiales : Nous permettons à nos clients de bénéficier d'un réseau mondial d'expertise qui allie des prix compétitifs aux plus hauts standards de qualité. Ce système de services d'ingénierie, de recherche et de développement repose sur cinq grands centres d'ingénierie répartis entre les régions nearshore et offshore. Cambridge Consultants : Notre branche spécialisée dans l'ingénierie et le développement de produits innovants uniques, où travaillent des équipes scientifiques et d'élite de haut niveau, appuyées par des laboratoires de pointe aux États-Unis et au Royaume-Uni.
=== Domaine d'activité de Capgemini Engineering 
L'entreprise s'appuie sur son expertise pointue en technologies numériques et solutions logicielles pour jouer un rôle clé dans le développement de l'« Industrie Intelligente ». Forte d'une force d'ingénierie et scientifique de plus de 55 000 experts répartis dans 50 pays, Capgemini Engineering est présente dans de nombreux secteurs stratégiques grâce à des partenariats avec des géants de l'industrie : Automobile : Notre activité se concentre sur l'accompagnement des principaux constructeurs et développeurs mondiaux, notamment des groupes comme Stellantis et Volkswagen (VW), ainsi que le leader des technologies automobiles Bosch. Aéronautique : Nous contribuons au développement de solutions aéronautiques en collaboration avec des acteurs majeurs tels qu'Airbus, Safran et Dassault Aviation. Ferroviaire : Nous relevons les défis des transports modernes à travers des projets d'envergure avec Alstom (y compris la division Bombardier récemment intégrée) et la SNCF. Sciences de la vie et santé : Nous sommes fortement présents auprès des leaders des industries pharmaceutiques et biotechnologiques tels que Sanofi et GSK.


=== Organisation de Capgemini Engineering au Maroc

Capgemini Engineering Maroc adopte une structure organisationnelle articulée autour
de quatre grands pôles. Cette structuration vise à assurer une gestion optimale des
projets, tout en favorisant l’expertise et la spécialisation technique [@fig:organisation-capgemini].
#v(0.5cm)
#capgemini-entity-direction-diagram() <fig:organisation-capgemini>
#v(0.5cm)
Notre stage a été effectué au sein de la division Global Engineering Unit Morocco,
un pôle stratégique regroupant plusieurs unités d’ingénierie spécialisées. Nous avons
été intégrés à l’Advanced Intelligent Systems Engineering Unit *(AIS)*, dirigée par M. Moulay El Ghil Hamdouchi. Cette unité est en charge du développement de solutions
intelligentes pour divers secteurs, notamment l’automobile, en s’appuyant sur des approches innovantes telles que les systèmes embarqués, l’ingénierie des systèmes et les
technologies avancées. Plus précisément, nous avons rejoint le département *EE ARCHITECTURE & SAFETY* 
au sein de l’équipe *SDA* [@fig:organisation-ais].
#v(0.5cm)
#ais-organization-diagram() <fig:organisation-ais>
#v(0.5cm)
 Dans cette organisation, notre travail s’inscrit plus particulièrement dans le sous-groupe *MBSE, RBSE, & System Engineers*, dont les activités sont liées à l’ingénierie des systèmes, à la modélisation des exigences, à la structuration des données techniques et à l’amélioration des processus de validation.
Ce positionnement nous a permis de travailler dans un environnement fortement orienté vers les systèmes automobiles intelligents et les méthodologies d’ingénierie avancées. Il constitue ainsi un cadre adapté pour le développement de notre projet ADAS-R2T, qui vise à assister les ingénieurs dans la transformation des exigences fonctionnelles ADAS en plans et cas de test structurés, traçables et exploitables.

=== Présentation de l'équipe *_SDA_*
#v(0.5cm)
#sda-definition-diagram()
#v(0.5cm)

== Présentation du projet ADAS-R2T
=== Problématique 
#adas-limitations-cards()
L'approche actuelle de conception et de développement des tests ADAS présente plusieurs obstacles structurels qui ont rendu cette recherche indispensable. Les principaux défauts peuvent être résumés comme suit : Charge de traitement manuel : La formulation des cas de test repose entièrement sur le travail manuel des ingénieurs de vérification, basé sur leur interprétation subjective des exigences fonctionnelles. Cette approche est non seulement chronophage, mais elle est aussi source d'erreurs d'interprétation et rend difficile la réplication des tests avec la même précision. Lacunes de couverture fonctionnelle : Tant que la conception est gérée manuellement, l'accent est naturellement mis sur les scénarios nominaux et idéaux, au détriment des cas limites, des scénarios défavorables et des conditions rares et complexes. Paradoxalement, c'est précisément dans ces environnements négligés que se cachent les erreurs les plus graves, celles qui ont le plus grand impact sur la sécurité des passagers. Absence de traçabilité systématique : Le système ne dispose pas d'un lien structurel clair et documenté entre l'exigence fonctionnelle initiale et les cas de test qui en découlent. Cette fragmentation rend l'évaluation de la couverture ou la mise à jour des ensembles de tests suite à une modification technique complexe et aléatoire. Lenteur du rythme de production et des flux de travail : L’ensemble du processus, de la réception des exigences à l’approbation de la version finale de test, prend plusieurs semaines, engendrant des goulots d’étranglement opérationnels qui retardent le déploiement sur le marché des fonctionnalités ADAS. Données de conduite réelles inutilisées : Bien que les entreprises possèdent des milliers d’heures d’enregistrements vidéo issus de véritables expériences de conduite sur route, cette mine de données en situation réelle reste inexploitée, ne permettant pas d’améliorer la qualité et la portée des tests. Compte tenu de ces facteurs, la problématique centrale de ce travail peut se résumer à la question suivante :
#v(0.4cm)
#info-box("Problématique")[
  Comment concevoir un processus automatisé capable de traduire les exigences fonctionnelles des systèmes ADAS, rédigées en langage naturel, en cas de test précis, sans compromettre l'exhaustivité, tout en garantissant un suivi rigoureux et des normes de qualité conformes aux exigences de l'industrie automobile ? Autrement dit, et plus fondamentalement : comment faire confiance à l'intelligence artificielle générative pour automatiser l'inspection des systèmes critiques pour la sécurité et assurer la surveillance des cas rares et limites, sans que ce système ne devienne une « boîte noire » opaque, dépourvue de tout contrôle humain ?
]


#v(0.157cm)
=== Objectifs du projet
À cette fin, la feuille de route du projet ADAS-R2T a été conçue pour se concentrer sur la réalisation des objectifs stratégiques suivants : Flux de travail entièrement automatisé (de bout en bout) : Nous visons à construire un cycle de traitement intégré qui démarre automatiquement dès l’importation du fichier d’exigences source (Excel) et se poursuit sans interruption jusqu’à la génération et l’extraction, dans le même format, du fichier de résultats structurés contenant les cas de test finaux. Couverture complète et multidimensionnelle : La plateforme ne se limitera pas à une analyse superficielle, mais est conçue pour décomposer chaque condition fonctionnelle selon cinq dimensions techniques (telles que les transitions d’état, les contraintes temporelles et les messages IHM). Cette approche garantit une génération structurée couvrant quatre catégories de tests : de routine, de pointe, inversés et rares. Traçabilité rigoureuse : Nous visons à établir un lien structurel indissociable entre chaque cas de test et sa source originale dans le cahier des charges en attribuant des identifiants uniques (identifiants uniques) permettant un audit inversé à tout moment. Inspection intelligente par analyse vidéo : L’un de nos principaux objectifs est de s’affranchir de la rigidité du texte en intégrant des scénarios extraits d’enregistrements de conduite réels. Cela confère aux tests un réalisme que les exigences théoriques seules ne peuvent atteindre. Conception d'une architecture flexible et indépendante des fournisseurs : nous avons conçu le système avec une architecture logicielle flexible qui lui permet de s'intégrer et de fonctionner de manière transparente avec divers fournisseurs de modèles de langage (tels que OpenAI, Gemini, ou même des modèles locaux via Ollama) sans qu'il soit nécessaire de réécrire ou de modifier le code source.
=== Expression des besoins
Dans le cadre de ce stage, les besoins suivants ont ete identifies en collaboration avec l'equipe encadrante :
#set text(
  font: "Times New Roman",
  size: 11pt,
)

#let requirements-table(title, columns, rows, caption-text) = [
  #v(0.4cm)

  #text(
    size: 13pt,
    weight: "bold",
    fill: rgb("#000000"),
  )[
    #title
  ]

  #v(0.25cm)
  #figure(
    table(
    columns: columns,
    inset: 7pt,
    stroke: 0.45pt + rgb("#BFC7D1"),
    fill: (x, y) => {
      if y == 0 {
        rgb(116, 145, 149)
      } else if calc.odd(y) {
        rgb("#F6FAFB")
      } else {
        white
      }
    },
    align: (x, y) => {
      if x == 0 { center } else { left }
    },

    ..rows
  
  ),
  caption: caption-text ,
    
  )
  
]

// ===============================
// Besoins Fonctionnels
// ===============================

#requirements-table(
  [- Besoins fonctionnels],
  
  (1.6cm, 1fr),
  (
    table.header(
      
      text(fill: white, weight: "bold")[ID],
      text(fill: white, weight: "bold")[Description du besoin fonctionnel],
    ),

    [*BF01*],
    [Le système doit accepter un fichier Excel contenant des exigences fonctionnelles ADAS et générer un fichier Excel de cas de test.],

    [*BF02*],
    [Le système doit accepter une vidéo de conduite et extraire des scénarios de test avec raisonnement causal : cause, effet et conséquence.],

    [*BF03*],
    [Le système doit supporter trois modes d’entrée : Excel seul, vidéo seule, et Excel + vidéo.],

    [*BF04*],
    [Le système doit permettre à l’utilisateur de revoir les résultats avant le téléchargement : approbation, rejet avec feedback ou suppression.],

    [*BF05*],
    [Le système doit régénérer uniquement les cas de test rejetés sans relancer tout le pipeline.],

    [*BF06*],
    [Le système doit afficher la progression en temps réel pendant la génération à travers un mécanisme de streaming SSE.],

    [*BF07*],
    [Le système doit maintenir un historique des versions et des révisions : v1, v2, v3, etc.],

    [*BF08*],
    [Le système doit évaluer automatiquement 100 % des cas de test générés afin de détecter les contradictions, les éléments hors périmètre et les doublons.],

    [*BF09*],
    [Le système doit apprendre des feedbacks utilisateurs à travers une mémoire à long terme, incluant des règles partagées et des préférences personnelles.],

    [*BF10*],
    [Le système doit supporter plusieurs utilisateurs simultanément avec isolation des données.]
  ),
  [Liste des besoins fonctionnels]
)

#v(0.6cm)

// ===============================
// Besoins Non Fonctionnels
// ===============================

#requirements-table(
  [- Besoins non fonctionnels],
  (1.6cm, 3.2cm, 1fr),
  (
    table.header(
      text(fill: white, weight: "bold")[ID],
      text(fill: white, weight: "bold")[Catégorie],
      text(fill: white, weight: "bold")[Description du besoin non fonctionnel],
    ),

    [*BNF01*],
    [Performance],
    [La génération doit s’effectuer en moins de 120 secondes pour 10 exigences.],

    [*BNF02*],
    [Scalabilité],
    [L’architecture doit supporter l’ajout de nouvelles fonctions ADAS sans modification majeure.],

    [*BNF03*],
    [Disponibilité],
    [Le système doit reprendre après un crash sans perte de données.],

    [*BNF04*],
    [Sécurité],
    [Les checkpoints doivent être chiffrés. L’authentification par clé API est obligatoire.],

    [*BNF05*],
    [Maintenabilité],
    [Le code doit être modulaire, documenté et un logging structuré.],

    [*BNF06*],
    [Portabilité],
    [Le système doit être déployable sur tout environnement.],

    [*BNF07*],
    [Interopérabilité],
    [Le système doit communiquer via une API REST .]
  ),
  [Liste des besoins non fonctionnels]
)
#text(
    weight: "semibold",
    size: 14pt,
    fill: rgb("#000000"),
  )[
    === Méthodologie de Travail
  ]
  Concernant la gestion de projet, nous avons opté pour la méthodologie Agile Scrum en raison de sa grande flexibilité, qui facilite la communication et simplifie la coordination quotidienne. Bien que cette méthodologie ait été initialement conçue pour des équipes plus importantes, nous l'avons adaptée avec succès à notre fonctionnement en duo (Binôme). Cette approche nous a permis de nous adapter rapidement aux évolutions techniques et de mener à bien les tâches sans tomber dans l'imprévisibilité, garantissant ainsi la livraison d'un produit de qualité conforme aux attentes. Pour concrétiser cette vision, nous avons adopté un ensemble de bonnes pratiques : Définition des fonctionnalités et structuration du projet : Nous avons commencé par définir les fonctionnalités requises à partir d'une analyse des besoins techniques, puis nous avons divisé le projet en périodes spécifiques (sprints) et en livrables minimums (MVP). Décomposition des tâches : Chaque sprint a été décomposé en tâches plus petites et détaillées, précisément réparties pour faciliter le suivi quotidien. Communication quotidienne avec le superviseur : Nous avons veillé à avoir une brève discussion quotidienne avec le superviseur pour le tenir informé de l'avancement du travail et nous assurer que nous étions sur la bonne voie. Réunion hebdomadaire prolongée (tous les mardis) : Nous organisons une réunion régulière avec tous les stagiaires de l’équipe. Cette réunion permet d’échanger des points de vue, de faire le point sur l’avancement de chaque projet, d’aborder les difficultés techniques courantes et de définir les prochaines étapes. Séance d’auto-évaluation (tous les vendredis) : Nous tenons une réunion de clôture pour la semaine, consacrée aux trois questions essentielles de la méthodologie Scrum :
#set par(first-line-indent: 0.7cm)

  -- Quelles sont les tâches effectuées ?

  -- Quelles sont les difficultés rencontrées ?

  -- Quelles sont les tâches futures à réaliser ?

- Une réunion mensuelle où nous essayons de montrer l’importance de notre projet
et l’efficacité de nos solutions.
#set par(first-line-indent: 0cm)
=== Approche de recherche


Pour inscrire ce travail dans une perspective scientifique, nous avons identifié la méthodologie de la Recherche en Sciences de la Conception (RSC) comme le cadre et le guide idéal pour notre projet. Ce choix découle de la nature même de cette méthodologie : elle constitue l’option la plus appropriée lorsque l’objectif est de créer des solutions pratiques à des problèmes réels et complexes, grâce à un processus itératif alternant conception, construction et évaluation continue de l’impact technique ou logiciel (artefact). Contrairement aux approches traditionnelles qui se contentent d’observer ou d’interpréter des phénomènes, la RSC se concentre sur la conception d’outils fonctionnels utilisables et mesurables sur le terrain. C’est précisément ce qui s’applique à notre projet, où l’impact logiciel représente ici un flux de travail dynamique (Workflow) que nous avons construit à partir de LangGraph afin de générer des tests ADAS de manière structurée et évolutive. La méthodologie DSR a été mise en œuvre dans notre projet à travers deux cycles successifs de développement et d'évaluation : le premier cycle, axé sur l'établissement du noyau de base du flux de travail, a consisté à définir les composants essentiels du système, à ajuster les mécanismes de réception des données d'entrée, à concevoir la logique de traitement et à définir la structure d'état qui régit le graphe. Le second cycle, consacré au raffinement et à l'amélioration, a porté sur le renforcement des mécanismes d'auto-vérification et d'autocontrôle au sein du graphe, ainsi que sur le renforcement de la logique de génération afin d'améliorer la qualité et la fiabilité des résultats finaux. Cette progression itérative illustre parfaitement la philosophie DSR, fondée sur la triade « Construire, Évaluer, Améliorer en continu ». Enfin, la conception de cette solution n'était pas accidentelle, mais plutôt basée sur une double base de connaissances : un aspect technique lié à la physique de la construction de systèmes basés sur des graphes et de sorties régies par des états (Stateful Systems) dans l'environnement LangGraph, et un aspect industriel conforme aux exigences strictes et précises des tests de systèmes ADAS dans le secteur automobile.
// Ainsi, DSR a permis de relier les exigences de la réalité pratique aux fondements théoriques et techniques, puis de transformer le tout en un système pouvant être évalué et amélioré.
=== Planification du projet
Afin de garantir le respect du calendrier de formation et une gestion efficace du temps, le projet a fait l'objet d'une planification par phases rigoureuse. Nous avons décomposé la feuille de route en tâches et sous-thèmes plus petits, directement liés à chaque version des livrables initiaux (MVP). Le diagramme suivant résume la séquence chronologique et les interrelations structurelles de ces tâches tout au long du projet :
#v(0.05cm)
#project-planning-gantt-modern() <fig:planning-projet>
]




