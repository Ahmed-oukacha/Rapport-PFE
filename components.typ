#import "@preview/colorful-boxes:1.4.1": colorbox
#import "@preview/cetz:0.5.2"
#import "@preview/fletcher:0.5.8" as fletcher
#let report-header = context [
  #grid(
    columns: (1fr, auto),
    [
      #text(size: 9pt, fill: rgb("#64748B"))[
        Rapport de Projet de Fin d'Études
      ]
    ],
    [
      #text(size: 9pt, weight: "bold", fill: rgb(94, 177, 163))[
        ADAS-R2T
      ]
    ],
  )

  #v(0pt)

  #line(length: 100%, stroke: 0.5pt + rgb("#D1D5DB"))
]

#let report-footer = context [
  #v(4pt)

  #line(length: 100%, stroke: 0.5pt + rgb("#D1D5DB"))

  #v(0pt)

  #grid(
    columns: (1fr, auto, 1fr),
    [
      #text(size: 9pt, fill: rgb("#64748B"))[
        Ahmed Oukacha
      ]
    ],
    [
      #text(size: 9pt)[
        #counter(page).display("1")
      ]
    ],
    [
      #align(right)[
        #text(size: 9pt, fill: rgb("#64748B"))[
          Capgemini Engineering
        ]
      ]
    ],
  )
]

#let info-box(title, body) = {
  block(
    width: 100%,
    inset: (x: 12pt, y: 10pt),
    fill: rgb("#eaeeef78"),
    stroke: (left: 2.5pt + rgb(116, 145, 149)),
    radius: 2pt,
  )[
    #text(size: 11pt, weight: "bold", fill: rgb("#5c7376"))[
      #title
    ]

    #v(6pt)

    #text(fill: rgb("#253044"))[
      #body
    ]
  ]
}

#let legacy-info-box(title, body) = {
  colorbox(title: title, radius: 4pt, width: auto, color: "blue")[
    #body
  ]
}

#let metric-card(value, label) = {
  rect(
    radius: 6pt,
    inset: 12pt,
    fill: rgb("#f5f7fa"),
    stroke: rgb("#d9e2ec"),
    width: 5cm,
  )[
    #align(center)[
      #text(
        size: 22pt,
        weight: "bold",
        fill: rgb("#0057AB"),
      )[
        #value
      ]

      #v(6pt)

      #text(
        size: 10pt,
        fill: rgb("#52606d"),
      )[
        #label
      ]
    ]
  ]
}

#let architecture-card(
  title,
  subtitle,
  color: rgb("#0057AB"),
  body,
) = {
  rect(
    radius: 8pt,
    inset: 14pt,
    stroke: color,
    fill: rgb("#f8fafc"),
    width: 100%,
  )[
    #text(
      size: 16pt,
      weight: "bold",
      fill: color,
    )[
      #title
    ]

    #v(4pt)

    #text(
      size: 10pt,
      style: "italic",
      fill: rgb("#52606d"),
    )[
      #subtitle
    ]

    #v(10pt)

    #body
  ]
}


// =====================================================
// Front Matter Title
// =====================================================

#let frontmatter-title(title) = [

  #v(1.2cm)

  #text(
    size: 22pt,
    weight: "bold",
    fill: rgb("#0a4d91"),
  )[
  ▌ #upper(title)
  ]

  #v(0cm)

  #line(
    length: 100%,
    stroke: 1.5pt + rgb("#2564eb96")
  )

  #v(0.8cm)

]


// =====================================================
// Summary Box
// =====================================================

#let summary-box(
  title,
  content,
  keywords: none,
) = [

  #block(
    inset: 16pt,
    fill: rgb("#EFF6FF"),
    stroke: 1pt + rgb("#BFDBFE"),
    radius: 6pt,
  )[
    #text(
      size: 16pt,
      weight: "bold",
      fill: rgb("#1D4ED8"),
    )[
      #title
    ]

    #v(0.4cm)

    #content

    #if keywords != none [
      #v(0.4cm)

      #text(weight: "bold")[
        Mots-clés :
      ]

      #keywords
    ]
  ]
]

// =====================================================
// Chapter Banner
// =====================================================

#let chapter-banner(
  number,
  title,
  subtitle: none,
) = [

  #pagebreak(weak: true)

  #v(1cm)

  #text(
    size: 20pt,
    weight: "bold",
    fill: rgb("#1c50c2"),
  )[
    CHAPITRE #number
  ]

  #v(0cm)

  #text(
    size: 30pt,
    weight: "bold",
    fill: rgb("#003366"),
  )[
    #title
  ]

  #if subtitle != none [

    #v(-0.5cm)

    #text(
      size: 12pt,
      fill: rgb("#64748B"),
    )[
      #subtitle
    ]
  ]

  #v(0.5cm)

  #line(
    length: 70%,
    stroke: 2pt + rgb("#2564eb96")
  )

  #v(0.5cm)
]


#let frontmatter-banner(title) = [
  #v(-0.1cm)
  
  #block(
    width: 100%,
    fill: rgb("#ffffff"),
    inset: 8pt,
   
  )[
    #align(center)[
      #text(
        fill: black,
        weight: "bold",
        size: 18pt,
      )[
        #upper(title)
      ]
    ]
  ]

  #v( -0.6cm)

  
  

  #v(0.4cm)
]


#let chapter-cover(
  number,
  title,
  subtitle: none,
) = [

  #pagebreak(weak: true)

  // Barre latérale
  #place(
    top + left,
    dx: -1.8cm,
    dy: -2cm,
  )[
    #rect(
      width: 1cm,
      height: 120%,
      fill: rgb("#70b2ca15"),
    )
  ]

  #v(0cm)

  // Bandeau Chapitre
  #align(left)[
    #place(
      top + left,
    dx: -1cm,
    dy: -1.5cm,
  )[
    #block(
      width: 5cm,
      fill: rgb("#ffffff7a"),
      inset: 6pt,
    )[
      #align(center)[
        #text(
          size: 16pt,
          weight: "bold",
          fill: black,
        )[
          CHAPITRE #number
        ]
      ]
    ]
  ]]

  #v(0cm)

  #align(left)[
    #text(
      size: 28pt,
      weight: "bold",
      fill: rgb("#1c474f"),
    )[
      #title
    ]
  ]

  #if subtitle != none [

    #v(-0.5cm)

    #align(left)[
      #text(
        size: 12pt,
        fill: rgb("#64748B"),
      )[
        #subtitle
      ]
    ]
  ]

  #v(0cm)

  #align(left)[
    #line(
      length: 100%,
      stroke: 1pt + rgb("#DCEBE8"),
    )
  ]

  #v(0.8cm)

]





#let chapter-cover_2(
  number,
  title,
  subtitle: none,
) = [

  #pagebreak(weak: true)

  // Barre latérale
  #place(
    top + left,
    dx: -1.8cm,
    dy: -2cm,
  )[
    #rect(
      width: 1cm,
      height: 120%,
      fill: rgb("#70b2ca15"),
    )
  ]

  #v(0cm)

  // Bandeau Chapitre
  #align(left)[
    #place(
      top + left,
    dx: -1cm,
    dy: -1.5cm,
  )[
    #block(
      width: 5cm,
      fill: rgb("#ffffff7a"),
      inset: 6pt,
    )[
      #align(center)[
        #text(
          size: 16pt,
          weight: "bold",
          fill: black,
        )[
          CHAPITRE #number
        ]
      ]
    ]
  ]]

  #v(0cm)

  #align(left)[
    #text(
      size: 28pt,
      weight: "bold",
      fill: rgb("#000000"),
    )[
      #title
    ]
  ]

  #if subtitle != none [

    #v(-0.5cm)

    #align(left)[
      #text(
        size: 12pt,
        fill: rgb("#64748B"),
      )[
        #subtitle
      ]
    ]
  ]

  #v(0cm)

  #align(left)[
    #line(
      length: 100%,
      stroke: 1pt + rgb("#DCEBE8"),
    )
  ]

  #v(0.8cm)

]






#let chapter-cover_3(
  number,
  title,
  subtitle: none,
) = [

  #pagebreak(weak: true)

  // Barre latérale
  #place(
    top + left,
    dx: -1.8cm,
    dy: -2cm,
  )[
    #rect(
      width: 1cm,
      height: 120%,
      fill: rgb("#70b2ca15"),
    )
  ]

  #v(0cm)

  // Bandeau Chapitre
  #align(left)[
    #place(
      top + left,
    dx: -1cm,
    dy: -1.5cm,
  )[
    #block(
      width: 5cm,
      fill: rgb("#ffffff7a"),
      inset: 6pt,
    )[
      #align(center)[
        #text(
          size: 16pt,
          weight: "bold",
          fill: black,
        )[
          CHAPITRE #number
        ]
      ]
    ]
  ]]

  #v(0cm)

  #align(left)[
    #text(
      size: 28pt,
      weight: "bold",
      fill: rgb("#000000"),
    )[
      #title
    ]
  ]

  #if subtitle != none [

    #v(-0.5cm)

    #align(left)[
      #text(
        size: 12pt,
        fill: rgb("#64748B"),
      )[
        #subtitle
      ]
    ]
  ]

  #v(0cm)

  #align(left)[
    #line(
      length: 100%,
      stroke: 1pt + rgb("#DCEBE8"),
    )
  ]

  #v(0.8cm)

]





#let chapter-cover_4(
  number,
  title,
  subtitle: none,
) = [

  #pagebreak(weak: true)

  // Barre latérale
  #place(
    top + left,
    dx: -1.8cm,
    dy: -2cm,
  )[
    #rect(
      width: 1cm,
      height: 120%,
      fill: rgb("#70b2ca15"),
    )
  ]

  #v(0cm)

  // Bandeau Chapitre
  #align(left)[
    #place(
      top + left,
    dx: -1cm,
    dy: -1.5cm,
  )[
    #block(
      width: 5cm,
      fill: rgb("#ffffff7a"),
      inset: 6pt,
    )[
      #align(center)[
        #text(
          size: 16pt,
          weight: "bold",
          fill: black,
        )[
          CHAPITRE #number
        ]
      ]
    ]
  ]]

  #v(0cm)

  #align(left)[
    #text(
      size: 28pt,
      weight: "bold",
      fill: rgb("#000000"),
    )[
      #title
    ]
  ]

  #if subtitle != none [

    #v(-0.5cm)

    #align(left)[
      #text(
        size: 12pt,
        fill: rgb("#64748B"),
      )[
        #subtitle
      ]
    ]
  ]

  #v(0cm)

  #align(left)[
    #line(
      length: 100%,
      stroke: 1pt + rgb("#DCEBE8"),
    )
  ]

  #v(0.8cm)

]





#let chapter-cover_5(
  number,
  title,
  subtitle: none,
) = [

  #pagebreak(weak: true)

  // Barre latérale
  #place(
    top + left,
    dx: -1.8cm,
    dy: -2cm,
  )[
    #rect(
      width: 1cm,
      height: 120%,
      fill: rgb("#70b2ca15"),
    )
  ]

  #v(0cm)

  // Bandeau Chapitre
  #align(left)[
    #place(
      top + left,
    dx: -1cm,
    dy: -1.5cm,
  )[
    #block(
      width: 5cm,
      fill: rgb("#ffffff7a"),
      inset: 6pt,
    )[
      #align(center)[
        #text(
          size: 16pt,
          weight: "bold",
          fill: black,
        )[
          CHAPITRE #number
        ]
      ]
    ]
  ]]

  #v(0cm)

  #align(left)[
    #text(
      size: 28pt,
      weight: "bold",
      fill: rgb("#000000"),
    )[
      #title
    ]
  ]

  #if subtitle != none [

    #v(-0.5cm)

    #align(left)[
      #text(
        size: 12pt,
        fill: rgb("#64748B"),
      )[
        #subtitle
      ]
    ]
  ]

  #v(0cm)

  #align(left)[
    #line(
      length: 100%,
      stroke: 1pt + rgb("#DCEBE8"),
    )
  ]

  #v(0.8cm)

]


// =====================================================
// Academic Acronyms Table
// =====================================================

#let acronym-row(short, meaning) = [
  #grid(
    columns: (3.2cm, 1fr),
    column-gutter: 0.9cm,
    inset: (x: 0pt, y: 5pt),
    align: top,
    [
      #text(
        font: "Times New Roman",
        size: 11pt,
        weight: "bold",
        fill: black,
      )[
        #short
      ]
    ],
    [
      #text(
        font: "Times New Roman",
        size: 11pt,
        fill: black,
      )[
        #meaning
      ]
    ],
  )

  #line(
    length: 100%,
    stroke: 0.35pt + rgb("#BFBFBF"),
  )
]

#let acronym-table(items) = block(
  width: 100%,
  inset: (x: 0pt, y: 0pt),
)[
  #block(
    width: 100%,
    inset: (x: 0pt, y: 6pt),
    stroke: (
      top: 0.6pt + black,
      bottom: 0.6pt + black,
    ),
  )[
    #grid(
      columns: (3.2cm, 1fr),
      column-gutter: 0.9cm,
      align: top,
      [
        #text(
          font: "Times New Roman",
          size: 11pt,
          weight: "bold",
          fill: black,
        )[Acronyme]
      ],
      [
        #align(center)[
        #text(
          font: "Times New Roman",
          size: 11pt,
          weight: "bold",
          fill: black,
        )[Signification]]
      ],
    )
  ]

  #v(2pt)

  #for item in items [
    #acronym-row(item.short, item.meaning)
  ]
]



// #let acronym-badge(short) = box(
//   width: 3cm,
//   inset: (x: 0pt, y: 2pt),
// )[
//   #text(
//     size: 10pt,
//     weight: "bold",
//     fill: rgb("#245E68"),
//   )[
//     #short
//   ]
// ]

// #let acronym-row(short, meaning) = [
//   #grid(
//     columns: (3.4cm, 1fr),
//     column-gutter: 0.8cm,
//     inset: (x: 0pt, y: 1pt),
//     align: horizon,
//     [
//       #acronym-badge(short)
//     ],
//     [
//       #text(size: 10.5pt, fill: rgb("#253044"))[
//         #meaning
//       ]
//     ],
//   )

//   #line(length: 100%, stroke: 0.35pt + rgb("#D7E8EC"))
// ]

// #let acronym-table(items) = block(
//   width: 100%,
//   inset: (x: 0pt, y: 0pt),
// )[
//   #block(
//     width: 100%,
//     inset: (x: 0pt, y: 6pt),
//     stroke: (bottom: 0.8pt + rgb("#8BBCC5")),
//   )[
//     #grid(
//       columns: (3.4cm, 1fr),
//       column-gutter: 0.8cm,
//       [
//         #text(size: 9pt, weight: "bold", fill: rgb("#245E68"))[Acronyme]
//       ],
//       [
//         #text(size: 9pt, weight: "bold", fill: rgb("#245E68"))[Signification]
//       ],
//     )
//   ]

//   #v(2pt)

//   #for item in items {
//     acronym-row(item.short, item.meaning)
//   }
// ]

#let outline-chapter(title) = [
  #show heading.where(level: 1): it => []
  #heading(level: 1, outlined: true)[#title]
]

// #let keyword-chip(label) = box(
//   inset: (x: 4pt, y: 4pt),
//   fill: rgb("#FFFFFF"),
//   stroke: 0.7pt + rgb("#B7D8DF"),
//   radius: 99pt,
// )[
//   #text(
//     size: 9.5pt,
//     weight: "medium",
//     fill: rgb("#245E68"),
//   )[
//     #label
//   ]
// ]

// #let keywords-panel(keywords) = block(
//   width: 100%,
//   inset: 14pt,
//   fill: rgb("#F3FAFA"),
//   stroke: 0.8pt + rgb("#B7D8DF"),
//   radius: 8pt,
// )[
//   #grid(
//     columns: (auto, 1fr),
//     column-gutter: 10pt,
//     align: horizon,
//     [
//       #box(
//         inset: (x: 7pt, y: 5pt),
//         fill: rgb("#696b6b"),
//         radius: 4pt,
//       )[
//         #text(size: 9pt, weight: "bold", fill: white)[MOTS-CLÉS]
//       ]
//     ],
//     [
//       #text(size: 10pt, fill: rgb("#52606D"))[
//         Concepts principaux du projet et accès rapide à la liste des acronymes.
//       ]
//     ],
//   )

//   #v(1pt)



#let academic-keywords(keywords) = block(
  width: 100%,
  inset: (top: 8pt, bottom: 8pt),
)[
  #text(
    font: "Times New Roman",
    size: 11pt,
  )[
    #text(weight: "bold")[Mots-clés : ]
    #for (i, keyword) in keywords.enumerate() [
      #keyword#if i < keywords.len() - 1 [; ]
    ]
  ]
  
]

  






#let capgemini-entity-direction-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.75cm, {
        import cetz.draw: *

        let bg = rgb(255, 248, 236)
        let top-blue = rgb(153, 217, 244)
        let dark-blue = rgb(116, 145, 149)
        let mid-blue = rgb("#30448E")
        let line-color = rgb("#1B2A44")

        // Background bands
        rect(
          (0, 4.1),
          (22, 5.8),
          fill: bg,
          stroke: none,
          radius: 0.18,
        )

        rect(
          (0, 1.15),
          (22, 2.85),
          fill: bg,
          stroke: none,
          radius: 0.18,
        )

        

     

        // Connector lines
        line(
          (11, 4.25),
          (11, 3.0),
          stroke: line-color + 0.8pt,
        )

        line(
          (4.7, 3.0),
          (17.3, 3.0),
          stroke: line-color + 0.8pt,
        )

        for x in (4.7, 7.85, 11, 14.15, 17.3) {
          line(
            (x, 3.0),
            (x, 2.75),
            stroke: line-color + 0.8pt,
          )
        }

        // Helper function for rounded boxes
        let org-box(x, y, w, h, body, fill-color: dark-blue, size: 16pt) = {
          rect(
            (x - w / 1.8, y - h / 1.8),
            (x + w / 1.8, y + h / 1.8),
            fill: fill-color,
            stroke: none,
            radius: 0.15,
          )

          content((x, y), anchor: "center", [
            #align(center)[
              #text(
                size: 8pt,
                fill: white,
              )[
                #body
              ]
            ]
          ])
        }

        // Top entity box
        org-box(
          11,
          4.95,
          2.45,
          1.25,
          [
            #text(fill : black)[CaCpgemini \
            Engineering]
          ],
          fill-color: rgb(236, 160, 124),
          size: 16pt,
        )

        // Direction boxes
        org-box(
          4.7,
          2.0,
          2.45,
          1.15,
          [#text(fill : black)[MG2]],
          fill-color: rgb(251, 193, 143),
          size: 15pt,
        )

        org-box(
          7.85,
          2.0,
          2.45,
          1.15,
          [#text(fill : black)[i-Factories]],
          fill-color: rgb(220, 201, 185),
          size: 15pt,
        )

        org-box(
          11,
          2.0,
          2.45,
          1.15,
          [#text(fill : black)[
            MG2\
            Engineering
          ]],
          fill-color: rgb(233, 194, 132),
          size: 15pt,
        )

        org-box(
          14.15,
          2.0,
          2.45,
          1.15,
          [#text(fill : black)[AIS]],
          fill-color: rgb(241, 194, 168),
          size: 15pt,
        )

        org-box(
          17.3,
          2.0,
          2.45,
          1.15,
          [#text(fill : black)[PowerParts]],
          fill-color: rgb(207, 205, 180),
          size: 15pt,
        )
      })
    ]
  ],
  caption: [Organisation de Capgemini Engineering],
)

#let ais-organization-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.62cm, {
        import cetz.draw: *

        let bg = rgb(255, 248, 236)
        let dark-blue = rgb(116, 145, 149)
        let mid-blue = rgb("#1372f086")
        let main-blue = rgb(153, 217, 244)
        let line-color = rgb("#1B2A44")
        let teal = rgb("#000000")
        let orange = rgb("#000000")

        // =========================
        // Background bands
        // =========================
        rect((0, 9.0), (26, 11.2), fill: bg, stroke: none, radius: 0.18)
        rect((0, 6.0), (26, 8.2), fill: bg, stroke: none, radius: 0.18)
        rect((0, 3.0), (26, 5.2), fill: bg, stroke: none, radius: 0.18)
        rect((0, 0.0), (26, 2.2), fill: bg, stroke: none, radius: 0.18)

        // =========================
        // Helper function for boxes
        // =========================
        let org-box(
          x,
          y,
          w,
          h,
          body,
          fill-color: dark-blue,
          size: 8.5pt,
          text-width: 2.45cm,
        ) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: fill-color,
            stroke: none,
            radius: 0.16,
          )

          content((x, y), anchor: "center", [
            #box(width: text-width)[
              #align(center)[
                #set par(leading: 0.35em)
                #text(
                  size: size,
                  fill: white,
                )[
                  #body
                ]
              ]
            ]
          ])
        }

        // =========================
        // Direction: AIS
        // =========================
        org-box(
          11.25,
          10.1,
          3.4,
          1.45,
          [#text(fill : black)[AIS]],
          fill-color: rgb(235, 159, 125),
          size: 11pt,
          text-width: 2.3cm,
          
        )

        // =========================
        // Departments
        // =========================
        org-box(
          3.9,
          7.1,
          4.25,
          1.75,
          [#text(fill : black)[
            Mechatronics \
            connected \
            systems
          ]],
          fill-color: rgb(253, 193, 139),
          size: 8.4pt,
          text-width: 2.55cm,
        )

        org-box(
          8.8,
          7.1,
          4.25,
          1.75,
          [#text(fill : black)[
            Mechatronics \
            product \
            engineering
          ]],
          fill-color: rgb(218, 199, 183),
          size: 8.4pt,
          text-width: 2.55cm,
        )

        org-box(
          13.7,
          7.1,
          4.25,
          1.75,
          [#text(fill : black)[
            Modeling & \
            Simulation
          ]],
          fill-color: rgb(233, 193, 131),
          size: 8.8pt,
          text-width: 2.45cm,
        )

        org-box(
          18.6,
          7.1,
          4.25,
          1.75,
          [#text(fill : black)[
            EE \
            Architecture \
            & Safety
          ]],
          fill-color: rgb(243, 191, 168),
          size: 8.4pt,
          text-width: 2.55cm,
        )

        // =========================
        // Team
        // =========================
        org-box(
          18.6,
          4.1,
          3.7,
          1.55,
          [#text(fill : black)[SDA]],
          fill-color: rgb(221, 139, 100),
          size: 10pt,
          text-width: 2.2cm,
        )

        // =========================
        // Subteams
        // =========================
        org-box(
          10,
          1.1,
          4.6,
          1.75,
          [#text(fill : black)[
            MBSE, RBSE, \
            & System \
            Engineers
          ]],
          fill-color: rgb(210, 204, 170),
          size: 8pt,
          text-width: 2.75cm,
        )

        org-box(
          15.2,
          1.1,
          3.8,
          1.75,
          [#text(fill : black)[
            NVH \
            Engineers
          ]],
          fill-color: rgb(210, 214, 191),
          size: 8.8pt,
          text-width: 2.25cm,
        )

        org-box(
          20.3,
          1.1,
          4.1,
          1.75,
          [#text(fill : black)[
            Data \
            Analysts / \
            Developers
          ]],
          fill-color: rgb(216, 209, 217),
          size: 8pt,
          text-width: 2.45cm,
        )

        // =========================
        // Connectors: AIS -> Departments
        // =========================
        line(
          (11.25, 9.38),
          (11.25, 8.45),
          stroke: line-color + 0.75pt,
        )

        line(
          (3.9, 8.45),
          (18.6, 8.45),
          stroke: line-color + 0.75pt,
        )

        for x in (3.9, 8.8, 13.7, 18.6) {
          line(
            (x, 8.45),
            (x, 7.98),
            stroke: line-color + 0.75pt,
          )
        }

        // =========================
        // Connector: EE Architecture & Safety -> SDA
        // =========================
        line(
          (18.6, 6.22),
          (18.6, 4.88),
          stroke: teal + 0.85pt,
        )

        // =========================
        // Connectors: SDA -> Subteams
        // =========================
        line(
          (18.6, 3.32),
          (18.6, 2.45),
          stroke: orange + 0.85pt,
        )

        line(
          (11.8, 2.45),
          (20.1, 2.45),
          stroke: orange + 0.85pt,
        )

        for x in (11.8, 16.2, 20.1) {
          line(
            (x, 2.45),
            (x, 1.98),
            stroke: orange + 0.85pt,
          )
        }
      })
    ]
  ],
  caption: [Organisation de la direction AIS],
)



// #import "@preview/cetz:0.5.2"

// #let sda-definition-diagram() = figure(
//   block(width: 100%)[
//     #align(center)[
//       #cetz.canvas(length: 0.72cm, {
//         import cetz.draw: *

//         let cyan = rgb("#76CBE8")
//         let black = rgb("#000000")

//         // Style des lignes pointillées
//         let dashed-stroke = (
//           paint: cyan,
//           thickness: 1.1pt,
//           dash: "dashed",
//         )

//         // Fonction pour les blocs de texte
//         let text-block(x, y, title, body) = {
//           content((x, y), anchor: "north-west", [
//             #box(width: 4.1cm)[
//               #set par(leading: 0.55em)
//               #text(size: 10.5pt, fill: black)[
//                 #underline[#text(weight: "bold")[#title]]

//                 #v(4pt)

//                 #body
//               ]
//             ]
//           ])
//         }

//         // =========================
//         // Lettres SDA
//         // =========================
//         content((5.0, 8.8), anchor: "center", [
//           #text(size: 20pt, fill: black)[S]
//         ])

//         content((7.6, 8.8), anchor: "center", [
//           #text(size: 20pt, fill: black)[D]
//         ])

//         content((10.0, 8.8), anchor: "center", [
//           #text(size: 20pt, fill: black)[A]
//         ])

//         // =========================
//         // Lignes pointillées et flèches
//         // =========================

//         // Système
//         line(
//           (0.8, 8.45),
//           (4.5, 8.45),
//           stroke: dashed-stroke,
//         )

//         line(
//           (0.8, 8.45),
//           (0.8, 4.0),
//           stroke: dashed-stroke,
//           mark: (end: ">"),
//         )

//         // Conception
//         line(
//           (7.6, 8.0),
//           (7.6, 3.8),
//           stroke: dashed-stroke,
//           mark: (end: ">"),
//         )

//         // Analyse
//         line(
//           (10.4, 8.3),
//           (15.1, 8.3),
//           stroke: dashed-stroke,
//         )

//         line(
//           (15.1, 8.3),
//           (15.1, 4.0),
//           stroke: dashed-stroke,
//           mark: (end: ">"),
//         )

//         // =========================
//         // Blocs de texte
//         // =========================

//         text-block(
//           -2,
//           3.3,
//           [Système],
//           [
//             - Un système est un  ensemble
//             d’éléments en  interaction ou
//             interconnectés, agissant selon
//             un ensemble de règles afin de
//             former un tout unifié.
//           ],
//         )

//         text-block(
//           5.2,
//           3.3,
//           [Conception],
//           [
//             - Construire le système à partir
//             de zéro et utiliser de nouvelles
//             idées pour répondre au besoin
//             du client.
//             - Créer et mettre à jour
//             l’architecture du système.
//           ],
//         )

//         text-block(
//           12.8,
//           3.3,
//           [Analyse],
//           [
//             - Vérifier la conformité des
//             exigences avec les standards.

//             - Analyser les exigences
//             d’entrée et identifier les
//             évolutions nécessaires.

//             - Étudier l’impact des
//             évolutions sur l’architecture
//             et les exigences existantes.
//           ],
//         )
//       })
//     ]
//   ],
//   caption: [Signification de l’approche SDA],
// )
// 
#let sda-definition-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.7cm, {
        import cetz.draw: *

        let cyan = rgb(211, 213, 191)
        let black = rgb("#000000")

        // Style des lignes pointillées
        let dashed-stroke = (
          paint: cyan,
          thickness: 1.1pt,
          dash: (4pt, 4pt),
        )

        // Fonction pour les blocs de texte
        let text-block(x, y, title, body, width: 4.3cm) = {
          content((x, y), anchor: "north-west", [
            #box(width: width)[
              #set text(
                font: "Times New Roman",
                size: 9.3pt,
                fill: black,
                hyphenate: false,
              )

              #set par(
                justify: false,
                leading: 0.65em,
              )
              #align(center)[
              #underline[
                #text(weight: "bold")[#title]
              ]]

              #v(5pt)

              #body
            ]
          ])
        }

        // =========================
        // Lettres SDA
        // =========================
        content((5.0, 8.8), anchor: "center", [
          #text(size: 20pt, fill: rgb(252, 193, 142))[S]
        ])

        content((7.6, 8.8), anchor: "center", [
          #text(size: 20pt, fill: rgb(252, 193, 142))[D]
        ])

        content((10.0, 8.8), anchor: "center", [
          #text(size: 20pt, fill: rgb(252, 193, 142))[A]
        ])

        // =========================
        // Lignes pointillées et flèches
        // =========================

        // Système
        line(
          (0.8, 8.45),
          (4.5, 8.45),
          stroke: dashed-stroke,
        )

        line(
          (0.8, 8.45),
          (0.8, 6.0),
          stroke: dashed-stroke,
          mark: (end: ">"),
        )

        // Conception
        line(
          (7.6, 8.0),
          (7.6, 6),
          stroke: dashed-stroke,
          mark: (end: ">"),
        )

        // Analyse
        line(
          (10.4, 8.3),
          (15.1, 8.3),
          stroke: dashed-stroke,
        )

        line(
          (15.1, 8.3),
          (15.1, 6.0),
          stroke: dashed-stroke,
          mark: (end: ">"),
        )

        // =========================
        // Blocs de texte organisés
        // =========================

        text-block(
          -2.5,
          5.5,
          [Système],
          [
            • Un système est un ensemble
            d’éléments en interaction ou
            interconnectés.

            #v(4pt)

            • Ces éléments agissent selon
            un ensemble de règles afin de
            former un tout unifié.
          ],
          width: 4.6cm,
        )

        text-block(
          4.8,
          5.5,
          [Conception (Design) ],
          [
            • Construire le système à partir
            de zéro.

            #v(4pt)

            • Utiliser de nouvelles idées
            pour répondre au besoin du
            client.

            #v(4pt)

            • Créer et mettre à jour
            l’architecture du système.
          ],
          width: 4.8cm,
        )

        text-block(
          12,
          5.5,
          [Analyse],
          [
            • Vérifier la conformité des
            exigences avec les standards.

            #v(4pt)

            • Analyser les exigences
            d’entrée et identifier les
            évolutions nécessaires.

            #v(4pt)

            • Étudier l’impact des
            évolutions sur l’architecture
            et les exigences existantes.
          ],
          width: 5.0cm,
        )
      })
    ]
  ],
  caption: [Signification de l’approche SDA],
)





