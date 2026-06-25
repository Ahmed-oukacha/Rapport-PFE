#import "../components.typ": *

#eniad-chapter(
  "1",
  [Contexte général du projet]
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
      // ✅ لSommaire
      #hide[
        #heading(
          level: 2,
          numbering: none,
          outlined: true,
        )[ #chapter.#section #title ]
      ]

      // ✅ display الحقيقي
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

#intro-section[Présentation de Capgemini Engineering]

#intro-subsection[Historique et positionnement]

Capgemini et Altran ont annoncé, le 24 juin 2019, un accord portant sur l’acquisition de la société Altran par Capgemini. Le 1er avril 2020, l’OPA amicale de Capgemini sur Altran a été finalisée. Dominique Cerutti, directeur général d’Altran, a confirmé que cette acquisition allait créer un leader mondial de l’industrie intelligente au service de la transformation numérique des entreprises. En avril 2021, Altran est devenue *Capgemini Engineering*.
#v(0cm)
 @fig:historique-capgemini présente l’évolution historique de Capgemini Engineering au Maroc:
    
#align(center)[
    
#figure(
  image(
    "../img/historique.jpeg",
    width: 100%,
    height: 7cm,
  ),
  caption: [historique de Capgemini Engineering],
) <fig:historique-capgemini>
]
#v(0.5cm)
#set page(header: report-header, footer: report-footer)

#intro-subsection[Offres des services du Capgemini Engineering]

Les offres du groupe suivent l’ensemble du cycle de RD : conception, développement,
test, innovation et prototypage, et accompagne également l’industrialisation, le service
après-vente et la production. Elle est caractérisée avec son fort et unique savoir-faire en
matière d’innovation, Capgemini Engineering répond aux besoins de ses clients dans 6
catégories d’activités :
*- Consulting :* Accompagne les clients du Groupe dans la transformation de leursopérations, les conseille dans la définition de leurs stratégies en matière d’innovation et de leurs services et produits futurs.
 #v(0.6cm)

*- Digital :* Accompagne les clients dans leur transformation digitale par le biais de
la capitalisation sur sa connaissance de leurs produits et processus industriels, et
sur l’expertise de ses ingénieurs spécialisés dans les métiers du numérique.


*- Engineering :* aide les clients du Groupe dans le développement de nouveaux
produits et système tout en réduisant leurs délais de mise sur le marché et leurs
coûts, et les accompagne dans l’amélioration de leurs processus industriels et leurs
systèmes de production.

*- World Class Centers :* propose les solutions et les services dans des domaines
de pointe en s’appuyant sur sept centres d’expertise mondiaux regroupant les
investissements et actifs du Groupe correspondant. 


*- Industrialized Global Shore :* permet aux clients de bénéficier d’une expertise
globale et de réunir la compétitivité et les normes de qualité les plus élevés. Cette
solution industrielle de prestations de services d’ingénierie et de RD du Groupe
repose sur 5 centres d’ingénierie mondiaux, situés Near- et offshore. 

*- Cambridge Consultants :* spécialisé dans le développement de produits innovants, accompagné par des équipes scientifiques de haut niveau, et s’appuyant
sur des laboratoires dédiés aux États-Unis et Royaume-Uni.


#intro-subsection[Domaine d'activité de Capgemini Engineering ]

Grâce à une maîtrise avancée des technologies digitales et logicielles, l’entreprise joue
un rôle clé dans la transformation des industries vers l’Intelligent Industry. Avec plus de
55 000 ingénieurs et scientifiques répartis dans plus de 50 pays, Capgemini Engineering
intervient dans des secteurs variés tels que :
 
 *— Secteur automobile :* elle travaille principalement STELLANTIS (Ex. PSA),
Le constructeur automobile WW et BOSCH.
 
 *— Secteur aéronautique :* SAFRAN, AIRBUS, DASSAULT AVIATION.
 
 *— Secteur ferroviaire :* ALSTOM, SNCF, BOMBARDIER.
 
 *— Secteur Sciences de la vie :* SANOFI, GSK.


// =====================================================
// 0.2 Contexte du Projet
// =====================================================

#intro-subsection[Organisation de Capgemini Engineering au Maroc]
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
#v(0.28cm)
#ais-organization-diagram() <fig:organisation-ais>
#v(0.5cm)
 Dans cette organisation, notre travail s’inscrit plus particulièrement dans le sous-groupe *MBSE, RBSE, & System Engineers*, dont les activités sont liées à l’ingénierie des systèmes, à la modélisation des exigences, à la structuration des données techniques et à l’amélioration des processus de validation.
Ce positionnement nous a permis de travailler dans un environnement fortement orienté vers les systèmes automobiles intelligents et les méthodologies d’ingénierie avancées. Il constitue ainsi un cadre adapté pour le développement de notre projet , qui vise à assister les ingénieurs dans la transformation des exigences fonctionnelles *ADAS* en plans et cas de test structurés, traçables et exploitables.

#intro-subsection[Présentation de l'équipe *_SDA_*]
#sda-definition-diagram()
#v(0.5cm)

