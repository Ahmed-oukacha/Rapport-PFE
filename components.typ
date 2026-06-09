#import "@preview/colorful-boxes:1.4.1": colorbox
#import "@preview/cetz:0.5.2"
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

        let bg = rgb(243, 245, 246)
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
            Capgemini \
            Engineering
          ],
          fill-color: top-blue,
          size: 16pt,
        )

        // Direction boxes
        org-box(
          4.7,
          2.0,
          2.45,
          1.15,
          [MG2],
          fill-color: dark-blue,
          size: 15pt,
        )

        org-box(
          7.85,
          2.0,
          2.45,
          1.15,
          [i-Factories],
          fill-color: dark-blue,
          size: 15pt,
        )

        org-box(
          11,
          2.0,
          2.45,
          1.15,
          [
            MG2\
            Engineering
          ],
          fill-color: dark-blue,
          size: 15pt,
        )

        org-box(
          14.15,
          2.0,
          2.45,
          1.15,
          [AIS],
          fill-color: rgb("#1372f086"),
          size: 15pt,
        )

        org-box(
          17.3,
          2.0,
          2.45,
          1.15,
          [PowerParts],
          fill-color: dark-blue,
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

        let bg = rgb(243, 245, 246)
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
          [AIS],
          fill-color: main-blue,
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
          [
            Mechatronics \
            connected \
            systems
          ],
          fill-color: dark-blue,
          size: 8.4pt,
          text-width: 2.55cm,
        )

        org-box(
          8.8,
          7.1,
          4.25,
          1.75,
          [
            Mechatronics \
            product \
            engineering
          ],
          fill-color: dark-blue,
          size: 8.4pt,
          text-width: 2.55cm,
        )

        org-box(
          13.7,
          7.1,
          4.25,
          1.75,
          [
            Modeling & \
            Simulation
          ],
          fill-color: dark-blue,
          size: 8.8pt,
          text-width: 2.45cm,
        )

        org-box(
          18.6,
          7.1,
          4.25,
          1.75,
          [
            EE \
            Architecture \
            & Safety
          ],
          fill-color: mid-blue,
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
          [SDA],
          fill-color: mid-blue,
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
          [
            MBSE, RBSE, \
            & System \
            Engineers
          ],
          fill-color: mid-blue,
          size: 8pt,
          text-width: 2.75cm,
        )

        org-box(
          15.2,
          1.1,
          3.8,
          1.75,
          [
            NVH \
            Engineers
          ],
          fill-color: mid-blue,
          size: 8.8pt,
          text-width: 2.25cm,
        )

        org-box(
          20.3,
          1.1,
          4.1,
          1.75,
          [
            Data \
            Analysts / \
            Developers
          ],
          fill-color: mid-blue,
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
      #cetz.canvas(length: 0.72cm, {
        import cetz.draw: *

        let cyan = rgb("#76CBE8")
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
          #text(size: 20pt, fill: rgb(116, 145, 149))[S]
        ])

        content((7.6, 8.8), anchor: "center", [
          #text(size: 20pt, fill: rgb(116, 145, 149))[D]
        ])

        content((10.0, 8.8), anchor: "center", [
          #text(size: 20pt, fill: rgb(116, 145, 149))[A]
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
          (0.8, 4.0),
          stroke: dashed-stroke,
          mark: (end: ">"),
        )

        // Conception
        line(
          (7.6, 8.0),
          (7.6, 3.8),
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
          (15.1, 4.0),
          stroke: dashed-stroke,
          mark: (end: ">"),
        )

        // =========================
        // Blocs de texte organisés
        // =========================

        text-block(
          -2.5,
          3.3,
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
          3.3,
          [Conception],
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
          3.3,
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

        let card-bg = rgb("#f3f5f6")
        let cyan = rgb(116, 145, 149)
        let black = rgb("#000000")
        let text-dark = rgb("#263238")

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
        let cyan = rgb("#11B8D0")
        let cyan-fill = rgb("#DDF7FA")
        let orange = rgb(116, 145, 149)
        let orange-fill = rgb("#78a8b4")
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
        let border = rgb(94, 177, 163)
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
        let border = rgb(94, 177, 163)
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
        let border = rgb(94, 177, 163)
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
        let border = rgb(94, 177, 163)
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
        let border = rgb(94, 177, 163)
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




