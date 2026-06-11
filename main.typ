#import "template.typ": paris-saclay-thesis, prune
#import "components.typ": *

#import "@preview/fletcher:0.5.8": *

///////////////////////////////////////////
// 1/3 If not already done, download the
//     "Segoe UI This" font (see README)
/////////////////////////////////////////// 

///////////////////////////////////////////
// 2/3 Change the value of the following
//     parameters to edit the first two pages.
//     All parameters have a default value, so
//     you can remove some to highlight which
//     ones are still missing.
///////////////////////////////////////////

// #show: paris-saclay-thesis.with(
//   candidate-name: [OUKACHA Ahmed],
//   title-fr: [
  

// #v(1cm)
//     #text(
//     26pt,
//     weight: "bold",
//     fill: rgb("#003366"),
//   )[
//     ADAS Test Case Generation
//   ]

//   #v(0.5cm)

//   #text(
//     18pt,
//     fill: rgb("#595959"),
//   )[
//     using agentic AI
//   ]],
//   title-en: [Un système multi-agents pour la génération, l'évaluation et l'amélioration itérative automatisées des cas de tests fonctionnels ADAS à partir des exigences et des vidéos de conduite],
//   keywords-fr: ("Or", "montagne du Destin", "Magie occulte"),
//   keywords-en: ("Gold","Mount Doom", "Occult magic"),
//   abstract-fr: lorem(200),
//   abstract-en: lorem(200),
//   NNT: [1955UPASX000],
//   doctoral-school: [*École de diplôme* : École nationale de l'intelligence artificielle et digitale berkane],
//   doctoral-school-code: "INTERFACES", // for the logo to insert
//   specialty: [*Spécialité de diplome* : Ingénieur en intelligence artificielle],
//   graduate-school: [*Référent* : Université Mohamed premier],
//   university-component: [*Année* : 2025/2026],
//   research-unit-and-advisors: [
//     *Stage realise au sein de Capgemini Engineering.* \
//   ],
//   defense-date: [20 octobre 1955],
//   thesis-examiners: (
//     (
//       name: [*name*],
//       title: [title],
//       status: [status]
//     ),
//     (
//       name: [*name*],
//       title: [title],
//       status: [status]
//     ),
//     (
//       name: [*name*],
//       title: [title],
//       status: [status]
//     ),
//     (
//       name: [*name*],
//       title: [title],
//       status: [status]
//     ),
//   ),
//   vertical-spacing-2: 15pt,
// vertical-spacing-3: 15pt,
// vertical-spacing-4: 20pt,
//   // You can also adjust spacings in the first page with
//   // `vertical-spacing-1` to `vertical-spacing-5`
//   // and `horizontal-spacing-1` to `horizontal-spacing-2`
// )

///////////////////////////////////////////
// 3/3 Starting from here, the third page,
//     no formatting is imposed.
//     However here are some tweaks you
//     might like.
///////////////////////////////////////////

// Switch to a serif font family, size 11

// #set text(
//   font: "Libertinus Serif",
//   size: 11pt
// )

// // Show links in blue

// #show link: set text(fill: blue)

// // Show numbers in references (to a bibliography entry, a section, a figure) in blue
// // thanks Eric Biedert https://github.com/typst/typst/discussions/4143

// #show cite: it => {
//   // reference to a bibliography entry -> color only the number, not square brackets, not the potential supplement
//   show regex("\[",): set text(fill: black) // enforce square brackets in black
//   show regex("^\[(\d+)",): set text(fill: blue) // only the first number, in case there is a number in the supplement
//   it
// }
// #show ref: it => {
//   if it.element == none {
//     // reference to a bibliography entry -> manage by `#show cite` above
//     return it
//   }
//   // reference to a section or a figure
//   show regex("[\d]+[\.]?[\d]*[\.]?[\d]*"): set text(fill: blue) // find something like "1", "1.2" or "1.3"
//   it
// }

// // Figure legends in italic and with smaller font size

// #show figure.caption: it => [
//   #text(size: 10pt, style: "italic")[#it]
// ]

// // Headings numbering & refer to a section with "Chapitre X" instead of "Section X"

// #set heading(numbering: "1.1", supplement: "Chapitre")

// // Refer to an equation with "Équation X" instead of "Equation X"

// #set math.equation(supplement: "Équation")

// // Headings formatting

// #let heading_text_size = (none, 18pt, 15pt, 12pt, 11pt) // for each heading level
// #show heading.where(level: 1): header => {

//   pagebreak(weak: true)

//   let chap = counter(heading).get().first()

//   block(
//     width: 100%,
//     breakable: false,
//   )[

//     #v(0.8cm)

//     #text(
//       size: 12pt,
//       weight: "bold",
//       fill: rgb("#2563EB"),
//       font: "Segoe UI This",
//     )[
//       // Chapitre #chap
//     ]

//     #v(0.15cm)

//     #text(
//       size: 24pt,
//       weight: "bold",
//       fill: rgb("#0F172A"),
//       font: "Segoe UI This",
//     )[
//       #header.body
//     ]