#let adas-limitations-cards() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.84cm, {
        import cetz.draw: *

        let card-bg = rgb("#fdfbf9")
        let cyan = rgb(235, 159, 125)
        let black = rgb(116, 105, 97)
        let text-dark = rgb("#000000")

        // =========================
        // Fonction carte
        // =========================
        let limitation-card(x, number, title, body) = {
          let y = 0
          let w = 6
          let h = 6.0

          // Fond de la carte
          rect(
            (x, y),
            (x + w, y + h),
            fill: card-bg,
            stroke: none,
            radius: 0.03,
          )

          // Barre verticale turquoise
          rect(
            (x, y),
            (x + 0.2, y + h),
            fill: cyan,
            stroke: none,
          )

          // Cercle du numéro
          circle(
            (x + 0.9, y + h - 0.8),
            radius: 0.55,
            fill: white,
            stroke: black + 0.7pt,
          )

          // Numéro
          content((x + 0.9, y + h - 0.8), anchor: "center", [
            #text(
              size: 30pt,
              weight: "bold",
              fill: black,
            )[
              #number
            ]
          ])

          // Titre
          content((x + 0.55, y + h - 2.0), anchor: "north-west", [
            #box(width: 4.2cm)[
              #text(
                font: "Times New Roman",
                size: 13pt,
                weight: "bold",
                fill: black,
              )[
                #title
              ]
            ]
          ])

          // Description
          content((x + 0.7, y + h - 3.05), anchor: "north-west", [
            #box(width: 4.1cm)[
              #set par(
                justify: false,
                leading: 0.75em,
              )

              #text(
                font: "Times New Roman",
                size: 11.5pt,
                fill: text-dark,
              )[
                #body
              ]
            ]
          ])
        }

        // =========================
        // Cartes
        // =========================

        limitation-card(
          -2.2,
          [1],
          [Génération manuelle],
          [
            Les cas de test sont créés
            manuellement à partir des
            exigences fonctionnelles.
          ],
        )

        limitation-card(
          4.75,
          [2],
          [Couverture limitée],
          [
            Les scénarios rares et critiques
            sont souvent oubliés lors de la
            conception manuelle.
          ],
        )

        limitation-card(
          11.5,
          [3],
          [Time-to-Market long],
          [
            Les cycles de validation longs
            retardent la mise sur le marché
            des fonctions ADAS.
          ],
        )
      })
    ]
  ],
  caption: [Limites du processus actuel de génération des tests ADAS],
)







#let project-planning-gantt-modern() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.8cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let navy = rgb("#4f696b")
        let border = rgb("#374151")
        let header-blue = rgb(125, 176, 243)
        let task-orange = rgb(123, 156, 160)
        let green = rgb("#72C95F")
        let yellow = rgb("#72C95F")
        let gray = rgb("#72C95F")
        let white = rgb(246, 250, 251)
        let dark = rgb("#1F2937")
        let text-blue = rgb("#26324D")
        let pink = rgb("#FF00B8")



        // let bg = rgb(243, 245, 246)
        // let dark-blue = rgb(116, 145, 149)
        // let mid-blue = rgb("#1372f086")
        // let main-blue = rgb(153, 217, 244)
        // let line-color = rgb("#1B2A44")
        // let teal = rgb("#000000")
        // let orange = rgb("#000000")

        // =========================
        // Dimensions
        // =========================
        let left-w = 3.8
        let month-w = 2.25
        let months-count = 7
        let chart-w = left-w + months-count * month-w
        let chart-h = 9.4

        let header-y = 7.7
        let row-h = 1.05

        // Month positions
        // Feb = 0, Mar = 1, Apr = 2, May = 3, Jun = 4, Jul = 5, Aug = 6
        let mx(i) = left-w + i * month-w

        // =========================
        // Outer background
        // =========================
        rect(
          (-0.4, -0.4),
          (chart-w + 0.4, chart-h + 0.4),
          fill: navy,
          stroke: none,
          radius: 0.3,
        )

        // =========================
        // Main white board
        // =========================
        rect(
          (0, 0),
          (chart-w, chart-h),
          fill: white,
          stroke: none,
          radius: 0.35,
        )

        // =========================
        // Grid
        // =========================

        // Vertical line after task column
        line((left-w, 0), (left-w, chart-h), stroke: border + 0.55pt)

        // Month vertical lines
        for i in range(0, months-count + 1) {
          let x = left-w + i * month-w
          line((x, 0), (x, chart-h), stroke: border + 0.45pt)
        }

        // Horizontal lines
        for y in (7.7, 6.65, 5.6, 4.55, 3.5, 2.45, 1.4) {
          line((0, y), (chart-w, y), stroke: border + 0.45pt)
        }

        // =========================
        // Header badges
        // =========================
        let badge(x, y, w, h, label, color) = {
          rect(
            (x, y),
            (x + w, y + h),
            fill: color,
            stroke: none,
            radius: 0.18,
          )

          content((x + w / 2, y + h / 2), anchor: "center", [
            #text(size: 11.5pt, weight: "bold", fill: white)[#label]
          ])
        }

        badge(0.65, 8.85, 2.5, 0.85, [Task], task-orange)

        // Quarter-like headers adapted to Feb-Aug
        badge(mx(0) + 0.35, 8.85, 3.1, 0.85, [Phase 1], header-blue)
        badge(mx(2) + 0.35, 8.85, 3.1, 0.85, [Phase 2], header-blue)
        badge(mx(4) + 0.35, 8.85, 3.1, 0.85, [Phase 3], header-blue)

        // =========================
        // Month labels
        // =========================
        let month-labels = ([Feb], [Mar], [Apr], [May], [Jun], [Jul], [Aug])

        for i in range(0, months-count) {
          let x = mx(i) + month-w / 2
          content((x, 8.25), anchor: "center", [
            #text(size: 8pt, weight: "bold", fill: rgb("#4B5563"))[
              #month-labels.at(i)
            ]
          ])
        }

        // =========================
        // Row labels
        // =========================
        let row-label(y, label) = {
          content((left-w / 2, y), anchor: "center", [
            #text(size: 9.5pt, weight: "bold", fill: text-blue)[#label]
          ])
        }

        row-label(7.15, [Planning])
        row-label(6.10, [MVP 1])
        row-label(5.05, [MVP 2])
        row-label(4.00, [MVP 3])
        row-label(2.95, [MVP 4])
        row-label(1.90, [MVP 5])
        row-label(0.85, [Interface])

        // =========================
        // Helper for bars
        // =========================
        let gantt-bar(x1, x2, y, color, label, label-size: 5.9pt, label-fill: dark) = {
          rect(
            (x1, y - 0.28),
            (x2, y + 0.28),
            fill: color,
            stroke: none,
            radius: 0.18,
          )

          content(((x1 + x2) / 2, y), anchor: "center", [
            #box(width: ((x2 - x1) * 0.55cm))[
              #align(center)[
                #set par(leading: 0.35em)
                #text(size: label-size, weight: "bold", fill: label-fill)[
                  #label
                ]
              ]
            ]
          ])
        }

       

        // =========================
        // Bars
        // =========================

        // Planning / Design: Feb -> Mar
        gantt-bar(
          mx(0) + 0.45,
          mx(1) + 1.55,
          7.15,
          green,
          [Design],
          label-size: 5.4pt,
        )

        // MVP 1: Mar -> Apr
        gantt-bar(
          mx(1) + 0.55,
          mx(2) + 1.75,
          6.10,
          green,
          [MVP 1 – Requirements to Test Cases],
          label-size: 6.2pt,
        )

        // MVP 2: Apr -> Jun
        gantt-bar(
          mx(2) + 0.7,
          mx(4) + 0.95,
          5.05,
          green,
          [MVP 2 – Video Input Layer],
          label-size: 5.4pt,
        )

        // MVP 3: Jun -> Jul
        gantt-bar(
          mx(4) + 0.70,
          mx(5) + 1.85,
          4.00,
          yellow,
          [MVP 3 – Human-in-the-Loop],
          label-size: 5.2pt,
        )

        // MVP 4: Jul
        gantt-bar(
          mx(5) + 0.45,
          mx(5) + 3.75,
          2.95,
          yellow,
          [MVP 4 - chatbot],
          label-size: 5.8pt,
        )

        // MVP 5: Jul -> Aug
        gantt-bar(
          mx(5) + 1.95,
          mx(6) + 1.65,
          1.90,
          gray,
          [MVP 5 - Memoire],
          label-size: 5.8pt,
        )

        // Interface: Mar -> Jul
        gantt-bar(
          mx(1) + 0.05,
          mx(5) + 0.85,
          0.85,
          yellow,
          [Développement de l’interface utilisateur],
          label-size: 5.2pt,
        )

        // =========================
        // Legend
        // =========================
        // rect(
        //   (2.3, -0.45),
        //   (chart-w - 2.3, 0.05),
        //   fill: navy,
        //   stroke: none,
        //   radius: 0.08,
        // )

       

        

       

       
      })
    ]
  ],
  caption: [Planification globale du projet],
)




#let architecture-pipeline-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.50cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let purple = rgb("#B77CCB")
        let blue = rgb("#4A6FDB")
        let green = rgb("#00B050")
        let gray = rgb("#8C8C8C")
        let light-gray = rgb("#F8F8F8")
        let black = rgb("#000000")
        let warning = rgb("#F2C94C")

        // =========================
        // Helper functions
        // =========================
        let box-node(x, y, w, h, title, subtitle: none, stroke-color: purple, title-size: 9pt, sub-size: 8pt) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: stroke-color + 1.2pt,
            radius: 0.20,
          )

          content((x, y + if subtitle == none { 0 } else { 0.18 }), anchor: "center", [
            #box(width: (w * 0.43cm))[
              #align(center)[
                #set par(leading: 0.55em)
                #text(size: title-size, fill: black)[#title]

                #if subtitle != none [
                  #v(3pt)
                  #text(size: sub-size, fill: green)[#subtitle]
                ]
              ]
            ]
          ])
        }

        let simple-node(x, y, w, h, label, stroke-color: gray) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: stroke-color + 0.7pt,
            radius: 0.22,
          )

          content((x, y), anchor: "center", [
            #text(size: 8pt, fill: gray)[#label]
          ])
        }

        let arrow(a, b, color: black) = {
          line(
            a,
            b,
            stroke: color + 0.6pt,
            mark: (end: ">"),
          )
        }

        let poly-arrow(points, color: black) = {
          line(
            ..points,
            stroke: color + 0.6pt,
            mark: (end: ">"),
          )
        }

        // =========================
        // Top contextual data area
        // =========================
        rect(
          (0.2, 12.3),
          (28.5, 15.4),
          fill: none,
          stroke: (paint: rgb("#666666"), thickness: 1.2pt, dash: (5pt, 3pt)),
          radius: 0.0,
        )

        content((0.35, 12.65), anchor: "west", [
          #text(size: 8pt, fill: gray)[Contextual data]
        ])

        simple-node(5.6, 14.3, 3.6, 1.15, [Data Pipelines])
        simple-node(14.2, 14.3, 3.6, 1.15, [Embedding])
        box-node(20.8, 14.3, 3.6, 1.15, [Database], stroke-color: rgb("#DDBAE8"), title-size: 8pt)

        // contextual arrows
        poly-arrow(((1.45, 12.85), (1.45, 14.3), (3.8, 14.3)), color: gray)
        arrow((7.4, 14.3), (12.4, 14.3), color: gray)
        arrow((16.0, 14.3), (19.0, 14.3), color: gray)

        // warning TBC
        content((25.5, 14.15), anchor: "center", [
          #text(size: 22pt, fill: warning)[⚠]
        ])
        content((26.3, 14.15), anchor: "west", [
          #text(size: 13pt, fill: black)[TBC]
        ])

        // Database to tools
        arrow((20.8, 13.72), (20.8, 12.0), color: gray)

        // =========================
        // Main orchestration
        // =========================
        box-node(
          14.2,
          8.0,
          3.6,
          3.6,
          [
            Orchestration \
            pipeline traitement
          ],
          subtitle: [LangGraph],
          stroke-color: purple,
          title-size: 11pt,
          sub-size: 8pt,
        )

        // Context / Prompt engineering
        box-node(
          5.6,
          9.8,
          3.6,
          1.1,
          [
            Context / Prompt \
            engineering
          ],
          stroke-color: purple,
          title-size: 8pt,
        )

        // App hosting
        box-node(
          5.6,
          3.8,
          3.6,
          1.5,
          [
            App Hosting - Api / UI
          ],
          subtitle: [
            fast api / slowapi \
            JWT
          ],
          stroke-color: blue,
          title-size: 8pt,
          sub-size: 7.5pt,
        )

        // Query / Output
        content((0.35, 6.8), anchor: "west", [
          #text(size: 9pt)[Query]
        ])
        content((0.25, 3.9), anchor: "west", [
          #text(size: 9pt)[Output]
        ])

        poly-arrow(((1.6, 6.8), (4.7, 6.8), (4.7, 4.55)), color: black)
        arrow((4.65, 3.9), (1.55, 3.9), color: black)

        // App to orchestration
        poly-arrow(((6.5, 4.55), (6.5, 7.85), (12.4, 7.85)), color: black)

        // Orchestration to prompt
        poly-arrow(((13.5, 9.75), (13.5, 10.0), (7.4, 10.0)), color: black)

        // =========================
        // Right side service blocks
        // =========================

        box-node(
          20.8,
          11.2,
          3.6,
          1.2,
          [Tools],
          subtitle: [API / langchain tool],
          stroke-color: purple,
          title-size: 8pt,
          sub-size: 7.5pt,
        )

        box-node(
          20.8,
          9.8,
          3.6,
          1.2,
          [mémoire],
          subtitle: [postgres db / mem0ai],
          stroke-color: purple,
          title-size: 8pt,
          sub-size: 7.5pt,
        )

        box-node(
          20.8,
          8.2,
          3.6,
          1.45,
          [llm Cache],
          subtitle: [Redis],
          stroke-color: blue,
          title-size: 8pt,
          sub-size: 7.5pt,
        )

        box-node(
          20.8,
          6.2,
          3.6,
          1.55,
          [Logging / LLMops],
          subtitle: [
            Langfuse / structlog \
            Prometheus / Grafana
          ],
          stroke-color: blue,
          title-size: 8pt,
          sub-size: 7.2pt,
        )

        box-node(
          20.8,
          4.0,
          3.6,
          1.35,
          [Validation],
          subtitle: [en cours],
          stroke-color: blue,
          title-size: 8pt,
          sub-size: 7.5pt,
        )

        // LLM APIs and Hosting
        box-node(
          28.5,
          7.1,
          6.3,
          2.7,
          [
            LLM APIs and Hosting \
            \
            API model          Local model
          ],
          subtitle: [gpt / gemini / ollama / tenacity],
          stroke-color: purple,
          title-size: 8pt,
          sub-size: 8pt,
        )

        // =========================
        // Arrows from orchestration
        // =========================

        // To Tools
        poly-arrow(((15.0, 9.75), (15.0, 11.2), (19.0, 11.2)), color: black)

        // To mémoire
        poly-arrow(((15.0, 9.0), (15.0, 9.8), (19.0, 9.8)), color: black)

        // To cache
        arrow((16.0, 8.2), (19.0, 8.2), color: black)

        // To logging
        arrow((16.0, 6.7), (19.0, 6.7), color: black)

        // To validation
        poly-arrow(((14.2, 6.2), (14.2, 4.0), (19.0, 4.0)), color: black)

        // Cache to LLM
        arrow((22.6, 8.2), (25.35, 8.2), color: black)

        // LLM to logging
        arrow((25.35, 6.7), (22.6, 6.7), color: black)

        // Validation to LLM
        poly-arrow(((22.6, 4.0), (28.9, 4.0), (28.9, 5.75)), color: black)
      })
    ]
  ],
  caption: [Architecture globale du pipeline ADAS-R2T],)


#let genai-vs-agentic-radar() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.85cm, {
        import cetz.draw: *

        // =========================
        // Couleurs
        // =========================
        let cyan = rgb(241, 192, 165)
        let cyan-fill = rgb(220, 138, 100)
        let orange = rgb(211, 213, 191)
        let orange-fill = rgb(211, 213, 191)
        let grid = rgb("#E5E7EB")
        let dark = rgb("#4B5563")
        let black = rgb("#111827")

        // =========================
        // Paramètres radar
        // =========================
        let r = 4.0
        let center = (0, 0)

        let angles = (
          90deg,
          18deg,
          -54deg,
          -126deg,
          -198deg,
        )

        let point(angle, value) = {
          let rr = r * value / 10
          (rr * calc.cos(angle), rr * calc.sin(angle))
        }

        // Données
        let genai = (
          point(angles.at(0), 3),
          point(angles.at(1), 4),
          point(angles.at(2), 3),
          point(angles.at(3), 9),
          point(angles.at(4), 3),
        )

        let agentic = (
          point(angles.at(0), 9),
          point(angles.at(1), 8),
          point(angles.at(2), 8),
          point(angles.at(3), 3),
          point(angles.at(4), 8),
        )

        // =========================
        // Légende
        // =========================
        rect((-3.5, 5.0), (-2.8, 5.25), fill: cyan-fill, stroke: cyan + 1pt)
        content((-2.65, 5.13), anchor: "west", [
          #text(size: 8.5pt, fill: dark)[GenAI traditionnelle]
        ])

        rect((0.7, 5.0), (1.4, 5.25), fill: orange-fill, stroke: orange + 1pt)
        content((1.55, 5.13), anchor: "west", [
          #text(size: 8.5pt, fill: dark)[IA agentique]
        ])

        // =========================
        // Grille radar
        // =========================
        for level in (2, 4, 6, 8, 10) {
          let p0 = point(angles.at(0), level)
          let p1 = point(angles.at(1), level)
          let p2 = point(angles.at(2), level)
          let p3 = point(angles.at(3), level)
          let p4 = point(angles.at(4), level)

          line(
            p0, p1, p2, p3, p4, p0,
            stroke: grid + 0.6pt,
          )
        }

        // Axes
        for angle in angles {
          line(
            center,
            point(angle, 10),
            stroke: grid + 0.7pt,
          )
        }

        // Valeurs numériques
        for level in (2, 4, 6, 8, 10) {
          content((0.15, r * level / 10), anchor: "west", [
            #text(size: 7pt, fill: dark)[#str(level)]
          ])
        }

        // =========================
        // Courbe GenAI traditionnelle
        // =========================
        line(
          genai.at(0),
          genai.at(1),
          genai.at(2),
          genai.at(3),
          genai.at(4),
          genai.at(0),
          stroke: cyan + 1.4pt,
        )

        // Courbe IA agentique
        line(
          agentic.at(0),
          agentic.at(1),
          agentic.at(2),
          agentic.at(3),
          agentic.at(4),
          agentic.at(0),
          stroke: orange + 1.4pt,
        )

        // Points GenAI
        for p in genai {
          circle(
            p,
            radius: 0.09,
            fill: white,
            stroke: cyan + 1pt,
          )
        }

        // Points IA agentique
        for p in agentic {
          circle(
            p,
            radius: 0.09,
            fill: orange,
            stroke: white + 0.5pt,
          )
        }

        // =========================
        // Labels
        // =========================
        content(point(angles.at(0), 11.5), anchor: "center", [
          #text(size: 8.5pt, weight: "bold", fill: dark)[Autonomie]
        ])

        content(point(angles.at(1), 11.8), anchor: "west", [
          #box(width: 2.8cm)[
            #text(size: 8.5pt, weight: "bold", fill: dark)[
              Complexité \
              technique
            ]
          ]
        ])

        content(point(angles.at(2), 11.5), anchor: "north-west", [
          #text(size: 8.5pt, weight: "bold", fill: dark)[Coût]
        ])

        content(point(angles.at(3), 11.7), anchor: "north-east", [
          #box(width: 2.7cm)[
            #align(right)[
              #text(size: 8.5pt, weight: "bold", fill: dark)[
                Contrôle \
                humain
              ]
            ]
          ]
        ])

        content(point(angles.at(4), 11.8), anchor: "east", [
          #box(width: 2.9cm)[
            #align(right)[
              #text(size: 8.5pt, weight: "bold", fill: dark)[
                Résilience \
                face aux erreurs
              ]
            ]
          ]
        ])
      })
    ]
  ],
  caption: [Comparaison des attributs structurels entre GenAI traditionnelle et IA agentique],
)






#let agentic-patterns-selection() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.58cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let row-bg = rgb("#DFEBDD")
        let accent = rgb("#00B050")
        let retained = rgb("#9AD92E")
        let gray = rgb("#6B7280")
        let dark = rgb("#000000")
        let line-gray = rgb("#707070")
        let box-stroke = rgb("#777777")

        // =========================
        // Helpers
        // =========================
        let retained-button(x, y) = {
          rect(
            (x, y),
            (x + 2.0, y + 0.7),
            fill: retained,
            stroke: none,
            radius: 0.12,
          )

          content((x + 1.0, y + 0.35), anchor: "center", [
            #text(size: 10pt, weight: "bold", fill: white)[Retenu]
          ])
        }

        let llm-box(x, y, label: none, w: 0.95, h: 0.55) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: none,
            stroke: (paint: box-stroke, thickness: 0.45pt, dash: (3pt, 2pt)),
            radius: 0.08,
          )

          content((x, y), anchor: "center", [
            #text(size: 7pt, fill: gray)[Llm]
          ])

          if label != none {
            content((x, y + 0.48), anchor: "center", [
              #text(size: 5pt, fill: gray)[#label]
            ])
          }
        }

        let arrow(a, b) = {
          line(
            a,
            b,
            stroke: line-gray + 0.45pt,
            mark: (end: ">"),
          )
        }

        let row(y, title, subtitle, draw-pattern) = {
          // row background
          rect(
            (0, y),
            (20.4, y + 1.8),
            fill: row-bg,
            stroke: none,
          )

          // left green line
          line(
            (-0.2, y),
            (-0.2, y + 1.8),
            stroke: accent + 1pt,
          )

          // Title and subtitle
          content((0.25, y + 1.28), anchor: "west", [
            #text(size: 14pt, weight: "bold", fill: dark)[#title]
          ])

          content((0.25, y + 0.72), anchor: "west", [
            #text(size: 11pt, fill: gray)[#subtitle]
          ])

          // Pattern
          draw-pattern(y)

          // Button
          retained-button(17.55, y + 0.55)
        }

        // =========================
        // Pattern 1: Prompt Chaining
        // =========================
        let prompt-chaining(y) = {
          content((9.9, y + 1.55), anchor: "center", [
            #text(size: 5.5pt, fill: gray)[LLM call]
          ])

          content((9.0, y + 0.8), anchor: "center", [
            #text(size: 5.5pt, fill: gray)[In]
          ])

          arrow((9.25, y + 0.8), (9.75, y + 0.8))
          llm-box(10.45, y + 0.8)
          arrow((10.95, y + 0.8), (11.55, y + 0.8))
          llm-box(12.20, y + 0.8)
          arrow((12.70, y + 0.8), (13.30, y + 0.8))

          content((13.55, y + 0.8), anchor: "west", [
            #text(size: 5.5pt, fill: gray)[Out]
          ])
        }

        // =========================
        // Pattern 2: Routing
        // =========================
        let routing(y) = {
          content((9.25, y + 0.8), anchor: "center", [
            #text(size: 5.5pt, fill: gray)[In]
          ])

          arrow((9.55, y + 0.8), (10.05, y + 0.8))
          llm-box(10.55, y + 0.8, label: [Router])

          arrow((11.05, y + 0.9), (11.65, y + 1.35))
          arrow((11.05, y + 0.7), (11.65, y + 0.25))

          llm-box(12.30, y + 1.35)
          llm-box(12.30, y + 0.25)

          arrow((12.80, y + 1.35), (13.25, y + 1.35))
          arrow((12.80, y + 0.25), (13.25, y + 0.25))

          content((13.45, y + 1.35), anchor: "west", [
            #text(size: 5.5pt, fill: gray)[Out]
          ])
          content((13.45, y + 0.25), anchor: "west", [
            #text(size: 5.5pt, fill: gray)[Out]
          ])
        }

        // =========================
        // Pattern 3: Parallelization
        // =========================
        let parallelization(y) = {
          content((9.10, y + 0.85), anchor: "center", [
            #text(size: 5.5pt, fill: gray)[In]
          ])

          arrow((9.45, y + 0.85), (10.35, y + 1.35))
          arrow((9.45, y + 0.85), (10.35, y + 0.30))

          llm-box(11.0, y + 1.35)
          llm-box(11.0, y + 0.30)

          arrow((11.50, y + 1.35), (12.05, y + 1.35))
          arrow((11.50, y + 0.30), (12.05, y + 0.30))

          content((12.25, y + 1.35), anchor: "west", [
            #text(size: 5.5pt, fill: gray)[Out]
          ])
          content((12.25, y + 0.30), anchor: "west", [
            #text(size: 5.5pt, fill: gray)[Out]
          ])
        }

        // =========================
        // Pattern 4: Orchestrator-Workers
        // =========================
        let orchestrator-workers(y) = {
          content((9.10, y + 0.8), anchor: "center", [
            #text(size: 5.5pt, fill: gray)[In]
          ])

          arrow((9.45, y + 0.8), (10.05, y + 0.8))
          llm-box(10.65, y + 0.8, label: [Orchestrator])

          content((12.50, y + 1.55), anchor: "center", [
            #text(size: 5pt, fill: gray)[Workers]
          ])

          arrow((11.15, y + 0.95), (12.10, y + 1.35))
          arrow((11.15, y + 0.80), (12.10, y + 0.80))
          arrow((11.15, y + 0.65), (12.10, y + 0.25))

          llm-box(12.75, y + 1.35)
          llm-box(12.75, y + 0.80)
          llm-box(12.75, y + 0.25)

          arrow((13.25, y + 0.80), (14.10, y + 0.80))
          llm-box(14.75, y + 0.80, label: [Synthesizer])
          arrow((15.25, y + 0.80), (15.90, y + 0.80))

          content((16.15, y + 0.80), anchor: "west", [
            #text(size: 5.5pt, fill: gray)[Out]
          ])
        }

        // =========================
        // Pattern 5: Evaluator-Optimizer
        // =========================
        let evaluator-optimizer(y) = {
          content((9.05, y + 0.80), anchor: "center", [
            #text(size: 5.5pt, fill: gray)[In]
          ])

          arrow((9.40, y + 0.80), (10.15, y + 0.80))
          llm-box(10.85, y + 0.80, label: [Generator])
          arrow((11.35, y + 0.80), (12.05, y + 0.80))
          llm-box(12.75, y + 0.80, label: [Evaluator])
          arrow((13.25, y + 0.80), (13.95, y + 0.80))

          content((14.15, y + 0.80), anchor: "west", [
            #text(size: 5.5pt, fill: gray)[Out]
          ])

          // feedback loop
          line(
            (12.70, y + 0.25),
            (12.20, y - 0.12),
            (11.10, y - 0.12),
            (10.85, y + 0.25),
            stroke: line-gray + 0.45pt,
            mark: (end: ">"),
          )
        }

        // =========================
        // Rows
        // =========================
        row(8.0, [Prompt Chaining], [Séquence linéaire A→B→C], prompt-chaining)
        row(5.8, [Routing], [Classification → spécialiste], routing)
        row(3.6, [Parallelization], [Traitement simultané], parallelization)
        row(1.4, [Orchestrator-Workers], [Chef de projet + planificateur], orchestrator-workers)
        row(-0.8, [Evaluator-Optimizer], [Boucle rétroaction], evaluator-optimizer)
      })
    ]
  ],
  caption: [Patrons d’architecture agentique retenus pour la conception du système],
)



#let agentic-workflows-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#222222")
        let gray = rgb("#666666")
        let light-gray = rgb("#777777")

        // =========================
        // Helpers
        // =========================
        let arrow(a, b) = {
          line(
            a,
            b,
            stroke: gray + 0.55pt,
            mark: (end: ">"),
          )
        }

        let dashed-arrow(a, b) = {
          line(
            a,
            b,
            stroke: (paint: gray, thickness: 0.5pt, dash: (3pt, 2pt)),
            mark: (end: ">"),
          )
        }

        let llm-box(x, y, label: none, w: 1.0, h: 0.62) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: (paint: light-gray, thickness: 0.5pt, dash: (3pt, 2pt)),
            radius: 0.10,
          )

          content((x, y), anchor: "center", [
            #text(size: 6.5pt, fill: gray)[LLM]
          ])

          if label != none {
            content((x, y + 0.55), anchor: "center", [
              #text(size: 5.5pt, fill: gray)[#label]
            ])
          }
        }

        let title(x, y, body, size: 18pt) = {
          content((x, y), anchor: "center", [
            #text(
              font: "Courier New",
              size: size,
              weight: "bold",
              fill: black,
            )[
              #body
            ]
          ])
        }

        let small-label(x, y, body) = {
          content((x, y), anchor: "center", [
            #text(
              font: "Courier New",
              size: 5.7pt,
              fill: black,
            )[
              #body
            ]
          ])
        }

        // =========================
        // Main title
        // =========================
        title(8.5, 10.6, [Workflows], size: 20pt)

        // Vertical dashed separator
        line(
          (8.5, 0.2),
          (8.5, 10.1),
          stroke: (paint: gray, thickness: 0.55pt, dash: (3pt, 2pt)),
        )

        // =====================================================
        // LEFT SIDE — Prompt Chaining
        // =====================================================
        title(3.0, 7.55, [Prompt Chaining], size: 16pt)

        small-label(2.7, 6.95, [LLM call])

        small-label(0.85, 6.55, [In])
        arrow((1.15, 6.55), (1.75, 6.55))
        llm-box(2.25, 6.55)
        arrow((2.75, 6.55), (3.45, 6.55))
        llm-box(3.95, 6.55)
        arrow((4.45, 6.55), (5.15, 6.55))
        small-label(5.45, 6.55, [Out])

        // =====================================================
        // LEFT SIDE — Parallelization
        // =====================================================
        title(3.0, 5.25, [Parallelization], size: 16pt)

        small-label(1.65, 4.15, [In])

        arrow((2.0, 4.15), (2.85, 4.95))
        arrow((2.0, 4.15), (2.85, 3.35))

        llm-box(3.55, 4.95)
        llm-box(3.55, 3.35)

        arrow((4.05, 4.95), (4.75, 4.95))
        arrow((4.05, 3.35), (4.75, 3.35))

        small-label(5.10, 4.95, [Out])
        small-label(5.10, 3.35, [Out])

        // =====================================================
        // RIGHT SIDE — Orchestrator Worker
        // =====================================================
        title(12.6, 8.95, [Orchestrator–Worker], size: 16pt)

        small-label(10.0, 7.85, [In])
        arrow((10.35, 7.85), (10.95, 7.85))

        llm-box(11.50, 7.85, label: [Orchestrator])

        small-label(13.30, 8.55, [Workers])

        dashed-arrow((12.0, 8.05), (13.0, 8.55))
        dashed-arrow((12.0, 7.65), (13.0, 7.15))

        llm-box(13.6, 8.55)
        llm-box(13.6, 7.15)

        dashed-arrow((14.10, 8.00), (15.0, 7.85))

        llm-box(15.55, 7.85, label: [Synthesizer])

        arrow((16.05, 7.85), (16.65, 7.85))
        small-label(17.0, 7.85, [Out])

        // =====================================================
        // RIGHT SIDE — Evaluator Optimizer
        // =====================================================
        title(12.6, 5.85, [Evaluator–optimizer], size: 16pt)

        small-label(10.1, 4.95, [In])
        arrow((10.45, 4.95), (11.05, 4.95))

        llm-box(11.65, 4.95, label: [Generator])
        arrow((12.15, 4.95), (12.85, 4.95))

        llm-box(13.45, 4.95, label: [Evaluator])
        arrow((13.95, 4.95), (14.75, 4.95))

        small-label(15.05, 4.95, [Out])

        // feedback loop
        line(
          (13.45, 4.45),
          (13.15, 4.0),
          (12.10, 4.0),
          (11.65, 4.45),
          stroke: gray + 0.55pt,
          mark: (end: ">"),
        )

        // =====================================================
        // RIGHT SIDE — Routing
        // =====================================================
        title(12.6, 2.95, [Routing], size: 16pt)

        small-label(10.05, 1.85, [In])
        arrow((10.40, 1.85), (11.05, 1.85))

        llm-box(11.65, 1.85, label: [Router])

        arrow((12.15, 2.00), (13.05, 2.55))
        arrow((12.15, 1.65), (13.05, 1.05))

        llm-box(13.70, 2.55)
        llm-box(13.70, 1.05)

        arrow((14.20, 2.55), (14.95, 2.55))
        arrow((14.20, 1.05), (14.95, 1.05))

        small-label(15.25, 2.55, [Out])
        small-label(15.25, 1.05, [Out])
      })
    ]
  ],
  caption: [Principaux workflows utilisés dans les architectures agentiques],
)


