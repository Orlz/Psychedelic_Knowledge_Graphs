# Construction of the Knowledge Graphs 

The final step of the pipeline took the extracted information and transformed it into something more easily understandable to the human eye, a knowledge graph. As their name suggests, these graphs take 'knowledge' in the form of entities ('nodes') and model the semantic relations between them using 'links' or 'edges'. In their most simple terms, a knowledge graph is a directed labelled graph which models triplets in the form of how _node 'A'_ is related _'B'_ to _node 'C'_, as demonstrated below: 


<div align="center"><img src="https://github.com/Orlz/Psychedelic_Knowledge_Graphs/blob/master/4_Knowledge_Graphs/output/triple.jpeg" width="500" height="250"/></div>

Image Credit: Stanford AI lab [blog](http://ai.stanford.edu/blog/introduction-to-knowledge-graphs)

Knowledge graphs can be used to enrich databases by linking abstract concepts and entities and thereby enhance search and recall performance, and they can also be used to present domain specific information in one coherent place. Here, we took the latter approach and aimed to present how the 'Drug' categories were related to the other entities such as 'Health Conditions', 'Neural Correlates', and 'Outcomes'. The following graphs have been modelled to show the relations between the 3 commonly used drugs in psychedelic research, ayahuasca, LSD, and psilocybin. They are available in the ```output``` folder: 

```
Graphs by Relationship | Description
---------------------- | ------------
Positively_impacts     | Models the entities that have been found to be positively impacted by psychedelic compounds. Can be thought of as 'benefits'. 
Negatively_impacts     | Models the entities that have been found to be negatively impacted by psychedelic compounds. Can be thought of as 'risks'.
Needs_research         | Models the entities between which the papers' authors have recommended more research is needed between. 
Thought_to_cause       | Models the entities which are thought to be caused by the psychedelic compound. Can be thought of as a very lose 'causal' relation.


Graphs by Drug         | Description
---------------------- | ------------
Ayahuasca              | Models all the relations found to be related to the Drug node of Ayahuasca. 
LSD                    | Models all the relations found to be related to the Drug node of LSD.
Psilocybin             | Models all the relations found to be related to the Drug node of Psilocybin.
```

The graphs listed above are representations of the most commonly found relations within the 84 articles collected. They have been produced by firstly passing all 84 articles through the fine-tuned entitiy extraction model to pull the entities from the 6 classes listed in step 2. These entities have then been fed into the relation extraction model created in step 3, to classify 3348 relations between them. These two steps are explained throughout the notebook ```Extracting_KG_information.ipynb``` with particular information being found in line [53]. The following distibutions of relations were extracted from the 84 psychedelic articles: 

```
Relation Type                 | Count
-----------------------------   -------
POSITIVELY IMPACTS            |  2620    
NEGATIVELY IMPACTS            |  55
NEEDS MORE RESEARCH BETWEEN   |  205
NO RELATION FOUND BETWEEEN    |  37
THOUGHT TO CAUSE              |  431
```

From the above, we can see that our relation extraction model is over compensating for positive relations, and is the product of the bias we found through the annotation step whereby authors seemed to be overly positive of their claims. There are 47 times more positive relations found than negative relations. Nevertheless, for the purposes of this project we can continue with the important note that our model is biased and needs trained on more balanced data to achieve results we can depend upon. 

## Neo4j Knowledge Graph Construction 
The knowledge graphs themselves were constructed in a google colab notebook, as this integrates more seamlessly with the neo4j browser. This notebook can be accessed [here](https://colab.research.google.com/drive/1PJDpQqAjoRHcTfZIJRnMuf-Q4adBmjwW?usp=sharing) and is also copied into the directory above. 

Neo4j is an advanced graphing data science tool, which allows for the creation of deeply connected knowledge graphs using its machine learning tool kit. The software integrates with python using a 'Bolt URL', username (often just 'neo4j') and a unique password created when you create a new blank project (known to the langauge as a 'sandbox'). This is available for 10 days since creation and is open to be accessed by using the username 'neo4j' and password 'worksheet-choice-perforation'. Detailed information on this tool is outlined throughout the above mentioned notebook. 

The tool connects to the browser and is then fed the entities extracted from our NER model, with the relations extracted from our relation extraction model, in the form of dictionaries. Labels are used to distinguish between entities and create individual nodes. When the code is passed through python, resulting graphs can be observed in the neo4j browser, and nodes can be pulled and moulded to suit visual preference. Most importantly, as neo4j is fed such a wealth of information, it is able to conduct many data exploration tasks such as returning co-occurances, eigenvector centrality, and searching for the top matches between nodes and relations. This makes the tool versatile for using as a knowledge base. The top 50 co-occurances are saved in the output folder as ```top_50_cooccurances.csv```. 

Here however, the focus was on the visualisation and so the entities were simplified down into base nodes with relations between them. Only triplets which were found at least 3 times were modelled within the graph. First, the relations were the focus of the graph, then second the individual drug was the focus of the graph. There was also the ability to model all entities within one article, however this quickly expanded into a complex network which was hard to conceptualise and so the more simple visualisations were preferred. An example of an article related graph is also included in the output folder as ```Article_KG.png```. It should be noted that the cypher language used to call and construct the graphs determines the visualisation outcome, which is largely based on SQL style. The manual can be found [here](https://neo4j.com/docs/cypher-manual/current/) and can be used to search for an create your own graphs in the sandbox. 

### Knowledge Graph Examples 

Below are 2 knowledge graphs constructed to show the beneficial relations (positively_impacts) and the detrimental or risky relations (negatively_impacts). It should be remembered that these are still the product of our relation extraction pipeline and so are only as good as the models from which they have been construsted from. Therefore, while they are a good first step, there is a long way to go before the world of psychedelic research can depend on the visualisations constructed. They can however point us in new directions and pull together the overall thoughts of many different researchers.  

### Positively Impacts 

<div align="center"><img src="https://github.com/Orlz/Psychedelic_Knowledge_Graphs/blob/master/4_Knowledge_Graphs/output/Positively_impacts.png" width="750" height="500"/></div>

### Negatively Impacts 

<div align="center"><img src="https://github.com/Orlz/Psychedelic_Knowledge_Graphs/blob/master/4_Knowledge_Graphs/output/Negatively_Impacts.png" width="750" height="500"/></div>
