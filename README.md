# Psychedelic Knowledge Graphs
-----


<div align="center"><img src="https://github.com/Orlz/Psychedelic_Knowledge_Graphs/blob/master/5_script_for_future_research/Readme_images/psychedelic.png" width="120" height="120" /></div>

This repository builds an information extraction pipeline for the top cited psychedelic research articles to date. It gathers articles in their raw form  and passes the discussion and conclusion sections through a 4-step pipeline to extract meaningful insights from the masses of information held within. Namely, it looks for the benefits and risks associated with psychedelic research, and identifies areas where more research is needed. While the project choses to focus on the micro-field of psychedelic research, it is hoped that the reader can see the potential of generalising such pipelines to other niche fields of research. This is because pipelines of this nature, if developed further, could play a significant role in the future of science communication and journalism, as they have the ability to map entities and the relations between them across a broad range of topics and from various sources of information. For a controversial field such as psychedelic research, this could be valuable for visualising how the science world interprets the research and how that is then relayed to the public through thte media.

In essence, information extraction could build a bridge between the world of science and the media, whereby media reports could be visually compared to scientific reports to see if there is misalignment between the two. Misalignment may indicate that there is mis-reporting of the scientific information within, leading to false ideas circulating within the public. This is always a cause for concern and could be avoided by using Natural Language Processing (NLP) tools effectively. Therefore, this project was interested in testing one side of this bridge, the scintific reports by means of published research articles. It seeks to investigate whether our NLP tools can bring new insights to the field of psychedelic research or whether more work is needed to hone the tools towards this niche and interdisciplinary field. 

The project starts with a PRISMA data collection which identifies the top cited research articles in the domain of psychedelic research for depression. From this search, it extracts the discussion and conclusion sections of the selected articles and passes them through the 4-step pipeline outlined below:  

<div align="center"><img src="https://github.com/Orlz/Psychedelic_Knowledge_Graphs/blob/master/5_script_for_future_research/Readme_images/pipeline.png" width="600" height="170" /></div>


## Repository Folders

The repository has been split into folders which hold the code and data used in each step of the pipeline.

```
 Step                       | Folder Name                 
 -------------------------- | --------------------             
 Data Collection            | 0_data_collection              
 Co-reference Resolution    | 1_coreference_resolution                 
 Named Entity Recognition   | 2_named_entity_recognition                  
 Relation Extraction        | 3_relation_extraction           
 Knowledge Graphs           | 4_knowledge_graphs 
 Further Research           | 5_scripts_for_future_research      
```

_Each step of the pipeline is detailed with more information in their individual README pages._ 

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

## Future steps for the project 

The project above can be seen as a stepping stone to the next step, which would be to firstly develop a more efficient way to annotate the scientific articles, then generalise the notebooks into python scripts with parameter options for adapting them to individual projects. Secondly, media articles could be collected which were thought to be written in response to the publication of the scientific articles. This could be achieved by searching for publications mentioning psychedelic research and either the author name or institution from which the research was published. The media articles could then be run through the same pipeline to create comparable graphs, and visual inspection between the media graphs and scientific graphs could perhaps highlight areas of misalignment or inconsistency between the two medium's 'stories'. As more fields close to psychedelic research produced labelled data of high quality, the models trained to work with the data could improve to make results more reliable. For now, we will start with preliminary steps to build models and consider what such models need to be considered valuable to the field of psychedelic research. 

I hope you enjoyed the project. If you have any questions, you can always reach out to orla.mallon@icloud.com
