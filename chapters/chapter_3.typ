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

      #v(0.55cm)
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

      #v(0.45cm)

      #text(
        size: 13pt,
        weight: "bold",
      )[
        #chapter.#section.#subsection #h(0.45cm) #title
      ]

      #v(0.25cm)
    ]
  }
]
``
Ce chapitre presente l'architecture du systeme ADAS-R2T selon une approche descendante : nous partons d'une vue macroscopique du pipeline, puis nous detaillons progressivement chaque couche technique jusqu'aux mecanismes internes du graphe agentique.

#intro-section[Vue d'ensemble]
Le systeme ADAS-R2T repose sur un principe simple : transformer des entrees metier (exigences fonctionnelles, videos de conduite) en sorties exploitables (cas de test structures, scenarios de validation). Entre ces deux extremites, un pipeline intelligent orchestre le travail de dix-neuf nodes specialises.

#intro-subsection[ Flux global]
A son niveau le plus abstrait, le systeme fonctionne comme une chaine de transformation en trois temps :

- *Entree* : l'utilisateur fournit un fichier Excel contenant les exigences fonctionnelles ADAS (et eventuellement une video de conduite reelle).
- *Traitement* : le pipeline agentique analyse, planifie, genere et evalue les cas de test de maniere autonome.
- *Sortie* : un fichier Excel structure contenant les cas de test prets a etre executes par l'equipe de validation.
#adas-r2t-pipeline-stages()











#intro-section[Vue d'ensemble]
#intro-subsection[ Flux global]
#intro-section[Vue d'ensemble]
#intro-subsection[ Flux global]
#intro-section[Vue d'ensemble]
#intro-subsection[ Flux global]
#intro-section[Vue d'ensemble]
#intro-subsection[ Flux global]#intro-section[Vue d'ensemble]
#intro-subsection[ Flux global]
#intro-section[Vue d'ensemble]
#intro-subsection[ Flux global]
#pagebreak()
``


















// #set page(header: report-header, footer: report-footer)
