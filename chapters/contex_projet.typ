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
    Capgemini et Altran ont annoncé, le 24 juin 2019, un accord portant sur l’acquisition
de la société Altran par Capgemini. Le 1er avril 2020, l’OPA amicale de Capgemini
sur Altran a été finalisée. Dominique Cerutti, directeur général d’Altran, a confirmé
que cette acquisition allait créer un leader mondial de l’industrie intelligente au service
de la transformation numérique des entreprises. En avril 2021, Altran est devenue
*Capgemini Engineering*.
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
Les offres du groupe suivent l’ensemble du cycle de RD : conception, développement,
test, innovation et prototypage, et accompagne également l’industrialisation, le service
après-vente et la production. Elle est caractérisée avec son fort et unique savoir-faire en
matière d’innovation, Capgemini Engineering répond aux besoins de ses clients dans 6
catégories d’activités :
#set page(header: report-header, footer: report-footer)

*— Consulting* : Accompagne les clients du Groupe dans la transformation de leurs
opérations, les conseille dans la définition de leurs stratégies en matière d’innovation et de leurs services et produits futurs.

*— Digital* : Accompagne les clients dans leur transformation digitale par le biais de
la capitalisation sur sa connaissance de leurs produits et processus industriels, et
sur l’expertise de ses ingénieurs spécialisés dans les métiers du numérique.

*— Engineering* : aide les clients du Groupe dans le développement de nouveaux
produits et système tout en réduisant leurs délais de mise sur le marché et leurs
coûts, et les accompagne dans l’amélioration de leurs processus industriels et leurs
systèmes de production.

*— World Class Centers* : propose les solutions et les services dans des domaines
de pointe en s’appuyant sur sept centres d’expertise mondiaux regroupant les
investissements et actifs du Groupe correspondant.

*— Industrialized Global Shore* : permet aux clients de bénéficier d’une expertise
globale et de réunir la compétitivité et les normes de qualité les plus élevés. Cette
solution industrielle de prestations de services d’ingénierie et de RD du Groupe
repose sur 5 centres d’ingénierie mondiaux, situés Near- et offshore.

*— Cambridge Consultants* : spécialisé dans le développement de produits innovants, accompagné par des équipes scientifiques de haut niveau, et s’appuyant
sur des laboratoires dédiés aux États-Unis et Royaume-Uni.
=== Domaine d'activité de Capgemini Engineering 
Grâce à une maîtrise avancée des technologies digitales et logicielles, l’entreprise joue
un rôle clé dans la transformation des industries vers l’Intelligent Industry. Avec plus de
55 000 ingénieurs et scientifiques répartis dans plus de 50 pays, Capgemini Engineering
intervient dans des secteurs variés tels que :

*— Secteur automobile* : elle travaille principalement STELLANTIS (Ex. PSA),
Le constructeur automobile WW et BOSCH.

*— Secteur aéronautique* : SAFRAN, AIRBUS, DASSAULT AVIATION.

*— Secteur ferroviaire* : ALSTOM, SNCF, BOMBARDIER.

*— Secteur Sciences de la vie* : SANOFI, GSK.
#set page(header: report-header, footer: report-footer)

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
Le processus actuel de génération des cas de test ADAS présente plusieurs limitations structurelles qui motivent cette recherche :

- *Génération manuelle.* Les cas de test sont aujourd'hui rédigés manuellement par les ingénieurs de validation, à partir de leur lecture et interprétation des exigences fonctionnelles. Ce processus est chronophage, sujet aux erreurs d'interprétation et difficilement reproductible.

- *Couverture incomplète.* La conception manuelle tend à privilégier les scénarios nominaux au détriment des cas limites (_boundary_), des scénarios négatifs et des situations

 rares, ce sont précisément ces cas qui révèlent les défauts les plus critiques dans les systèmes de sécurité.

- *Absence de traçabilité structurée.* Le lien entre une exigence source et les cas de test qui la couvrent n'est pas toujours formalisé, rendant difficile l'analyse de couverture et la maintenance des suites de tests.

- *Temps de cycle élevé.* Le cycle complet — de la réception des exigences à la livraison des cas de test validés — peut s'étendre sur plusieurs semaines, retardant la mise sur le marché des fonctions ADAS.

- *Pas d'exploitation des données de conduite.* Les vidéos de conduite réelle, riches en scénarios de terrain, ne sont pas exploitées pour enrichir la conception des tests.

La problématique centrale de ce travail peut ainsi se formuler :
#v(0.4cm)
#info-box("Problématique")[
  Comment automatiser la génération de cas de test ADAS à partir d'exigences fonctionnelles en langage naturel, tout en garantissant une couverture complète, une traçabilité rigoureuse et une qualité conforme aux standards de l'industrie automobile ?
]


#v(0.157cm)
=== Objectifs du projet

Pour répondre à cette problématique, le projet ADAS-R2T (_Requirements to Tests_) poursuit les objectifs suivants :

- *Automatiser la chaîne complète* de transformation des exigences en cas de test : de l'ingestion du fichier Excel source jusqu'à la génération du fichier Excel de sortie contenant les cas de test structurés.

- *Garantir une couverture exhaustive* en analysant chaque exigence selon cinq dimensions complémentaires (transitions d'état, contraintes temporelles, messages HMI, calculs, cas génériques) et en générant systématiquement quatre catégories de tests : nominal, boundary, negative et rare.

- *Assurer la traçabilité* entre chaque cas de test généré et l'exigence source, avec un identifiant unique et un lien explicite.

- *Intégrer l'analyse vidéo* pour enrichir les cas de test avec des scénarios extraits de vidéos de conduite réelle, apportant un réalisme que la seule lecture des exigences ne peut fournir.

- *Concevoir un système vendor-agnostic* capable de fonctionner avec différents fournisseurs des modèles de langage (OpenAI, Ollama, Gemini ...) sans modification du code.
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
    fill: rgb("#1c474f"),
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
#set page(header: report-header, footer: report-footer)

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
    [Le système doit reprendre après un crash sans perte de données grâce à la persistance des checkpoints.],

    [*BNF04*],
    [Sécurité],
    [Les checkpoints doivent être chiffrés. L’authentification par clé API est obligatoire.],

    [*BNF05*],
    [Maintenabilité],
    [Le code doit être modulaire, avec un fichier par nœud, documenté et accompagné d’un logging structuré.],

    [*BNF06*],
    [Portabilité],
    [Le système doit être déployable via Docker sur tout environnement, cloud ou on-premise.],

    [*BNF07*],
    [Interopérabilité],
    [Le système doit communiquer via une API REST avec le backend BFF et le frontend.]
  ),
  [Liste des besoins non fonctionnels]
)
]
