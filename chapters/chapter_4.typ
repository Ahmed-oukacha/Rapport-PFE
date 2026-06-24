
#import "../components.typ": *

#eniad-chapter(
  "4",
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
#intro-section[Réalisation et implémentation]
Ce chapitre quitte le terrain de la conception pour entrer dans celui de la construction. Il retrace les choix concrets de développement, l'organisation du code, les itérations successives du produit, et les obstacles rencontrés en cours de route.
#intro-subsection[Organisation du code source]
Un projet de cette envergure *25 nœuds*, trois modes de fonctionnement, *plusieurs couches* d'infrastructure  ne peut se permettre un code monolithique. Dès le départ, l'organisation du code a été pensée pour qu'un développeur puisse localiser n'importe quel composant en quelques secondes.
Le projet adopte une structure `"src/"` qui isole le code applicatif des fichiers de configuration et d'infrastructure :
#figure(
  block(
    width: 100%,
    fill: rgb("#F8FAFC"),
    stroke: 0.6pt + rgb("#D1D5DB"),
    radius: 6pt,
    inset: 10pt,
  )[
    #set text(
      font: "Cascadia Code",
      size: 6.6pt,
    )

```text
R2T-0.1V/
├── docker/
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── nginx/
│   ├── prometheus/
│   └── grafana/
├── src/
│   └── app/
│       ├── main.py
│       ├── api/
│       │   └── v1/
│       │       └── pipeline.py
│       ├── core/
│       │   ├── config.py
│       │   ├── logging.py
│       │   ├── metrics.py
│       │   ├── checkpointer.py
│       │   ├── memory_store.py
│       │   ├── memory_manager.py
│       │   ├── middleware.py
│       │   ├── cleanup.py
│       │   └── langgraph/
│       │       ├── graph.py
│       │       ├── utils.py
│       │       ├── nodes/
│       │       │   ├── ingest_excel.py
│       │       │   ├── extract_and_structure.py
│       │       │   ├── analyze_video.py
│       │       │   ├── video_frame_analyzer.py
│       │       │   ├── video_scenario_builder.py
│       │       │   ├── video_scenario_mutator.py
│       │       │   ├── coverage_planner.py
│       │       │   ├── plan_single_req.py
│       │       │   ├── generate_tc.py
│       │       │   ├── synthesizer.py
│       │       │   ├── evaluator.py
│       │       │   ├── human_review.py
│       │       │   ├── process_review.py
│       │       │   ├── output_excel.py
│       │       │   └── video_output_excel.py
│       │       └── prompts/
│       │           ├── extract_and_structure.md
│       │           ├── plan_single_req.md
│       │           ├── generate_tc.md
│       │           └── ...
│       └── schemas/
│           ├── workflow.py
│           └── nodes/
│               ├── test_case.py
│               └── video_scenarios.py
├── tests/
├── evals/
├── .env
├── pyproject.toml
└── uv.lock
```
  ],
  caption: [Arborescence du projet ADAS-R2T],
) 





// #intro-section[Vue d'ensemble]
// #intro-subsection[ Flux global]
// #intro-section[Vue d'ensemble]
// #intro-subsection[ Flux global]
#pagebreak()
``

// #set page(header: report-header, footer: report-footer)
