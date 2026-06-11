#import "../../components.typ": *

#frontmatter-page(
  [Résumé],
  [
  L’émergence des systèmes avancés d'aide à la conduite *(ADAS)* pose un défi majeur : 
  la complexité croissante des processus de vérification et d'audit.

  L'analyse des exigences, la conception des plans de test et la création des scénarios 
  de test sont des tâches essentielles mais chronophages en ingénierie. C'est précisément 
  là qu'intervient ce projet de fin d'études.

  #v(0.6em)

  L'objectif est de concevoir une plateforme intelligente, basée sur une approche 
  de *agentic AI*, pour assister les ingénieurs ADAS. Notre solution coordonne le travail 
  de plusieurs agents spécialisés qui collaborent pour analyser les spécifications, 
  structurer les données et produire des cas de test cohérents et traçables.

  #v(0.6em)

  L'architecture exploite la puissance des grands modèles de langage *LLM* et utilise 
  le framework LangGraph pour orchestrer les interactions entre agents. Une approche 
  *human-in-the-loop* garantit que l'expert reste le décideur final.

  #v(0.6em)

  Sur le plan technique, la solution repose sur *FastAPI* et *Docker*, avec un système de 
  monitoring basé sur *Grafana* pour assurer la performance et la fiabilité.

  #v(0.6em)

  Les résultats montrent que l'intégration de l'intelligence artificielle avec la 
  *supervision humaine* permet d'améliorer significativement la productivité tout en 
  garantissant des tests fiables et standardisés.

    #keywords-box(
      [Mots-clés],
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