#import "../components.typ": *

#set page(header: report-header, footer: report-footer)

#v(1.2cm)

#set text(
  font: "Times New Roman",

)

// Titre simple comme dans l'exemple
#align(left)[
  #text(
    size: 20pt,
    weight: "bold",
    fill: rgb("#111827"),
  )[Conclusion générale et perspectives]
]

#v(0.45cm)

// Ligne orange
#line(
  length: 100%,
  stroke: 2pt + rgb("#E87722"),
)

#v(0.75cm)

#set par(
  justify: true,
  leading: 1.15em,
  
)
#text(size: 15pt,
    weight: "bold",)[Bilan du travail réalisé]

Ce projet de fin d’études s’est inscrit dans un contexte industriel précis : l’équipe SDA (System
Design & Analysis) de Capgemini Engineering fait face à un volume croissant de documents
d’exigences ADAS à traiter manuellement, chaque cas de test nécessitant en moyenne 10 à 20
minutes de rédaction. Ce goulot d’étranglement freinait la couverture des systèmes critiques tels
que l’ACC, l’AEB et le LKA, et exposait les projets à des risques de couverture incomplète.
Pour répondre à cette problématique, la plateforme ADAS R2T a été conçue, développée et
livrée : une plateforme agentique full-stack conteneurisée via Docker, déployée sur un serveur
privé virtuel (VPS) pour le développement et l’évaluation par l’équipe SDA. L’application
intègre un pipeline LangGraph à 25 nœuds et un frontend Next.js accessible aux ingénieurs de
l’équipe. Le pipeline orchestre quatre étapes logiques  ingestion, analyse parallèle, génération
et évaluation avec trois étages de fan-out via la fonction Send(), six routes conditionnelles
et une boucle HITL (Human-in-the-Loop) permettant à l’utilisateur de corriger les cas de
test avant validation finale. Les checkpoints LangGraph sont chiffrés en AES-256-CBC pour
garantir la confidentialité des données d’exigences stockées. La résilience du pipeline repose
sur une stratégie de retry avec backoff exponentiel  implémentée via tenacity  qui neutralise
les erreurs transitoires des fournisseurs LLM. L’observabilité est assurée en double couche :
Langfuse trace chaque appel LLM avec ses tokens et sa latence; Prometheus et Grafana
collectent les métriques système et API en temps réel.
La plateforme fullstack expose une interface structurée en sept états de progression,
une bibliothèque de projets sur trois niveaux hiérarchiques, un assistant conversationnel
contextualisé sur les exigences actives et un tableau d’administration des comptes. L’ensemble
du système a été réalisé selon une approche Agile MVP en trois itérations successives : MVP1
(prototype pipeline), MVP2 (intégration fullstack M2M), MVP3-5 (déploiement, HITL, qualité
et observabilité).

#pagebreak()
#text(size: 15pt,
    weight: "bold",)[Bilan des résultats et limites de la solution]

Les mesures réalisées en conditions réelles sur la plateforme ADAS R2T montrent un temps de
génération moyen de l’ordre de 8 secondes par cas de test (en parallèle), contre 10 à 20 minutes
de rédaction manuelle (médiane de 15 minutes) par un ingénieur V&V. Chaque exigence produit
par défaut au moins trois cas de test : un scénario nominal, un cas limite et un cas négatif; des
variantes rares et des scénarios de mutation SOTIF s’y ajoutent lorsque la nature de l’exigence
le justifie. Le taux d’acceptation initial sans modification par l’équipe de validation est passé de
52 % au stade MVP1 à 71 % au stade final MVP3.
La qualité des sorties est contrôlée par une double validation : huit vérifications basées sur des
règles métier complétées par un pipeline d’évaluation sémantique validant la conformité par
rapport à des exigences de référence (golden cases).
Toutefois, la solution présente certaines limites de portée :
• Dépendance aux formats tabulaires (Excel) : Le nœud d’ingestion est conçu pour traiter
des classeurs Excel contenant les spécifications d’exigences. L’intégration directe avec
des outils d’ingénierie système ALM (comme IBM DOORS ou Polarion via API) n’est
pas encore implémentée et constitue une frontière physique du système.

