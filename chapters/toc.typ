#import "../components.typ": *

#let toc-side-bar = [
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
]


#toc-side-bar

#frontmatter-banner("Table des matières")

#outline(title: none)
#pagebreak()