#import "@preview/cetz:0.5.2"

#let adas-functional-chain-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.66cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let blue = rgb("#1F77B4")
        let teal = rgb("#00A6A6")
        let green = rgb("#70B77E")
        let orange = rgb("#F59E0B")
        let purple = rgb("#7C3AED")
        let red = rgb("#DC2626")
        let gray = rgb("#6B7280")
        let light = rgb("#F3FAFA")
        let black = rgb("#111827")
        let white = rgb("#FFFFFF")

        // =========================
        // Helpers
        // =========================
        let block-node(x, y, w, h, title, subtitle, color) = {
          // Main box
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: color + 1.15pt,
            radius: 0.18,
          )

          // Header plus grand
          rect(
            (x - w / 2, y + h / 2 - 0.68),
            (x + w / 2, y + h / 2),
            fill: color,
            stroke: none,
            radius: 0.18,
          )

          // Title plus grand
          content((x, y + h / 2 - 0.34), anchor: "center", [
            #box(width: (w * 0.60cm))[
              #align(center)[
                #text(
                  size: 8.8pt,
                  weight: "bold",
                  fill: white,
                  hyphenate: false,
                )[
                  #title
                ]
              ]
            ]
          ])

          // Subtitle
          content((x, y - 0.35), anchor: "center", [
            #box(width: (w * 0.55cm))[
              #align(center)[
                #set par(
                  leading: 0.43em,
                  justify: false,
                )

                #text(
                  size: 6.5pt,
                  fill: black,
                  hyphenate: false,
                )[
                  #subtitle
                ]
              ]
            ]
          ])
        }

        let arrow(a, b, color: gray) = {
          line(
            a,
            b,
            stroke: color + 0.75pt,
            mark: (end: ">"),
          )
        }

        let small-chip(x, y, label, color) = {
          rect(
            (x - 0.82, y - 0.24),
            (x + 0.82, y + 0.24),
            fill: color.lighten(75%),
            stroke: color + 0.45pt,
            radius: 0.12,
          )

          content((x, y), anchor: "center", [
            #text(
              size: 6.2pt,
              weight: "bold",
              fill: color,
            )[
              #label
            ]
          ])
        }

        // =========================
        // Title
        // =========================
        content((12.2, 7.65), anchor: "center", [
          #text(size: 14pt, weight: "bold", fill: black)[
            Chaîne fonctionnelle générale d’un système ADAS
          ]
        ])

        // =========================
        // Main chain nodes
        // =========================
        let y = 5.25
        let w = 3.25
        let h = 2.15

        block-node(
          1.8,
          y,
          w,
          h,
          [Environnement],
          [
            Route \
            Obstacles \
            Véhicules \
            Piétons
          ],
          blue,
        )

        block-node(
          5.95,
          y,
          w,
          h,
          [Capteurs],
          [
            Caméra \
            Radar \
            LiDAR \
            Ultrason
          ],
          teal,
        )

        block-node(
          10.10,
          y,
          w,
          h,
          [Perception],
          [
            Détection \
            Objets \
            Voies \
            Signaux
          ],
          green,
        )

        block-node(
          14.25,
          y,
          w,
          h,
          [Fusion],
          [
            Combinaison \
            des données \
            capteurs
          ],
          orange,
        )

        block-node(
          18.40,
          y,
          w,
          h,
          [Décision],
          [
            Analyse \
            du risque \
            Choix action
          ],
          purple,
        )

        block-node(
          22.55,
          y,
          w,
          h,
          [Assistance],
          [
            Alerte \
            Freinage \
            Direction \
            Vitesse
          ],
          red,
        )

        // =========================
        // Arrows main chain
        // =========================
        arrow((3.43, y), (4.30, y))
        arrow((7.58, y), (8.45, y))
        arrow((11.73, y), (12.60, y))
        arrow((15.88, y), (16.75, y))
        arrow((20.03, y), (20.90, y))

        // =========================
        // ADAS functions row
        // =========================
        content((12.2, 3.05), anchor: "center", [
          #text(size: 11pt, weight: "bold", fill: black)[
            Exemples de fonctions ADAS
          ]
        ])

        small-chip(6.7, 2.38, [ACC], blue)
        small-chip(8.7, 2.38, [AEB], red)
        small-chip(10.7, 2.38, [LKA], green)
        small-chip(12.7, 2.38, [FCW], orange)
        small-chip(14.7, 2.38, [TSR], purple)
        small-chip(16.7, 2.38, [BSW], teal)

        // Link from decision to ADAS functions
        line(
          (18.40, 4.18),
          (18.40, 3.58),
          (12.2, 3.58),
          (12.2, 2.80),
          stroke: gray + 0.65pt,
          mark: (end: ">"),
        )

        // =========================
        // Bottom explanation box
        // =========================
        rect(
          (2.3, 0.68),
          (22.1, 1.50),
          fill: light,
          stroke: 0.55pt + rgb("#B7D8DF"),
          radius: 0.12,
        )

        content((12.2, 1.09), anchor: "center", [
          #box(width: 17.0cm)[
            #align(center)[
              #set par(
                leading: 0.55em,
                justify: false,
              )

              #text(size: 7.5pt, fill: gray)[
                Un système ADAS analyse l’environnement du véhicule à l’aide de capteurs,
                interprète la scène de conduite, puis déclenche une assistance adaptée
                afin d’améliorer la sécurité et le confort du conducteur.
              ]
            ]
          ]
        ])
      })
    ]
  ],
  caption: [Chaîne fonctionnelle générale d’un système ADAS],
)




#let prompt-chain-gate-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#111827")
        let gray = rgb("#6B7280")
        let border = rgb(235, 159, 125)
        let gate-border = rgb(211, 213, 191)
        let red = rgb("#6d888b")
        let white = rgb("#FFFFFF")

        // =========================
        // Helpers
        // =========================
        let arrow(a, b, color: black) = {
          line(
            a,
            b,
            stroke: color + 0.75pt,
            mark: (end: ">"),
          )
        }

        let llm-box(x, y) = {
          rect(
            (x - 0.75, y - 0.48),
            (x + 0.75, y + 0.48),
            fill: white,
            stroke: border + 1.0pt,
            radius: 0.16,
          )

          content((x, y), anchor: "center", [
            #text(
              size: 9pt,
              weight: "bold",
              fill: black,
            )[LLM]
          ])
        }

        let gate-node(x, y) = {
          circle(
            (x, y),
            radius: 0.43,
            fill: white,
            stroke: gate-border + 1.0pt,
          )

          content((x, y), anchor: "center", [
            #text(
              size: 6.2pt,
              fill: gray,
            )[Gate]
          ])
        }

        // =========================
        // Diagram
        // =========================

        // In label
        content((0.0, 0.0), anchor: "center", [
          #text(size: 8pt, fill: gray)[In]
        ])

        // First arrow
        arrow((0.35, 0), (1.05, 0))

        // First LLM
        llm-box(1.85, 0)

        // Arrow LLM 1 -> Gate
        arrow((2.60, 0), (3.15, 0))

        // Gate
        gate-node(3.65, 0)

        // Arrow Gate -> LLM 2
        arrow((4.10, 0), (4.75, 0))

        // Second LLM
        llm-box(5.55, 0)

        // Arrow LLM 2 -> Out
        arrow((6.30, 0), (6.95, 0))

        // Out label
        content((7.25, 0.0), anchor: "west", [
          #text(size: 8pt, fill: gray)[Out]
        ])

        // Fail vertical arrow from Gate
        line(
          (3.65, -0.42),
          (3.65, -1.20),
          stroke: red + 0.65pt,
          mark: (end: ">"),
        )

        // Fail label
        content((3.65, -1.45), anchor: "center", [
          #text(
            size: 8pt,
            weight: "bold",
            fill: red,
          )[Fail]
        ])
      })
    ]
  ],
  caption: [Chaînage de prompts avec étape de validation],
)



#let routing-workflow-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.95cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#111827")
        let gray = rgb("#6B7280")
        let border = rgb(235, 159, 125)
        let gate-border = rgb("#E5E7EB")
        let red = rgb("#6d888b")
        let white = rgb("#FFFFFF")

        // =========================
        // Helpers
        // =========================
        let arrow(a, b, color: black) = {
          line(
            a,
            b,
            stroke: color + 0.75pt,
            mark: (end: ">"),
          )
        }

        let llm-box(x, y) = {
          rect(
            (x - 0.75, y - 0.42),
            (x + 0.75, y + 0.42),
            fill: white,
            stroke: border + 1.0pt,
            radius: 0.14,
          )

          content((x, y), anchor: "center", [
            #text(
              size: 8.5pt,
              weight: "bold",
              fill: black,
            )[LLM]
          ])
        }

        let route-node(x, y) = {
          // Diamond shape
          line(
            (x, y + 0.58),
            (x + 0.72, y),
            (x, y - 0.58),
            (x - 0.72, y),
            (x, y + 0.58),
            stroke: border + 1.0pt,
          )

          content((x, y), anchor: "center", [
            #text(
              size: 6.6pt,
              weight: "bold",
              fill: black,
            )[Route]
          ])
        }

        // =========================
        // Diagram
        // =========================

        // Input label
        content((0.0, 0.0), anchor: "center", [
          #text(size: 8pt, fill: gray)[In]
        ])

        // Arrow In -> Route
        arrow((0.35, 0), (0.95, 0))

        // Route diamond
        route-node(1.75, 0)

        // Branch arrows
        arrow((2.35, 0.28), (3.25, 1.12))
        arrow((2.45, 0.00), (3.25, 0.00))
        arrow((2.35, -0.28), (3.25, -1.12))

        // LLM boxes
        llm-box(4.05, 1.12)
        llm-box(4.05, 0.00)
        llm-box(4.05, -1.12)

        // Arrows LLM -> Out
        arrow((4.80, 1.12), (5.45, 1.12))
        arrow((4.80, 0.00), (5.45, 0.00))
        arrow((4.80, -1.12), (5.45, -1.12))

        // Output labels
        content((5.70, 1.12), anchor: "west", [
          #text(size: 8pt, fill: gray)[Out]
        ])

        content((5.70, 0.00), anchor: "west", [
          #text(size: 8pt, fill: gray)[Out]
        ])

        content((5.70, -1.12), anchor: "west", [
          #text(size: 8pt, fill: gray)[Out]
        ])
      })
    ]
  ],
  caption: [Workflow de routage vers des spécialistes LLM],
)



#let parallelization-workflow-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.95cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#111827")
        let gray = rgb("#6B7280")
        let border = rgb(235, 159, 125)
        let gate-border = rgb("#E5E7EB")
        let red = rgb("#6d888b")
        let white = rgb("#FFFFFF")

        // =========================
        // Helpers
        // =========================
        let arrow(a, b, color: black) = {
          line(
            a,
            b,
            stroke: color + 0.75pt,
            mark: (end: ">"),
          )
        }

        let llm-box(x, y) = {
          rect(
            (x - 0.75, y - 0.42),
            (x + 0.75, y + 0.42),
            fill: white,
            stroke: border + 1.0pt,
            radius: 0.14,
          )

          content((x, y), anchor: "center", [
            #text(
              size: 8.5pt,
              weight: "bold",
              fill: black,
            )[LLM]
          ])
        }

        let merge-box(x, y) = {
          rect(
            (x - 0.82, y - 0.42),
            (x + 0.82, y + 0.42),
            fill: white,
            stroke: border + 1.0pt,
            radius: 0.14,
          )

          content((x, y), anchor: "center", [
            #text(
              size: 7.8pt,
              weight: "bold",
              fill: black,
            )[Merge]
          ])
        }

        let join-node(x, y) = {
          circle(
            (x, y),
            radius: 0.11,
            fill: black,
            stroke: black + 0.5pt,
          )
        }

        // =========================
        // Diagram
        // =========================

        // Input label
        content((0.0, 0.0), anchor: "center", [
          #text(size: 8pt, fill: gray)[In]
        ])

        // Input arrow to split point
        arrow((0.35, 0), (0.95, 0))

        // Split point
        join-node(1.15, 0)

        // Arrows from split to parallel LLMs
        arrow((1.15, 0), (2.15, 1.05))
        arrow((1.15, 0), (2.15, 0.00))
        arrow((1.15, 0), (2.15, -1.05))

        // LLM boxes
        llm-box(3.05, 1.05)
        llm-box(3.05, 0.00)
        llm-box(3.05, -1.05)

        // Join point before Merge

        // Arrows from LLMs to join point
        arrow((3.80, 1.05), (4.95, 0.00))
        arrow((3.80, 0.00), (4.95, 0.00))
        arrow((3.80, -1.05), (4.95, 0.00))

        // Merge box
        merge-box(6.05, 0.00)

        // Arrow join -> Merge
        arrow((5.05, 0.00), (5.25, 0.00))

        // Arrow Merge -> Output
        arrow((6.87, 0.00), (7.55, 0.00))

        // Output label
        content((7.82, 0.0), anchor: "west", [
          #text(size: 8pt, fill: gray)[Out]
        ])
      })
    ]
  ],
  caption: [Workflow de parallélisation avec fusion des résultats],
)


#let orchestrator-workers-workflow-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.95cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#111827")
        let gray = rgb("#6B7280")
        let border = rgb(235, 159, 125)
        let gate-border = rgb("#E5E7EB")
        let red = rgb("#6d888b")
        let white = rgb("#FFFFFF")

        // =========================
        // Helpers
        // =========================
        let arrow(a, b, color: black) = {
          line(
            a,
            b,
            stroke: color + 0.75pt,
            mark: (end: ">"),
          )
        }

        let orchestrator-box(x, y) = {
          rect(
            (x - 1.75, y - 0.52),
            (x + 1.75, y + 0.52),
            fill: white,
            stroke: border + 1.1pt,
            radius: 0.18,
          )

          content((x, y), anchor: "center", [
            #text(
              size: 9pt,
              weight: "bold",
              fill: black,
            )[Orchestrator]
          ])
        }

        let worker-box(x, y) = {
          rect(
            (x - 0.95, y - 0.48),
            (x + 0.95, y + 0.48),
            fill: rgb("#F8FAFC"),
            stroke: gate-border + 1.0pt,
            radius: 0.14,
          )

          content((x, y), anchor: "center", [
            #text(
              size: 8pt,
              weight: "bold",
              fill: gray,
            )[Worker]
          ])
        }

        // =========================
        // Diagram
        // =========================

        // Orchestrator
        orchestrator-box(3.8, 1.55)

        // Workers
        worker-box(1.2, -0.35)
        worker-box(3.8, -0.35)
        worker-box(6.4, -0.35)

        // Arrows: delegate
        arrow((2.8, 1.05), (1.65, 0.18))
        arrow((3.8, 1.03), (3.8, 0.18))
        arrow((4.8, 1.05), (5.95, 0.18))

        // Delegate labels
        content((1.20, 0.62), anchor: "center", [
          #text(size: 6.2pt, fill: gray)[delegate]
        ])

        content((6.40, 0.62), anchor: "center", [
          #text(size: 6.2pt, fill: gray)[delegate]
        ])

        // Results synthesized label
        content((3.8, -1.25), anchor: "center", [
          #text(
            size: 7pt,
            weight: "bold",
            fill: red,
          )[results synthesized]
        ])
      })
    ]
  ],
  caption: [Workflow Orchestrator–Workers],
)




#let evaluator-optimizer-workflow-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.95cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#111827")
        let gray = rgb("#6B7280")
        let border = rgb(235, 159, 125)
        let gate-border = rgb("#E5E7EB")
        let red = rgb("#6d888b")
        let white = rgb("#FFFFFF")

        // =========================
        // Helpers
        // =========================
        let arrow(a, b, color: black) = {
          line(
            a,
            b,
            stroke: color + 0.75pt,
            mark: (end: ">"),
          )
        }

        let process-box(x, y, label) = {
          rect(
            (x - 1.05, y - 0.48),
            (x + 1.05, y + 0.48),
            fill: white,
            stroke: border + 1.05pt,
            radius: 0.16,
          )

          content((x, y), anchor: "center", [
            #text(
              size: 8.3pt,
              weight: "bold",
              fill: black,
            )[
              #label
            ]
          ])
        }

        // =========================
        // Diagram
        // =========================

        // Input
        content((0.0, 0.0), anchor: "center", [
          #text(size: 8pt, fill: gray)[In]
        ])

        // In -> Generator
        arrow((0.35, 0.0), (1.05, 0.0))

        // Generator
        process-box(2.15, 0.0, [Generator])

        // Generator -> Evaluator
        arrow((3.20, 0.0), (4.05, 0.0))

        // Evaluator
        process-box(5.15, 0.0, [Evaluator])

        // Evaluator -> Out
        arrow((6.20, 0.0), (7.00, 0.0))

        // Output
        content((7.28, 0.0), anchor: "west", [
          #text(size: 8pt, fill: gray)[Out]
        ])

        // =========================
        // Feedback loop
        // =========================

        // Feedback path from Evaluator back to Generator
        line(
          (5.15, -0.48),
          (5.15, -1.25),
          (2.15, -1.25),
          (2.15, -0.48),
          stroke: red + 0.75pt,
          mark: (end: ">"),
        )

        // Feedback label
        content((3.65, -1.55), anchor: "center", [
          #text(
            size: 7pt,
            weight: "bold",
            fill: red,
          )[
            feedback
          ]
        ])
      })
    ]
  ],
  caption: [Workflow Evaluator–Optimizer],
)




// =====================================================
// PFE Title Page - Typst Version
// =====================================================

// ---------- Colors ----------
#let ENIADWhite = white
#let ENIADOrange = rgb("#d17a23")
#let ENIADNavy = rgb("#0B1F3A")
#let ENIADBlue = rgb("#0070C0")
#let ENIADLightBlue = rgb("#EAF4FF")
#let ENIADGray = rgb("#6B7280")
#let ENIADDark = rgb("#111827")

// ---------- Variables ----------
#let pfeAcademicYear = "2025–2026"
#let pfeSpeciality = "Intelligence Artificielle et Digital"
#let pfeProjectTitle = [
  ADAS Test Case Generation \ using agentic AI
]
#let pfeStudentName = "Ahmed Oukacha"
#let pfeCompanyName = "Capgemini Engineering"
#let pfeInternshipPeriod = "Février 2026 – Aout 2026"
#let pfeDefenseDate = "Juillet 2026"
#let pfeAcademicSupervisor = "EL IDRISSI MOURAD"
#v(3cm)
#let pfeIndustrialSupervisor = "AYMANE BENSLIMANE
AWATIF ESHAIMI 
CHAIMAE EL MAJJATI
"

// Mets ici les chemins de tes logos.
// Si tu n’as pas encore les logos, mets none.
#let pfeLogoUMP = "img/logo-ump.png"
#let pfeLogoENIAD = "img/logo-eniad.png"

// ---------- Logo helper ----------
#let logo-or-box(path, width, fallback) = {
  if path != none {
    image(path, width: width)
  } else {
    box(
      width: width,
      height: 2.4cm,
      stroke: 0.7pt + rgb("#CBD5E1"),
      radius: 4pt,
      inset: 6pt,
    )[
      #align(center + horizon)[
        #text(size: 9pt, fill: ENIADGray)[#fallback]
      ]
    ]
  }
}

// ---------- Title page ----------
#let pfe-title-page() = [
  #set page(
    width: 21cm,
    height: 29.7cm,
    margin: 0cm,
    header: [],
    footer: [],
  )

  // =====================================================
  // Background
  // =====================================================

  // Fond blanc général
  #place(top + left, dx: 0cm, dy: 0cm)[
    #rect(
      width: 21cm,
      height: 29.7cm,
      fill: ENIADWhite,
      stroke: none,
      
    )
  ]
// ── Triangles décoratifs bas-droite ─────────────────────

// Grand triangle bleu marine
#place(bottom + right, dx: 0cm, dy: 0cm)[
  #box(width: 8cm, height: 8cm)[
    #polygon(
      fill: ENIADNavy,
      stroke: none,
      (100%, 100%),
      (0%, 100%),
      (100%, 0%),
    )
  ]
]

// Petit triangle orange au-dessus
#place(bottom + right, dx: 0cm, dy: 0cm)[
  #box(width: 4.5cm, height: 4.5cm)[
    #polygon(
      fill: ENIADOrange,
      stroke: none,
      (100%, 100%),
      (0%, 100%),
      (100%, 0%),
    )
  ]
]
  // Bande orange fine sous le bandeau supérieur
  #place(top + left, dx: 0cm, dy: 4cm)[
    #rect(
      width: 21cm,
      height: 0.4cm,
      fill: ENIADOrange,
      stroke: none,
    )
  ]

  // Barre verticale orange gauche
  #place(top + left, dx: 1.5cm, dy: 4.4cm)[
    #rect(
      width: 0.35cm,
      height: 22.9cm,
      fill: ENIADOrange,
      stroke: none,
    )
  ]

  // Bandeau inférieur bleu marine
  #place(bottom + left, dx: 0cm, dy: 0cm)[
    #rect(
      width: 21cm,
      height: 2.4cm,
      fill: ENIADNavy,
      stroke: none,
    )
  ]

  // Texte année universitaire dans le pied
  #place(bottom + center, dy: -1.15cm)[
    #text(
      size: 10pt,
      weight: "bold",
      fill: ENIADWhite,
    )[
      Année Universitaire #pfeAcademicYear
    ]
  ]

  // Décoration bas droite simple
  #place(bottom + right, dx: 0cm, dy: 0cm)[
    #rect(
      width: 5.5cm,
      height: 2.4cm,
      fill: ENIADNavy,
      stroke: none,
    )
  ]

  // =====================================================
  // Logos
  // =====================================================

  // Logo UMP
  #place(top + left, dx: 2.2cm, dy: 0.1cm)[
    #logo-or-box(
      pfeLogoUMP,
      5cm,
      [
        Logo \
        Univ. Mohamed \
        Premier
      ],
    )
  ]

  // Logo ENIAD
  #place(top + right, dx: -2cm, dy: 0.23cm)[
    #logo-or-box(
      pfeLogoENIAD,
      5cm,
      [
        Logo \
        ENIAD \
        Berkane
      ],
    )
  ]

  // =====================================================
  // Bloc mention officielle diplôme
  // =====================================================

  #place(top + center, dy: 4.55cm)[
    #box(
      width: 15cm,
      inset: (x: 18pt, y: 8pt),
      fill: ENIADWhite,
      stroke: 1.5pt + ENIADOrange,
      radius: 6pt,
    )[
      #align(center)[
        #text(
          size: 11pt,
          weight: "bold",
          fill: ENIADNavy,
        )[
          Université Mohamed Premier, Oujda, Maroc
        ]

        #v(2pt)

        #text(
          size: 11pt,
          weight: "bold",
          fill: ENIADNavy,
        )[
          École Nationale de l'Intelligence Artificielle et du Digital, Berkane
        ]

        #v(5pt)

        #text(
          size: 15pt,
          weight: "bold",
          fill: ENIADBlue,
        )[
          PROJET DE FIN D'ÉTUDES
        ]

        #v(2pt)

        #text(
          size: 9.5pt,
          style: "italic",
          fill: ENIADGray,
        )[
          Pour l'obtention du Diplôme d'Ingénieur d'État
        ]
      ]
    ]
  ]

  // =====================================================
  // Filière
  // =====================================================

  #place(top + center, dy: 8.55cm)[
    #box(
      width: 12cm,
      height: 0.72cm,
      fill: ENIADOrange,
      radius: 3pt,
    )[
      #align(center + horizon)[
        #text(
          size: 11pt,
          weight: "bold",
          fill: ENIADWhite,
        )[
          Filière : #pfeSpeciality
        ]
      ]
    ]
  ]

  // =====================================================
  // Separateurs et titre du projet
  // =====================================================

  // Trait supérieur
  #place(top + center, dy: 9.5cm)[
    #line(
      length: 14cm,
      stroke: 1.2pt + ENIADOrange,
    )
  ]

  // Titre du projet
  #place(top + center, dy: 10.0cm)[
    #box(width: 15cm)[
      #align(center)[
        #set par(justify: false, leading: 0.75em)

        #text(
          size: 18pt,
          weight: "bold",
          fill: ENIADNavy,
        )[
          #pfeProjectTitle
        ]
      ]
    ]
  ]

  // Trait inférieur
  #place(top + center, dy: 12.2cm)[
    #line(
      length: 14cm,
      stroke: 1.2pt + ENIADOrange,
    )
  ]

  // =====================================================
  // Bloc informations étudiant
  // =====================================================

  #place(top + center, dy: 12.55cm)[
    #box(
      width: 13.5cm,
      inset: 10pt,
      fill: ENIADLightBlue,
      stroke: 1pt + ENIADBlue,
      radius: 7pt,
    )[
      #align(center)[
        #text(
          size: 8.5pt,
          weight: "bold",
          fill: ENIADGray,
        )[
          RÉALISÉ PAR
        ]

        #v(3pt)

        #text(
          size: 16pt,
          weight: "bold",
          fill: ENIADNavy,
        )[
          #pfeStudentName
        ]
      ]

      #v(8pt)

      #line(
        length: 100%,
        stroke: 0.4pt + ENIADBlue.lighten(60%),
      )

      #v(8pt)

      #align(center)[
        #table(
          columns: (4.2cm, 0.3cm, 6.2cm),
          inset: (x: 2pt, y: 3pt),
          stroke: none,

          [#text(size: 9pt, weight: "bold", fill: ENIADGray)[Organisme d'accueil]],
          [#text(size: 9pt, fill: ENIADGray)[:]],
          [#text(size: 9pt, fill: ENIADDark)[#pfeCompanyName]],

          [#text(size: 9pt, weight: "bold", fill: ENIADGray)[Période de stage]],
          [#text(size: 9pt, fill: ENIADGray)[:]],
          [#text(size: 9pt, fill: ENIADDark)[#pfeInternshipPeriod]],

          [#text(size: 9pt, weight: "bold", fill: ENIADGray)[Soutenu le]],
          [#text(size: 9pt, fill: ENIADGray)[:]],
          [#text(size: 9pt, fill: ENIADDark)[#pfeDefenseDate]],
        )
      ]
    ]
  ]

  // =====================================================
  // Tableau du jury
  // =====================================================

  #place(top + center, dy: 18.65cm)[
    #box(width: 14cm)[
      #align(center)[
        #text(
          size: 14pt,
          weight: "bold",
          fill: ENIADNavy,
        )[
          JURY DE SOUTENANCE
        ]

        #v(6pt)

        #table(
          columns: (4.5cm, 5.5cm, 3cm),
          inset: (x: 4pt, y: 4pt),
          stroke: none,

          [#text(size: 8.5pt, weight: "bold", fill: ENIADDark)[LAMOUDAN TARIK]],
          [#text(size: 8.5pt, fill: ENIADGray)[Président du Jury]],
          [#text(size: 8.5pt, fill: ENIADGray)[ENIAD]],

          [#text(size: 8.5pt, weight: "bold", fill: ENIADDark)[LABLOUL BOUCHRA]],
          [#text(size: 8.5pt, fill: ENIADGray)[Examinateur]],
          [#text(size: 8.5pt, fill: ENIADGray)[ENIAD]],

          [#text(size: 8.5pt, weight: "bold", fill: ENIADDark)[#pfeAcademicSupervisor]],
          [#text(size: 8.5pt, fill: ENIADGray)[Encadrant Académique]],
          [#text(size: 8.5pt, fill: ENIADGray)[ENIAD]],


          [#v(0.5cm)
            #text(size: 8.5pt, weight: "bold", fill: ENIADDark)[#pfeIndustrialSupervisor]],
          [#v(1cm)
            #text(size: 8.5pt, fill: ENIADGray)[Relevant de l'organisme d'accueil]],
          [#v(1cm)
            #text(size: 8.5pt, fill: ENIADGray)[#pfeCompanyName]],
        )
      ]
    ]
  ]

  // Force one full page
  #v(29.7cm)
  #pagebreak()
]



// =====================================================
// Front Matter Pages Design
// =====================================================

// Colors
#let ENIADWhite = white
#let ENIADOrange = rgb("#F28C28")
#let ENIADNavy = rgb("#0B1F3A")
#let ENIADBlue = rgb("#0070C0")
#let ENIADLightBlue = rgb("#EAF4FF")
#let ENIADGray = rgb("#6B7280")
#let ENIADDark = rgb("#111827")

// ---------- Decorative background ----------
#let frontmatter-decoration() = [
  // Left vertical orange bar
  

  // Small bottom-right decoration
  #place(bottom + right, dx: 0cm, dy: 0cm)[
    #box(width: 5.5cm, height: 5.5cm)[
      #polygon(
        fill: ENIADNavy,
        stroke: none,
        (100%, 100%),
        (0%, 100%),
        (100%, 0%),
      )
    ]
  ]

  #place(bottom + right, dx: 0cm, dy: 0cm)[
    #box(width: 3.2cm, height: 3.2cm)[
      #polygon(
        fill: ENIADOrange,
        stroke: none,
        (100%, 100%),
        (0%, 100%),
        (100%, 0%),
      )
    ]
  ]
]

// ---------- Frontmatter title ----------
#let frontmatter-page-title(title) = [
  #show heading.where(level: 1): it => [
    #align(left)[
      #text(
        font: "Times New Roman",
        size: 22pt,
        weight: "bold",
        fill: ENIADNavy,
      )[
        #it.body
      ]
    ]

    #v(0.25cm)

    #align(center)[
      #line(
        length: 100%,
        stroke: 1.2pt + ENIADOrange,
      )
    ]

    #v(0.9cm)
  ]

  #heading(
    level: 1,
    numbering: none,
    outlined: true,
  )[#title]
]

