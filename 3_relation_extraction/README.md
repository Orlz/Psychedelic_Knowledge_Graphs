# Relation Extraction 

The third step in our pipeline seeks to semantically understand the unstructured text, working on the principle that it is not enough to recognise the entities, but we need to know how they are related to one another. To do this, a model needs trained on the relationships between entities, whereby it learns how to predict the relation (r) between a given pair of entities (e1, e2). Relation extraction models are essentially classifiers, where they assign probabilities to each possible relation between a pair of nodes by stacking  a linear classification layer on top of a BERT model trained on the relation statements. The final output is the relation with the highest probability. 

Relation extraction is an area of NLP where much attention is still needed, because the models are hard to generalise and do not achieve accuracy at the same impressive levels as other tasks, such as question answering. However, this is also because they are dealing with an incredidibly difficult task where they must learn how entities behave together in a vast array of contexts and between many different writing styles. In this project, the model was trying to decipher the relation between psychedelic entities and determine if the relation fell into any of the below 5 relations: 


```
 Relation                     | Other Street art                 
 --------------------------    | --------------------             
 Positively Impacts            | Can be thought of as a ‘benefit’, linking entities which have a beneficial relationship               
 Negatively Impacts            | Can be thought of as a ‘risk’, linking entities which have a detrimental relationship                
 No Relationship Found Between | Identifies areas of research which have been explored and found no link or relationship between the two entities
 Needs More Research Between   | Identifies areas of research that have ambiguous results or that the authors claim future studies should focus on
 Thought to Cause              | Identifies causal relationships, whereby entities are linked by the authors claiming one influences the other,        
```

Already we can see this will be difficult for the model to learn, because there is more than just 2 labels and the relations are not simple such as family relations ('mother of', 'cousin'), or corporate relations ('owned by', 'CEO of'). This is an area of design critique, where perhaps building a more simple model first which only handles benefits and risks and then building upon this would have allowed the model to learn the relations more easily. Nevertheless, we build tools to fit our needs and so it was decided to see how well a model could manage such complex relations. 

The data was again annotated within [UBIAI](https://ubiai.tools/about) using the same data as in the named entitiy recognition, with 40% of the dicsussions and all the conclusion sections annotated. These were split into 3 datasets, train (70%), development (20%), and test (10%) which could be fed into the model to be trained. The texts were first passed through the converter.py script, which took the annotated json files and transformed them into the necessary binary spacy files. Spacy's new ```project``` feature was then used to provide a base for the relation extraction project. More information about the SpaCy project feature can be found [here](https://spacy.io/usage/projects) while the relation extraction repository can be found [here](https://github.com/explosion/projects/tree/v3/tutorials/rel_component). The key information to note is that the ```project.yml``` file is used to initiate the workflows and connect the data paths. The ```rel_trf.cfg``` configuration file is then used to define the model (_SciBERT_ and _RoBERTa_)and ammend any parameters necessary for the project. This included reducing the max-length allowed between entities and allocating the batch size. Using the project with a hugging face transformer model in this way requires the use of a GPU, and so again Google Colab was used to run the relation extraction model. The notebook for this can be found [here](https://colab.research.google.com/drive/1rywzDQfhv9dG2PEFvjl1OrklF3txpMB8?usp=sharing). 

## Results 

The transformer relation extraction model, unsurprisingly, struggled to classify the relations well between the entities. It did however perform better than a more simple tok2vec model, producing the following results: 


| Model | Precision | Recall | F1 score | 
|--------|:-----------|:-----------|:-----------|
RoBERTa| 0.37 | 0.35 | 0.36 
SciBERT | 0.42 | 0.38 | 0.40
tok2vec | 0.24 | 0.15 | 0.19 

## Brief Discussion 

The poor accuracy of the relation extraction models can be attributed to 2 key things. Firstly, the model is trained on imperfect entities, where the best models were only able to achieve an accuracy of around 64%. Therefore, if a key component of the relation extraction process, or the 'bones' as we referred to them before, are imperfect then we can extect these weaknesses will follow through to the next stage of the pipeline. It's almost like a muscle trying to work with a broken bone. Secondly, the relations themselves are complex and not so easily defined. Inconsistency exists among them by nature, such as a relation between the entity ```LSD``` sometimes having a relationship with the entity ```Depression``` as ```Positively Impacts``` and sometimes having a relationship as ```Negatively Impacts```. Overcoming this problem would need more labelled data to tran the model on, and more clearly defined relations. It could be that a 'benefits' and 'risks' approach is not yet appropriate to the psychedelic research context. Nevertheless, we can still take insights from these results, though they are disappointing, in showing that we need to develop our tools further and perhaps also that the field of psychedelic research has many areas where further research is needed to better figure out the relations within the science itself. 
