# MS-Project-March-2024

### *Anastasia Lvovna Rizzo, MSc in Artificial Intelligence, University of Essex.*

### Project Description.

#### Project Title.
    
“Exploring Early Detection and Prediction of Alzheimer's Disease Markers and Risk
Factors in Genetically Predisposed Individuals Using a Multimodal Machine Learning
Model”.

#### Research Question.

To what extent can multimodal machine learning frameworks, integrating diverse data modalities such as neuroimaging, genetic markers, psychometric assessments, demographic information, and health records, improve the early identification of biomarkers and risk factors associated with Alzheimer's disease in genetically predisposed individuals, while also classifying them into risk groups for developing the disease in the future?

#### Aims and Objectives. 

##### Research Aim.

To develop and optimise a multimodal machine learning model capable of identifying
relationships between early markers and risk factors associated with AD, as well as
classifying participants by their level of risk of developing AD in the future.

##### Research Objectives. 

● Objective 1: To identify novel insights and potential biomarkers for AD through the analysis
of multimodal data integration and machine learning predictions.

● Objective 2: To interpret and analyse the contributions of different data modalities in the
prediction of AD markers and risk factors.

● Objective 3: To evaluate the performance of the developed multimodal machine learning model in classifying Alzheimer's disease (AD) risk groups in a focus group of cognitively healthy, genetically predisposed individuals under the age of 65 using independent test datasets.

##### Task.

This task addresses a **multiclass classification** problem aimed at categorizing participants into distinct risk groups. These groups not only capture the participants' current status regarding Alzheimer's disease but also predict their future risk of developing the condition. By leveraging diverse data modalities, the classification provides critical insights into both the present and potential progression of Alzheimer's disease.

### Hypotheses.

#### Hypotheses 1:

* **Null Hypothesis (H0):** "Newly identified potential quantitative brain structure biomarkers will not have a significant impact on cognitive function features."

* **Alternative Hypothesis (H1):** "Newly identified potential quantitative brain structure biomarkers will have a significant impact on cognitive function features."


#### Hypotheses 2:

* **Null Hypothesis (H0)**: "Newly identified potential quantitative brain structure biomarkers will not significantly enhance their contribution to the prediction of Alzheimer's disease markers and risk factors."

* **Alternative Hypothesis (H1)**: "Newly identified potential quantitative brain structure biomarkers will enhance their contribution to the prediction of Alzheimer's disease markers and risk factors."

  ### Dataset Description:

This study was conducted using data provided by the **National Alzheimer’s Coordinating Center (NACC)** (https://naccdata.org/requesting-data/nacc-data). Access to the datasets was granted following an official data request.

The datasets utilized in this research include:

- The **Uniform Data Set** (uds3-rdd), which serves as the primary resource for researchers analyzing NACC clinical and demographic data (https://files.alz.washington.edu/documentation/uds3-rdd.pdf).
  
- **Genetic Data** (rdd-genetic-data), which includes information such as APOE genotype and the availability of other genetic data (https://files.alz.washington.edu/documentation/rdd-genetic-data.pdf).
  
- **Heterogeneous Imaging Data** (rdd-imaging), which contains MRI-derived volumes (https://files.alz.washington.edu/documentation/rdd-imaging.pdf).
  
- **MRI image files** were downloaded via the NACC data request process (https://naccdata.org/requesting-data/data-request-process).

  ### Modalities Description.
#### Modality 1 (Mixed modalities data, 40 attributes):
* NACCID
    
__Demographic data:__ BIRTHYR, SEX, EDUC, MARISTAT, NACCLIVS, INDEPEND, HANDED.

__Family History:__ NACCFAM, NACCMOM, NACCDAD.

__Health History:__ SMOKYRS, DIABETES, HYPERTEN, THYROID, ALCOHOL, DEP2YRS, DEPOTHR.

__Physical:__ HEIGHT, WEIGHT, NACCBMI, VISION, HEARING.

__Clinician Diagnosis:__ NACCALZD, NACCALZP, NACCUDSD.

__Genetic data:__ NACCAPOE, NACCNE4S.

__MRI scan date data:__ MRIYR, NACCMRIA.

__Tests:__

*  **CDR® Plus NACC FTLTe** MEMORY, ORIENT, JUDGMENT, COMMUN, HOMEHOBB, PERSCARE, CDRSUM, CDRGLOB.

*  **Neuropsychological battery Summary Scores:** NACCMMSE, NACCMOCA.


#### Modality 2 (Imaging Data, 3 attributes):

* NACCID, WHITEVOL, WMHVOL.

#### Modality 4 (Data extracted from MRI by the author, 3 attributes):

* NACCID, Lesion_Vol, Num_of_Lesions.

**Please note:**

**Modality 3 data** (data extracted from MRI by the author), a set of PNG (Portable Network Graphics) files of brain lesions, is not included in this code but could be utilized for educational purposes and Computer Vision applications.

### Code Description.

The code of Multimodal Machine Learning Model is divided into two distinct phases.

In the **first phase**, data preprocessing, EDA, data transformation, model training, and the generation of predictions from the first modality will be carried out.

In the **second phase**, the Late Fusion process will be implemented. During this phase, predictions from the first modality will be merged with raw data from the second and fourth modalities, resulting in a feature set that represents a comprehensive feature vector, integrating information from all three modalities. Following this, data preprocessing, EDA, data transformation, model training, and the generation of final predictions will be conducted.


### Exploring Early Detection and Prediction of Alzheimer's Disease Markers and Risk Factors in Genetically Predisposed Individuals Using a Multimodal Machine Learning Model

© 2024 Anastasia Lvovna Rizzo. All Rights Reserved.

This code is part of my academic research for the project titled "Exploring Early Detection and Prediction of Alzheimer's Disease Markers and Risk Factors in Genetically Predisposed Individuals Using a Multimodal Machine Learning Model." It is published here for educational and review purposes only. Unauthorized use, distribution, or reproduction of this work, in part or in whole, without explicit permission from the author is prohibited.

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

## Author

**Anastasia Lvovna Rizzo**  
ar22614@essex.ac.uk  
[University of Essex]