// ---------- Hint text ----------
#let hint(body) = text(
  font: "Times New Roman",
  size: 12pt,
  style: "italic",
  fill: ENIADGray,
)[#body]

// ---------- Keywords box ----------
#let keywords-box(title, body, is-rtl: false) = [
  #v(0.8em)

  #block(
    width: 100%,
    inset: 12pt,
    fill: ENIADLightBlue,
    stroke: 0.8pt + ENIADBlue,
    radius: 4pt,
  )[
    #if is-rtl [
      #set text(
        font: "Arial",
        size: 11pt,
        lang: "ar",
        dir: rtl,
      )

      #align(right)[
        #text(
          weight: "bold",
          fill: ENIADNavy,
        )[
          #title
        ]

        #v(0.35em)

        #text(
          style: "italic",
          fill: ENIADDark,
        )[
          #body
        ]
      ]
    ] else [
      #text(
        font: "Times New Roman",
        size: 10pt,
        weight: "bold",
        fill: ENIADNavy,
      )[
        #title
      ]

      #v(0.35em)

      #text(
        font: "Times New Roman",
        size: 11pt,
        style: "italic",
        fill: ENIADDark,
      )[
        #body
      ]
    ]
  ]
]
// ---------- Generic frontmatter page ----------
#let frontmatter-page(title, body, is-rtl: false) = [
  #pagebreak(weak: true)

  #set page(
    header: [],
    footer: context [
      #align(center)[
        #text(size: 10pt)[
          #counter(page).display("i")
        ]
      ]
    ],
  )


  #frontmatter-page-title(title)

  #set text(
    font: "Times New Roman",
    size: 12pt,
  )

  #set par(
    justify: true,
    leading: 1.15em,
  )

  #if is-rtl [
    #set text(
      font: "Arial",
      size: 12pt,
      lang: "ar",
      dir: rtl,
    )

    #align(right)[
      #body
    ]
  ] else [
    #body
  ]

  #pagebreak()
]



// =====================================================
// Navigation Pages: TOC, LOF, LOT, Abbreviations
// Fixed version: decoration in page background
// =====================================================

// ---------- Background only ----------
#let navigation-background = [
  // Left vertical orange bar
  #place(top + left, dx: 1.2cm, dy: 0cm)[
    #rect(
      width: 0.25cm,
      height: 29.7cm,
      fill: ENIADOrange,
      stroke: none,
    )
  ]

  // Bottom-right navy triangle
  #place(bottom + right, dx: 0cm, dy: 0cm)[
    #box(width: 5.5cm, height: 5.5cm)[
      #polygon(
        fill: ENIADNavy,
        stroke: none,
        (100%, 100%),
        (0%, 100%),
        (100%, 0%),
      )
    ]
  ]

  // Bottom-right orange triangle
  #place(bottom + right, dx: 0cm, dy: 0cm)[
    #box(width: 3.2cm, height: 3.2cm)[
      #polygon(
        fill: ENIADOrange,
        stroke: none,
        (100%, 100%),
        (0%, 100%),
        (100%, 0%),
      )
    ]
  ]
]

// ---------- Page setup ----------
#let navigation-page-setup() = [
  #set page(
    header: [],
    footer: [],
    background: navigation-background,
  )

  #set text(
    font: "Times New Roman",
    size: 12pt,
  )
]

// ---------- Title ----------
#let navigation-page-title(title) = [
  #align(left)[
    #text(
      font: "Times New Roman",
      size: 20pt,
      weight: "bold",
      fill: rgb("#475e6e"),
    )[
      #upper(title)
    ]
  ]

  #v(0.25cm)

  

  #v(0.7cm)
]

// =====================================================
// Sommaire
// =====================================================

#let sommaire-page() = [
  #pagebreak(weak: true)
  #navigation-page-setup()

  #navigation-page-title([Sommaire])

  #outline(
    title: none,
    indent: auto,
    depth: 3,
  )

  #pagebreak()
]

// =====================================================
// Liste des figures
// =====================================================

#let liste-figures-page() = [
  #pagebreak(weak: true)
  #navigation-page-setup()

  #navigation-page-title([Liste des figures])

  #outline(
    title: none,
    target: figure,
  )

  #pagebreak()
]

// =====================================================
// Liste des tableaux
// =====================================================

#let liste-tableaux-page() = [
  #pagebreak(weak: true)
  #navigation-page-setup()

  #navigation-page-title([Liste des tableaux])

  #outline(
    title: none,
    target: figure.where(kind: table),
  )

  #pagebreak()
]

// =====================================================
// Abbreviations table
// =====================================================

#let abbreviations-table(items) = [
  #table(
    columns: (3cm, 1fr),
    inset: (x: 8pt, y: 7pt),
    stroke: 0.45pt + rgb("#D1D5DB"),
    fill: (x, y) => {
      if y == 0 {
        ENIADNavy
      } else if calc.odd(y) {
        rgb("#F8FAFC")
      } else {
        white
      }
    },

    table.header(
      text(fill: white, weight: "bold")[Abréviation],
      text(fill: white, weight: "bold")[Signification],
    ),

    ..items
  )
]

// =====================================================
// Liste des abréviations
// =====================================================
// =====================================================
// Liste d'abréviations - Style académique simple
// =====================================================

#let abbreviations-simple-list(items) = [
  #v(1.2cm)

  #table(
    columns: (3.2cm, 1fr),
    inset: (x: 0pt, y: 10pt),
    stroke: none,
    align: (left, left),

    ..items
  )
]

#let liste-abreviations-page() = [
  #pagebreak(weak: true)

  #set page(
    header: [],
    footer: [],
  )

  #set text(
    font: "Times New Roman",
    size: 12pt,
  )

  // Titre
  #v(1.3cm)

  #text(
    font: "Times New Roman",
    size: 24pt,
    weight: "bold",
    fill: ENIADNavy,
  )[
    Liste d’abréviations
  ]

  #v(0.7cm)

  // Ligne orange
  #line(
    length: 100%,
    stroke: 1.4pt + ENIADOrange,
  )

  // Liste des abréviations
  #abbreviations-simple-list((
    [#text(weight: "bold")[ACC]],
    [Adaptive Cruise Control — Régulateur de vitesse adaptatif],

    [#text(weight: "bold")[ADAS]],
    [Advanced Driver Assistance Systems — Systèmes avancés d'aide à la conduite],

    [#text(weight: "bold")[AEB]],
    [Automatic Emergency Braking — Freinage d'urgence automatique],

    [#text(weight: "bold")[API]],
    [Application Programming Interface — Interface de programmation applicative],

    [#text(weight: "bold")[BSW]],
    [Blind Spot Warning — Avertissement d'angle mort],

    [#text(weight: "bold")[CDC]],
    [Cahier des charges — Document de spécification du projet],

    [#text(weight: "bold")[CI/CD]],
    [Continuous Integration / Continuous Deployment — Intégration et déploiement continus],

    [#text(weight: "bold")[ESC]],
    [Electronic Stability Control — Contrôle électronique de stabilité],

    [#text(weight: "bold")[FCW]],
    [Forward Collision Warning — Avertissement de collision frontale],

    [#text(weight: "bold")[GenAI]],
    [Generative Artificial Intelligence — Intelligence artificielle générative],

    [#text(weight: "bold")[HMI]],
    [Human-Machine Interface — Interface homme-machine],

    [#text(weight: "bold")[JWT]],
    [JSON Web Token — Jeton d'authentification web],

    [#text(weight: "bold")[LKA]],
    [Lane Keeping Assist — Aide au maintien de voie],

    [#text(weight: "bold")[LLM]],
    [Large Language Model — Grand modèle de langage],
  ))

  #pagebreak()
]




#let eniad-note(body) = block(
  width: 100%,
  inset: 12pt,
  fill: rgb("#EAF4FF"),
  stroke: (left: 3pt + rgb("#F28C28")),
  radius: 4pt,
)[
  #text(
    font: "Times New Roman",
    size: 11pt,
    fill: rgb("#111827"),
  )[
    #body
  ]
]



// =====================================================
// ENIAD PFE REPORT — Typst Components
// =====================================================

// =====================================================
// Colors ENIAD
// =====================================================

#let ENIADBlue = rgb(0, 62, 126)
#let ENIADOrange = rgb(230, 100, 20)
#let ENIADLightBlue = rgb(210, 228, 248)
#let ENIADGray = rgb(100, 110, 120)
#let ENIADDark = rgb(25, 30, 40)
#let ENIADWhite = white
#let ENIADAccent = rgb(0, 160, 200)
#let ENIADNavy = rgb(10, 35, 80)

// =====================================================
// Variables de personnalisation
// =====================================================

#let pfeStudentName = "Ahmed Oukacha"
#let pfeProjectTitle = "Titre Complet du Projet de Fin d'Études"
#let pfeSpeciality = "Intelligence Artificielle et Digital"
#let pfeAcademicYear = "2025 -- 2026"
#let pfeCompanyName = "Capgemini Engineering"
#let pfeAcademicSupervisor = "Nom du Professeur 3"
#let pfeIndustrialSupervisor = "M./Mme Prénom NOM, Titre"
#let pfeInternshipPeriod = ".... au .... 2026"

#let pfeLogoENIAD = "img/logo-eniad.png"
#let pfeLogoUMP = "img/logo-ump.png"
#let pfeLogoCompany = none

// =====================================================
// Logo helper
// =====================================================

#let logo-or-box(path, width, fallback) = {
  if path != none {
    image(path, width: width)
  } else {
    box(
      width: width,
      height: 2.4cm,
      stroke: 0.7pt + ENIADGray,
      radius: 4pt,
      inset: 6pt,
    )[
      #align(center + horizon)[
        #text(size: 8pt, fill: ENIADGray)[#fallback]
      ]
    ]
  }
}

// =====================================================
// Global page setup
// Equivalent geometry
// =====================================================

#let page-margins = (
  top: 2.5cm,
  bottom: 2.5cm,
  left: 3cm,
  right: 2.5cm,
)

// =====================================================
// Header / Footer
// Equivalent fancyhdr
// =====================================================

#let report-header = context [
  #grid(
    columns: (1fr, auto),
    align: horizon,
    [
      #text(size: 9pt, weight: "bold", fill: ENIADBlue)[ENIAD]
      #text(size: 9pt, fill: ENIADGray)[ | Rapport PFE]
    ],
    [
      #text(size: 9pt, fill: ENIADGray)[
        #let hs = query(heading.where(level: 1).before(here()))
        #if hs.len() > 0 [
          #hs.last().body
        ]
      ]
    ],
  )

  #v(4pt)

  #line(
    length: 100%,
    stroke: 0.4pt + ENIADBlue,
  )
]

#let report-footer = context [
  #line(
    length: 100%,
    stroke: 0.4pt + ENIADOrange.lighten(35%),
  )

  #v(4pt)

  #grid(
    columns: (1fr, auto, 1fr),
    align: horizon,
    [
      #text(size: 9pt, style: "italic", fill: ENIADGray)[
        #pfeStudentName
      ]
    ],
    [
      #text(size: 9pt, fill: ENIADGray)[
        --- #counter(page).display("1") ---
      ]
    ],
    [
      #align(right)[
        #text(size: 9pt, style: "italic", fill: ENIADGray)[
          #pfeAcademicYear
        ]
      ]
    ],
  )
]

// Footer roman for frontmatter
#let frontmatter-footer = context [
  #align(center)[
    #text(size: 9pt, fill: ENIADGray)[
      --- #counter(page).display("i") ---
    ]
  ]
]

// Setup frontmatter
#let setup-frontmatter() = [
  #set page(
    paper: "a4",
    margin: page-margins,
    header: [],
    footer: frontmatter-footer,
  )

  #counter(page).update(1)
]

// Setup body
#let setup-body() = [
  #set page(
    paper: "a4",
    margin: page-margins,
    header: report-header,
    footer: report-footer,
  )

  #counter(page).update(1)
]

// Setup pages without header/footer
#let setup-empty-page() = [
  #set page(
    paper: "a4",
    margin: page-margins,
    header: [],
    footer: [],
  )
]

// =====================================================
// Typography
// =====================================================

#let setup-typography() = [
  #set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "fr",
  )

  #set par(
    justify: true,
    leading: 1.15em,
  )
]

// =====================================================
// Chapter / Section styles
// =====================================================

// Chapter cover similar to LaTeX chapter style
#let eniad-chapter(number, title) = [
  #pagebreak(weak: true)

  #v(0.2cm)

  #box(
    width: 4.4cm,
    height: 1.1cm,
    fill: ENIADBlue,
    radius: 4pt,
  )[
    #align(center + horizon)[
      #text(size: 14pt, weight: "bold", fill: white)[
        CHAPITRE #number
      ]
    ]
  ]

  #v(0.5cm)

  #text(
    font: "Times New Roman",
    size: 28pt,
    weight: "bold",
    fill: ENIADDark,
  )[
    #title
  ]

  #v(0.25cm)

  #line(
    length: 100%,
    stroke: 2.5pt + ENIADOrange,
  )

  #v(0.5cm)

  #heading(
    level: 1,
    outlined: true,
    numbering: none,
  )[#title]
]

// Section style
#show heading.where(level: 2): it => [
  #v(0.8cm)

  #text(
    font: "Times New Roman",
    size: 17pt,
    weight: "bold",
    fill: ENIADBlue,
  )[
    #it.body
  ]

  #v(0.25cm)

  #line(
    length: 100%,
    stroke: 0.6pt + ENIADBlue.lighten(65%),
  )

  #v(0.45cm)
]

// Subsection style
#show heading.where(level: 3): it => [
  #v(0.45cm)

  #text(
    font: "Times New Roman",
    size: 14pt,
    weight: "bold",
    fill: ENIADDark,
  )[
    #it.body
  ]

  #v(0.25cm)
]

// Subsubsection style
#show heading.where(level: 4): it => [
  #v(0.3cm)

  #text(
    font: "Times New Roman",
    size: 12pt,
    weight: "bold",
    fill: ENIADGray,
  )[
    #it.body
  ]

  #v(0.2cm)
]

// =====================================================
// ENIAD boxes
// =====================================================

#let eniad-note(body) = block(
  width: 100%,
  inset: 0pt,
  stroke: 0.8pt + ENIADBlue,
  radius: 4pt,
)[
  #block(
    width: 100%,
    inset: (x: 8pt, y: 5pt),
    fill: ENIADBlue,
    radius: (top-left: 4pt, top-right: 4pt),
  )[
    #text(size: 10.5pt, weight: "bold", fill: white)[
      ⓘ Note
    ]
  ]

  #block(
    width: 100%,
    inset: 10pt,
    fill: ENIADLightBlue.lighten(35%),
    radius: (bottom-left: 4pt, bottom-right: 4pt),
  )[
    #set par(
      justify: true,
      leading: 1.1em,
      first-line-indent: 0cm,
    )

    #text(size: 11pt, fill: ENIADDark)[
      #body
    ]
  ]
]

#let eniad-warning(body) = block(
  width: 100%,
  inset: 0pt,
  stroke: 0.8pt + ENIADOrange,
  radius: 4pt,
)[
  #block(
    width: 100%,
    inset: (x: 8pt, y: 5pt),
    fill: ENIADOrange,
    radius: (top-left: 4pt, top-right: 4pt),
  )[
    #text(size: 10.5pt, weight: "bold", fill: white)[
      ⚠ Problématique
    ]
  ]

  #block(
    width: 100%,
    inset: 10pt,
    fill: ENIADOrange.lighten(85%),
    radius: (bottom-left: 4pt, bottom-right: 4pt),
  )[
    #text(size: 11pt, fill: ENIADDark)[
      #body
    ]
  ]
]

// =====================================================
// Code source style
// Equivalent listings
// =====================================================

#show raw.where(block: true): it => block(
  width: 100%,
  inset: 10pt,
  fill: ENIADLightBlue.lighten(35%),
  stroke: 0.6pt + ENIADBlue.lighten(45%),
  radius: 4pt,
)[
  #text(
    font: "Consolas",
    size: 9pt,
    fill: ENIADDark,
  )[
    #it
  ]
]

// =====================================================
// Figure caption style
// =====================================================

#show figure.caption: it => [
  #v(0.2cm)
  #align(center)[
    #text(size: 9pt, fill: ENIADGray)[
      #it.body
    ]
  ]
]

// =====================================================
// Navigation pages
// Sommaire / Listes / Abréviations
// =====================================================

#let navigation-page-title(title) = [
  #v(1.2cm)

  #text(
    font: "Times New Roman",
    size: 24pt,
    weight: "bold",
    fill: ENIADBlue,
  )[
    #title
  ]

  #v(0.6cm)

  #line(
    length: 100%,
    stroke: 1.4pt + ENIADOrange,
  )

  #v(0.8cm)
]

#let sommaire-page() = [
  #set page(footer: frontmatter-footer)
  #navigation-page-title([Sommaire])

  #outline(
    title: none,
    depth: 3,
    indent: auto,
  )

  #pagebreak()
]

#let liste-figures-page() = [
  #pagebreak(weak: true)
  #place(bottom + center)[
    #context text(size: 9pt, fill: ENIADGray)[--- #counter(page).display("i") ---]
  ]
  #navigation-page-title([Liste des figures])

  #outline(
    title: none,
    target: figure.where(kind: image),
  )

  #pagebreak()
]

#let liste-tableaux-page() = [
  #pagebreak(weak: true)
  #place(bottom + center)[
    #context text(size: 9pt, fill: ENIADGray)[--- #counter(page).display("i") ---]
  ]
  #navigation-page-title([Liste des tableaux])

  #outline(
    title: none,
    target: figure.where(kind: table),
  )
]

// ================================================// =====================================================
// Liste d'abréviations et mots-clés techniques
// =====================================================

#let abbreviations-simple-list(items) = [
  #v(0.8cm)

  #table(
    columns: (3.8cm, 1fr),
    inset: (x: 0pt, y: 6pt),
    stroke: none,
    align: (left, left),

    ..items
  )
]