//     #v(0.25cm)

//     #line(
//       length: 100%,
//       stroke: 1.5pt + rgb("#2563EB")
//     )

//     #v(0.5cm)
//   ]
// }
// #show heading.where(level: 2): it => [

//   #v(1.2em)

//   #text(
//     font: "IBM Plex Sans",
//     weight: "bold",
//     size: 18pt,
//     fill: rgb("#111b2f"),
//   )[
//     #counter(heading).display() #h(0.3em) #it.body
//   ]

  

//   #v(0.6em)
// ]

// #show heading.where(level: 3): it => [

//   #v(0.8em)

//   #text(
//     // font: heading-font,
//     weight: "semibold",
//     size: 14pt,
//     fill: rgb("#000000"),
//   )[
//     #counter(heading).display() #h(0.25em) #it.body
//   ]

//   #v(0.3em)
// ]
// // Headings formatting in the outline

// #show outline.entry.where(level: 1): it => {
//   v(12pt, weak: true) // small spacing before
//   strong(it) // in bold
// }
// #show outline.entry.where(level: 3): it => {
//   text(size: 10pt)[#it] // slightly smaller
// }

// // Footer with the page number
// #set page(
//   header: context [

//   #grid(
//     columns: (1fr, auto),

//     [
//       #text(
//         size: 9pt,
//         fill: rgb("#64748B")
//       )[
//         Rapport de Projet de Fin d'Études
//       ]
//     ],

//     [
//       #text(
//         size: 9pt,
//         weight: "bold",
//         fill: rgb(94, 177, 163)
//       )[
//         ADAS-R2T
//       ]
//     ]
//   )

//   #v(0pt)

//   #line(
//     length: 100%,
//     stroke: 0.5pt + rgb("#D1D5DB")
//   )
// ],

//   footer: context [
//     #v(4pt)

//     #line(length: 100%, stroke: 0.5pt + rgb("#D1D5DB"))

//     #v(0pt)

//     #grid(
//       columns: (1fr, auto, 1fr),

//       [
//         #text(size: 9pt, fill: rgb("#64748B"))[
//           Ahmed Oukacha
//         ]
//       ],

//       [
//         #text(size: 9pt)[
//           #counter(page).display("1")
//         ]
//       ],

//       [
//         #align(right)[
//           #text(size: 9pt, fill: rgb("#64748B"))[
//             Capgemini Engineering
//           ]
//         ]
//       ]
//     )
//   ]
// )

// // Text justification

// #set par(
//   justify: true,
//   linebreaks: "optimized"
// )

// // A "Remarque : " text box

// #let remarque(number: none, body) = {
//   block(stroke: (left: 1pt), inset: 0.5em)[
//     #smallcaps[Remarque #number :] #body
//   ] 
// }

// // "En résumé" & "Publications et communications scientifiques" boxes

// #import "@preview/colorful-boxes:1.4.1": colorbox

// #let en_résumé(body) = {
//   colorbox(
//     title: text(font: "Segoe UI This")[En résumé],
//     radius: 2pt,
//     width: auto,
//     color: "default"
//   )[
//     #body
//     #v(2pt)
//   ]
// }

// #let publications(body) = {
//   colorbox(
//     title: text(font: "Segoe UI This")[Publications et communications scientifiques],
//     radius: 2pt,
//     width: auto,
//     box-colors: (
//       prune: (stroke: prune, fill: white, title: white),
//     ),
//     color: "prune"
//   )[
//     #body
//     #v(2pt)
//   ]
// }

// Display the outline

// #outline(
//   title: [Table des matières],
//   indent: 1em
// )

// ///////////////////////////////////////////
// // Write your thesis below. Bon courage !
// ///////////////////////////////////////////

// = Chapitre <ch:chapitre>

// #lorem(50)

// #en_résumé[
//   #lorem(25)
// ]

// #publications[
//   - #lorem(12)
//   - #lorem(12)
//   - #lorem(12)
// ]

// == Sous-chapitre <ch:sous-chapitre>

// #lorem(25)

// === Sous-sous-chapitre <ch:sous-sous-chapitre>

// #lorem(50) @bib:concerning-hobbits

// #remarque[
//   #lorem(25)
// ]

// #lorem(50)

// 

#pfe-title-page()

#include "chapters/frontmatter/remerciements.typ"
#include "chapters/frontmatter/resume.typ"
#include "chapters/frontmatter/abstract.typ"
#include "chapters/frontmatter/abstract_ar.typ"
#sommaire-page()
#liste-figures-page()
#liste-tableaux-page()
#liste-abreviations-page()

#include "chapters/introduction.typ"
// #include "chapters/contex_projet.typ"

// #include "chapters/state_of_art.typ"

#include "chapters/chapter_1.typ"

#include "chapters/chapter_2.typ"

// #include "chapters/evaluation.typ"

// #include "chapters/conclusion.typ"

// #bibliography("bib.yml", title: [Bibliographie])
#include "chapters/bibliographie.typ"

#include "chapters/Annexes.typ"

