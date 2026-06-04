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
    "../img/historique-capgemini.png",
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

== Choix de l'approche : IA Agentique
#v(-0.1cm)

Une question fondamentale s'est posée dès le début du projet : faut-il utiliser l'IA Générative (GenAI) classique ou l'IA Agentique pour résoudre ce problème ?

Pour trancher, nous avons appliqué une *matrice de décision à cinq questions* issue de la littérature :

#v(0.157cm)

#figure(
  table(
    columns: (auto, 1fr, auto),
    inset: 8pt,
    stroke: 0.5pt + rgb("#D1D5DB"),
    fill: (x, y) => if y == 0 { rgb(94, 177, 163) } else if calc.odd(y) { rgb("#F8FAFC") } else { white },
    align: (center, left, center),
    table.header(
      text(fill: white, weight: "bold")[Critère],
      text(fill: white, weight: "bold")[Analyse du projet],
      text(fill: white, weight: "bold")[Résultat],
    ),
    [*Sortie*], [Le projet demande un résultat exécuté (fichier Excel structuré, KPIs de couverture), pas seulement du texte généré.], [Agentique],
    [*Trajectoire*], [Le flux est dynamique et cyclique : générer → évaluer → corriger → régénérer. Les étapes ne sont pas linéaires.], [Agentique],
    [*Erreur*], [Le système doit s'auto-corriger : si la couverture est insuffisante, il relance la génération ciblée sans intervention humaine.], [Agentique],
    [*Interaction*], [L'humain définit l'objectif (les exigences) et le système conduit le processus complet de bout en bout.], [Agentique],
    [*État*], [Le système modifie l'environnement : il lit des fichiers, exécute des analyses, génère des fichiers de sortie.], [Agentique],
  ),
  caption: [Application de la matrice de décision GenAI vs Agentique au projet ADAS-R2T.],
) <tab:decision-matrix>
#v(0.5cm)
Le résultat est unanime : #text("5 critères sur 5", weight: "bold",fill: rgb(94, 177, 163)) orientent vers l'IA Agentique. Le système ne se contente pas de générer du contenu — il planifie, exécute, évalue et corrige de manière autonome.

== Organisation du mémoire

Ce mémoire est structuré en cinq chapitres :

*Chapitre 2 — État de l'art.* Présente les fondements théoriques nécessaires : l'évolution de l'IA générative vers l'IA agentique, les patrons architecturaux des systèmes multi-agents, les frameworks d'orchestration (LangGraph) et les travaux existants en génération automatique de tests.

*Chapitre 3 — Architecture du système.* Détaille l'architecture complète du pipeline ADAS-R2T : les 18 nœuds, les quatre stages, les mécanismes de parallélisation, le routage conditionnel et la boucle d'évaluation-correction.

*Chapitre 4 — Implémentation.* Décrit les choix techniques, la couche LLM vendor-agnostic, le framework مِصْبَاح pour l'ingénierie des prompts, l'intégration de l'analyse vidéo et le déploiement via FastAPI.

*Chapitre 5 — Évaluation.* Présente les résultats quantitatifs et qualitatifs, l'évolution des métriques de qualité au fil des itérations et les limites identifiées.

*Conclusion.* Synthétise les contributions, discute les limitations et propose des perspectives d'évolution.
]