#let liste-abreviations-page() = [
  #set page(footer: frontmatter-footer)

  #navigation-page-title([Liste d’abréviations ])

  #abbreviations-simple-list((
    [#text(weight: "bold")[ACC]],
    [Adaptive Cruise Control — Régulateur de vitesse adaptatif],

    [#text(weight: "bold")[ADAS]],
    [Advanced Driver Assistance Systems — Systèmes avancés d'aide à la conduite],



    [#text(weight: "bold")[AEB]],
    [Automatic Emergency Braking — Freinage d'urgence automatique],

    [#text(weight: "bold")[AES]],
    [Advanced Encryption Standard — Algorithme de chiffrement utilisé pour protéger les checkpoints au repos],

    [#text(weight: "bold")[API]],
    [Application Programming Interface — Interface de programmation applicative],

    [#text(weight: "bold")[API Contract]],
    [Document de spécification décrivant les endpoints, formats de requêtes, réponses et erreurs],

    [#text(weight: "bold")[API Key]],
    [Clé d'authentification utilisée pour sécuriser les échanges entre services],



    [#text(weight: "bold")[backoff]],
    [Stratégie d'attente progressive entre plusieurs tentatives après une erreur transitoire],

    [#text(weight: "bold")[backend]],
    [Couche serveur intermédiaire responsable de la logique applicative et de la communication avec le pipeline],

    [#text(weight: "bold")[backend BFF]],
    [Backend For Frontend — Backend intermédiaire adapté aux besoins spécifiques du frontend],

    [#text(weight: "bold")[BSW]],
    [Blind Spot Warning — Avertissement d'angle mort],

    [#text(weight: "bold")[callback]],
    [Fonction appelée automatiquement lors d'un événement, par exemple pour tracer un appel LLM],

    [#text(weight: "bold")[CDC]],
    [Cahier des charges — Document de spécification du projet],

    [#text(weight: "bold")[checkpointer]],
    [Composant LangGraph chargé de sauvegarder l'état du graphe pendant l'exécution],

    [#text(weight: "bold")[CI/CD]],
    [Continuous Integration / Continuous Deployment — Intégration et déploiement continus],

    [#text(weight: "bold")[CPU]],
    [Central Processing Unit — Processeur utilisé comme indicateur système dans le monitoring],

    [#text(weight: "bold")[cross-session]],
    [Mémoire ou information persistante réutilisable entre plusieurs sessions d'exécution],


    [#text(weight: "bold")[Design Science Research]],
    [Méthodologie de recherche consistant à concevoir, évaluer et améliorer un artefact],

  

    [#text(weight: "bold")[embeddings]],
    [Représentations vectorielles de textes utilisées pour la recherche sémantique],

    [#text(weight: "bold")[endpoint]],
    [Point d'accès exposé par une API pour réaliser une action spécifique],

 

    [#text(weight: "bold")[ESC]],
    [Electronic Stability Control — Contrôle électronique de stabilité],

   

    [#text(weight: "bold")[FCW]],
    [Forward Collision Warning — Avertissement de collision frontale],

    [#text(weight: "bold")[flow table]],
    [Table décrivant les flux, transitions ou conditions utiles à l'analyse des exigences],

    [#text(weight: "bold")[framework]],
    [Cadre logiciel fournissant des composants et abstractions pour développer une application],

    [#text(weight: "bold")[frame]],
    [Image individuelle extraite d'une vidéo],


    [#text(weight: "bold")[frontend]],
    [Interface utilisateur permettant l'interaction avec le système],

    [#text(weight: "bold")[GenAI]],
    [Generative Artificial Intelligence — Intelligence artificielle générative],

   

    [#text(weight: "bold")[HITL]],
    [Human-in-the-Loop — Mécanisme intégrant une revue humaine dans le pipeline],

    [#text(weight: "bold")[HMI]],
    [Human-Machine Interface — Interface homme-machine],
    
    [#text(weight: "bold")[JSON]],
    [JavaScript Object Notation — Format léger d'échange de données structurées],

    [#text(weight: "bold")[JWT]],
    [JSON Web Token — Jeton d'authentification web],


    [#text(weight: "bold")[LangGraph]],
    [Framework d'orchestration permettant de construire des graphes agentiques avec état persistant],

    [#text(weight: "bold")[LKA]],
    [Lane Keeping Assist — Aide au maintien de voie],

    [#text(weight: "bold")[LLM]],
    [Large Language Model — Grand modèle de langage],

    [#text(weight: "bold")[LLMOps]],
    [Pratiques d'observabilité, monitoring et gestion des applications basées sur des LLM],

  
    [#text(weight: "bold")[middleware]],
    [Composant intermédiaire interceptant les requêtes pour ajouter des traitements transverses],

   

    [#text(weight: "bold")[pipeline]],
    [Chaîne de traitement qui orchestre l'analyse, la génération, l'évaluation et la sortie],



    [#text(weight: "bold")[prompt]],
    [Instruction structurée envoyée à un modèle de langage],

 

    [#text(weight: "bold")[reverse proxy]],
    [Serveur intermédiaire redirigeant les requêtes vers les services internes appropriés],

    [#text(weight: "bold")[semaphore]],
    [Mécanisme de contrôle de concurrence limitant le nombre de tâches parallèles],



    [#text(weight: "bold")[Time Travel]],
    [Mécanisme LangGraph permettant de revenir à un état ou nœud antérieur du graphe],

 

    [#text(weight: "bold")[tokens]],
    [Unités de texte consommées ou générées par un modèle de langage],

    [#text(weight: "bold")[Txt2Sce]],
    [Méthode inspirant la construction de scénarios à partir de descriptions textuelles],

  

    
  ))

  #pagebreak()
]


// =====================================================
// Fonction générique pour table des besoins
// =====================================================
// =====================================================
// Fonction générique pour table des besoins - Style clean
// =====================================================

// =====================================================
// Fonction générique pour table des besoins - Style image
// =====================================================

#let requirements-table(title, columns, rows, caption-text) = [
  #v(0.45cm)

  #text(
    font: "Times New Roman",
    size: 12.5pt,
    weight: "bold",
    fill: ENIADBlue,
  )[
    #title
  ]

  #v(0.25cm)

  #figure(
    block[
      #set text(
        font: "Times New Roman",
        size: 9pt,
      )

      #table(
        columns: columns,
        inset: (x: 5pt, y: 6pt),
        stroke: none,

        align: (x, y) => {
          if x == 0 {
            center
          } else {
            center
          }
        },

        // Top rule
        table.hline(stroke: 0.8pt + black),

        // Header
        rows.at(0),

        // Mid rule
        table.hline(stroke: 0.45pt + black),

        // Body
        ..rows.slice(1),

        // Bottom rule
        table.hline(stroke: 0.8pt + black),
      )
    ],
    caption: caption-text,
    kind: table,
  )
]



// =====================================================
// Tables des besoins du système
// =====================================================

#let requirements-section-tables() = [
  #set text(
    font: "Times New Roman",
    size: 10.5pt,
  )

  #requirements-table(
    [- Besoins fonctionnels],
    (1.6cm, 1fr),
    (
      table.header(
        table.cell(fill:rgb("#DCE6F1"))[

          #text(fill: ENIADBlue, weight: "bold")[ID]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[#text(fill: ENIADBlue, weight: "bold")[Description du besoin fonctionnel]]
          
        ],
      ),

      [#text(weight: "bold", fill: ENIADBlue)[BF01]],
      [Le système doit accepter un fichier Excel contenant des exigences fonctionnelles ADAS et générer un fichier Excel des cas de test.],

      table.cell(fill: ENIADLightBlue.lighten(85%))[
        #text(weight: "bold", fill: ENIADBlue)[BF02]
      ],
      table.cell(fill: ENIADLightBlue.lighten(80%))[
        Le système doit accepter une vidéo de conduite et extraire des scénarios de test avec raisonnement causal : cause, effet et conséquence.
      ],

      [#text(weight: "bold", fill: ENIADBlue)[BF03]],
      [Le système doit supporter trois modes d’entrée : Excel seul, vidéo seule, et Excel + vidéo.],

      table.cell(fill: ENIADLightBlue.lighten(80%))[
        #text(weight: "bold", fill: ENIADBlue)[BF04]
      ],
      table.cell(fill: ENIADLightBlue.lighten(80%))[
        Le système doit permettre à l’utilisateur de revoir les résultats avant le téléchargement : approbation, rejet avec feedback ou suppression.
      ],

      [#text(weight: "bold", fill: ENIADBlue)[BF05]],
      [Le système doit régénérer uniquement les cas de test rejetés sans relancer tout le pipeline.],

      table.cell(fill: ENIADLightBlue.lighten(80%))[
        #text(weight: "bold", fill: ENIADBlue)[BF06]
      ],
      table.cell(fill: ENIADLightBlue.lighten(80%))[
        Le système doit afficher la progression en temps réel pendant la génération à travers un mécanisme de streaming SSE.
      ],

      [#text(weight: "bold", fill: ENIADBlue)[BF07]],
      [Le système doit maintenir un historique des versions et des révisions : v1, v2, v3, etc.],

      table.cell(fill: ENIADLightBlue.lighten(80%))[
        #text(weight: "bold", fill: ENIADBlue)[BF08]
      ],
      table.cell(fill: ENIADLightBlue.lighten(80%))[
        Le système doit évaluer automatiquement 100 % des cas de test générés afin de détecter les contradictions, les éléments hors périmètre et les doublons.
      ],

      [#text(weight: "bold", fill: ENIADBlue)[BF09]],
      [Le système doit apprendre des feedbacks utilisateurs à travers une mémoire à long terme, incluant des règles partagées et des préférences personnelles.],

      table.cell(fill: ENIADLightBlue.lighten(80%))[
        #text(weight: "bold", fill: ENIADBlue)[BF10]
      ],
      table.cell(fill: ENIADLightBlue.lighten(80%))[
        Le système doit supporter plusieurs utilisateurs simultanément avec isolation des données.
      ],
      table.cell(fill: ENIADLightBlue.lighten(80%))[
        #text(weight: "bold", fill: ENIADBlue)[BF11]
      ],
      table.cell(fill: ENIADLightBlue.lighten(80%))[
        L'utilisateur peut consulter les résultats et obtenir une explication de ceux-ci ainsi que des modifications apportées au système via un chatbot.
      ],
      
    ),
    [Liste des besoins fonctionnels],
  )



  // ===============================
  // Besoins Non Fonctionnels
  // ===============================
  #requirements-table(
    [- Besoins non fonctionnels],
    (1.6cm, 3.2cm, 1fr),
    (
      table.header(
        table.cell(fill: rgb("#DCE6F1"))[
          #text(fill: ENIADBlue, weight: "bold")[ID]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
          #text(fill: ENIADBlue, weight: "bold")[Catégorie]]
        ],
        table.cell(fill: rgb("#DCE6F1"))[
          #align(center)[
          #text(fill: ENIADBlue, weight: "bold")[Description du besoin non fonctionnel]]
        ],
      ),

      [#text(weight: "bold", fill: ENIADBlue)[BNF01]],
      [Performance],
      [La génération doit s’effectuer en moins de 120 secondes pour 1 exigence.],

      table.cell(fill: ENIADLightBlue.lighten(80%))[
        #text(weight: "bold", fill: ENIADBlue)[BNF02]
      ],
      table.cell(fill: ENIADLightBlue.lighten(80%))[Scalabilité],
      table.cell(fill: ENIADLightBlue.lighten(80%))[
        L’architecture doit supporter l’ajout des nouvelles fonctions ADAS sans modification majeure.
      ],

      [#text(weight: "bold", fill: ENIADBlue)[BNF03]],
      [Disponibilité],
      [Le système doit reprendre après un crash sans perte des données.],

      table.cell(fill: ENIADLightBlue.lighten(80%))[
        #text(weight: "bold", fill: ENIADBlue)[BNF04]
      ],
      table.cell(fill: ENIADLightBlue.lighten(80%))[Sécurité],
      table.cell(fill: ENIADLightBlue.lighten(80%))[
        Les checkpoints doivent être chiffrés. L’authentification par clé API est obligatoire.
      ],

      [#text(weight: "bold", fill: ENIADBlue)[BNF05]],
      [Maintenabilité],
      [Le code doit être modulaire, documenté et accompagné d’un logging structuré.],

      table.cell(fill: ENIADLightBlue.lighten(80%))[
        #text(weight: "bold", fill: ENIADBlue)[BNF06]
      ],
      table.cell(fill: ENIADLightBlue.lighten(80%))[Portabilité],
      table.cell(fill: ENIADLightBlue.lighten(80%))[
        Le système doit être déployable sur tout environnement.
      ],

      [#text(weight: "bold", fill: ENIADBlue)[BNF07]],
      [Interopérabilité],
      [Le système doit communiquer via une API REST.]
    ),
    [Liste des besoins non fonctionnels],
  )
]


#let eniad-chapter(number, title) = [
  #pagebreak(weak: true)

  #place(bottom + left, dy: 1.5cm)[
    #block(width: 100%)[#report-footer]
  ]

  // ✅ heading مخفي (فقط sommaire)
  #hide[
    #heading(
      level: 1,
      numbering:"1.",
      outlined: true,
    )[Chapitre #number — #title]
  ]

  // ✅ الشكل فقط هو اللي يبقى
  #v(0.2cm)

  // Badge
  #box(
    width: 3.6cm,
    height: 1.1cm,
    fill: ENIADBlue,
    radius: 4pt,
  )[
    #align(center + horizon)[
      #text(size: 13pt, weight: "bold", fill: white)[
        Chapitre #number
      ]
    ]
  ]

  #v(0.5cm)

  // Title
  #text(
    font: "Times New Roman",
    size: 26pt,
    fill: ENIADDark,
  )[
    #title
  ]

  #v(0.6cm)

  // Orange line
  #line(
    length: 100%,
    stroke: 2pt + ENIADOrange,
  )

  #v(0.8cm)
]
#let eniad-warning(body) = block(
  width: 100%,
  radius: 4pt,
  stroke: 1pt + ENIADOrange,
)[
  // Header
  #block(
    width: 100%,
    inset: 6pt,
    fill: ENIADOrange,
    radius: (top-left: 4pt, top-right: 4pt),
  )[
    #text(weight: "bold", fill: white)[⚠ Attention]
  ]

  // Content
  #block(
    width: 100%,
    inset: 10pt,
    fill: rgb("#FFF4E8"),
  )[
    #text(size: 11pt)[#body]
  ]
]

#show heading.where(level: 2): it => [
  #v(0.6cm)

  #text(
    size: 17pt,
    weight: "bold",
    fill: ENIADBlue,
  )[
    #it.body
  ]

  #v(0.2cm)

  #line(
    length: 100%,
    stroke: 0.6pt + rgb("#C5CED8"),
  )

  #v(0.5cm)
]

#show heading.where(level: 3): it => [
  #v(0.3cm)

  #text(
    size: 13pt,
    weight: "bold",
    fill: ENIADDark,
  )[
    #it.body
  ]

  #v(0.3cm)
]

#let eniad-synthese(body) = block(
  width: 100%,
  radius: 6pt,
  stroke: 1pt + ENIADBlue,
)[
  // Header
  #block(
    width: 100%,
    inset: 8pt,
    fill: ENIADBlue,
    radius: (top-left: 6pt, top-right: 6pt),
  )[
    #text(weight: "bold", fill: white)[✔ NOTE]
  ]

  // Content
  #block(
    inset: 12pt,
    fill: rgb("#EDF4FB"),
  )[
    #text(size: 11pt)[#body]
  ]
]


// =====================================================
// Gantt simple avec CeTZ - Planification ADAS-R2T
// =====================================================

#let adas-r2t-simple-gantt() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.77cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let orange = rgb("#e27638")
        let grid = rgb("#D9D9D9")
        let text-gray = rgb("#666666")
        let dark = rgb("#333333")

        // =========================
        // Layout parameters
        // =========================
        let x-label = 2.65
        let x0 = 3.4
        let month-w = 2.05

        let y-top = 7.0
        let y-bottom = 0.7

        // Month x positions
        let feb = x0
        let mar = x0 + month-w
        let apr = x0 + 2 * month-w
        let may = x0 + 3 * month-w
        let jun = x0 + 4 * month-w
        let jul = x0 + 5 * month-w
        let aug = x0 + 6 * month-w
        let end = x0 + 7 * month-w

        // =========================
        // Title
        // =========================
        content(((x0 + end) / 2, 8.0), anchor: "center", [
          #align(center)[
            #text(
            font: "Times New Roman",
            size: 16pt,
            weight: "bold",
            fill: text-gray,
          )[
            
          ]]
          
        ])

        // =========================
        // Vertical grid lines
        // =========================
        for x in (feb, mar, apr, may, jun, jul, aug, end) {
          line(
            (x, y-bottom),
            (x, y-top),
            stroke: grid + 0.7pt,
          )
        }

        // =========================
// Horizontal grid lines
// =========================
for y in (6.45, 5.65, 4.85, 4.05, 3.25, 2.45, 1.35) {
  line(
    (x0, y),
    (end, y),
    stroke: grid + 0.55pt,
  )
}

        // =========================
        // Month labels
        // =========================
        let month-label(x, label) = {
          content((x, 7.35), anchor: "center", [
            #text(
              font: "Times New Roman",
              size: 9pt,
              weight: "bold",
              fill: text-gray,
            )[
              #label
            ]
          ])
        }

        month-label(feb, [Feb])
        month-label(mar, [Mar])
        month-label(apr, [Apr])
        month-label(may, [May])
        month-label(jun, [Jun])
        month-label(jul, [Jul])
        month-label(aug, [Aug])

        // =========================
        // Task labels
        // =========================
        let task-label(y, label) = {
          content((x-label, y), anchor: "east", [
            #text(
              font: "Times New Roman",
              size: 9.2pt,
              fill: text-gray,
            )[
              #label
            ]
          ])
        }

    

        task-label(6.45, [Recherche et étude ])
        task-label(5.65, [MVP 1: Requirements to Tests])
        task-label(4.85, [MVP 2: Video Input Layer])
        task-label(4.05, [MVP 3: Human-in-the-Loop])
        task-label(3.25, [MVP 4: Chatbot])
        task-label(2.45, [MVP 5: Mémoire agents])
        task-label(1.35, [Interface utilisateur])

        // =========================
        // Horizontal bars
        // =========================
        let gantt-bar(x1, x2, y, label, size: 6.8pt) = {
          rect(
            (x1, y - 0.17),
            (x2, y + 0.17),
            fill: orange,
            stroke: none,
            radius: 0.05,
          )

          content(((x1 + x2) / 2, y), anchor: "center", [
            #box(width: ((x2 - x1) * 0.55cm))[
              #align(center)[
                #set par(leading: 0.35em)
                #text(
                  font: "Times New Roman",
                  size: size,
                  weight: "bold",
                  fill: white,
                )[
                  #label
                ]
              ]
            ]
          ])
        }

        // =========================
        // Project bars - contenu ADAS-R2T
        // =========================

        // Planning / Design : Feb -> Mar
        gantt-bar(
          feb,
          mar,
          6.45,
          [],
          size: 7pt,
        )

        // MVP 1 : Mar -> Apr
        gantt-bar(
          mar ,
          apr + 0.15,
          5.65,
          [
            
          ],
          size: 5.8pt,
        )

        // MVP 2 : Apr -> May
        gantt-bar(
          apr + 0.15,
          may + 0.8,
          4.85,
          [],
          size: 6pt,
        )

        // MVP 3 : Jun -> Jul
        gantt-bar(
          may + 0.4,
          jun + 0.4,
          4.05,
          [
            
          ],
          size: 5.8pt,
        )

        // MVP 4 : Jul
        gantt-bar(
          jun + 0.25,
          jun + 2,
          3.25,
          [],
          size: 6.2pt,
        )

        // MVP 5 : Aug
        gantt-bar(
          jun + 0.25,
          jun + 2,
          2.45,
          [
            
          ],
          size: 6pt,
        )

        // Interface : Mar -> Jul
        gantt-bar(
          mar,
          aug,
          1.35,
          [],
          size: 6.2pt,
        )
      })
    ]
  ],
  caption: [Planification globale du projet ADAS-R2T],
)


// =====================================================
// ADAS-R2T Pipeline Stages Diagram - Native Typst Version
// =====================================================

#let adas-r2t-pipeline-stages() = figure(
  block(width: 100%)[
    #set text(font: "Arial")

    // =========================
    // Colors
    // =========================
    #let green = rgb("#2FBF6B")
    #let blue = rgb("#6B86E8")
    #let cyan = rgb("#08B9C9")
    #let beige = rgb("#D2B39E")

    #let card-bg = rgb("#F8F8FA")
    #let bottom-bg = rgb("#f0f0f09f")
    #let input-bg = rgb("#ffffff")
    #let pipeline-bg = rgb("#ffffff")
    #let output-bg = rgb("#ffffff")

    #let gray = rgb("#4B4B4B")

    // =========================
    // Helpers
    // =========================
    #let stage-card(color, number, title, body) = box(
      width: 3.35cm,
      height: 5.15cm,
      fill: card-bg,
      inset: 0pt,
    )[
      #box(
        width: 100%,
        height: 0.20cm,
        fill: color,
      )[]

      #pad(x: 0.28cm, y: 0.30cm)[
        #text(size: 20pt, weight: "bold")[Stage #number]

        #v(-0.1cm)

        #text(size: 10.5pt, weight: "bold")[
          #title
        ]

        #v(0.35cm)

        #text(size: 9pt, fill: gray)[
          #body
        ]
      ]
    ]

    #let arrow-symbol() = align(center + horizon)[
      #text(size: 22pt, weight: "bold")[→]
    ]

    #let bottom-card(color, title, body) = box(
      width: 3.8cm,
      height: 1.3cm,
      fill: color,
      inset: 4pt,
    )[
      #align(center)[
        #text(size: 11pt, weight: "bold")[#title]

        #v(1pt)

        #text(size: 9pt)[
          #body
        ]
      ]
    ]

    // =========================
    // Top stages row
    // =========================

    
    #v(0.1cm)

    // =========================
    // Bottom overview row
    // =========================

    #box(
      width: 100%,
      fill: bottom-bg,
      inset: (x: 0.45cm, y: 0.45cm),
    )[
      #align(center)[
        #grid(
          columns: (3.8cm, 0.9cm, 3.8cm, 0.9cm, 3.8cm),
          column-gutter: 0.25cm,
          align: horizon,

          bottom-card(
            input-bg,
            [#text(fill:rgb("#eca474"))[INPUT]],
            [
              Excel + Video 
            ],
          ),

          arrow-symbol(),

          bottom-card(
            pipeline-bg,
            [#text(fill:rgb("#bda18e"))[PIPELINE]],
            [
              25 nodes LangGraph
            ],
          ),

          arrow-symbol(),

          bottom-card(
            output-bg,
            [#text(fill:rgb(210, 205, 171))[OUTPUT]],
            [
              Excel (test cases)
            ],
          ),
        )
      ]
    ]
  ],
  caption: [Vue synthétique du pipeline ADAS-R2T],
)



#let adas-r2t-pipeline-stages_1() = figure(
  block(width: 100%)[
    #set text(font: "Arial")

    // =========================
    // Colors
    // =========================
    #let green = rgb(254, 192, 141)
    #let blue = rgb(218, 199, 183)
    #let cyan = rgb(233, 193, 131)
    #let beige = rgb(210, 205, 171)

    #let card-bg = rgb("#F8F8FA")
    #let bottom-bg = rgb("#FBFAFC")
    #let input-bg = rgb("#91DFC0")
    #let pipeline-bg = rgb("#A8C7F4")
    #let output-bg = rgb("#F2C6A8")

    #let gray = rgb("#4B4B4B")

    // =========================
    // Helpers
    // =========================
    #let stage-card(color, number, title, body) = box(
      width: 3.35cm,
      height: 5.15cm,
      fill: card-bg,
      inset: 0pt,
    )[
      #box(
        width: 100%,
        height: 0.20cm,
        fill: color,
      )[]

      #pad(x: 0.28cm, y: 0.30cm)[
        #text(size: 20pt, weight: "bold")[Stage #number]

        #v(-0.1cm)

        #text(size: 10.5pt, weight: "bold")[
          #title
        ]

        #v(0.35cm)

        #text(size: 9pt, fill: gray)[
          #body
        ]
      ]
    ]

    #let arrow-symbol() = align(center + horizon)[
      #text(size: 22pt, weight: "bold")[→]
    ]

    #let bottom-card(color, title, body) = box(
      width: 3.8cm,
      height: 1.3cm,
      fill: color,
      inset: 4pt,
    )[
      #align(center)[
        #text(size: 11pt, weight: "bold")[#title]

        #v(1pt)

        #text(size: 9pt)[
          #body
        ]
      ]
    ]

    // =========================
    // Top stages row
    // =========================

    #grid(
      columns: (3.35cm, 0.55cm, 3.35cm, 0.55cm, 3.35cm, 0.55cm, 3.35cm),
      column-gutter: 0.15cm,
      align: horizon,

      stage-card(
        green,
        "1",
        [Input \ Extraction],
        [
          Lire et extraits l’Excel + video
          
        ],
      ),

      arrow-symbol(),

      stage-card(
        blue,
        "2",
        [Semantic Analysis],
        [
          5 analyseurs en parallèle
        ],
      ),

      arrow-symbol(),

      stage-card(
        cyan,
        "3",
        [Test Case Generation],
        [
          Planner + \
          Workers parallèles
        ],
      ),

      arrow-symbol(),

      stage-card(
        beige,
        "4",
        [Evaluation & Output],
        [
          Vérifier qualité \
          Exporter Excel
        ],
      ),
    )

    #v(0.1cm)

    // =========================
    // Bottom overview row
    // =========================

    
  ],
  caption: [Les quatre etapes du pipeline de generation.],
)


// =====================================================
// Architecture Agentic AI / ADAS-R2T Diagram - Same Shape, Readable
// =====================================================

#let agentic-ai-architecture-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.64cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let purple = rgb(235, 159, 124)
        let blue = rgb("#66348b")
        let green = rgb("#92aa07")
        let black = rgb("#111111")
        let gray = rgb("#4B5563")
        let white = rgb("#FFFFFF")

        // =========================
        // Helpers
        // =========================

        let arrow(a, b) = {
          line(
            a,
            b,
            stroke: black + 0.75pt,
            mark: (end: ">"),
          )
        }

        let box-node(
          x,
          y,
          w,
          h,
          stroke-color,
          title,
          body,
          title-size: 7pt,
          body-size: 6pt,
          body-color: green,
        ) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: stroke-color + 1.25pt,
            radius: 0.16,
          )

          // Title
          content((x, y + h * 0.18), anchor: "center", [
            #box(width: (w * 0.52cm))[
              #align(center)[
                #set par(leading: 0.58em, justify: false)
                #text(
                  font: "Arial",
                  size: title-size,
                  weight: "bold",
                  fill: black,
                )[
                  #title
                ]
              ]
            ]
          ])

          // Body
          if body != none {
            content((x, y - h * 0.28), anchor: "center", [
              #box(width: (w * 0.52cm))[
                #align(center)[
                  #set par(leading: 0.58em, justify: false)
                  #text(
                    font: "Arial",
                    size: body-size,
                    fill: body-color,
                  )[
                    #body
                  ]
                ]
              ]
            ])
          }
        }

        let side-label(x, y, label) = {
          content((x, y), anchor: "east", [
            #text(font: "Arial", size: 7pt, fill: black)[#label]
          ])
        }

        let legend-dot(x, y, color) = {
          circle((x, y), radius: 0.11, fill: color, stroke: none)
        }

        let legend-label(x, y, label, color) = {
          content((x, y), anchor: "west", [
            #text(font: "Arial", size: 6pt, fill: color)[#label]
          ])
        }

        // =========================
        // Main nodes
        // =========================

        // Left labels
        side-label(0.35, 4.00, [Query])
        side-label(0.4, 0.20, [Output])

        // App hosting
        box-node(
          1.6,
          2.20,
          3.65,
          2.25,
          blue,
          [App Hosting - Api / UI],
          [
            FastAPI / SlowAPI \
            JWT
          ],
          title-size: 6.2pt,
          body-size: 5.7pt,
        )

        // Context / Prompt engineering
        box-node(
          1.65,
          7.20,
          3.70,
          2.05,
          purple,
          [
            Context / Prompt \
            engineering
          ],
          none,
          title-size: 6.3pt,
        )

        // Orchestration
        box-node(
          7.80,
          4.65,
          3.65,
          3.35,
          purple,
          [
            Orchestration \
            pipeline traitement
          ],
          [LangGraph],
          title-size: 7.5pt,
          body-size: 6.0pt,
        )

        // Right stack components
        box-node(
          12.85,
          8.4,
          3.55,
          2.12,
          purple,
          [Tools],
          [
            API / LangChain \
            tool
          ],
          title-size: 6.2pt,
          body-size: 5.5pt,
        )

        box-node(
          12.85,
          6.1,
          3.55,
          2.12,
          purple,
          [Mémoire],
          [
            PostgreSQL / \
            mem0ai
          ],
          title-size: 6.2pt,
          body-size: 5.5pt,
        )

        box-node(
          12.85,
          3.8,
          3.55,
          2.12,
          blue,
          [LLM Cache],
          [Redis],
          title-size: 6.2pt,
          body-size: 5.5pt,
        )

        box-node(
          12.85,
          1.4,
          3.55,
          2.30,
          blue,
          [Logging / LLMOps],
          [
            Langfuse / Structlog \
            Prometheus / Grafana
          ],
          title-size: 5.8pt,
          body-size: 5.1pt,
        )

        box-node(
          12.85,
          -1.00,
          3.55,
          2.12,
          blue,
          [Validation],
          [pydantic ai],
          title-size: 6.2pt,
          body-size: 5.5pt,
        )

        // LLM APIs and Hosting
        box-node(
          18.95,
          4.55,
          6.25,
          2,
          purple,
          [LLM APIs and Hosting],
          [
            API model / Local model \
            GPT / Gemini / Ollama / Tenacity
          ],
          title-size: 6.2pt,
          body-size: 5.4pt,
        )

        // =========================
        // Arrows - Left side
        // =========================
// =========================
// Arrows - Left side
// =========================

// Query -> App
line(
  (0.50, 4.00),
  (0.85, 4.00),
  (0.85, 3.33),
  stroke: black + 0.75pt,
  mark: (end: ">"),
)

// App -> Output
line(
  (1.60, 1.08),
  (1.60, 0.20),
  (0.55, 0.20),
  stroke: black + 0.75pt,
  mark: (end: ">"),
)

// App -> Orchestration
line(
  (3.43, 2.65),
  (4.35, 2.65),
  (4.35, 4.65),
  (5.98, 4.65),
  stroke: black + 0.75pt,
  mark: (end: ">"),
)

// Orchestration -> Context / Prompt engineering
line(
  (7.80, 6.33),
  (7.80, 7.20),
  (3.50, 7.20),
  stroke: black + 0.75pt,
  mark: (end: ">"),
)


// =========================
// Arrows - Orchestration to stack
// =========================

// Orchestration -> Tools
line(
  (9.63, 5.75),
  (10.25, 5.75),
  (10.25, 8.40),
  (11.08, 8.40),
  stroke: black + 0.75pt,
  mark: (end: ">"),
)

// Orchestration -> Mémoire
line(
  (9.63, 5.35),
  (10.45, 5.35),
  (10.45, 6.10),
  (11.08, 6.10),
  stroke: black + 0.75pt,
  mark: (end: ">"),
)

// Orchestration -> LLM Cache
line(
  (9.63, 3.80),
  (11.08, 3.80),
  stroke: black + 0.75pt,
  mark: (end: ">"),
)

// Orchestration -> Logging / LLMOps
line(
  (9.63, 3.25),
  (10.45, 3.25),
  (10.45, 1.40),
  (11.08, 1.40),
  stroke: black + 0.75pt,
  mark: (end: ">"),
)

// Orchestration -> Validation
line(
  (7.80, 2.98),
  (7.80, -1.00),
  (11.08, -1.00),
  stroke: black + 0.75pt,
  mark: (end: ">"),
)


// =========================
// Arrows - Stack to LLM APIs
// =========================

// LLM Cache -> LLM APIs and Hosting
line(
  (14.63, 3.80),
  (15.83, 3.80),
  stroke: black + 0.75pt,
  mark: (end: ">"),
)

// Validation -> LLM APIs and Hosting
line(
  (14.63, -1.00),
  (18.95, -1.00),
  (18.95, 3.55),
  stroke: black + 0.75pt,
  mark: (end: ">"),
)
        // =========================
        // Legend
        // =========================

        legend-dot(3.25, -3.45, purple)
        legend-label(3.62, -3.45, [Agentic AI Components], purple)

        legend-dot(8.4, -3.45, blue)
        legend-label(8.8, -3.45, [Backend technologie], blue)

        legend-dot(13.20, -3.45, green)
        legend-label(13.57,-3.45, [Technologie utilisée], green)
      })
    ]
  ],
  caption: [Architecture globale des composants agentiques et techniques d’ADAS-R2T],
)
``

// =====================================================
// Pipeline Routing Diagram - Readable Black/White Style
// =====================================================

#let pipeline-routing-modes-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.7cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#111111")
        let gray = rgb("#6B7280")
        let white = rgb("#FFFFFF")
        let light-gray = rgb("#F8FAFC")

        // =========================
        // Helpers
        // =========================

        let solid-arrow(points) = {
          line(
            ..points,
            stroke: black + 0.75pt,
            mark: (end: ">"),
          )
        }

        let dashed-arrow(points) = {
          line(
            ..points,
            stroke: (
              paint: black,
              thickness: 0.65pt,
              dash: "dashed",
            ),
            mark: (end: ">"),
          )
        }

        let flow-label(x, y, txt) = {
          content((x, y), anchor: "center", [
            #text(
              font: "Times New Roman",
              size: 6.6pt,
              style: "italic",
              fill: black,
            )[
              #txt
            ]
          ])
        }

        let pill(x, y, w, h, txt) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: light-gray,
            stroke:rgb("#3385a5"),
            radius: h / 2,
          )

          content((x, y), anchor: "center", [
            #text(
              font: "Times New Roman",
              size: 8.5pt,
              weight: "bold",
              fill: black,
            )[
              #txt
            ]
          ])
        }

        let node(x, y, w, h, title, main, details) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: rgb("#f1b26a"),
            radius: 0.18,
          )

          // Title
          content((x, y + h * 0.27), anchor: "center", [
            #box(width: (w * 0.54cm))[
              #align(center)[
                #set par(leading: 0.55em, justify: false)
                #text(
                  font: "Times New Roman",
                  size: 9.4pt,
                  weight: "bold",
                  fill: black,
                )[
                  #title
                ]
              ]
            ]
          ])

          // Main text
          content((x, y - h * 0.03), anchor: "center", [
            #box(width: (w * 0.54cm))[
              #align(center)[
                #set par(leading: 0.55em, justify: false)
                #text(
                  font: "Times New Roman",
                  size: 7.4pt,
                  fill: black,
                )[
                  #main
                ]
              ]
            ]
          ])

          // Details
          content((x, y - h * 0.32), anchor: "center", [
            #box(width: (w * 0.54cm))[
              #align(center)[
                #set par(leading: 0.50em, justify: false)
                #text(
                  font: "Times New Roman",
                  size: 7.3pt,
                  fill: gray,
                )[
                  #details
                ]
              ]
            ]
          ])
        }

        let legend-line(x1, y, x2, dashed: false) = {
          if dashed {
            line(
              (x1, y),
              (x2, y),
              stroke: (
                paint: black,
                thickness: 0.6pt,
                dash: "dashed",
              ),
            )
          } else {
            line(
              (x1, y),
              (x2, y),
              stroke: black + 0.7pt,
            )
          }
        }

        // =========================
        // Title
        // =========================

        content((8.8, 10.4), anchor: "center", [
          #text(
            font: "Arial",
            size: 11.5pt,
            weight: "bold",
            fill: black,
          )[
          ]
        ])

        // =========================
        // Nodes
        // =========================

        pill(8.8, 9.55, 2.0, 0.55, [START])

        node(
          2.8,
          7.15,
          4.35,
          2.05,
          [Agent 1],
          [Extraction des entrées],
          [
            ingest_excel \
            extract_and_structure
          ],
        )

        node(
          2.8,
          4.65,
          4.35,
          2.05,
          [Agent 2],
          [Analyse sémantique],
          [
            5 analyseurs en parallèle 
          ],
        )

        node(
          2.8,
          2.15,
          4.35,
          2.05,
          [Agent 3],
          [Génération des cas de test],
          [
            planner → workers parallèles 
            synthesizer 
          ],
        )

        node(
          14.4,
          7.15,
          4.55,
          2.05,
          [Agent Vidéo],
          [Analyse et mutations],
          [
            analyze → frames → scenarios 
            mutations
          ],
        )

        node(
          14.4,
          2.15,
          4.55,
          2.05,
          [Agent 4],
          [Evaluation et sortie],
          [
            evaluator → HITL review 
            output Excel .
          ],
        )

        pill(14.5, 0.25, 1.75, 0.48, [END])

        // =========================
        // Main routes
        // =========================

        // START -> Etape 1
        solid-arrow((
          (8.8, 9.28),
          (8.8, 8.45),
          (2.8, 8.45),
          (2.8, 8.18),
        ))
        flow-label(5.7, 8.68, [excel_only / excel_video])

        // START -> Pipeline Video
        solid-arrow((
          (9.25, 9.28),
          (9.25, 8.45),
          (14.4, 8.45),
          (14.4, 8.18),
        ))
        flow-label(12.5, 8.68, [video_only])

        // START -> Pipeline Video dashed branch
        dashed-arrow((
          (9.1, 9.28),
          (9.1, 7.5),
          (10, 7.5),
          (12.4, 7.5),
        ))
        flow-label(9.7, 7.90, [excel_video branche vidéo])

        // Etape 1 -> Etape 2
        solid-arrow((
          (2.8, 6.12),
          (2.8, 5.68),
        ))

        // Etape 2 -> Etape 3
        solid-arrow((
          (2.8, 3.62),
          (2.8, 3.18),
        ))

        // Etape 3 -> Etape 4
        solid-arrow((
          (4.98, 2.15),
          (12.14, 2.15),
        ))

        // Etape 4 -> END
        solid-arrow((
          (14.5, 1.12),
          (14.5, 0.50),
        ))

        // Pipeline Video -> Etape 4
        dashed-arrow((
          (14.4, 6.12),
          (14.4, 4.20),
          (14.4, 4.20),
          (14.4, 3.20),
        ))
        flow-label(14.65, 4.70, [video_only → HITL])

        // Pipeline Video -> Etape 2 : video insights
        dashed-arrow((
          (12.12, 7.),
          (7.00, 5.2),
          (7.00, 5.2),
          (4.98, 4.5),
        ))
        flow-label(8.65, 5.38, [video_insights])

        // TT path from Etape 3 to Etape 4
        dashed-arrow((
          
          (13.30, 1.1),
          (13.30, 0.82),
          (2.55, 0.82),
          (2.55, 1.2),
        ))

        
      })
    ]
  ],
  caption: [Vue globale du pipeline ],
)


// // =====================================================
// // Pipeline — Vue globale  (Fletcher 0.5.8)
// // =====================================================

// #let pipeline-routing-modes-diagram() = {

//   // ── Palette — fill blanc, couleur sur le bord uniquement ──
//   let wh  = white
//   let mu  = rgb("#64748B")
//   let mk  = rgb("#1E293B")

//   // Couleurs sur le bord uniquement, fill = blanc
//   let col-se  = rgb("#059669")   // vert
//   let col-ag1 = rgb("#2563EB")   // bleu
//   let col-ag2 = rgb("#7C3AED")   // violet
//   let col-ag3 = rgb("#EA580C")   // orange
//   let col-vid = rgb("#D97706")   // ambre
//   let col-ag4 = rgb("#DB2777")   // rose

//   let s-main = mk + 1.3pt
//   let s-cond = (paint: rgb("#94A3B8"), thickness: 1pt, dash: "dashed")

//   // Nœud compact : titre + rôle sur 2 lignes, largeur fixe 32mm
//   let nd(title, role) = box(width: 32mm)[
//     #set par(leading: 0.32em)
//     #align(center)[
//       #text(size: 9pt, weight: "bold")[#title]\
//       #text(size: 7.5pt, fill: mu)[#role]
//     ]
//   ]

//   // ──────────────────────────────────────────────────────
//   //  Layout :
//   //    (0.5, 0)  START
//   //    (0, 1)    Agent 1        (1, 1)  Agent Vidéo
//   //    (0, 2)    Agent 2
//   //    (0, 3)    Agent 3
//   //    (0.5, 4)  Agent 4
//   //    (0.5, 5)  END
//   // ──────────────────────────────────────────────────────
//   let dia = fletcher.diagram(
//     cell-size: (42mm, 16mm),
//     node-corner-radius: 5pt,
//     node-inset: 8pt,
//     node-defocus: 0,

//     // START — double bord (extrude) comme dans l'image
//     fletcher.node((0.5, 0),
//       align(center)[#text(size: 9.5pt, weight: "bold")[START]],
//       corner-radius: 14pt,
//       fill: wh, stroke: col-se + 2pt,
//       extrude: (0, 3),
//       name: <start>),

//     fletcher.node((0, 1),
//       nd([Agent 1], [Extraction des entrées]),
//       fill: wh, stroke: col-ag1 + 1.8pt,
//       name: <ag1>),

//     fletcher.node((1, 1),
//       nd([Agent Vidéo], [Analyse et mutations]),
//       fill: wh, stroke: col-vid + 1.8pt,
//       name: <vid>),

//     fletcher.node((0, 2),
//       nd([Agent 2], [Analyse sémantique]),
//       fill: wh, stroke: col-ag2 + 1.8pt,
//       name: <ag2>),

//     fletcher.node((0, 3),
//       nd([Agent 3], [Génération des TCs]),
//       fill: wh, stroke: col-ag3 + 1.8pt,
//       name: <ag3>),

//     fletcher.node((0.5, 4),
//       nd([Agent 4], [Évaluation et sortie]),
//       fill: wh, stroke: col-ag4 + 1.8pt,
//       name: <ag4>),

//     // END — double bord
//     fletcher.node((0.5, 5),
//       align(center)[#text(size: 9.5pt, weight: "bold")[END]],
//       corner-radius: 14pt,
//       fill: wh, stroke: col-se + 2pt,
//       extrude: (0, 3),
//       name: <end>),

//     // Flux principaux
//     fletcher.edge(<start>, <ag1>, "->",
//       label: text(size: 6pt)[excel],
//       label-side: left,
//       stroke: s-main),
//     fletcher.edge(<start>, <vid>, "->",
//       label: text(size: 6pt)[video],
//       label-side: right,
//       stroke: s-main),
//     fletcher.edge(<ag1>, <ag2>, "->", stroke: s-main),
//     fletcher.edge(<ag2>, <ag3>, "->", stroke: s-main),
//     fletcher.edge(<ag3>, <ag4>, "->", stroke: s-main),
//     fletcher.edge(<ag4>, <end>, "->", stroke: s-main),

//     // Flux conditionnels (tirets)
//     fletcher.edge(<vid>, (0.9, 1), (0.9, 2), <ag2>, "->",
//       label: text(size: 6pt)[video\_insights],
//       label-side: right,
//       stroke: s-cond),

//     // Routage en C à droite : Vidéo → (col 1.55, r1) → (col 1.55, r4) → Agent 4
//     fletcher.edge(<vid>, (1.2, 1), (1.25, 4), <ag4>, "->",
//       label: text(size: 6pt)[video → HITL],
//       label-pos: 0.65,
//       label-side: right,
//       stroke: s-cond),
//   )

