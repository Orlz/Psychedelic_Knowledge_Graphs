# Co-reference Resolution 

Co-reference resolution searches for pronouns used in text and matches them to the the entity to which they belong. It then replaces them with the entity name, to make the text more readable for a machine. This is a way of handling problems such as 'his', 'hers', or 'its' within text which a machine can struggle to work with. In scientific papers, conference resoltuion is a tricky task as the entities are often abstract concepts such as gene names or neural correlates. Often, such as in the case here, we have to use co-reference packages that are intended for data much different than scientific journal papers, which means the results are somewhat patchy. Nevertheless, it is an important step for disentangling long sentences so that hey can be meaningfully broken into smaller chunks. 

Here, the neuralcoref package was used which is build upon the Spacy framework. A small library of typical psychedelic relevant terms were defined in advance to improve the packages ability to work with the text and then passed through the pipeline. This is commented in the attached notebook above. 

#### Example of co-referenced sentence 

<div align="center"><img src="https://github.com/Orlz/Psychedelic_Knowledge_Graphs/blob/master/5_script_for_future_research/Readme_images/coref.png"/></div>