#intro-section[ Présentation du projet ADAS-R2T]
#intro-subsection[Problématique] 
#adas-limitations-cards()
L'approche actuelle de conception et de développement des tests *ADAS* présente plusieurs obstacles structurels qui ont rendu cette recherche indispensable. Les principaux défauts peuvent être résumés comme suit : 

- *Charge de traitement manuel :* La formulation des cas de test repose entièrement sur le travail manuel des ingénieurs de vérification, basé sur leur interprétation subjective des exigences fonctionnelles. Cette approche est non seulement chronophage, mais elle est aussi source d'erreurs d'interprétation et rend difficile la réplication des tests avec la même précision. 

- *Lacunes de couverture fonctionnelle :* Tant que la conception est gérée manuellement, l'accent 
 est naturellement mis sur les scénarios nominaux et idéaux, au détriment des cas limites, des scénarios défavorables et des conditions rares et complexes. Paradoxalement, c'est précisément dans ces environnements négligés que se cachent les erreurs les plus graves, celles qui ont le plus grand impact sur la sécurité des passagers. 
 
- *Absence de traçabilité systématique :* Le système ne dispose pas d'un lien structurel clair et documenté entre l'exigence fonctionnelle initiale et les cas de test qui en découlent. Cette fragmentation rend l'évaluation de la couverture ou la mise à jour des ensembles de tests suite à une modification technique complexe et aléatoire. 
 
- *Lenteur du rythme de production et des flux de travail :* L’ensemble du processus, de la réception des exigences à l’approbation de la version finale de test, prend plusieurs semaines, engendrant des goulots d’étranglement opérationnels qui retardent le déploiement sur le marché des fonctionnalités ADAS. 
 
- *Données de conduite réelles inutilisées :* Bien que les entreprises possèdent des milliers d’heures d’enregistrements vidéo issus de véritables expériences de conduite sur route, cette mine de données en situation réelle reste inexploitée, ne permettant pas d’améliorer la qualité et la portée des tests. Compte tenu de ces facteurs, la problématique centrale de ce travail peut se résumer à la question suivante :
#v(0.4cm)

#eniad-synthese[
  Comment concevoir un processus automatisé capable de traduire les exigences fonctionnelles des systèmes ADAS, rédigées en langage naturel, en cas de test précis, sans compromettre l'exhaustivité, tout en garantissant un suivi rigoureux et des normes de qualité conformes aux exigences de l'industrie automobile ? Autrement dit, et plus fondamentalement : comment faire confiance à l'intelligence artificielle générative pour automatiser l'inspection des systèmes critiques pour la sécurité et assurer la surveillance des cas rares et limites, sans que ce système ne devienne une « boîte noire » opaque, dépourvue de tout contrôle humain ?
]

#intro-subsection[Objectifs du projet]
À cette fin, la feuille de route du projet *" _Test Cases Generator_ "* a été conçue pour se concentrer sur la réalisation des objectifs stratégiques suivants : 

- *Flux de travail entièrement automatisé(End To End) :* Nous visons à construire un cycle de traitement intégré qui démarre automatiquement dès l’importation du fichier d’exigences source (Excel) et se poursuit sans interruption jusqu’à la génération et l’extraction, dans le même format, du fichier de résultats structurés contenant 
 les cas de test finaux. 
 
- *Couverture complète et multidimensionnelle :* La plateforme ne se limitera pas à une analyse superficielle, mais est conçue pour décomposer chaque condition fonctionnelle selon cinq dimensions techniques (telles que les transitions d’état, les contraintes temporelles et les messages IHM). Cette approche garantit une génération structurée couvrant quatre catégories de tests : de routine, de pointe, inversés et rares. 
 
- *Traçabilité rigoureuse :* Nous visons à établir un lien structurel indissociable entre chaque cas de test et sa source originale dans le cahier des charges en attribuant des identifiants uniques (identifiants uniques) permettant un audit inversé à tout moment. 
 
- *Inspection intelligente par analyse vidéo :* L’un de nos principaux objectifs est de s’affranchir de la rigidité du texte en intégrant des scénarios extraits d’enregistrements de conduite réels. Cela confère aux tests un réalisme que les exigences théoriques seules ne peuvent atteindre. 
 
- *Conception d'une architecture flexible et indépendante des fournisseurs :* nous avons conçu le système avec une architecture logicielle flexible qui lui permet de s'intégrer et de fonctionner de manière transparente avec divers fournisseurs de modèles de langage (tels que OpenAI, Gemini, ou même des modèles locaux via Ollama) sans qu'il soit nécessaire de réécrire ou de modifier le code source.
#intro-subsection[Expression des besoins]

Dans le cadre de ce stage, les besoins suivants ont été identifiés en collaboration avec l’équipe encadrante. Pour mieux représenter les interactions entre les utilisateurs et la plateforme ADAS-R2T, un diagramme de cas d’utilisation a été réalisé. Il met en évidence les principales fonctionnalités du système ainsi que les acteurs concernés.
#adas-r2t-usecase-diagram()