//   // Légende horizontale
//   let hleg = block(
//     stroke: rgb("#E2E8F0") + 0.8pt,
//     radius: 4pt,
//     inset: (x: 10pt, y: 7pt),
//     width: 100%,
//   )[
//     #align(center)[
//       #box(stroke: col-se  + 1.5pt, fill: wh, width: 12pt, height: 8pt, radius: 10pt)
//       #h(3pt)#text(size: 7pt)[Début/Fin]#h(10pt)
//       #box(stroke: col-ag1 + 1.5pt, fill: wh, width: 12pt, height: 8pt, radius: 2pt)
//       #h(3pt)#text(size: 7pt)[Agent 1]#h(10pt)
//       #box(stroke: col-vid + 1.5pt, fill: wh, width: 12pt, height: 8pt, radius: 2pt)
//       #h(3pt)#text(size: 7pt)[Agent Vidéo]#h(10pt)
//       #box(stroke: col-ag2 + 1.5pt, fill: wh, width: 12pt, height: 8pt, radius: 2pt)
//       #h(3pt)#text(size: 7pt)[Agent 2]#h(10pt)
//       #box(stroke: col-ag3 + 1.5pt, fill: wh, width: 12pt, height: 8pt, radius: 2pt)
//       #h(3pt)#text(size: 7pt)[Agent 3]#h(10pt)
//       #box(stroke: col-ag4 + 1.5pt, fill: wh, width: 12pt, height: 8pt, radius: 2pt)
//       #h(3pt)#text(size: 7pt)[Agent 4]#h(12pt)
//       #box(baseline: 2pt)[#line(length: 16pt, stroke: mk + 1.2pt)]
//       #h(3pt)#text(size: 7pt)[Flux principal]#h(10pt)
//       #box(baseline: 2pt)[#line(length: 16pt,
//         stroke: (paint: rgb("#94A3B8"), thickness: 1pt, dash: "dashed"))]
//       #h(3pt)#text(size: 7pt)[Flux conditionnel]
//     ]
//   ]

//   figure(
//     block(width: 100%)[
//       #align(center, dia)
//       #v(8pt)
//       #hleg
//     ],
//     caption: [Vue globale du pipeline],
//   )
// }


// =====================================================
// Branche Excel Graph - Same Graph Style, White Background
// =====================================================

#let excel-branch-ingestion-graph() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#111111")
        let gray = rgb("#6B7280")
        let white = rgb("#FFFFFF")
        let light = rgb("#FFFFFF")
        let orange = rgb("#F59E0B")

        // =========================
        // Helpers
        // =========================

        let solid-arrow(points) = {
          line(
            ..points,
            stroke: black + 0.85pt,
            mark: (end: ">"),
          )
        }

        let dashed-arrow(points) = {
          line(
            ..points,
            stroke: (
              paint: black,
              thickness: 0.75pt,
              dash: "dashed",
            ),
            mark: (end: ">"),
          )
        }

        let pill-node(x, y, w, h, label,fill-color: rgb("#000000")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: light,
            stroke: fill-color,
            radius: h / 2,
          )

          content((x, y), anchor: "center", [
            #text(
              font: "Times New Roman",
              size: 7.5pt,
              weight: "bold",
              fill: black,
            )[
              #label
            ]
          ])
        }

        let graph-node(x, y, w, h, title, body,fill-color: rgb("#000000")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: light,
            stroke: fill-color ,
            radius: 0.20,
          )

          content((x, y + h * 0.16), anchor: "center", [
            #box(width: (w * 0.56cm))[
              #align(center)[
                #set par(leading: 0.55em, justify: false)
                #text(
                  font: "Times New Roman",
                  size: 8.3pt,
                  weight: "bold",
                  fill: black,
                )[
                  #title
                ]
                #v(0.6em)
              ]
            ]
          ])
          
          content((x, y - h * 0.24), anchor: "center", [
            #box(width: (w * 0.56cm))[
              #align(center)[
                #set par(leading: 0.55em, justify: false)
                #text(
                  font: "Arial",
                  size: 6.7pt,
                  fill: gray,
                )[
                  #body
                ]
              ]
            ]
          ])
        }

        let orange-node(x, y, w, h, title) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: orange + 1pt,
            radius: 0.20,
          )

          content((x, y), anchor: "center", [
            #text(
              font: "Times New Roman",
              size: 8.3pt,
              weight: "bold",
              fill: orange,
            )[
              #title
            ]
          ])
        }

        

        // =========================
        // Title
        // =========================

       

        // =========================
        // Nodes
        // =========================

        pill-node(
          5.8,
          7.55,
          1.85,
          0.55,
          [START],
          fill-color: rgb("#3385a5")
        )

        graph-node(
          5.8,
          6.40,
          4.25,
          1.10,
          [Ingest_excel],
          [
            Lecture Excel, détection structure,
          ],
           fill-color: rgb("#f1b26a")
        )

        graph-node(
          5.8,
          4.95,
          4.25,
          1.10,
          [Extract_and_structure],
          [
            texte brut → exigences structurées
          ],
          fill-color: rgb("#f1b26a")
        )

        graph-node(
          5.8,
          3.45,
          4.25,
          1.05,
          [Structured_req],
        
          [
            Vers Étape 2 (Analyse sémantique)
          ],
          fill-color: rgb("#f1b26a")
        )

       

        pill-node(
          5.8,
          2.25,
          1.70,
          0.50,
          [END],
          fill-color: rgb("#3385a5")
        )

        // =========================
        // Main arrows
        // =========================

        solid-arrow((
          (5.8, 7.28),
          (5.8, 6.95),
        ))

        solid-arrow((
          (5.8, 5.85),
          (5.8, 5.50),
        ))

        solid-arrow((
          (5.8, 4.40),
          (5.8, 3.98),
        ))

        solid-arrow((
          (5.8, 2.93),
          (5.8, 2.43),
        ))

      

        // =========================
        // Dashed routing links
        // =========================

       

       
        

        
      

        // =========================
        // Optional agent-style node
        // =========================

        

     
      })
    ]
  ],
  caption: [Agent 1 Workflows],
)





// =====================================================
// Branche Video Graph - Same Graph Style, White Background
// =====================================================

#let video-branch-analysis-graph() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#111111")
        let gray = rgb("#6B7280")
        let white = rgb("#FFFFFF")
        let light = rgb("#FFFFFF")
        let orange = rgb("#F59E0B")

        // =========================
        // Helpers
        // =========================

        let solid-arrow(points) = {
          line(
            ..points,
            stroke: black + 0.85pt,
            mark: (end: ">"),
          )
        }

        let dashed-arrow(points) = {
          line(
            ..points,
            stroke: (
              paint: black,
              thickness: 0.75pt,
              dash: "dashed",
            ),
            mark: (end: ">"),
          )
        }

        let pill-node(x, y, w, h, label,fill-color: rgb("#000000")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: light,
            stroke: fill-color,
            radius: h / 2,
          )

          content((x, y), anchor: "center", [
            #text(
              font: "Arial",
              size: 8.5pt,
              weight: "bold",
              fill: black,
            )[
              #label
            ]
          ])
        }

        let graph-node(x, y, w, h, title, body,fill-color: rgb("#000000")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: light,
            stroke:fill-color,
            radius: 0.20,
          )

          content((x, y + h * 0.16), anchor: "center", [
            #box(width: (w * 0.56cm))[
              #align(center)[
                #set par(leading: 0.55em, justify: false)
                #text(
                  font: "Times New Roman",
                  size: 8.3pt,
                  weight: "bold",
                  fill: black,
                )[
                  #title
                ]
              ]
            ]
          ])

          content((x, y - h * 0.24), anchor: "center", [
            #box(width: (w * 0.56cm))[
              #align(center)[
                #set par(leading: 0.55em, justify: false)
                #text(
                  font: "Times New Roman",
                  size: 7.7pt,
                  fill: gray,
                )[
                  #body
                ]
              ]
            ]
          ])
        }

        let orange-node(x, y, w, h, title) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: orange + 1pt,
            radius: 0.20,
          )

          content((x, y), anchor: "center", [
            #text(
              font: "Times New Roman",
              size: 7.3pt,
              weight: "bold",
              fill: orange,
            )[
              #title
            ]
          ])
        }

        // =========================
        // Title
        // =========================

       
        // =========================
        // Nodes
        // =========================

        pill-node(
          5.8,
          7.55,
          1.85,
          0.55,
          [START],
          fill-color: rgb("#3385a5"),
        )

        graph-node(
          5.8,
          6.40,
          4.80,
          1.10,
          [Analyze_video],
          [
            Extraction frames
          ],
          fill-color: rgb("#f1b26a")
        )

        graph-node(
          5.8,
          4.95,
          4.80,
          1.10,
          [Video_frame_analyzer],
          [
            Vision LLM par frame 
          ],
          fill-color: rgb("#f1b26a")
        )

        graph-node(
          5.8,
          3.50,
          4.80,
          1.10,
          [Video_scenario_builder],
          [
             cause → effet → conséquence
          ],
          fill-color: rgb("#f1b26a")
        )

        graph-node(
          5.8,
          2.05,
          4.80,
          1.10,
          [Video_scenario_mutator],
          [
             mutations / seed
          ],
          fill-color: rgb("#f1b26a")
        )

        pill-node(
          5.8,
          0.75,
          1.70,
          0.50,
          [END],
          fill-color: rgb("#3385a5")
        )

        // =========================
        // Main vertical arrows
        // =========================

        solid-arrow((
          (5.8, 7.28),
          (5.8, 6.95),
        ))

        solid-arrow((
          (5.8, 5.85),
          (5.8, 5.50),
        ))

        solid-arrow((
          (5.8, 4.40),
          (5.8, 4.05),
        ))

        solid-arrow((
          (5.8, 2.95),
          (5.8, 2.60),
        ))

        solid-arrow((
          (5.8, 1.50),
          (5.8, 1.02),
        ))

        

        

       


        
      })
    ]
  ],
  caption: [Agent video Workflows],
)


// =====================================================
// Etape 2 - Analyse sémantique multi-dimensionnelle
// Clean Graph Style - Readable and Spacious
// =====================================================

#let semantic-analysis-graph() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.7cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#111111")
        let gray = rgb("#6B7280")
        let white = rgb("#FFFFFF")
        let orange = rgb("#F59E0B")

        // =========================
        // Helpers
        // =========================

        let solid-arrow(points) = {
          line(
            ..points,
            stroke: black + 0.78pt,
            mark: (end: ">"),
          )
        }

        let dashed-arrow(points) = {
          line(
            ..points,
            stroke: (
              paint: black,
              thickness: 0.60pt,
              dash: "dashed",
            ),
            mark: (end: ">"),
          )
        }

        let pill-node(x, y, w, h, label,fill-color: rgb("#000000")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: fill-color,
            radius: h / 2,
          )

          content((x, y), anchor: "center", [
            #text(
              font: "Times New Roman",
              size: 7.2pt,
              weight: "bold",
              fill: black,
            )[
              #label
            ]
          ])
        }

        let graph-node(x, y, w, h, title, body,fill-color: rgb("#000000")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: fill-color,
            radius: 0.20,
          )

          content((x, y + h * 0.17), anchor: "center", [
            #box(width: (w * 0.56cm))[
              #align(center)[
                #set par(leading: 0.55em, justify: false)
                #text(
                  font: "Times New Roman",
                  size: 8.0pt,
                  weight: "bold",
                  fill: black,
                )[
                  #title
                ]
              ]
            ]
          ])

          content((x, y - h * 0.25), anchor: "center", [
            #box(width: (w * 0.56cm))[
              #align(center)[
                #set par(leading: 0.52em, justify: false)
                #text(
                  font: "Times New Roman",
                  size: 6.5pt,
                  fill: gray,
                )[
                  #body
                ]
              ]
            ]
          ])
        }

        let analyzer-node(x, y, w, h, title, body,fill-color:  rgb("#f1b26a")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: fill-color,
            radius: 0.18,
          )

          content((x, y + h * 0.25), anchor: "center", [
            #box(width: (w * 0.58cm))[
              #align(center)[
                #set par(leading: 0.50em, justify: false)
                #text(
                  font: "Times New Roman",
                  size: 7.6pt,
                  weight: "bold",
                  fill: black,
                )[
                  #title
                ]
              ]
            ]
          ])

          content((x, y - h * 0.18), anchor: "center", [
            #box(width: (w * 0.58cm))[
              #align(center)[
                #set par(leading: 0.48em, justify: false)
                #text(
                  font: "Times New Roman",
                  size: 5.9pt,
                  fill: gray,
                )[
                  #body
                ]
              ]
            ]
          ])
        }

        let orange-node(x, y, w, h, title) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: orange + 0.95pt,
            radius: 0.18,
          )

          content((x, y), anchor: "center", [
            #text(
              font: "Times New Roman",
              size: 6.7pt,
              weight: "bold",
              fill: orange,
            )[
              #title
            ]
          ])
        }

        let side-label(x, y, title, body) = {
          content((x, y + 0.18), anchor: "west", [
            #text(
              font: "Times New Roman",
              size: 6.0pt,
              weight: "bold",
              fill: black,
            )[
              #title
            ]
          ])

          content((x, y - 0.12), anchor: "west", [
            #text(
              font: "Times New Roman",
              size: 5.0pt,
              fill: gray,
            )[
              #body
            ]
          ])
        }

        // =========================
        // Title
        // =========================

        

        // =========================
        // Main vertical chain
        // =========================

        pill-node(
          9.0,
          10.45,
          1.70,
          0.48,
          [START],
          fill-color: rgb("#3385a5")
        )

        

        graph-node(
          9.0,
          8.15,
          5.35,
          1.05,
          [Route_requirement],
          [
            Orientation des exigences 
           
          ],
          fill-color:  rgb("#f1b26a")
        )

        // =========================
        // Analyzer row
        // =========================

        analyzer-node(
          1.65,
          5.70,
          3.10,
          1.45,
          [state],
          [
            Transitions d’états 
           
          ],
          fill-color:  rgb("#60b2c0")
        )

        analyzer-node(
          5.30,
          5.70,
          3.10,
          1.45,
          [Timing],
          [
            Contraintes temporelles 
          ],
          fill-color:  rgb("#60b2c0")
        )

        analyzer-node(
          9.00,
          5.70,
          3.10,
          1.45,
          [HMI],
          [
            Interactions homme-machine 
          ],
          fill-color:  rgb("#60b2c0")
        )

        analyzer-node(
          12.70,
          5.70,
          3.10,
          1.45,
          [Computation],
          [
            Logique de calcul \
            formules, seuils
          ],
          fill-color:  rgb("#60b2c0")
        )

        analyzer-node(
          16.35,
          5.70,
          3.10,
          1.45,
          [Generic],
          [
            Analyse générique 
          ],
          fill-color:  rgb("#60b2c0")
        )

        // =========================
        // Merge and result nodes
        // =========================

        graph-node(
          9.0,
          2.75,
          5.35,
          1.05,
          [Merge_analyses],
          [
            Consolide les 5 analyses 
          ],
          fill-color:  rgb("#f1b26a")
        )

      

        pill-node(
          9.0,
          0.20,
          1.65,
          0.48,
          [END],
          fill-color: rgb("#3385a5")
        )

      
        // =========================
        // Arrows: top chain
        // =========================

       

        solid-arrow((
          (9.0, 10.20),
          (9.0, 8.68),
        ))

        // =========================
        // Fan-out arrows
        // =========================

        solid-arrow((
          (9.0, 7.62),
          (1.65, 6.43),
        ))

        solid-arrow((
          (9.0, 7.62),
          (5.30, 6.43),
        ))

        solid-arrow((
          (9.0, 7.62),
          (9.00, 6.43),
        ))

        solid-arrow((
          (9.0, 7.62),
          (12.70, 6.43),
        ))

        solid-arrow((
          (9.0, 7.62),
          (16.35, 6.43),
        ))

        // =========================
        // Fan-in arrows
        // =========================

        solid-arrow((
          (1.65, 4.98),
          (9.0, 3.28),
        ))

        solid-arrow((
          (5.30, 4.98),
          (9.0, 3.28),
        ))

        solid-arrow((
          (9.00, 4.98),
          (9.0, 3.28),
        ))

        solid-arrow((
          (12.70, 4.98),
          (9.0, 3.28),
        ))

        solid-arrow((
          (16.35, 4.98),
          (9.0, 3.28),
        ))

        // =========================
        // Merge -> Results -> End
        // =========================

        solid-arrow((
          (9.0, 2.22),
          (9.0, 0.5),
        ))

      

        

    

       

      

      })
    ]
  ],
  caption: [Agent 3 Analyse sémentique],
)




// =====================================================
// Etape 3 - Génération des cas de test
// Clean Graph Style - Complete Working Version
// =====================================================

#let test-case-generation-graph() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#111111")
        let gray = rgb("#6B7280")
        let white = rgb("#FFFFFF")
        let orange = rgb("#F59E0B")

        // =========================
        // Helpers
        // =========================

        let solid-arrow(points) = {
          line(
            ..points,
            stroke: black + 0.75pt,
            mark: (end: ">"),
          )
        }

        let dashed-arrow(points) = {
          line(
            ..points,
            stroke: (
              paint: black,
              thickness: 0.60pt,
              dash: "dashed",
            ),
            mark: (end: ">"),
          )
        }

        let pill-node(x, y, w, h, label,fill-color: rgb("#000000")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: fill-color,
            radius: h / 2,
          )

          content((x, y), anchor: "center", [
            #text(
              font: "Arial",
              size: 8pt,
              weight: "bold",
              fill: black,
            )[
              #label
            ]
          ])
        }

        let graph-node(x, y, w, h, title, body,fill-color: rgb("#000000")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: fill-color,
            radius: 0.20,
          )

          content((x, y + h * 0.18), anchor: "center", [
            #box(width: (w * 0.55cm))[
              #align(center)[
                #set par(leading: 0.55em, justify: false)
                #text(
                  font: "Arial",
                  size: 7.8pt,
                  weight: "bold",
                  fill: black,
                )[
                  #title
                ]
              ]
            ]
          ])

          content((x, y - h * 0.25), anchor: "center", [
            #box(width: (w * 0.55cm))[
              #align(center)[
                #set par(leading: 0.52em, justify: false)
                #text(
                  font: "Arial",
                  size: 6.2pt,
                  fill: gray,
                )[
                  #body
                ]
              ]
            ]
          ])
        }

        let small-node(x, y, w, h, title, body,fill-color: rgb("#000000")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke:fill-color,
            radius: 0.18,
          )

          content((x, y + h * 0.22), anchor: "center", [
            #box(width: (w * 0.56cm))[
              #align(center)[
                #set par(leading: 0.50em, justify: false)
                #text(
                  font: "Arial",
                  size: 7.1pt,
                  weight: "bold",
                  fill: black,
                )[
                  #title
                ]
              ]
            ]
          ])

          content((x, y - h * 0.24), anchor: "center", [
            #box(width: (w * 0.56cm))[
              #align(center)[
                #set par(leading: 0.48em, justify: false)
                #text(
                  font: "Arial",
                  size: 5.8pt,
                  fill: gray,
                )[
                  #body
                ]
              ]
            ]
          ])
        }

        let dashed-node(x, y, w, h, label,fill-color: rgb("#000000")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: (
              paint: fill-color,
              thickness: 0.70pt,
              dash: "dashed",
            ),
            radius: 0.18,
          )

          content((x, y), anchor: "center", [
            #text(
              font: "Arial",
              size: 8pt,
              fill: black,
            )[
              #label
            ]
          ])
        }

        let orange-node(x, y, w, h, label) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: orange + 0.95pt,
            radius: 0.18,
          )

          content((x, y), anchor: "center", [
            #text(
              font: "Arial",
              size: 7.6pt,
              weight: "bold",
              fill: orange,
            )[
              #label
            ]
          ])
        }

        let side-label(x, y, title, body) = {
          content((x, y + 0.16), anchor: "west", [
            #text(
              font: "Arial",
              size: 6.8pt,
              weight: "bold",
              fill: black,
            )[
              #title
            ]
          ])

          content((x, y - 0.12), anchor: "west", [
            #text(
              font: "Arial",
              size: 5.8pt,
              fill: gray,
            )[
              #body
            ]
          ])
        }

        // =========================
        // Title
        // =========================

       

        // =========================
        // Main nodes
        // =========================

        pill-node(
          9.5,
          11.45,
          1.65,
          0.46,
          [START],
          fill-color: rgb("#3385a5")
        )

    

        graph-node(
          9.5,
          9.20,
          5.90,
          1.15,
          [coverage_planner],
          [
            Détermine les tests 
          ],
          fill-color:  rgb("#f1b26a")
        )

        dashed-node(
          12.85,
          9.50,
          1.65,
          0.42,
          [rule-based],
        )

        // =========================
        // Plan nodes
        // =========================

        small-node(
          2.80,
          7.10,
          3.10,
          1.00,
          [plan_single_req],
          [REQ_001],
          fill-color:  rgb("#60b2c0")
        )

        small-node(
          6.35,
          7.10,
          3.10,
          1.00,
          [plan_single_req],
          [REQ_002],
          fill-color:  rgb("#60b2c0")
        )

        dashed-node(
          9.90,
          7.10,
          2.70,
          1.00,
          [...],
          fill-color:  rgb("#34cf15")
        )

        small-node(
          15.75,
          7.10,
          3.10,
          1.00,
          [plan_single_req],
          [REQ_00N],
          fill-color:  rgb("#60b2c0")
        )

        graph-node(
          9.5,
          5.40,
          5.25,
          1.00,
          [dispatch_tc_workers],
          [
            Collecte les blueprints 
          ],
          fill-color:  rgb("#f1b26a")
        )

      
        // =========================
        // Generate TC nodes
        // =========================

        small-node(
          2.80,
          3.40,
          3.10,
          1.00,
          [generate_tc],
          [TC_001],
          fill-color:  rgb("#60b2c0")
        )

        small-node(
          6.35,
          3.40,
          3.10,
          1.00,
          [generate_tc],
          [TC_002],
          fill-color:  rgb("#60b2c0")
        )

        dashed-node(
          9.90,
          3.40,
          2.70,
          1.00,
          [...],
          fill-color:  rgb("#34cf15")
        )

        small-node(
          15.75,
          3.40,
          3.10,
          1.00,
          [generate_tc],
          [TC_00M],
          fill-color:  rgb("#60b2c0")
        )

      

        graph-node(
          9.5,
          1.25,
          5.90,
          1.10,
          [synthesizer],
          [
            Dedup 3 passes 
          ],
          fill-color:  rgb("#f1b26a")
        )

      

        pill-node(
          9.5,
          -1.25,
          1.65,
          0.46,
          [END],
          fill-color: rgb("#3385a5")
        )

      

        // =========================
        // Main vertical arrows
        // =========================

       

        solid-arrow((
          (9.5, 11.20),
          (9.5, 9.78),
        ))

        // =========================
        // Planner fan-out
        // =========================

        solid-arrow((
          (9.5, 8.62),
          (2.80, 7.60),
        ))

        solid-arrow((
          (9.5, 8.62),
          (6.35, 7.60),
        ))

        solid-arrow((
          (9.5, 8.62),
          (9.90, 7.60),
        ))

        solid-arrow((
          (9.5, 8.62),
          (15.75, 7.60),
        ))

        // =========================
        // Plan fan-in to dispatch
        // =========================

        solid-arrow((
          (2.80, 6.60),
          (9.5, 5.90),
        ))

        solid-arrow((
          (6.35, 6.60),
          (9.5, 5.90),
        ))

        solid-arrow((
          (9.90, 6.60),
          (9.5, 5.90),
        ))

        solid-arrow((
          (15.75, 6.60),
          (9.5, 5.90),
        ))

    

        // =========================
        // Dispatch fan-out
        // =========================

        solid-arrow((
          (9.5, 4.90),
          (2.80, 3.90),
        ))

        solid-arrow((
          (9.5, 4.90),
          (6.35, 3.90),
        ))

        solid-arrow((
          (9.5, 4.90),
          (9.90, 3.90),
        ))

        solid-arrow((
          (9.5, 4.90),
          (15.75, 3.90),
        ))

        // =========================
        // Generate fan-in to synthesizer
        // =========================

        solid-arrow((
          (2.80, 2.90),
          (9.5, 1.80),
        ))

        solid-arrow((
          (6.35, 2.90),
          (9.5, 1.80),
        ))

        solid-arrow((
          (9.90, 2.90),
          (9.5, 1.80),
        ))

        solid-arrow((
          (15.75, 2.90),
          (9.5, 1.80),
        ))

        // Synthesizer -> final_tcs -> END
       

        solid-arrow((
          (9.5, 0.7),
          (9.5, -1.02),
        ))

        // =========================
        // Optional dashed control links
        // =========================

   

      

       

        // =========================
        // Side labels
        // =========================

        
       

       
      })
    ]
  ],
  caption: [Agent 3 Workflows],
)



// =====================================================
// Etape 4 - Evaluation, HITL and Output
// Complete Working Version - Black/White Graph Style
// =====================================================

#let evaluation-hitl-output-graph() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#111111")
        let gray = rgb("#6B7280")
        let white = rgb("#FFFFFF")
        let orange = rgb("#F59E0B")

        // =========================
        // Helpers
        // =========================

        let solid-arrow(points) = {
          line(
            ..points,
            stroke: black + 0.75pt,
            mark: (end: ">"),
          )
        }

        let dashed-arrow(points) = {
          line(
            ..points,
            stroke: (
              paint: black,
              thickness: 0.60pt,
              dash: "dashed",
            ),
            mark: (end: ">"),
          )
        }

        let graph-node(x, y, w, h, title, body,fill-color:  rgb("#000000")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: fill-color,
            radius: 0.20,
          )

          content((x, y + h * 0.18), anchor: "center", [
            #box(width: (w * 0.55cm))[
              #align(center)[
                #set par(leading: 0.55em, justify: false)
                #text(
                  font: "Arial",
                  size: 7.8pt,
                  weight: "bold",
                  fill: black,
                )[
                  #title
                ]
              ]
            ]
          ])

          content((x, y - h * 0.25), anchor: "center", [
            #box(width: (w * 0.55cm))[
              #align(center)[
                #set par(leading: 0.52em, justify: false)
                #text(
                  font: "Arial",
                  size: 7.2pt,
                  fill: gray,
                )[
                  #body
                ]
              ]
            ]
          ])
        }

        let small-node(x, y, w, h, title, body,fill-color:  rgb("#000000")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: fill-color,
            radius: 0.18,
          )

          content((x, y + h * 0.20), anchor: "center", [
            #box(width: (w * 0.55cm))[
              #align(center)[
                #set par(leading: 0.50em, justify: false)
                #text(
                  font: "Arial",
                  size: 7.2pt,
                  weight: "bold",
                  fill: black,
                )[
                  #title
                ]
              ]
            ]
          ])

          content((x, y - h * 0.25), anchor: "center", [
            #box(width: (w * 0.55cm))[
              #align(center)[
                #set par(leading: 0.48em, justify: false)
                #text(
                  font: "Arial",
                  size: 6.8pt,
                  fill: gray,
                )[
                  #body
                ]
              ]
            ]
          ])
        }

        let dashed-node(x, y, w, h, title, body,fill-color:  rgb("#000000")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: (
              paint: fill-color,
              thickness: 0.70pt,
              dash: "dashed",
            ),
            radius: 0.18,
          )

          content((x, y + h * 0.27), anchor: "center", [
            #box(width: (w * 0.55cm))[
              #align(center)[
                #set par(leading: 0.50em, justify: false)
                #text(
                  font: "Arial",
                  size: 7.2pt,
                  weight: "bold",
                  fill: black,
                )[
                  #title
                ]
              ]
            ]
          ])

          content((x, y - h * 0.2), anchor: "center", [
            #box(width: (w * 0.55cm))[
              #align(center)[
                #set par(leading: 0.48em, justify: false)
                #text(
                  font: "Arial",
                  size: 6.8pt,
                  fill: gray,
                )[
                  #body
                ]
              ]
            ]
          ])
        }

        let pill-node(x, y, w, h, label,fill-color:  rgb("#000000")) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: fill-color,
            radius: h / 2,
          )

          content((x, y), anchor: "center", [
            #text(
              font: "Arial",
              size: 8pt,
              weight: "bold",
              fill: black,
            )[
              #label
            ]
          ])
        }

        let orange-node(x, y, w, h, label) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: orange + 0.95pt,
            radius: 0.18,
          )

          content((x, y), anchor: "center", [
            #text(
              font: "Arial",
              size: 6.5pt,
              weight: "bold",
              fill: orange,
            )[
              #label
            ]
          ])
        }

        let dashed-box(x1, y1, x2, y2, label) = {
          rect(
            (x1, y1),
            (x2, y2),
            fill: white,
            stroke: (
              paint: black,
              thickness: 0.65pt
    ,
            ),
            radius: 0.22,
          )

          content((x1 + 0.45, y2 - 0.35), anchor: "west", [
            #text(
              font: "Arial",
              size: 6pt,
              weight: "bold",
              fill: black,
            )[
              #label
            ]
          ])
        }

        // =========================
        // Title
        // =========================

   

        // =========================
        // HITL Zone
        // =========================
