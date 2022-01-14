# Named Entity Recognition 

Named entity recognition is a pivotal step in the extraction pipeline, as it locates all the words and terms (entities) which are deemed of interest to the project and classifies these into pre-defined categories. These entities and their higher-order categories work as a base to the project, upon which all other steps are built. The entities can be thought of as the bones, while the relations explored in the next step are the joints and muscles which bring function to these bones. 


An obstacle of this project was that the entities of interest were divergent from the typical entity categories such as 'people', 'place' or 'organisation'. This means that popular pipelines and models to extract entities, such as SpaCy, could not be used as they would be unable to locate the entites of interest. Instead, the articles were hand annotated using the UBIAI NLP software [insert link]. 

## Entity Annotation 

The UBIAI software is a suite of annotation tools, developed for the pusposes of creating more labelled data for machine learning and to allow people to customise their own annotated data according to the needs of their project. It provides users with an interface where they can easily annotate entities and identify the relationships between these entities. The greatest challenge in annotating data using such tools is that categories must be predefined in advance, and consistency must be visible through all of the annotated data. The results extracted at the end of the pipeline all depend on the quality of annotations at the beginning. This is a time-consuming process which will never produce perfect results, but does allow us to get closer to a particular field if the pre-trained models available are unable to capture meaning in the given domain. In the case of psychedelic research, pre-trained models fell into the uncomfortable zone where an unspecific model (such as base BERT or base ROBERTA) was unable to capture the scientific nature of the data, while specific models (such as BioBERT or SciBERT) were unable to capture the interdisciplinary nature of psychedelic research. 

For these reasons, it was decided to hand-annotate the data into the following 6 categories: 

```
 Category                   | Description                 
 -------------------------- | --------------------             
 Antidepressant Drug        | Includes classic antidepressant drugs such as Fluoxetine and references to SSRIs.               
 Health condition           | Includes symptoms and diagnosed conditions such as depression, anxiety, and alcohol abuse disorder                
 Neural Mechanism/Correlate | Includes neural structures such as brain, hippocampus, and amygdala, as well as mechanisms such as functional connectivity
 Outcome                    | Includes references to observed outcomes and effects of the drugs, including phrases such as ‘therapeutic effects'         
 Psychedelic Drug           | Includes the names of psychedelic compounds such as psilocybin, LSD, and ayahuasca 
 Subjective Experience      | Includes mood, cognition, experiences, and states such as ‘ego dissolution’ or ‘psychedelic state’
 ```
 
 
