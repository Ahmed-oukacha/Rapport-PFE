// #import "../components.typ": *

// // #frontmatter-title("Remerciements")
// #set page(
//   header: [],
// )

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

// #frontmatter-banner("Remerciements")

// #set par(justify: true ,
//   leading: 1.8em
// )
// #text(size: 14pt)[
//   #text(
//     weight: "bold",
//     size: 30pt,
//     font:"Serif",
//   )[Au] 
// ]
//   #text(
//     size: 14pt,
//     font:"Serif",
//   )[terme de ce projet de fin d'études, nous tenons à exprimer notre reconnais
// sance à celles et ceux qui ont jalonné notre parcours et contribué à la réussite de  
// ce travail. Nos premiers remerciements s'adressent à Capgemini Engineering. Nous  
// y avons trouvé bien plus qu’un lieu de stage : une véritable immersion dans un  
// projet innovant et au cœur des technologies de pointe, alliant systèmes *ADAS* 
// et  intelligence artificielle.Nous tenons à remercier chaleureusement nos 
//   encadrants  pour leur accompagnement précieux. Leur disponibilité constante, leurs conseils  avisés et la confiance qu'ils nous ont accordée ont été de véritables moteurs  tout au long de cette expérience. Leur expertise technique et leur soutien ont   été déterminants.Travailler aux côtés des équipes de *Capgemini Engineering* a  été un immense plaisir. Au-delà des tâches quotidiennes, ce sont les échanges  partagés, les retours d'expérience et l'esprit de solidarité au sein de l'équipe qui  ont enrichi notre vision professionnelle.Nous tenons également à saluer *l'École  Nationale d'Intelligence Artificielle et du Digital de Berkane (ENIAD)*.  Merci à l'ensemble du corps professoral pour la rigueur de la formation et la  qualité des connaissances transmises, qui constituent aujourd'hui le socle de nos  compétences.Enfin, que toutes les personnes qui ont soutenu ce projet, de près ou  de loin, trouvent ici l'expression de notre gratitude pour avoir rendu cette aventure humaine et professionnelle aussi mémorable.]
// #pagebreak()


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
)[Remerciements]
]


#v(1.2em)

#text(
  font: "Times New Roman",
  size: 12pt,
)[
  #text(weight: "bold", size: 20pt , fill: rgb("#000000"))[Au] 
  terme de ce projet de fin d'études, nous tenons à exprimer notre reconnaissance 
  à celles et ceux qui ont jalonné notre parcours et contribué à la réussite de ce travail. 
  Nos premiers remerciements s'adressent à *Capgemini Engineering*. Nous y avons trouvé 
  bien plus qu’un lieu de stage : une véritable immersion dans un projet innovant et au cœur 
  des technologies de pointe, alliant systèmes *ADAS* et intelligence artificielle.

  #v(0.8em)

  Nous tenons à remercier chaleureusement nos encadrants pour leur accompagnement précieux. 
  Leur disponibilité constante, leurs conseils avisés et la confiance qu'ils nous ont accordée 
  ont été de véritables moteurs tout au long de cette expérience. Leur expertise technique et 
  leur soutien ont été déterminants.

  #v(0.8em)

  Travailler aux côtés des équipes de *Capgemini Engineering* a été un immense plaisir. 
  Au-delà des tâches quotidiennes, ce sont les échanges partagés, les retours d'expérience et 
  l'esprit de solidarité au sein de l'équipe qui ont enrichi notre vision professionnelle.

  #v(0.8em)

  Nous tenons également à saluer *l'École Nationale d'Intelligence Artificielle et du Digital 
  de Berkane (ENIAD)*. Merci à l'ensemble du corps professoral pour la rigueur de la formation 
  et la qualité des connaissances transmises, qui constituent aujourd'hui le socle de nos compétences.

  #v(0.8em)

  Enfin, que toutes les personnes qui ont soutenu ce projet, de près ou de loin, trouvent ici 
  l'expression de notre gratitude pour avoir rendu cette aventure humaine et professionnelle aussi mémorable.
]

#set page(header: report-header, footer: report-footer)