pill-node(
           9.45,
          12,
          1.70,
          0.48,
          [START],
          fill-color: rgb("#3385a5")
        )

        dashed-box(
          2.0,
          3.05,
          17.0,
          9.85,
          [Zone HITL],
        )

        // =========================
        // Nodes
        // =========================

        graph-node(
          9.5,
          10.75,
          5.70,
          1.05,
          [Evaluator],
          [
            
            Evaluation 
          ],
          fill-color:  rgb("#f1b26a")
        )

        graph-node(
          9.5,
          8.55,
          5.05,
          1.10,
          [Human_review],
          [
            interrupt
          ],
          fill-color:  rgb("#f1b26a")
        )

        graph-node(
          9.5,
          6.55,
          5.05,
          1.10,
          [Process_review],
          [
           
            oriente le flux
          ],
          fill-color:  rgb("#f1b26a")
        )

        small-node(
          15.95,
          8.55,
          3.00,
          1.3,
          [Decisions],
          [
            Approve 
            Reject  
            Delete  Skip
          ],
          fill-color: rgb("#39b99e")
        )

        small-node(
          3.20,
          2,
          3.00,
          0.72,
          [Feedback],
          [
            regeneration
          ],
          fill-color: rgb("#39b99e")
        )

        dashed-node(
          3.20,
          0,
          3.70,
          2.20,
          [Time Travel],
          [
            Excel vers coverage_planner \
            Vidéo vers scenario_mutator
          ],
          fill-color: rgb("#a4be0e")
        )

        small-node(
          9.45,
          2,
          2.85,
          0.72,
          [Download],
          [Skip HITL],
          fill-color: rgb("#39b99e")
        )

        graph-node(
          9.45,
          0.4,
          3.80,
          0.95,
          [Excel_Output],
          [TC_Generated_vn.xlsx],
          fill-color:  rgb("#f1b26a")
        )

        pill-node(
          9.45,
          -1,
          1.70,
          0.48,
          [END],
          fill-color: rgb("#3385a5")
        )

        small-node(
          14.85,
          2,
          3.00,
          0.72,
          [Download],
          [Skip HITL],
          fill-color: rgb("#39b99e")
        )

        graph-node(
          14.85,
          0.4,
          3.80,
          0.95,
          [Video_output],
          [Video_Scenarios_vn.xlsx],
          fill-color:  rgb("#f1b26a")
        )

        pill-node(
          14.85,
          -1,
          1.70,
          0.48,
          [END],
          fill-color: rgb("#3385a5")
        )

        dashed-node(
          9.50,
          -2.45,
          6.40,
          1.4,
          [Re-entry HITL],
          [
            
            retour au human_review
          ],
          fill-color: rgb("#a4be0e")
        )

     

        // =========================
        // Main arrows
        // =========================

        solid-arrow((
          (9.5, 10.22),
          (9.5, 9.10),
        ))

        solid-arrow((
          (9.5, 10.22),
          (9.5, 9.10),
        ))

         solid-arrow((
          (9.5, 8.),
          (9.5, 7.10),
        ))

         solid-arrow((
          (9.5, 6),
          (9.5, 5.5),
        ))

        solid-arrow((
          (9.5, 11.75),
          (9.5, 11.3),
        ))

        dashed-arrow((
          (9.5, 5.5),
          (3.20, 5.5),
          (3.20, 2.4),
        ))

        dashed-arrow((
          (9.5, 5.50),
          (9.45, 5.50),
          (9.45, 2.4),
        ))

        dashed-arrow((
          (9.5, 5.5),
          (14.85, 5.5),
          (14.85, 2.4),
        ))

        solid-arrow((
          (9.45,  1.6),
          (9.45, 0.9),
        ))

        solid-arrow((
          (9.45, -0.1),
          (9.45, -0.8),
        ))

        solid-arrow((
          (14.85, 1.6),
          (14.85, 0.9),
        ))

        solid-arrow((
          (14.85, -0.1),
          (14.85, -0.8),
        ))

        // =========================
        // Dashed / Feedback arrows
        // =========================

        solid-arrow((
          (14.45, 8.55),
          (12.03, 8.55),
        ))

        dashed-arrow((
          (12.70, -2.45),
          (18.55, -2.45),
          (18.55, 8.55),
          (17.45, 8.55),
        ))

       

        solid-arrow((
          (3.20, 1.6),
          (3.20, 1.05),
        ))

        dashed-arrow((
          (1.30, 0.45),
          (0.35, 0.45),
          (0.35, 8.55),
          (2.00, 8.55),
          
        ))

      

        // =========================
        // Labels
        // =========================

       

        content((15.95, 9.35), anchor: "center", [
          #text(
            font: "Arial",
            size: 6.3pt,
            style: "italic",
            fill: black,
          )[
            actions utilisateur
          ]
        ])

      })
    ]
  ],
  caption: [Agent 4 Workfolows],
)

#let hitl-time-travel-cycle-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.78cm, {
        import cetz.draw: *

        let black = rgb("#111111")
        let dark = rgb("#222222")
        let muted = rgb("#555555")
        let gray = rgb("#8A8A8A")
        let light = rgb("#F2F2F2")
        let white = rgb("#FFFFFF")

        let arrow(points, dashed: false, thickness: 0.75pt, paint: black) = {
          line(
            ..points,
            stroke: if dashed {
              (paint: paint, thickness: thickness, dash: (5pt, 3pt))
            } else {
              paint + thickness
            },
            mark: (end: ">"),
          )
        }

        let label(x, y, txt, size: 7.8pt, fill: black, weight: "regular") = {
          content((x, y), anchor: "center", [
            #text(font: "Arial", size: size, fill: fill, weight: weight)[#txt]
          ])
        }

        let wrapped-label(x, y, w, body, size: 6.7pt, fill: muted, weight: "regular") = {
          content((x, y), anchor: "center", [
            #box(width: (w * 0.68cm))[
              #align(center)[
                #set par(leading: 0.62em, justify: false)
                #text(font: "Arial", size: size, fill: fill, weight: weight)[#body]
              ]
            ]
          ])
        }

        let node(x, y, w, h, title, subtitle: none, fill: white, stroke: black, radius: 0.18, title-size: 8.5pt, subtitle-size: 6.6pt, title-fill: black) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: fill,
            stroke: stroke + 0.8pt,
            radius: radius,
          )
          label(x, if subtitle == none { y } else { y + h * 0.25 }, title, size: title-size, fill: title-fill, weight: "bold")
          if subtitle != none {
            wrapped-label(x, y - h * 0.24, w * 0.85, subtitle, size: subtitle-size, fill: muted)
          }
        }

        let dashed-node(x, y, w, h, title, subtitle: none, fill: white, title-size: 8pt, subtitle-size: 6.3pt) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: fill,
            stroke: (paint: black, thickness: 0.75pt, dash: (5pt, 3pt)),
            radius: 0.18,
          )
          label(x, if subtitle == none { y } else { y + h * 0.25 }, title, size: title-size, fill: black, weight: "bold")
          if subtitle != none {
            wrapped-label(x, y - h * 0.25, w * 0.85, subtitle, size: subtitle-size, fill: muted)
          }
        }

        let side-note(x, y, w, h, title, body) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: white,
            stroke: black + 0.7pt,
            radius: 0.15,
          )
          label(x, y + h * 0.32, title, size: 6.8pt, weight: "bold")
          wrapped-label(x, y - h * 0.24, w * 0.82, body, size: 6pt)
        }

        // Background and title.
        rect((0, 0), (18, 13.2), fill: white, stroke: black + 0.45pt, radius: 0.16)
        label(9, 12.75, [Cycle HITL et mecanisme de Time Travel], size: 12.3pt, fill: black, weight: "bold")

        // Main vertical flow
        node(9, 11.65, 6.0, 0.95, [Pipeline genere les resultats], subtitle: [evaluator termine], fill: light, stroke: black, title-size: 8.6pt, subtitle-size: 6.4pt)
        arrow(((9, 11.17), (9, 10.65)))

        node(9, 10.05, 6.7, 1.18, [Pause], subtitle: [interrupt - le pipeline attend la decision humaine], fill: white, stroke: black, title-size: 10.8pt, subtitle-size: 6.5pt)
        
        arrow(((9, 9.46), (9, 8.65)))

        rect((4.4, 6.65), (13.6, 8.65), fill: white, stroke: black + 0.8pt, radius: 0.22)
        label(9, 8.18, [L'utilisateur examine les resultats], size: 9.1pt, weight: "bold")
        node(6.0, 7.28, 2.35, 0.78, [Approve], subtitle: [conserver], fill: white, stroke: black, radius: 0.10, title-size: 7.4pt, subtitle-size: 5.9pt)
        node(9, 7.28, 2.85, 0.78, [Reject + feedback], subtitle: [regenerer], fill: white, stroke: black, radius: 0.10, title-size: 7.4pt, subtitle-size: 5.9pt)
        node(12.0, 7.28, 2.35, 0.78, [Delete], subtitle: [supprimer], fill: white, stroke: black, radius: 0.10, title-size: 7.4pt, subtitle-size: 5.9pt)

        arrow(((9, 6.65), (9, 5.80)), thickness: 0.65pt, paint: gray)

        // Decision diamond
        line((9, 5.80), (10.25, 5.00), (9, 4.20), (7.75, 5.00), (9, 5.80), stroke: black + 0.8pt)
        label(9, 4.92, [TCs rejetes ?], size: 7.3pt)

        // Left branch: time travel
        arrow(((7.75, 5.00), (3.95, 5.00)), thickness: 0.8pt)
        label(5.85, 5.28, [Oui], size: 7.4pt, weight: "bold")
        node(2.65, 5.00, 2.35, 1.05, [Time Travel], fill: white, stroke: black, title-size: 8.9pt)
        arrow(((2.65, 5.53), (0.75, 5.53), (0.75, 11.65), (6.0, 11.65)), dashed: true, thickness: 0.8pt)

        
        side-note(2.05, 7.85, 3.7, 1.30, [Boucle iterative], [Jusqu'a satisfaction\ ])

        // Right branch: download and end
        arrow(((10.25, 5.00), (14.15, 5.00)), thickness: 0.8pt)
        label(12.2, 5.28, [Non], size: 7.4pt, weight: "bold")
        node(15.35, 5.00, 2.75, 1.0, [Download], subtitle: [Excel output], fill: white, stroke: black, title-size: 9.1pt, subtitle-size: 6.5pt)
        arrow(((15.35, 4.50), (15.35, 3.50)), thickness: 0.65pt, paint: gray)
        rect((14.6, 3.15), (16.1, 3.65), fill: light, stroke: black + 0.75pt, radius: 0.25)
        label(15.35, 3.37, [END], size: 7.6pt, weight: "bold")

        // Re-entry loop
        arrow(((15.35, 3.15), (15.35, 1.10), (11.35, 1.10)), dashed: true, thickness: 0.75pt)
        dashed-node(9, 1.10, 4.7, 0.9, [Rtour à HTIL], subtitle: [review], fill: white, title-size: 7.8pt, subtitle-size: 6.1pt)
        arrow(((6.65, 1.10), (4.15, 1.10), (4.15, 10.05), (5.65, 10.05)), dashed: true, thickness: 0.75pt)
      })
    ]
  ],
  caption: [Cycle HITL et mecanisme de Time Travel],
)


// =====================================================
// Memory Architecture — Trois niveaux de persistance
// =====================================================

#let memory-architecture-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.52cm, {
        import cetz.draw: *

        let bk = rgb("#111111")
        let wh = rgb("#FFFFFF")
        let gr = rgb("#777777")

        // ── DB symbol: rect body (sides + bottom) + top ellipse cap ──
        // The flat bottom avoids complex bottom-arc code.
        let db(cx, cy, rx, h, ry: 0.38) = {
          let top = cy + h / 2
          let bot = cy - h / 2
          rect((cx - rx, bot), (cx + rx, top), fill: wh, stroke: none)
          line((cx - rx, top), (cx - rx, bot), stroke: rgb("#000000"))
          line((cx + rx, top), (cx + rx, bot), stroke: rgb("#000000"))
          line((cx - rx, bot), (cx + rx, bot), stroke: rgb("#000000"))
          line(
            (cx - rx, top),
            (cx - rx * 0.72, top + ry * 0.55),
            (cx - rx * 0.28, top + ry * 0.82),
            (cx, top + ry * 0.88),
            (cx + rx * 0.28, top + ry * 0.82),
            (cx + rx * 0.72, top + ry * 0.55),
            (cx + rx, top),
            (cx + rx * 0.72, top - ry * 0.55),
            (cx + rx * 0.28, top - ry * 0.82),
            (cx, top - ry * 0.88),
            (cx - rx * 0.28, top - ry * 0.82),
            (cx - rx * 0.72, top - ry * 0.55),
            (cx - rx, top),
            stroke:  rgb("#000000"),
          )
        }

        let sarr(pts) = line(..pts, stroke: bk + 0.65pt, mark: (end: ">"))
        let darr(pts) = line(..pts,
            stroke: (paint: bk, thickness: 0.65pt, dash: (3.5pt, 2pt)),
            mark: (end: ">"))

        // Scope rect — title and subtitle are placed at staggered y-positions
        // to avoid any overlap (each scope top is 2 units lower than the previous).
        let scope-rect(x0, y0, x1, y1, dp, tk: 1.0pt) = {
          rect((x0, y0), (x1, y1), fill: wh,
               stroke: (paint: bk, thickness: tk, dash: dp), radius: 0.25)
        }

        // ═══════════════════════════════════════════════
        // SCOPES  (drawn first so labels sit on top)
        // ═══════════════════════════════════════════════

        // Application — outermost, large dash
        scope-rect(0, 0, 31, 21, (7pt, 3pt), tk: 1.3pt)

        // Utilisateur — medium dash, top = 19  (2 units below App top 21)
        scope-rect(0.5, 3.5, 29.5, 19.0, (4.5pt, 2.5pt), tk: 1.0pt)

        // Session — fine dash, top = 16.5  (2.5 units below Util top 19)
        scope-rect(1.0, 7.5, 17.0, 16.5, (3pt, 2pt), tk: 0.85pt)

        // ── Scope labels — each at clearly separate vertical positions ──

        // Application: inside at top-left (y ≈ 20.65)
        content((0.5, 20.75), anchor: "north-west", [
          #text(size: 8.5pt, weight: "bold")[Scope Application]
        ])
        content((0.5, 20.25), anchor: "north-west", [
          #text(size: 5.7pt, fill: gr)[Partage entre tous les utilisateurs]
        ])

        // Utilisateur: inside its own rect at top-left (y ≈ 18.65)
        content((0.9, 18.78), anchor: "north-west", [
          #text(size: 8.5pt, weight: "bold")[Scope Utilisateur]
        ])
        content((0.9, 18.28), anchor: "north-west", [
          #text(size: 5.7pt, fill: gr)[Propre a chaque utilisateur]
        ])

        // Session: inside its own rect at top-left (y ≈ 16.15)
        content((1.4, 16.15), anchor: "north-west", [
          #text(size: 8.5pt, weight: "bold")[Scope Session]
        ])
        content((1.4, 15.65), anchor: "north-west", [
          #text(size: 5.7pt, fill: gr)[Une execution de pipeline]
        ])

        // ═══════════════════════════════════════════════
        // INSIDE SESSION  (y: 7.5 – 14.8, x: 1 – 17)
        // ═══════════════════════════════════════════════

        // Pipeline — rounded rect
        rect((1.5, 12.8), (10.5, 14.6),
             fill: wh, stroke: bk + 1.0pt, radius: 0.22)
        content((6.0, 13.7), anchor: "center", [
          #text(size: 9pt, weight: "bold")[Pipeline]
        ])

        // Checkpointer DB
        db(13.8, 13.7, 2.15, 1.55)
        content((13.8, 13.7), anchor: "center", [
          #text(size: 8pt)[Checkpointer]
        ])

        // Memoire courte (par session)
        rect((1.5, 7.8), (16.1, 12.0),
             fill: wh, stroke: bk + 0.8pt, radius: 0.18)
        content((1.85, 11.7), anchor: "north-west", [
          #text(size: 8pt, weight: "bold")[Memoire courte (par session)]
        ])
        content((1.85, 11.05), anchor: "north-west", [
          #box(width: 3.85cm)[
            #set par(leading: 0.52em)
            #text(size: 5.9pt)[
              • Etat complet du graphe a chaque noeud\
              • Checkpoints chiffres \
              • Interrupt / resume et Time Travel\
              • Retention configurable
            ]
          ]
        ])

        // PostgreSQL (inside Memoire courte)
        rect((9.05, 8.45), (15.75, 11.25),
             fill: wh, stroke: bk + 0.75pt, radius: 0.15)
        content((12.4, 10.25), anchor: "center", [
          #text(size: 8pt, weight: "bold")[PostgreSQL]
        ])
        content((12.4, 9.6), anchor: "center", [
          #text(size: 6.8pt, fill: gr)[AsyncPostgresSaver]
        ])
        content((12.4, 9.0), anchor: "center", [
          #text(size: 6.8pt, fill: gr)[+ Encryption AES]
        ])

        // ═══════════════════════════════════════════════
        // RIGHT SIDE — inside Utilisateur, x > 17.5
        // ═══════════════════════════════════════════════

        // Semantique DB  (top at ≈ 16.8, well below Util title at 18.65)
        db(23.5, 15.5, 3.0, 1.6)
        content((23.5, 15.5), anchor: "center", [
          #text(size: 8pt)[Semantique]
        ])

        // Memoire semantique (par user)  (below Semantique DB)
        rect((17.5, 11.8), (29.0, 14.2),
             fill: wh, stroke: bk + 0.75pt, radius: 0.15)
        content((17.85, 13.9), anchor: "north-west", [
          #text(size: 7.5pt, weight: "bold")[Memoire semantique (par user)]
        ])
        content((17.85, 13.2), anchor: "north-west", [
          #box(width: 4.5cm)[
            #set par(leading: 0.55em)
            #text(size: 6.3pt)[
              • Preferences : « preconditions detaillees »\
              • Habitudes : « boundary cases prioritaires »\
              • Confiance : low → medium → high
            ]
          ]
        ])

        // Episodique DB
        db(23.5, 8.7, 3.0, 1.6)
        content((23.5, 8.7), anchor: "center", [
          #text(size: 8pt)[Episodique]
        ])

        // Memoire episodique (par user)
        rect((17.5, 4.5), (29.0, 7.4),
             fill: wh, stroke: bk + 0.75pt, radius: 0.15)
        content((17.85, 7.1), anchor: "north-west", [
          #text(size: 7.5pt, weight: "bold")[Memoire episodique (par user)]
        ])
        content((17.85, 6.45), anchor: "north-west", [
          #box(width: 4.5cm)[
            #set par(leading: 0.55em)
            #text(size: 6.3pt)[
              • « 29 mai : rejete 3 TCs, cause préconditions »\
              • Historique des revues et feedbacks
            ]
          ]
        ])

        // ═══════════════════════════════════════════════
        // BOTTOM — Application level, below Utilisateur
        // ═══════════════════════════════════════════════

        // App Semantique DB
        db(4.5, 1.6, 2.5, 1.6)
        content((4.5, 1.6), anchor: "center", [
          #box(width: 2.0cm)[
            #align(center)[
              #set par(leading: 0.5em)
              #text(size: 7pt)[App\ Semantique]
            ]
          ]
        ])

        // Memoire semantique partagee (scope app)
        rect((8.5, 0.4), (22.5, 2.6),
             fill: wh, stroke: bk + 0.75pt, radius: 0.15)
        content((8.85, 2.3), anchor: "north-west", [
          #text(size: 7.5pt, weight: "bold")[Memoire semantique (partagee — scope app)]
        ])
        content((8.85, 1.65), anchor: "north-west", [
          #box(width: 5.3cm)[
            #set par(leading: 0.55em)
            #text(size: 6.3pt)[
              • « road_condition obligatoire dans préconditions »\
              • « vitesses en km/h » — régles apprises de tous les users
            ]
          ]
        ])

        

        // ═══════════════════════════════════════════════
        // ARROWS
        // ═══════════════════════════════════════════════

        sarr(((10.5, 13.7), (11.65, 13.7)))
        darr(((6.0, 14.6), (6.0, 15.25), (17.2, 15.25), (17.2, 15.5), (20.5, 15.5)))
        content((16.1, 15.55), anchor: "center", [
          #text(size: 5.8pt, fill: gr)[conditionnel]
        ])
        sarr(((10.5, 13.05), (10.9, 13.05), (10.9, 12.45), (16.9, 12.45), (16.9, 8.7), (20.5, 8.7)))
        darr(((1.5, 13.7), (1.15, 13.7), (1.15, 3.0), (4.5, 3.0), (4.5, 2.55)))
        content((1.35, 7.0), anchor: "west", [
          #text(size: 5.8pt, fill: gr)[conditionnel]
        ])

      })
    ]
  ],
  caption: [Architecture memoire],
)

// =====================================================
// Use Case Diagram - ADAS-R2T
// FINAL VERSION - CLEAN EDGES + YOUR SCALES
// =====================================================

#let adas-r2t-usecase-diagram() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.3cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#111111")
        let gray = rgb("#4B5563")
        let bg = rgb("#FAFBFE")
        let white = rgb("#FFFFFF")
        let head-bg = rgb("#F3F4F6")

        // =========================
        // Helpers
        // =========================
        let assoc(points) = {
          line(..points, stroke: black + 0.48pt)
        }

        let dashed-arrow(points) = {
          line(
            ..points,
            stroke: (paint: black, thickness: 0.50pt, dash: "dashed"),
            mark: (end: ">"),
          )
        }

        let rel-label(x, y, txt) = {
          content((x, y), anchor: "center", [
            #text(size: 7pt, style: "italic", fill: gray)[#txt]
          ])
        }

        let actor(x, y, label) = {
          circle((x, y + 0.80), radius: 0.24, stroke: black)
          line((x, y + 0.55), (x, y - 0.55))
          line((x - 0.55, y + 0.15), (x + 0.55, y + 0.15))
          line((x, y - 0.55), (x - 0.48, y - 1.20))
          line((x, y - 0.55), (x + 0.48, y - 1.20))

          content((x, y - 1.85), anchor: "center", [
            #text(size: 7pt, weight: "bold")[#label]
          ])
        }

        let package-box(x1, y1, x2, y2, title) = {
          rect((x1, y1), (x2, y2), fill: white, stroke: black)

          // rect(
          //   (x1, y2 - 0.7),
          //   (x1 + 4.2, y2),
          //   fill: head-bg,
          //   stroke: black,
          // )

          content((x1 + 0.25, y2 - 0.4), anchor: "west", [
            #text(size: 7pt, weight: "bold")[#title]
          ])
        }

        let usecase(x, y, w, h, label) = {
          rect(
            (x - w/2, y - h/2),
            (x + w/2, y + h/2),
            stroke: black,
            radius: h/2,
          )

          content((x, y), anchor: "center", [
            #box(width: w * 0.34cm)[
              #align(center)[
                #set par(leading: 0.4em, justify: false)
                #text(size: 8pt,font: "Times New Roman",)[#label]
              ]
            ]
          ])
        }

        // =========================
        // System
        // =========================
        rect((3,0.7),(56.5,24.8), fill: bg, stroke: black)
        content((29.5,24.1), [#text(size: 14pt, weight: "bold")[ADAS-R2T]])

        // =========================
        // Packages
        // =========================
        package-box(4.2,12.5,20.3,24,[Generation])
        package-box(4.2,2,20.3,11.8,[Résultats])
        package-box(21.7,2,42.8,22.9,[HITL])
        package-box(43.9,2,55.4,24,[Administration])

        // =========================
        // Generation
        // =========================
        usecase(12.25,21.6,12.1,2,[Charger un fichier \
Excel d’exigences])

        usecase(12.25,19.3,12.1,2,[Charger une vidéo \
de conduite])

        usecase(12.25,17,12.1,2,[Lancer la génération \
des cas de test])

        usecase(12.25,14.75,12.1,2,[Suivre la progression \
en temps réel SSE])

        // =========================
        // Résultats
        // =========================
        usecase(12.25,10,12.3,2,[Télécharger le fichier Excel])
        usecase(12.25,7.5,12.3,2,[Re-entrer en revue])
        usecase(12.25,4.95,12.3,2,[Consulter l’historique \
des versions])

        // =========================
        // HITL
        // =========================
        usecase(32.25,21.2,12.8,2,[Examiner les cas de test])
        usecase(27.05,16.85,7.8,2,[Approuver])
        usecase(37.45,16.85,8.2,2,[Rejeter])
        usecase(27.05,12.25,7.8,2,[Supprimer])
        usecase(37.45,12.25,8.2,2,[Regenerer rejetes])
        usecase(32.25,9.25,13.8,2,[Regenerer global])

        // =========================
        // Admin
        // =========================
        usecase(49.65,11.15,8.9,2,[Gerer utilisateurs])
        usecase(49.65,8.05,8.9,2,[Approuver inscriptions])
        usecase(49.65,4.95,8.9,2,[Consulter metriques])

        // =========================
        // Actors
        // =========================
        actor(1.2,13,[Ingenieur])
        actor(59,8,[Administrateur])

        // =========================
        // CLEAN EDGES ✅
        // =========================

        // LEFT SIDE
        assoc(((2,13.7),(3.5,21.6),(6.3,21.6)))
        assoc(((2,13.4),(3.5,19.3),(6.3,19.3)))
        assoc(((2,13.1),(3.5,17),(6.3,17)))
        assoc(((2,12.8),(3.5,14.75),(6.3,14.75)))

        // ROUTED to Examiner (no overlap)
        assoc(((2,12.4),(3,12.4),(3,23),(28,23),(28,21.2)))

        assoc(((2,11.8),(3.5,10),(6.3,10)))
        assoc(((2,11.4),(3.5,7.5),(6.3,7.5)))
        assoc(((2,11.1),(3.5,4.95),(6.3,4.95)))

        // RIGHT SIDE
        assoc(((57.5,9),(55.4,11.1),(54,11.1)))
        assoc(((57.5,8),(55.4,8),(54,8)))
        assoc(((57.5,7),(55.4,5),(54,5)))

        // =========================
        // INCLUDE / EXTEND CLEAN ✅
        // =========================

        // include
        dashed-arrow(((30.5,20.7),(27.05,17.8)))
        rel-label(30.4 ,19.5,[include])

        dashed-arrow(((34,20.7),(37.45,17.8)))
        rel-label(35.8,19.5,[include])

        dashed-arrow(((29.5,20.5),(25,17.5),(25,13),(27.05,13)))
        rel-label(25.5,15,[include])

        // extend
        dashed-arrow(((37.45,15.5),(37.45,13.5)))
        rel-label(37.7,15,[extend])

        dashed-arrow(((32.25,20.5),(32.25,10.5)))
        rel-label(32.2,15,[extend])
      })
    ]
  ],
  caption: [Diagramme de cas d’utilisation de la plateforme ADAS-R2T],
)


// =====================================================
// Sequence Diagram - Excel Generation Flow ADAS-R2T
// Complete visible version - no bottom clipping
// =====================================================

#let adas-r2t-sequence-excel-generation() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#111111")
        let gray = rgb("#4B5563")
        let bg = rgb("#ffffff")
        let white = rgb("#FFFFFF")
        let light = rgb("#F8FAFC")

        // =========================
        // Helpers
        // =========================

        let participant(x, y, w, h, label) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: light,
            stroke: black + 0.70pt,
            radius: 0.12,
          )

          content((x, y), anchor: "center", [
            #box(width: (w * 0.42cm))[
              #align(center)[
                #set par(leading: 0.55em, justify: false)
                #text(
                  font: "Arial",
                  size: 6.2pt,
                  fill: black,
                )[
                  #label
                ]
              ]
            ]
          ])
        }

        let actor-top(x, y, label) = {
          circle((x, y + 0.36), radius: 0.16, stroke: black + 0.70pt, fill: white)
          line((x, y + 0.20), (x, y - 0.38), stroke: black + 0.70pt)
          line((x - 0.34, y - 0.02), (x + 0.34, y - 0.02), stroke: black + 0.70pt)
          line((x, y - 0.38), (x - 0.30, y - 0.78), stroke: black + 0.70pt)
          line((x, y - 0.38), (x + 0.30, y - 0.78), stroke: black + 0.70pt)

          content((x, y - 1.12), anchor: "center", [
            #text(font: "Arial", size: 6.0pt, weight: "bold", fill: black)[#label]
          ])
        }

        let actor-bottom(x, y, label) = {
          content((x, y + 0.85), anchor: "center", [
            #text(font: "Arial", size: 6.0pt, weight: "bold", fill: black)[#label]
          ])

          circle((x, y + 0.45), radius: 0.16, stroke: black + 0.70pt, fill: white)
          line((x, y + 0.29), (x, y - 0.30), stroke: black + 0.70pt)
          line((x - 0.34, y + 0.08), (x + 0.34, y + 0.08), stroke: black + 0.70pt)
          line((x, y - 0.30), (x - 0.30, y - 0.70), stroke: black + 0.70pt)
          line((x, y - 0.30), (x + 0.30, y - 0.70), stroke: black + 0.70pt)
        }

        let lifeline(x, y1, y2) = {
          line(
            (x, y1),
            (x, y2),
            stroke: (
              paint: gray,
              thickness: 0.42pt,
              dash: "dashed",
            ),
          )
        }

        let msg(x1, x2, y, label) = {
          line(
            (x1, y),
            (x2, y),
            stroke: black + 0.62pt,
            mark: (end: ">"),
          )

          content(((x1 + x2) / 2, y + 0.16), anchor: "center", [
            #box(width: 3.2cm)[
              #align(center)[
                #set par(leading: 0.48em, justify: false)
                #text(font: "Arial", size: 6.2pt, fill: black)[#label]
              ]
            ]
          ])
        }

        let ret(x1, x2, y, label) = {
          line(
            (x1, y),
            (x2, y),
            stroke: (
              paint: black,
              thickness: 0.56pt,
              dash: "dashed",
            ),
            mark: (end: ">"),
          )

          content(((x1 + x2) / 2, y + 0.16), anchor: "center", [
            #box(width: 3.4cm)[
              #align(center)[
                #set par(leading: 0.48em, justify: false)
                #text(font: "Arial", size: 6.0pt, fill: black)[#label]
              ]
            ]
          ])
        }

        let self-msg(x, y, label) = {
          line(
            (x, y),
            (x + 0.90, y),
            (x + 0.90, y - 0.32),
            (x, y - 0.32),
            stroke: black + 0.58pt,
            mark: (end: ">"),
          )

          content((x + 1.02, y - 0.10), anchor: "west", [
            #box(width: 3.0cm)[
              #set par(leading: 0.48em, justify: false)
              #text(font: "Arial", size: 6.0pt, fill: black)[#label]
            ]
          ])
        }

        let activation(x, y-top, y-bottom) = {
          rect(
            (x - 0.08, y-bottom),
            (x + 0.08, y-top),
            fill: rgb("#E5E7EB"),
            stroke: black + 0.45pt,
            radius: 0.03,
          )
        }

        // =========================
        // Background
        // =========================

        rect(
          (-0.65, -0.20),
          (19.25, 18.25),
          fill: bg,
          stroke: none,
        )

        // =========================
        // Title
        // =========================

        content((9.30, 17.80), anchor: "center", [
          #text(
            font: "Arial",
            size: 10.5pt,
            weight: "bold",
            fill: black,
          )[
            Séquence de génération des cas de test à partir d’un fichier Excel
          ]
        ])

        // =========================
        // X positions
        // =========================

        let x-user = 0.75
        let x-front = 3.95
        let x-bff = 7.25
        let x-pipe = 10.90
        let x-pg = 14.25
        let x-llm = 17.55

        // =========================
        // Top participants
        // =========================

        actor-top(x-user, 16.35, [Utilisateur])

        participant(x-front, 16.35, 2.15, 0.70, [Frontend])
        participant(x-bff, 16.35, 2.40, 0.70, [Backend BFF])
        participant(x-pipe, 16.35, 2.40, 0.70, [AI Pipeline])
        participant(x-pg, 16.35, 2.35, 0.70, [PostgreSQL])
        participant(x-llm, 16.35, 2.15, 0.70, [LLM API])

        // =========================
        // Bottom participants
        // =========================

        actor-bottom(x-user, 0.75, [Utilisateur])

        participant(x-front, 0.75, 2.15, 0.70, [Frontend])
        participant(x-bff, 0.75, 2.40, 0.70, [Backend BFF])
        participant(x-pipe, 0.75, 2.40, 0.70, [AI Pipeline])
        participant(x-pg, 0.75, 2.35, 0.70, [PostgreSQL])
        participant(x-llm, 0.75, 2.15, 0.70, [LLM API])

        // =========================
        // Lifelines
        // =========================

        lifeline(x-user, 15.65, 1.55)
        lifeline(x-front, 15.95, 1.10)
        lifeline(x-bff, 15.95, 1.10)
        lifeline(x-pipe, 15.95, 1.10)
        lifeline(x-pg, 15.95, 1.10)
        lifeline(x-llm, 15.95, 1.10)

        // =========================
        // Messages
        // =========================

        msg(x-user, x-front, 15.25, [Charger Excel])

        msg(x-front, x-bff, 14.65, [POST /upload])

        self-msg(x-bff, 14.10, [Stocker dans MongoDB])

        msg(x-user, x-front, 13.35, [Lancer génération])

        msg(x-front, x-bff, 12.75, [POST /generate])

        msg(x-bff, x-pipe, 12.15, [POST /pipeline/run])

        // Activation AI Pipeline
        activation(x-pipe, 11.90, 3.95)

        msg(x-pipe, x-pg, 11.55, [Créer checkpoint thread_id])

        self-msg(x-pipe, 10.95, [ingest_Req])

        msg(x-pipe, x-llm, 10.25, [extract_and_structure])
        ret(x-llm, x-pipe, 9.78, [exigences structurées])

        msg(x-pipe, x-llm, 9.15, [5 analyseurs en parallèle])
        ret(x-llm, x-pipe, 8.68, [résultats d’analyse])

        msg(x-pipe, x-llm, 8.05, [plan_single_req × N])
        ret(x-llm, x-pipe, 7.58, [blueprints])

        msg(x-pipe, x-llm, 6.95, [generate_tc × M])
        ret(x-llm, x-pipe, 6.48, [cas de test])

        self-msg(x-pipe, 5.88, [synthesizer dedup])

        self-msg(x-pipe, 5.28, [evaluator])

        msg(x-pipe, x-pg, 4.62, [Sauvegarder checkpoint])

        ret(
          x-pipe,
          x-bff,
          4.02,
          [
            status: awaiting_review \
            thread_id + final_tcs
          ],
        )

        self-msg(x-bff, 3.35, [Stocker thread_id])

        ret(x-bff, x-front, 2.70, [Afficher résultats])

        ret(x-front, x-user, 2.05, [Page de revue])
      })
    ]
  ],
  caption: [Diagramme de séquence du flux de génération Excel dans ADAS-R2T],
)





