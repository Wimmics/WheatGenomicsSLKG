# WheatGenomicsSLKG

The **Wheat Genomics Scientific Literature Knowledge Graph** (WheatGenomicsSLKG) is a FAIR knowledge graph that exploits the Semantic Web technologies to integrate information about Named Entities (NE) extracted automatically from a corpus of PubMed scientific articles on wheat genetics and genomics.

In this corpus we extract Named Entities of types **genes**, **phenotypes**, **taxon names** and **varieties** mentioned in the title and the abstract of the publications, and the relationships between wheat mentions of varieties and phenotypes.

The figure below illustrates an example of PubMed publication where three types of NEs are recognised: genes (e.g., __Sr2__, __Lr27__, __Lr34__), phenotypes (e.g., __leaf rust resistance__, __resistance to stem rust__, __powdery mildew resistance__) and taxon name (e.g., __wheat__). 

<p align="center">
  <img src="Sample-NER.jpg" width="650" title="Example of NE recognition and linking in a PubMed publication" alt="Gene, phenotype and taxon named entities recognized and in a PubMed publication">
</p>


## Semantic Data Model 

Mentions of phenotype and taxon are linked to existing entities defined respectively in the [Wheat Trait and Phenotype Ontology OWL/SKOS](https://doi.org/10.57745/TAQQFZ) (WTO) and [NCBI taxonomy](https://www.ncbi.nlm.nih.gov/taxonomy).

The core part of the **WheatGenomicsSLKG** data model is based on the [W3C Web Annotation Ontology (OA)](https://www.w3.org/ns/oa)  which has been complemented with different vocabularies to describe documents metadata: 


|Vocabulary | Prefix  | URI |
|--------------| ------------- | ------------- |
|Bibliographic Ontology (BIBO) | bibo | http://purl.org/ontology/bibo/  |
|FaBiO (FRBR-aligned Bibliographic Ontology) | fabio | http://purl.org/spar/fabio/ |
|Dublin Core Elements | dce | http://purl.org/dc/elements/1.1/ |
|Dublin Core Terms | dct | http://purl.org/dc/terms/ |
|Schema.org | schema | http://schema.org/ |
|Web Annotation Vocabulary | oa  | https://www.w3.org/TR/annotation-vocab/  |


## Wheat Trait and Phenotype Ontology

The [Wheat Trait and Phenotype Ontology OWL/SKOS](https://doi.org/10.57745/TAQQFZ) is the RDF representation of the previously defined [Wheat Trait and Phenotype Ontology](https://doi.org/10.15454/1.4382637738008071E12) using OWL and SKOS. It is an ontology of wheat traits and environmental factors that affect these traits. They include resistance to disease, development, nutrition, bread quality, etc. Environmental factors include biotic and abiotic factors.

The files of WTO are also provided in this repository, in folder [dataset/WTO-v3.1](dataset/WTO-v3.1).


## Generation Pipeline

First, we use a [SPARQL micro-service](https://github.com/frmichel/sparql-micro-services.org/tree/main/pubmed/getArticleByPMId_sd) to query Pubmed's Web API and translate the articles' metadata (including the title and abstract) into RDF. 
In some cases, the abstract of a publication is split in sub-sections.
The SPARQL micro-service is currently deployed publicly at [this URL](https://sparql-micro-services.org/service/pubmed/getArticleByPMId_sd/).

In parallel, the [AlvisNLP](https://github.com/Bibliome/alvisnlp) tool is used to extract and link the named entities mentioned in the titles and abstracts. The output consists of [CSV files](alvisNLP-output) that must be translated to RDF.

The translation in RDF of CSV files is carried out using [Morph-xR2RML](https://github.com/frmichel/morph-xr2rml/), an implementation of the [xR2RML mapping language](http://i3s.unice.fr/~fmichel/xr2rml_specification.html) for MongoDB databases.
The mapping files are provided in directory [mapping-rules](mapping-rules).



## License

The code used to produce the knowledge graph is licensed under the [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).

The RDF data files produced by the code are made available under the terms of the [Open Data Commons Attribution License v1.0](https://opendatacommons.org/licenses/by/1-0/) (ODC-By-1.0) license.
