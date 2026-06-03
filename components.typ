#import "@preview/colorful-boxes:1.4.1": colorbox

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
    fill: rgb("#F6FBFA"),
    stroke: (left: 2.5pt + rgb("#5EB1A3")),
    radius: 2pt,
  )[
    #text(size: 11pt, weight: "bold", fill: rgb("#306C77"))[
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
      fill: rgb("#DCEBE8"),
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
      fill: rgb("#58acb9"),
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
        #text(
          font: "Times New Roman",
          size: 11pt,
          weight: "bold",
          fill: black,
        )[Signification]
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

  