- Limite au niveau de spécification textuelle : La plateforme se focalise sur la génération
de cas de test au format structuré P/A/E (langage naturel). La traduction de ces étapes
textuelles en scripts exécutables ou en scénarios de simulation physique (comme
OpenSCENARIO pour CARLA ou Simulink) est hors du périmètre de la solution.
- Validation humaine des scénarios complexes : L’alignement sémantique des cas de test
issus d’exigences hautement variables s’appuie sur la boucle de validation interactive
(HITL). L’expertise de l’ingénieur reste requise pour évaluer et ajuster les cas limites
ou les transitions physiques particulièrement complexes.
#pagebreak()
#text(size: 15pt,
    weight: "bold",)[Bilan personnel et difficultés rencontrées]

Bilan personnel et difficultés rencontrées
Ce stage de six mois au sein de l’équipe SDA de Capgemini Engineering a constitué
une opportunité d’immersion particulièrement enrichissante dans le secteur de l’ingénierie
automobile. En tant qu’étudiant en ingénierie de l’intelligence artificielle, ce projet a permis de
découvrir et d’assimiler les concepts des systèmes d’aide à la conduite (ADAS), de l’ingénierie
système et des démarches basées sur les modèles (MBSE). Il a été possible d’appréhender
comment transposer et appliquer les compétences en IA aux exigences de sécurité fonctionnelle
automobile.
\
\
La principale difficulté a résidé dans l’assimilation rapide des normes, acronymes et contraintes
propres à l’automobile (tels que le formatage des signaux d’interface et les contraintes de
temporisation). Surmonter ce fossé thématique entre la théorie de l’intelligence artificielle
et l’ingénierie ADAS a représenté une courbe d’apprentissage exigeante mais extrêmement
formatrice, consolidant la capacité d’adaptation et d’écoute active des besoins métiers.
Au-delà de ces aspects, ce projet a permis de travailler en étroite collaboration avec des
ingénieurs de validation V&V et des architectes systèmes.
Adapter les livrables à des retours
d’usage opérationnels et argumenter les choix de conception lors des revues de projet ont
développé les compétences en communication technique et en gestion de projet de bout en
bout, de l’analyse des besoins à la livraison d’un système documenté.
\
\
#text(size: 15pt,
    weight: "bold",)[Perspectives]

La plateforme ADAS R2T constitue une base fonctionnelle que plusieurs axes d’évolution
peuvent enrichir.
Extension aux normes connexes. Le pipeline est aujourd’hui centré sur les exigences ADAS
au format Excel. Son architecture modulaire permet d’envisager une extension aux formats
DO-178C (avionique), ISO 21434 (cybersécurité automobile) et SOTIF (ISO 21448), en
adaptant les gabarits de prompts et les schémas Pydantic de sortie. Une telle généralisation
ouvrirait la plateforme à d’autres équipes de la direction AIS.
Constitution d’un corpus d’évaluation. Les sessions de génération en production accumulent
des paires (exigence, cas de test validé) qui constituent une ressource d’entraînement précieuse.

La constitution d’un corpus annoté permettrait de fine-tuner un modèle de fondation plus léger
sur les formats P/A/E spécifiques à Capgemini Engineering, réduisant ainsi la dépendance aux
API tierces et le coût par génération.
\
\
- Nouvelles modalités ADAS. Les exigences de type radar, LiDAR et fusion de capteurs posent
des contraintes différentes de celles des systèmes caméra. Un module de génération dédié aux
exigences multimodales, s’appuyant sur les résultats du module d’analyse vidéo déjà intégré à
la plateforme, renforcerait la couverture des systèmes ADAS de niveau SAE 3 et supérieur.
\
\
- Génération de cas de test exécutables en simulation. Une perspective clé pour le passage à
l’échelle industrielle consiste à interfacer ADAS R2T avec les environnements de simulation
physique.
 L’objectif est de traduire automatiquement les cas de test générés (au format
structuré Pydantic/JSON) en scripts d’exécution et en scénarios dynamiques exploitables
directement sous MATLAB/Simulink ou dans le simulateur open-source CARLA. Cette
passerelle automatiserait complètement le cycle de validation, reliant la génération agentique à
l’exécution en simulation HIL/SIL