# Fine Tuning a BERT Named Entity Recognition Model 

Named entity recognition is a pivotal step in the extraction pipeline, as it locates all the words and terms (entities) which are deemed of interest to the project and classifies these into pre-defined categories. These entities and their higher-order categories work as a base to the project, upon which all other steps are built. The entities can be thought of as the bones, while the relations explored in the next step are the joints and muscles which bring function to these bones. 


An obstacle which presented in the study of psychedelic research was that the entities of interest were divergent from the typical entity categories such as 'people', 'place' or 'organisation'. This means that popular pipelines and models to extract entities, such as SpaCy, could not be used as they would be unable to locate the entites relevant in this context, such as 'health condition' or 'neural correlate'. For this reason, the articles were hand annotated using the [UBIAI NLP software](https://ubiai.tools/about). 

## Entity Annotation 

The UBIAI software is a suite of annotation tools, developed for the pusposes of creating more labelled data for machine learning and to allow people to customise their own annotated data according to the needs of their project. It provides users with an interface where they can easily annotate entities and identify the relationships between these entities. The greatest challenge in annotating data using such tools is that categories must be predefined in advance, and consistency must be visible through all of the annotated data. The results extracted at the end of the pipeline all depend on the quality of annotations at the beginning. This is a time-consuming process which will never produce perfect results, but does allow us to get closer to a particular field if the pre-trained models available are unable to capture meaning in the given domain. In the case of psychedelic research, pre-trained models fell into the uncomfortable zone where an unspecific model (such as base BERT or base ROBERTA) was unable to capture the scientific nature of the data, while specific models (such as BioBERT or SciBERT) were unable to capture the interdisciplinary nature of psychedelic research alone. 

For these reasons, it was decided to hand-annotate the data into the following 6 categories which could be used to fine tune a BERT model: 

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
 
 ## Fine Tuning 
 
After annotating 40% of the discussion sections and all the conclusion sections of the papers, the data was split into a train (discussions) and test (conclusions) set. It was then used to train 4 separate BERT models in Google Colab's GPU to see which could provide the most accurate results. The differences between the BERT models is mostly related to the data on which they have been trained, so finding a better match is usually due to the data you are working with being more similar to the data on which that BERT model was trained. Here, the four models included 1) RoBERTa base, 2) BioBERT, 3) Bio_Clinical_BERT, and 4) sciBERT. The changing of models was conducted by ammending the ``` NER_spacy_config.cfg``` file, and inserting the selected model name taken from the [hugging face](https://huggingface.co/) library into the ``` [components.transformer.model]``` section. 

Google colab was used to train the model due to its ability to run the models more efficiently in the GPU. The code for this can be followed in the notebook attached or found [here](https://colab.research.google.com/drive/1gsUxCsXPSvPvF6gIyo_LH0A7RBGRmaib?usp=sharing). To run the Notebook in Colab, you will need to activate the GPU by clicking on ```Edit```, then ```Notebook settings``` and change the hardware settings to ```GPU```. Be warned that Google has ambiguous data usage limits and it is likely that they will end your system randomly after you have run the data through 2 models. 

## Results 

Running the data through the 4 BERT models produced accuracy that was lower than expected but still good enough to allow us to move to the next step in our exploratory pipeline. The NER models were able to produce the following results: 

| Model | Training Data | Precision | Recall | F1 score | 
|--------|:-----------|:-----------|:-----------|:-----------|
RoBERTa| Large corpus of English texts | 0.62 | 0.57 | 0.58  
BioBERT | Biomedical abstracts | 0.66 | 0.60 | 0.61
BioClinicalBERT | Clinical notes from intensive care dataset | 0.66 | 0.61 | 0.63
SciBERT | Full research articles scraped from semantic scholar | 0.68 | 0.62 | 0.65 

## Brief Discussion 

The results from our named entity recognition scream to us that the model needs more data. When tested on a few random sentences, the model was able to capture ```Psychedelic Drug``` and ```Health Condition``` well but struggled with the more abstract entites such as ```Outcome``` and ```Neural Correlate```. Unfortunately, obtaining this labelled data would be a time consuming task as many more articles would need to be collected, scraped, annotated, and additionally they would need checked by a professional within the field to ensure the annotative coding was accurate. The annotation of one discussion alone takes around an hour, making this no small task. Nevertheless, with such volumes of data, there is little reason why the BERT model would not be able to learn the entities as well as it can in other domains. 
 
