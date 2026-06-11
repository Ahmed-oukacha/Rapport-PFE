#import "../../components.typ": *

#frontmatter-page(
  [Abstract],
  [
   The emergence of Advanced Driver Assistance Systems *ADAS* poses a major challenge:

the increasing complexity of verification and audit processes.

Requirements analysis, test plan design, and test scenario creation are essential but time-consuming tasks in engineering. This is precisely where this final-year project comes in.

  #v(0.6em)

  The goal is to design an intelligent platform, based on an *agentic AI* approach, to assist *ADAS* engineers. Our solution coordinates the work of several specialized agents that collaborate to analyze specifications, structure data, and produce consistent and traceable test cases.

  #v(0.6em)

The architecture leverages the power of large language models *LLMs* and uses the *LangGraph* framework to orchestrate interactions between agents. A human-in-the-loop approach ensures that the expert remains the final decision-maker.

  #v(0.6em)

  From a technical standpoint, the solution is based on *FastAPI* and *Docker*, with a monitoring system based on *Grafana* to ensure performance and reliability.

  #v(0.6em)

  The results show that integrating artificial intelligence with *human supervision *significantly improves productivity while ensuring reliable and standardized testing.

    #keywords-box(
      [Keywords],
      [
        [Agentic AI],
  [ADAS],
  [Large Language Models],
  [LangGraph],
  [Human-in-the-Loop],
  [Agent Memory],
  [Test Plan Generation],
  [Test Case Generation],
  [FastAPI],
  [Docker],
  [Grafana],
      ],
    )
  ],
)