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
      fill: rgb("#58acb97a"),
      inset: 6pt,
    )[
      #align(center)[
        #text(
          size: 16pt,
          weight: "bold",
          fill: white,
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
      fill: rgb("#e3dceb"),
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
      fill: rgb("#784ba0"),
      inset: 6pt,
    )[
      #align(center)[
        #text(
          size: 16pt,
          weight: "bold",
          fill: white,
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
      fill: rgb("#304a77"),
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
      fill: rgb("#ebdcdc"),
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
      fill: rgb("#a04b4bd0"),
      inset: 6pt,
    )[
      #align(center)[
        #text(
          size: 16pt,
          weight: "bold",
          fill: white,
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
      fill: rgb("#55222c"),
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
      fill: rgb("#ebeccc"),
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
      fill: rgb("#a09d4bd0"),
      inset: 6pt,
    )[
      #align(center)[
        #text(
          size: 16pt,
          weight: "bold",
          fill: white,
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
      fill: rgb("#3f3f1a"),
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
      fill: rgb("#d9ece0"),
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
      fill: rgb("#4fa04bd0"),
      inset: 6pt,
    )[
      #align(center)[
        #text(
          size: 16pt,
          weight: "bold",
          fill: white,
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
      fill: rgb("#1a3f28"),
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
        let navy = rgb(116, 145, 149)
        let border = rgb("#374151")
        let header-blue = rgb(153, 217, 244)
        let task-orange = rgb("#FFC247")
        let green = rgb("#72C95F")
        let yellow = rgb("#FFF000")
        let gray = rgb("#A8A8A8")
        let white = rgb("#FFFFFF")
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
          (-0.45, -0.75),
          (chart-w + 0.45, chart-h + 0.45),
          fill: navy,
          stroke: none,
          radius: 0.18,
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

        badge(0.65, 8.85, 2.5, 0.85, [TaCsk], task-orange)

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
            radius: 0.13,
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
          [MVP 5],
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
        rect(
          (2.3, -0.45),
          (chart-w - 2.3, 0.05),
          fill: navy,
          stroke: none,
          radius: 0.08,
        )

        rect((3.0, -0.32), (3.35, -0.10), fill: green, stroke: none, radius: 0.04)
        content((3.55, -0.20), anchor: "west", [
          #text(size: 5.7pt, fill: white)[Terminé]
        ])

        rect((5.0, -0.32), (5.35, -0.10), fill: yellow, stroke: none, radius: 0.04)
        content((5.55, -0.20), anchor: "west", [
          #text(size: 5.7pt, fill: white)[En cours]
        ])

        rect((7.2, -0.32), (7.55, -0.10), fill: gray, stroke: none, radius: 0.04)
        content((7.75, -0.20), anchor: "west", [
          #text(size: 5.7pt, fill: white)[Non démarré]
        ])

       
      })
    ]
  ],
  caption: [Planification globale du projet],
)