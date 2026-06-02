// #import "../components.typ": *



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
//     fill: rgb("#70b2ca46"),
//   )
// ]




// #frontmatter-banner("Bibliographie")

// Texte provisoire.


// #pagebreak()

#import "../components.typ": *

#set page(header: [])

#place(
  top + left,
  dx: -2.2cm,
  dy: -2cm,
)[
  #rect(
    width: 1cm,
    height: 120%,
    fill: rgb("#70b2ca46"),
  )
]

#frontmatter-banner("Bibliographie")

#v(0.5cm)

#set par(first-line-indent: 0pt)
#set text(size: 10.5pt)

#let bib-entry(number, content) = block(
  inset: (left: 2em, bottom: 8pt),
)[
  #text(weight: "bold", fill: rgb("#2563EB"))[\[#number\]] #content
]

#bib-entry(1)[
  Anthropic. _Building effective agents._ Blog technique, 2024. Disponible sur : https://www.anthropic.com/research/building-effective-agents. Consulté le 25/03/2026.
]

#bib-entry(2)[
  LangChain Inc. _LangGraph Documentation._ 2024-2026. Disponible sur : https://langchain-ai.github.io/langgraph/. Consulté le 20/03/2026.
]

#bib-entry(3)[
  OpenAI. _GPT-4o Technical Report._ 2024. Disponible sur : https://openai.com/index/gpt-4o-system-card/. Consulté le 15/03/2026.
]

#bib-entry(4)[
  ISO 26262:2018. _Road vehicles — Functional safety._ International Organization for Standardization, 2018.
]

#bib-entry(5)[
  S. Yao, J. Zhao, D. Yu et al. _ReAct: Synergizing Reasoning and Acting in Language Models._ arXiv:2210.03629, 2022.
]

#bib-entry(6)[
  P. Lewis, E. Perez, A. Piktus et al. _Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks._ NeurIPS, 2020.
]

#bib-entry(7)[
  J. Wei, X. Wang, D. Schuurmans et al. _Chain-of-Thought Prompting Elicits Reasoning in Large Language Models._ NeurIPS, 2022.
]

#bib-entry(8)[
  T. B. Brown, B. Mann, N. Ryder et al. _Language Models are Few-Shot Learners._ NeurIPS, 2020. (GPT-3)
]

#bib-entry(9)[
  A. Vaswani, N. Shazeer, N. Parmar et al. _Attention Is All You Need._ NeurIPS, 2017. (Architecture Transformer)
]

#bib-entry(10)[
  S. Timofte, S. Hendel. _Automated Test Case Generation using Large Language Models: A Survey._ arXiv, 2024.
]

#bib-entry(11)[
  European Commission. _Regulation (EU) 2019/2144 — General Safety Regulation for motor vehicles._ Official Journal of the European Union, 2019.
]

#bib-entry(12)[
  SAE International. _SAE J3016 — Taxonomy and Definitions for Terms Related to Driving Automation Systems._ 2021.
]

#bib-entry(13)[
  FastAPI Documentation. _FastAPI — Modern web APIs with Python._ Disponible sur : https://fastapi.tiangolo.com/. Consulté le 10/03/2026.
]

#bib-entry(14)[
  Pydantic Documentation. _Pydantic v2 — Data validation using Python type annotations._ Disponible sur : https://docs.pydantic.dev/. Consulté le 10/03/2026.
]

#pagebreak()
