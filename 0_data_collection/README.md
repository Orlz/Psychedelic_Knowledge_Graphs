# Collection of Top Cited Psychedelic Research Articles

This folder contains the raw text files and meta-data collected by conducting a PRISMA data collection on the Web of Science (Clarivate Analytics, 2021). Articles were identified by firstly conducing a keyword search using the terms listed in box 1, then secondly, applying an additional filter to ensure all articles also contained the word 'depression' in either the abstract, title, or keywords of the publication. The articles were then ranked according to their total number of citations (TNC) or their annual citation rate (ACR), as calculated by Web of Science. The title's and abstracts of all articles were screened to ensure they met the includion critera, and then a full manuscript screening was conducted. The top 75 artiles were collected in descending order from each of the TNC and the ACR to collect 2 cohorts of 75 articles, which were combined with duplicates removed to create a final cohort of 84 research articles. This process is outlined in figure 1. 


### Psychedelic Search Terms (Topic Search Conducted)

```
((TS=(“classic* psychedelic*” OR “psychedelic*” OR “hallucinogen*” OR “psilocybin” OR “psilocin” OR “magic mushroom*” OR “lysergic acid diethylamide” OR “LSD” OR “dimethyltryptamine” OR “DMT” OR “5-MeO-DMT” OR “Ayahuasca” OR “mescaline” OR “peyote.”))  NOT ALL=("marijuana" OR "Cannabis")NOT TS=("dance movement therapy" OR MDMA OR ADHD OR "Marine sponges" OR "Multiple Sclerosis"OR "peptide-based opioid" OR "comorbid cyclothymia" OR "mu-delta opioid receptor heteromer" OR "low sexual desire in men" OR "Acidithiobacillus ferroxidans" OR "Camellia sinensis" OR "disease-modifying therapies"))

```
Box 1: Demonstrating the psychedelic search terms used in Web of Science. 

### The Collection Process 

<div align="center"><img src="https://github.com/Orlz/Psychedelic_knowledge_graphs.git/0_data_collection/Flowchart.png"/></div>

Figure 1: The PRISMA data collection process 


## Scraping Articles 

Once the article metadata had been collected from the Web of Science, the pubmed id's contained in this were used to pull further information regarding the articles using the Entrez API. The Entrez package is good for getting abstracts and more detailed liscencing information, but it doesn't cope well with retrieving the full body text which we need here. Thus we can employ the requests package to gather the information from the page, due to PubMed central's Open Access HTML scraper ablities. You can read more about these here: https://www.ncbi.nlm.nih.gov/research/bionlp/APIs/BioC-PMC/. The API allowed us to extract the data in dictionary format saved in the json package. From here it was parsed to extract any parts which contained the following keys, '{'section_type': 'DISCUSSION', 'type': 'paragraph'}' or '{'section_type': 'CONCLUSION', 'type': 'paragraph'}'. This process was complicated by the API failing to pull all articles (40%), and further by the irrregular structure of research articles, meaning the data needed to be manually checked and filled in where the API could not. <br> 

The final textual data used is collected into the file named ```Final_cohort_texts.csv``` found in the ```raw_text_files``` folder. 