#requirements-section-tables()
#intro-section[ Méthodologie de Travail]
  

#intro-subsection[Management du projet] 

Concernant la gestion de projet, nous avons opté pour la méthodologie Agile Scrum en raison de sa grande flexibilité, qui facilite la communication et simplifie la coordination quotidienne. Bien que cette méthodologie ait été initialement conçue pour des équipes plus importantes, nous l'avons adaptée avec succès à notre fonctionnement en duo (Binôme). Cette approche nous a permis de nous adapter rapidement aux évolutions techniques et de mener à bien les tâches sans tomber dans l'imprévisibilité, garantissant ainsi la livraison d'un produit de qualité conforme aux attentes. Pour concrétiser cette vision, nous avons adopté un ensemble de bonnes pratiques : 
  
  - *Définition des fonctionnalités et structuration du projet :* Nous avons commencé par définir les fonctionnalités requises à partir d'une analyse des besoins techniques, puis nous avons divisé le projet en périodes spécifiques *sprints* et en livrables minimums *MVP*. 
  
  - *Décomposition des tâches :* Chaque sprint a été décomposé en tâches plus petites et détaillées, précisément réparties pour faciliter le suivi quotidien. 
  
  - *Communication quotidienne avec le superviseur :* Nous avons veillé à avoir une brève discussion quotidienne avec le superviseur pour le tenir informé de l'avancement du travail et nous assurer que nous étions sur la bonne voie. 
  
  - *Réunion hebdomadaire prolongée (tous les mardis) :* Nous organisons une réunion régulière avec tous les stagiaires de l’équipe. Cette réunion permet d’échanger des points de vue, de faire le point sur l’avancement de chaque projet, d’aborder les difficultés techniques courantes et de définir les prochaines étapes. 
  
  - *Séance d’auto-évaluation (tous les vendredis) :* Nous tenons une réunion de clôture pour la semaine, consacrée aux trois questions essentielles de la méthodologie Scrum :


     -- Quelles sont les tâches effectuées ?

     -- Quelles sont les difficultés rencontrées ?

     -- Quelles sont les tâches futures à réaliser ?

- *Une réunion mensuelle* où nous essayons de montrer l’importance de notre projet
et l’efficacité de nos solutions.
#intro-subsection[Approche de recherche] 
Pour inscrire ce travail dans une perspective scientifique, nous avons identifié la méthodologie de la Recherche en Sciences de la Conception *DSR* comme le cadre et le guide idéal pour notre projet. Ce choix découle de la nature même de cette méthodologie : elle constitue l’option la plus appropriée lorsque l’objectif est de créer des solutions pratiques à des problèmes réels et complexes, grâce à un processus itératif alternant conception, construction et évaluation continue de l’impact technique ou logiciel *artefact*. Contrairement aux approches traditionnelles qui se contentent d’observer ou d’interpréter des phénomènes, la *DSR* se concentre sur la conception d’outils fonctionnels utilisables et mesurables sur le terrain. C’est précisément ce qui s’applique à notre projet, où l’impact logiciel représente ici un flux de travail dynamique *Workflow* que nous avons construit à partir de LangGraph afin de générer des tests ADAS de manière structurée et évolutive. La méthodologie *DSR* a été mise en œuvre dans notre projet à travers deux cycles successifs 
 de développement et d'évaluation : 
 - le premier cycle, axé sur l'établissement du noyau de base du flux de travail, a consisté à définir les composants essentiels du système, à ajuster les mécanismes de réception des données d'entrée, à concevoir la logique de traitement et à définir la structure d'état qui régit le graphe. 
 - Le second cycle, consacré au raffinement et à l'amélioration, a porté sur le renforcement des mécanismes d'auto-vérification et d'autocontrôle au sein du graphe, ainsi que sur le renforcement de la logique de génération afin d'améliorer la qualité et la fiabilité des résultats finaux. Cette progression itérative illustre parfaitement la philosophie *DSR*, fondée sur la triade « Construire, Évaluer, Améliorer en continu ».\ 
 Enfin, la conception de cette solution n'était pas accidentelle, mais plutôt basée sur une double base de connaissances : un aspect technique lié à la physique de la construction de systèmes basés sur des graphes et des sorties régies par des états (Stateful Systems) dans l'environnement LangGraph, et un aspect industriel conforme aux exigences strictes et précises des tests de systèmes ADAS dans le secteur automobile.

#intro-subsection[Planification du projet] 
Afin de garantir le respect du calendrier de formation et une gestion efficace du temps, le projet a fait l'objet d'une planification par phases rigoureuse. Nous avons décomposé la feuille de route en tâches et sous-tâches plus petits planifiées a l'aide de *Notion app*, directement liés à chaque version des livrables initiaux *MVP*. Le diagramme suivant résume la séquence chronologique et les interrelations structurelles de ces tâches tout au long du projet :
#v(0.6cm)
#adas-r2t-timeliney-gantt()<fig:planning-projet>



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