// =====================================================
// Sequence Diagram - HITL Review / Regeneration Flow
// ADAS-R2T - Typst/CeTZ
// =====================================================

#let adas-r2t-sequence-hitl-review() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *

        // =========================
        // Colors
        // =========================
        let black = rgb("#111111")
        let gray = rgb("#4B5563")
        let bg = rgb("#FAFBFE")
        let white = rgb("#FFFFFF")
        let light = rgb("#F8FAFC")
        let note-bg = rgb("#FFF7E6")

        // =========================
        // Helpers
        // =========================

        let participant(x, y, w, h, label) = {
          rect(
            (x - w / 2, y - h / 2),
            (x + w / 2, y + h / 2),
            fill: light,
            stroke: black + 0.70pt,
            radius: 0.12,
          )

          content((x, y), anchor: "center", [
            #box(width: (w * 0.42cm))[
              #align(center)[
                #set par(leading: 0.55em, justify: false)
                #text(
                  font: "Arial",
                  size: 6.2pt,
                  fill: black,
                )[
                  #label
                ]
              ]
            ]
          ])
        }

        let actor-top(x, y, label) = {
          circle((x, y + 0.36), radius: 0.16, stroke: black + 0.70pt, fill: white)
          line((x, y + 0.20), (x, y - 0.38), stroke: black + 0.70pt)
          line((x - 0.34, y - 0.02), (x + 0.34, y - 0.02), stroke: black + 0.70pt)
          line((x, y - 0.38), (x - 0.30, y - 0.78), stroke: black + 0.70pt)
          line((x, y - 0.38), (x + 0.30, y - 0.78), stroke: black + 0.70pt)

          content((x, y - 1.12), anchor: "center", [
            #text(font: "Arial", size: 6.0pt, weight: "bold", fill: black)[#label]
          ])
        }

        let actor-bottom(x, y, label) = {
          content((x, y + 0.85), anchor: "center", [
            #text(font: "Arial", size: 6.0pt, weight: "bold", fill: black)[#label]
          ])

          circle((x, y + 0.45), radius: 0.16, stroke: black + 0.70pt, fill: white)
          line((x, y + 0.29), (x, y - 0.30), stroke: black + 0.70pt)
          line((x - 0.34, y + 0.08), (x + 0.34, y + 0.08), stroke: black + 0.70pt)
          line((x, y - 0.30), (x - 0.30, y - 0.70), stroke: black + 0.70pt)
          line((x, y - 0.30), (x + 0.30, y - 0.70), stroke: black + 0.70pt)
        }

        let lifeline(x, y1, y2) = {
          line(
            (x, y1),
            (x, y2),
            stroke: (
              paint: gray,
              thickness: 0.42pt,
              dash: "dashed",
            ),
          )
        }

        let msg(x1, x2, y, label, width: 3.4cm) = {
          line(
            (x1, y),
            (x2, y),
            stroke: black + 0.62pt,
            mark: (end: ">"),
          )

          content(((x1 + x2) / 2, y + 0.16), anchor: "center", [
            #box(width: width)[
              #align(center)[
                #set par(leading: 0.48em, justify: false)
                #text(font: "Arial", size: 5.15pt, fill: black)[#label]
              ]
            ]
          ])
        }

        let ret(x1, x2, y, label, width: 3.6cm) = {
          line(
            (x1, y),
            (x2, y),
            stroke: (
              paint: black,
              thickness: 0.56pt,
              dash: "dashed",
            ),
            mark: (end: ">"),
          )

          content(((x1 + x2) / 2, y + 0.16), anchor: "center", [
            #box(width: width)[
              #align(center)[
                #set par(leading: 0.48em, justify: false)
                #text(font: "Arial", size: 5.0pt, fill: black)[#label]
              ]
            ]
          ])
        }

        let self-msg(x, y, label, width: 3.1cm) = {
          line(
            (x, y),
            (x + 0.90, y),
            (x + 0.90, y - 0.32),
            (x, y - 0.32),
            stroke: black + 0.58pt,
            mark: (end: ">"),
          )

          content((x + 1.02, y - 0.10), anchor: "west", [
            #box(width: width)[
              #set par(leading: 0.48em, justify: false)
              #text(font: "Arial", size: 5.3pt, fill: black)[#label]
            ]
          ])
        }

        let activation(x, y-top, y-bottom) = {
          rect(
            (x - 0.08, y-bottom),
            (x + 0.08, y-top),
            fill: rgb("#E5E7EB"),
            stroke: black + 0.45pt,
            radius: 0.03,
          )
        }

        let section-title(y, label) = {
          line((0.20, y), (18.60, y), stroke: gray + 0.35pt)
          content((9.30, y + 0.25), anchor: "center", [
            #box(fill: bg, inset: (x: 4pt, y: 1pt))[
              #text(font: "Arial", size: 7.2pt, weight: "bold", fill: black)[#label]
            ]
          ])
        }

        let note-right(x, y, w, h, label) = {
          rect(
            (x, y - h / 2),
            (x + w, y + h / 2),
            fill: note-bg,
            stroke: black + 0.50pt,
            radius: 0.10,
          )

          content((x + 0.20, y), anchor: "west", [
            #box(width: ((w - 0.35) * 0.40cm))[
              #set par(leading: 0.48em, justify: false)
              #text(font: "Arial", size: 5.0pt, fill: black)[#label]
            ]
          ])
        }

        // =========================
        // Background
        // =========================

        rect(
          (-0.65, -0.20),
          (19.20, 22.80),
          fill: bg,
          stroke: none,
        )

        // =========================
        // Title
        // =========================

        content((9.30, 22.35), anchor: "center", [
          #text(
            font: "Arial",
            size: 10.5pt,
            weight: "bold",
            fill: black,
          )[
            Séquence de revue HITL, régénération et réentrée
          ]
        ])

        // =========================
        // X positions
        // =========================

        let x-user = 0.75
        let x-front = 4.00
        let x-bff = 7.25
        let x-pipe = 10.90
        let x-pg = 14.45

        // =========================
        // Top participants
        // =========================

        actor-top(x-user, 20.95, [Utilisateur])

        participant(x-front, 20.95, 2.20, 0.70, [Frontend])
        participant(x-bff, 20.95, 2.45, 0.70, [Backend BFF])
        participant(x-pipe, 20.95, 2.45, 0.70, [AI Pipeline])
        participant(x-pg, 20.95, 2.40, 0.70, [PostgreSQL])

        // =========================
        // Bottom participants
        // =========================

        actor-bottom(x-user, 0.85, [Utilisateur])

        participant(x-front, 0.85, 2.20, 0.70, [Frontend])
        participant(x-bff, 0.85, 2.45, 0.70, [Backend BFF])
        participant(x-pipe, 0.85, 2.45, 0.70, [AI Pipeline])
        participant(x-pg, 0.85, 2.40, 0.70, [PostgreSQL])

        // =========================
        // Lifelines
        // =========================

        lifeline(x-user, 20.25, 1.65)
        lifeline(x-front, 20.55, 1.20)
        lifeline(x-bff, 20.55, 1.20)
        lifeline(x-pipe, 20.55, 1.20)
        lifeline(x-pg, 20.55, 1.20)

        // =========================
        // Section 1 - Revue Round 1
        // =========================

        section-title(19.75, [Revue Round 1])

        msg(
          x-user,
          x-front,
          19.10,
          [
            Approuver TC01, TC03, TC04 \
            Rejeter TC02 avec feedback \
            Supprimer TC05
          ],
          width: 4.0cm,
        )

        msg(x-front, x-bff, 18.35, [decisions])

        msg(
          x-bff,
          x-pipe,
          17.65,
          [
            POST /pipeline/resume/thread_id \
            action: regenerate_selected
          ],
          width: 4.3cm,
        )

        activation(x-pipe, 17.45, 10.55)

        self-msg(
          x-pipe,
          16.95,
          [
            process_review \
            trier décisions
          ],
          width: 3.0cm,
        )

        msg(x-pipe, x-pg, 16.25, [Time Travel → coverage_planner])

        note-right(
          12.50,
          14.95,
          5.90,
          1.15,
          [
            Seul TC02 est régénéré \
            TC01, TC03, TC04 inchangés \
            TC05 supprimé
          ],
        )

        self-msg(
          x-pipe,
          14.20,
          [
            plan_single_req \
            TC02 + feedback
          ],
          width: 3.2cm,
        )

        self-msg(
          x-pipe,
          13.35,
          [
            generate_tc \
            TC02 uniquement
          ],
          width: 3.2cm,
        )

        self-msg(x-pipe, 12.55, [synthesizer merge])
        self-msg(x-pipe, 11.75, [evaluator])

        msg(x-pipe, x-pg, 11.00, [Sauvegarder checkpoint])

        ret(
          x-pipe,
          x-bff,
          10.40,
          [
            status: awaiting_review \
            review_round: 2 \
            final_tcs mis à jour
          ],
          width: 4.0cm,
        )

        ret(x-bff, x-front, 9.75, [Afficher nouveaux résultats])
        ret(x-front, x-user, 9.15, [Page de revue Round 2])

        // =========================
        // Section 2 - Final approval
        // =========================

        section-title(8.55, [Approbation finale])

        msg(x-user, x-front, 7.95, [Tout approuver])
        msg(x-front, x-bff, 7.35, [action: skip])

        msg(
          x-bff,
          x-pipe,
          6.75,
          [POST /pipeline/resume/thread_id],
          width: 3.8cm,
        )

        activation(x-pipe, 6.55, 4.90)

        self-msg(
          x-pipe,
          6.10,
          [
            output_excel \
            TC_Generated_v2.xlsx
          ],
          width: 3.4cm,
        )

        ret(x-pipe, x-bff, 5.35, [download_url])

        ret(x-bff, x-front, 4.75, [Lien de téléchargement])
        ret(x-front, x-user, 4.15, [Télécharger Excel v2])

        // =========================
        // Section 3 - Optional re-entry
        // =========================

        section-title(3.55, [Re-entry optionnel])

        msg(x-user, x-front, 3.05, [Bouton Review])
        msg(x-front, x-bff, 2.55, [Re-entrer en revue])

        msg(
          x-bff,
          x-pipe,
          2.05,
          [POST /pipeline/review/thread_id],
          width: 3.8cm,
        )

        msg(x-pipe, x-pg, 1.55, [aupdate_state → human_review])

        ret(x-pipe, x-bff, 1.10, [status: awaiting_review])
        ret(x-bff, x-front, 0.55, [Page de revue])
        ret(x-front, x-user, 0.05, [Nouveau cycle possible])
      })
    ]
  ],
  caption: [Diagramme de séquence du processus de revue HITL, régénération et réentrée],
)


#let hitl-review-round1-sequence() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *

        let black = rgb("#111111")
        let gray = rgb("#4B5563")
        let bg = rgb("#ffffff")
        let white = rgb("#FFFFFF")
        let light = rgb("#F8FAFC")
        let note-bg = rgb("#FFF7E6")

        let participant(x, y, label) = {
          rect((x - 1.1, y - 0.35), (x + 1.1, y + 0.35), fill: light, stroke: black + 0.7pt, radius: 0.12)
          content((x, y), anchor: "center", [
            #text(font: "Arial", size: 6.3pt, fill: black)[#label]
          ])
        }

        let actor(x, y, label) = {
          circle((x, y + 0.35), radius: 0.16, stroke: black + 0.7pt, fill: white)
          line((x, y + 0.19), (x, y - 0.38), stroke: black + 0.7pt)
          line((x - 0.32, y - 0.02), (x + 0.32, y - 0.02), stroke: black + 0.7pt)
          line((x, y - 0.38), (x - 0.28, y - 0.75), stroke: black + 0.7pt)
          line((x, y - 0.38), (x + 0.28, y - 0.75), stroke: black + 0.7pt)
          content((x, y - 1.05), anchor: "center", [
            #text(font: "Arial", size: 6pt, weight: "bold")[#label]
          ])
        }

        let lifeline(x, y1, y2) = {
          line((x, y1), (x, y2), stroke: (paint: gray, thickness: 0.42pt, dash: "dashed"))
        }

        let msg(x1, x2, y, label) = {
          line((x1, y), (x2, y), stroke: black + 0.62pt, mark: (end: ">"))
          content(((x1 + x2) / 2, y - 0.5), anchor: "center", [
            #box(width: 4.2cm)[
              #align(center)[
                #set par(leading: 0.48em, justify: false)
                #text(font: "Arial", size: 5.5pt)[#label]
              ]
            ]
          ])
        }

        let ret(x1, x2, y, label) = {
          line((x1, y), (x2, y), stroke: (paint: black, thickness: 0.56pt, dash: "dashed"), mark: (end: ">"))
          content(((x1 + x2) / 2, y + 0.5), anchor: "center", [
            #box(width: 4.2cm)[
              #align(center)[
                #set par(leading: 0.48em, justify: false)
                #text(font: "Arial", size: 6pt, fill: gray)[#label]
              ]
            ]
          ])
        }

        let self-msg(x, y, label) = {
          line((x, y), (x + 0.9, y), (x + 0.9, y - 0.32), (x, y - 0.32), stroke: black + 0.58pt, mark: (end: ">"))
          content((x + 1.05, y - 0.10), anchor: "west", [
            #box(width: 3.6cm)[
              #set par(leading: 0.48em, justify: false)
              #text(font: "Arial", size: 5pt)[#label]
            ]
          ])
        }

        let activation(x, y-top, y-bottom) = {
          rect((x - 0.08, y-bottom), (x + 0.08, y-top), fill: rgb("#E5E7EB"), stroke: black + 0.45pt)
        }

        let note-right(x, y, w, h, label) = {
          rect((x, y - h / 2), (x + w, y + h / 2), fill: note-bg, stroke: black + 0.5pt, radius: 0.1)
          content((x + 0.18, y), anchor: "west", [
            #box(width: 4.4cm)[
              #set par(leading: 0.48em, justify: false)
              #text(font: "Arial", size: 5pt)[#label]
            ]
          ])
        }

        rect((-0.6, 0.2), (18.7, 13.8), fill: bg, stroke: none)

        content((9.1, 13.35), anchor: "center", [
          #text(font: "Arial", size: 10.5pt, weight: "bold")[]
        ])

        let x-user = 0.8
        let x-front = 4.0
        let x-bff = 7.3
        let x-pipe = 10.9
        let x-pg = 14.5

        actor(x-user, 12.1, [Utilisateur])
        participant(x-front, 12.1, [Frontend])
        participant(x-bff, 12.1, [Backend BFF])
        participant(x-pipe, 12.1, [AI Pipeline])
        participant(x-pg, 12.1, [PostgreSQL])

        lifeline(x-user, 11.4, 0.9)
        lifeline(x-front, 11.7, 0.9)
        lifeline(x-bff, 11.7, 0.9)
        lifeline(x-pipe, 11.7, 0.9)
        lifeline(x-pg, 11.7, 0.9)

        msg(x-user, x-front, 11.0, [
          Approuver TC01, TC03, TC04 \
          Rejeter TC02 avec feedback \
          Supprimer TC05
        ])

        msg(x-front, x-bff, 10.1, [decisions])

        msg(x-bff, x-pipe, 9.3, [
          POST /pipeline/resume/thread_id \
          action: regenerate_selected
        ])

        activation(x-pipe, 9.0, 2.1)

        self-msg(x-pipe, 8.55, [
          process_review \
          trier décisions
        ])

        msg(x-pipe, x-pg, 7.75, [Time Travel ])

        note-right(13.3, 6.8, 3.7, 1.15, [
          Seul TC02 est régénéré \
          TC01, TC03, TC04 inchangés \
          TC05 supprimé
        ])

        self-msg(x-pipe, 5.95, [
          plan_single_req \
          TC02 + feedback
        ])

        self-msg(x-pipe, 5.15, [
          generate_tc \
          TC02 uniquement
        ])

        self-msg(x-pipe, 4.35, [synthesizer merge])
        self-msg(x-pipe, 3.55, [evaluator])

        msg(x-pipe, x-pg, 2.85, [Sauvegarder checkpoint])

        ret(x-pipe, x-bff, 2.15, [
          status: awaiting_review \
          review_round: 2 \
          final_tcs mis à jour
        ])

        ret(x-bff, x-front, 1.45, [Afficher nouveaux résultats])
        ret(x-front, x-user, 0.85, [Page de revue Round 2])
      })
    ]
  ],
  caption: [Revue HITL — Round 1 et régénération sélective],
)



#let hitl-reentry-sequence() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 0.9cm, {
        import cetz.draw: *

        let black = rgb("#111111")
        let gray = rgb("#4B5563")
        let bg = rgb("#ffffff")
        let white = rgb("#FFFFFF")
        let light = rgb("#F8FAFC")

        let participant(x, y, label) = {
          rect((x - 1.1, y - 0.35), (x + 1.1, y + 0.35), fill: light, stroke: black + 0.7pt, radius: 0.12)
          content((x, y), anchor: "center", [
            #text(font: "Arial", size: 6.3pt)[#label]
          ])
        }

        let actor(x, y, label) = {
          circle((x, y + 0.35), radius: 0.16, stroke: black + 0.7pt, fill: white)
          line((x, y + 0.19), (x, y - 0.38), stroke: black + 0.7pt)
          line((x - 0.32, y - 0.02), (x + 0.32, y - 0.02), stroke: black + 0.7pt)
          line((x, y - 0.38), (x - 0.28, y - 0.75), stroke: black + 0.7pt)
          line((x, y - 0.38), (x + 0.28, y - 0.75), stroke: black + 0.7pt)
          content((x, y - 1.05), anchor: "center", [
            #text(font: "Arial", size: 6pt, weight: "bold")[#label]
          ])
        }

        let lifeline(x, y1, y2) = {
          line((x, y1), (x, y2), stroke: (paint: gray, thickness: 0.42pt, dash: "dashed"))
        }

        let msg(x1, x2, y, label) = {
          line((x1, y), (x2, y), stroke: black + 0.62pt, mark: (end: ">"))
          content(((x1 + x2) / 2, y + 0.16), anchor: "center", [
            #box(width: 3.8cm)[
              #align(center)[
                #text(font: "Arial", size: 6pt)[#label]
              ]
            ]
          ])
        }

        let ret(x1, x2, y, label) = {
          line((x1, y), (x2, y), stroke: (paint: black, thickness: 0.56pt, dash: "dashed"), mark: (end: ">"))
          content(((x1 + x2) / 2, y + 0.16), anchor: "center", [
            #box(width: 3.8cm)[
              #align(center)[
                #text(font: "Arial", size: 6pt, fill: gray)[#label]
              ]
            ]
          ])
        }

        rect((-0.6, 0.2), (15.6, 7.2), fill: bg, stroke: none)

        content((7.5, 6.85), anchor: "center", [
          #text(font: "Arial", size: 10.5pt, weight: "bold")[]
        ])

        let x-user = 0.8
        let x-front = 4.0
        let x-bff = 7.3
        let x-pipe = 10.9
        let x-pg = 14.1

        actor(x-user, 5.85, [Utilisateur])
        participant(x-front, 5.85, [Frontend])
        participant(x-bff, 5.85, [Backend BFF])
        participant(x-pipe, 5.85, [AI Pipeline])
        participant(x-pg, 5.85, [PostgreSQL])

        lifeline(x-user, 5.15, 0.8)
        lifeline(x-front, 5.45, 0.8)
        lifeline(x-bff, 5.45, 0.8)
        lifeline(x-pipe, 5.45, 0.8)
        lifeline(x-pg, 5.45, 0.8)

        msg(x-user, x-front, 4.9, [Bouton Review])
        msg(x-front, x-bff, 4.25, [Re-entrer en revue])
        msg(x-bff, x-pipe, 3.6, [POST /pipeline/review/thread_id])
        msg(x-pipe, x-pg, 2.95, [aupdate_state → human_review])

        ret(x-pipe, x-bff, 2.25, [status: awaiting_review])
        ret(x-bff, x-front, 1.55, [Page de revue])
        ret(x-front, x-user, 0.9, [Nouveau cycle possible])
      })
    ]
  ],
  caption: [Revue HITL — réentrée optionnelle dans le cycle de revue],
)


#let hitl-final-approval-sequence() = figure(
  block(width: 100%)[
    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *

        let black = rgb("#111111")
        let gray = rgb("#4B5563")
        let bg = rgb("#ffffff")
        let white = rgb("#FFFFFF")
        let light = rgb("#F8FAFC")

        let participant(x, y, label) = {
          rect((x - 1.1, y - 0.35), (x + 1.1, y + 0.35), fill: light, stroke: black + 0.7pt, radius: 0.12)
          content((x, y), anchor: "center", [
            #text(font: "Arial", size: 6.3pt)[#label]
          ])
        }

        let actor(x, y, label) = {
          circle((x, y + 0.35), radius: 0.16, stroke: black + 0.7pt, fill: white)
          line((x, y + 0.19), (x, y - 0.38), stroke: black + 0.7pt)
          line((x - 0.32, y - 0.02), (x + 0.32, y - 0.02), stroke: black + 0.7pt)
          line((x, y - 0.38), (x - 0.28, y - 0.75), stroke: black + 0.7pt)
          line((x, y - 0.38), (x + 0.28, y - 0.75), stroke: black + 0.7pt)
          content((x, y - 1.05), anchor: "center", [
            #text(font: "Arial", size: 6pt, weight: "bold")[#label]
          ])
        }

        let lifeline(x, y1, y2) = {
          line((x, y1), (x, y2), stroke: (paint: gray, thickness: 0.42pt, dash: "dashed"))
        }

        let msg(x1, x2, y, label) = {
          line((x1, y), (x2, y), stroke: black + 0.62pt, mark: (end: ">"))
          content(((x1 + x2) / 2, y + 0.16), anchor: "center", [
            #box(width: 3.8cm)[
              #align(center)[
                #text(font: "Arial", size: 5.2pt)[#label]
              ]
            ]
          ])
        }

        let ret(x1, x2, y, label) = {
          line((x1, y), (x2, y), stroke: (paint: black, thickness: 0.56pt, dash: "dashed"), mark: (end: ">"))
          content(((x1 + x2) / 2, y + 0.16), anchor: "center", [
            #box(width: 3.8cm)[
              #align(center)[
                #text(font: "Arial", size: 5pt, fill: gray)[#label]
              ]
            ]
          ])
        }

        let self-msg(x, y, label) = {
          line((x, y), (x + 0.9, y), (x + 0.9, y - 0.32), (x, y - 0.32), stroke: black + 0.58pt, mark: (end: ">"))
          content((x + 1.05, y - 0.10), anchor: "west", [
            #box(width: 3.4cm)[
              #set par(leading: 0.48em, justify: false)
              #text(font: "Arial", size: 5pt)[#label]
            ]
          ])
        }

        let activation(x, y-top, y-bottom) = {
          rect((x - 0.08, y-bottom), (x + 0.08, y-top), fill: rgb("#E5E7EB"), stroke: black + 0.45pt)
        }

        rect((-0.6, 0.2), (15.6, 7.5), fill: bg, stroke: none)

        content((7.5, 7.1), anchor: "center", [
          #text(font: "Arial", size: 10.5pt, weight: "bold")[]
        ])

        let x-user = 0.8
        let x-front = 4.0
        let x-bff = 7.3
        let x-pipe = 10.9

        actor(x-user, 6.1, [Utilisateur])
        participant(x-front, 6.1, [Frontend])
        participant(x-bff, 6.1, [Backend BFF])
        participant(x-pipe, 6.1, [AI Pipeline])

        lifeline(x-user, 5.4, 0.8)
        lifeline(x-front, 5.7, 0.8)
        lifeline(x-bff, 5.7, 0.8)
        lifeline(x-pipe, 5.7, 0.8)

        msg(x-user, x-front, 5.1, [Tout approuver])
        msg(x-front, x-bff, 4.4, [action: skip])
        msg(x-bff, x-pipe, 3.75, [POST /pipeline/resume/thread_id])

        activation(x-pipe, 3.55, 2.25)

        self-msg(x-pipe, 3.15, [
          output_excel \
          TC_Generated_v2.xlsx
        ])

        ret(x-pipe, x-bff, 2.25, [download_url])
        ret(x-bff, x-front, 1.55, [Lien de téléchargement])
        ret(x-front, x-user, 0.9, [Télécharger Excel v2])
      })
    ]
  ],
  caption: [Revue HITL — approbation finale et génération du fichier Excel],
)




#import "@preview/timeliney:0.4.0" as timeliney

// =====================================================
// ADAS-R2T Gantt Chart - Timeliney Version
// =====================================================

#let adas-r2t-timeliney-gantt() = figure(
  timeliney.timeline(
    show-grid: true,
    {
      import timeliney: *

      // =========================
      // Colors
      // =========================
      let orange = rgb("#E87722")
      let dark-orange = rgb("#C75A11")
      let blue = rgb("#2563EB")
      let gray = rgb("#6B7280")
      let dark = rgb("#0a2e37")
      let light-gray = rgb("#E5E7EB")

      // =========================
      // Header
      // 0 = Feb, 1 = Mar, ..., 6 = Aug
      // =========================

      headerline(
        group(([*2026*], 7)),
      )

      headerline(
        group(
          [*Feb*],
          [*Mar*],
          [*Apr*],
          [*May*],
          [*Jun*],
          [*Jul*],
          [*Aug*],
        ),
      )

      // =========================
      // Phase 1 - Cadrage
      // =========================

      taskgroup(
        title: [*Cadrage*],
        content: text(8pt, white)[*Planning*],
        style: (stroke: 12pt + dark),
        {
          task(
            "Analyse du besoin",
            (
              from: 0.00,
              to: 0.75,
              content: text(7.5pt, white)[Planning],
            ),
            style: (stroke: 11pt + orange),
          )

          task(
            "Architecture initiale",
            (
              from: 0.45,
              to: 1.15,
              content: text(7.5pt, white)[Design],
            ),
            style: (stroke: 11pt + orange),
          )
        },
      )

      // =========================
      // Phase 2 - MVP Backend / AI Pipeline
      // =========================

      taskgroup(
        title: [*Backend & Pipeline IA*],
        content: text(8pt, white)[*Pipeline Agents*],
        style: (stroke: 12pt + dark),
        {
          task(
            "MVP 1 — Requirements to Tests",
            (
              from: 0.80,
              to: 2.20,
              content: text(7.2pt, white)[Excel → Test cases],
            ),
            style: (stroke: 11pt + orange),
          )

          task(
            "MVP 2 — Video Input Layer",
            (
              from: 1.80,
              to: 3.30,
              content: text(7.2pt, white)[Video → Scenarios],
            ),
            style: (stroke: 11pt + orange),
          )

          task(
            "MVP 3 — Human-in-the-Loop",
            (
              from: 3.10,
              to: 4.55,
              content: text(7.2pt, white)[Output Review],
            ),
            style: (stroke: 11pt + orange),
          )

          task(
            "MVP 4 — Chatbot",
            (
              from: 4.25,
              to: 5.45,
              content: text(7.2pt, white)[Assistant],
            ),
            style: (stroke: 11pt + orange),
          )

          task(
            "MVP 5 — Mémoire long terme",
            (
              from: 4.25,
              to: 5.45,
              content: text(7.2pt, white)[Memory],
            ),
            style: (stroke: 11pt + orange),
          )
        },
      )

      // =========================
      // Phase 3 - Interface & validation
      // =========================

      taskgroup(
        title: [*Interface & Validation*],
        content: text(8pt, white)[*UI + QA*],
        style: (stroke: 12pt + dark),
        {
          task(
            "Développement de l’interface utilisateur",
            (
              from: 2.40,
              to: 6.65,
              content: text(7.2pt, white)[Frontend + Review pages],
            ),
            style: (stroke: 11pt + orange),
          )

          task(
            "Tests, corrections et stabilisation",
            (
              from: 5.80,
              to: 6.85,
              content: text(7.2pt, white)[QA + Docs],
            ),
            style: (stroke: 11pt + orange),
          )
        },
      )

      // =========================
      // Milestones
      // =========================

      milestone(
        at: 0.15,
        style: (stroke: (paint: blue, thickness: 0.8pt, dash: "dashed")),
        align(center, [
          #text(size: 7pt, weight: "bold", fill: blue)[Kick-off]\
          #text(size: 6pt, fill: gray)[Feb 2026]
        ]),
      )

      milestone(
        at: 3.25,
        style: (stroke: (paint: blue, thickness: 0.8pt, dash: "dashed")),
        align(center, [
          #text(size: 7pt, weight: "bold", fill: blue)[Demo intermédiaire]\
          #text(size: 6pt, fill: gray)[May 2026]
        ]),
      )

      milestone(
        at: 6.75,
        style: (stroke: (paint: dark-orange, thickness: 0.8pt, dash: "dashed")),
        align(center, [
          #text(size: 7pt, weight: "bold", fill: dark-orange)[Livraison finale]\
          #text(size: 6pt, fill: gray)[Aug 2026]
        ]),
      )
    },
  ),
  caption: [Diagramme de Gantt du projet ADAS-R2T],
)

