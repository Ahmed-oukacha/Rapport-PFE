// #import "../components.typ": *

// #set page(header: [])

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

// #frontmatter-banner("Résumé")
// #set par(justify: true ,
//   leading: 1.2em
// )
// #text(size: 13pt)[
//   #text(
//     weight: "bold",
//     size: 30pt,
//     font:"Serif",
//   )[L']
//   #text(
//     size: 14pt,
//     font:"Serif",
//   )[ 
//   émergence des systèmes avancés d'aide à la conduite *(ADAS)* pose un défi majeur : la complexité croissante des processus de vérification et d'audit. L'analyse des exigences, la conception des plans de test et la création des scénarios de test sont des tâches essentielles mais chronophages en ingénierie. C'est précisément là qu'intervient ce projet de fin d'études. Quel est l'objectif ? Concevoir une plateforme intelligente, basée sur une approche de *agentic-IA*, pour assister les ingénieurs ADAS. Notre solution coordonne le travail de plusieurs agents spécialisés qui collaborent pour analyser les spécifications, structurer les données et produire des cas de test cohérents et traçables. En arrière-plan, l'architecture exploite la puissance des grands modèles de langage (LLM) et utilise le framework LangGraph pour coordonner le flux entre les agents. Plutôt que d'automatiser aveuglément l'ensemble du processus, nous avons intégré une approche d'« intervention humaine » afin que l'expert reste le décideur final. De plus, la mémoire des agents permet au système de tirer profit des connaissances acquises lors des opérations. Techniquement, la solution est fournie via les services FastAPI et déployée dans des conteneurs Docker. Pour surveiller l'intégrité et les performances du système, nous avons implémenté des mécanismes de supervision à l'aide de Grafana. Les résultats confirment la validité de cette approche : combiner l'intelligence artificielle à la supervision humaine améliore la productivité tout en garantissant des résultats de tests standardisés et de haute qualité.]
  
  
 
// ]

// #v(0.8cm)

// #keywords-panel((
//   [Agentic AI],
//   [ADAS],
//   [Large Language Models],
//   [LangGraph],
//   [Human-in-the-Loop],
//   [Agent Memory],
//   [Test Plan Generation],
//   [Test Case Generation],
//   [FastAPI],
//   [Docker],
// ))

// #pagebreak()





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

// #frontmatter-banner("Résumé")

// #set text(
//   font: "Times New Roman",
//   size: 12pt
// )

// #set par(
//   justify: true,
//   leading: 0.85em,
// )
// 
// 
// *

#import "../components.typ": *



#set par(first-line-indent: 1em)
#set par(spacing: 0.8em)
#set par(
  justify: true,
  leading: 0.9em,
)

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
#v(1.8em)

#align(center)[

#text(
  size: 20pt,
  weight: "bold",
  font: "Times New Roman"
)[Résumé]
]
#v(1.2em)


#text[
  #text(weight: "bold", size: 18pt)[L’] 
  émergence des systèmes avancés d'aide à la conduite *(ADAS)* pose un défi majeur : 
  la complexité croissante des processus de vérification et d'audit.

  L'analyse des exigences, la conception des plans de test et la création des scénarios 
  de test sont des tâches essentielles mais chronophages en ingénierie. C'est précisément 
  là qu'intervient ce projet de fin d'études.

  #v(0.6em)

  L'objectif est de concevoir une plateforme intelligente, basée sur une approche 
  de *agentic AI*, pour assister les ingénieurs ADAS. Notre solution coordonne le travail 
  de plusieurs agents spécialisés qui collaborent pour analyser les spécifications, 
  structurer les données et produire des cas de test cohérents et traçables.

  #v(0.6em)

  L'architecture exploite la puissance des grands modèles de langage (LLM) et utilise 
  le framework LangGraph pour orchestrer les interactions entre agents. Une approche 
  *human-in-the-loop* garantit que l'expert reste le décideur final.

  #v(0.6em)

  Sur le plan technique, la solution repose sur FastAPI et Docker, avec un système de 
  monitoring basé sur Grafana pour assurer la performance et la fiabilité.

  #v(0.6em)

  Les résultats montrent que l'intégration de l'intelligence artificielle avec la 
  supervision humaine permet d'améliorer significativement la productivité tout en 
  garantissant des tests fiables et standardisés.
]

#v(1em)


#v(0.4em)


#academic-keywords((
  [Agentic AI],
  [ADAS],
  [Large Language Models],
  [LangGraph],
  [Human-in-the-Loop],
  [Agent Memory],
  [Test Plan Generation],
  [Test Case Generation],
  [FastAPI],
  [Docker],
  [Grafana],
))


#pagebreak()




