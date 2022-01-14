# Psychedelic Knowledge Graphs
-----


<div align="center"><img src="https://github.com/Orlz/Psychedelic_Knowledge_Graphs/blob/master/5_script_for_future_research/Readme_images/psychedelic.png" width="120" height="120" /></div>

This repository builds an information extraction pipeline for the top cited psychedelic research articles to date. Pipelines of this nature could play a significant role in the future of science communication as they have the ability to map entities and the relations between them across a broad range of topics, and from various sources of information. For an interdisciplinary field such as psychedelic research this could be used to identify connections between psychedelic compounds, health conditions, neural correlates and/or outcomes which may help to inspire further research. However more importantly, information extraction could build a brigde between the world of science and the media, whereby media reports could be visually compared to scientific reports to see if there is misalignment between the two. Misalignment could be an indicator that there is mis-reporting of the scientific information within, leading to false ideas circulating within the public. This is always a cause for concern and could be avoided by using Natural Language Processing (NLP) tools effectively. Therefore, this project was interested in testing one side of this bridge, the scintific reports by means of published research articles. It seeks to investigate whether our NLP toold can bring new insights to the field of psychedelic research. 

The project starts with a PRISMA data collection which identifies the top cited research articles in the domain of psychedelic research for depression. The discussion and conclusion sections of the selected articles are scraped and passed through the 4-step pipeline outlined below:  

<div align="center"><img src="https://github.com/Orlz/Psychedelic_Knowledge_Graphs/blob/master/5_script_for_future_research/Readme_images/pipeline.png" width="800" height="250" /></div>

## Repository Folders

The repository has been split into folders which hold the code and data used in each step of the pipeline. 

```
 Step                     | Folder Name                 
 -------------------------- | --------------------             
 Data Collection            | 0_data_collection              
 Co-reference Resolution    | 1_coreference_resolution                 
 Named Entity Recognition   | 2_named_entity_recognition                  
 Relation Extraction        | 3_relation_extraction           
 Knowledge Graphs           | 4_knowledge_graphs 
 Further Research           | 5_scripts_for_future_research      
```

_More detailed information on each of the steps can be found in their individual README pages._ 

## Using the Scripts 

The easiest way to access the scripts is to clone the project repository by navigating into the location where you want the repository to be and using the following code in the terminal:

```
# clone repository to local device 
$ git clone https://github.com/Orlz/Psychedelic_Knowledge_Graphs.git
```

Next, you will need to create a virtual environment to ensure all your package versions are compatible with the codes: 

```
# create Psychedelic_KGs virtual environment 
$ bash create_virtual_environment.sh
```

And then activate the environment by typing:

```
# activate Psychedelic_KGs virtual environment 
$ source Psychedelic_KGs/bin/activate 
```

I hope you enjoy exploring the psychedelic research insights and if you have any questions you can always reach me by email: orla.mallon@icloud.com




