# Virus-Information-Database
Virus Information Relational Database

# Overview

Over the recent years there has been an influx of viruses that have evolved and caused diseases throughouttheplanet.Therefore,thereisaneedtodevelopmethodsorwaystotrackthesediseases and get information from them. In order to this I have implemented a database using SQL.This database keeps a record of 27 different types of viruses and all their related information. Through queries, the researcher/user would be able to find information on particular viruses such as where those viruses originated from, how many vaccines are there for each virus, what is the virus parent virus, what is the virus's length and so on. the user will also be able to delete less important viruses, or update information relating to the viruses too. Below are the system details of the database.

# Entities,Fields,and Data Types

## Variant Entity

| **Attributes** | **DataType** | **Explanation** |
| --- | --- | --- |
| **VariantID** | INT(7) | The VariantID acts as the primary key. It is better for primary keys to be numeric because it takes longer for the database to compare string values than numeric values.Hence if the PK is a numeric value,it can be matched and found faster. TheLength of the Primary key is kept at 7 for identification purposes. For example if it is a primary key for a Variant it starts with 101 but if it a primary key for a transmission it starts with 202. |
| **VariantName** | VARCHAR(40) | There might be some variants with long names and some with short names. Hence, it's better to use a flexible data type like VARCHAR as it will save space. |
| **VirusID** | INT(5) | SameasinVirusTable |
| **GeneID** | INT(7) | SameasinGeneTable |
| **Status** | VARCHAR(10) | The status will be inserted as either "active" or "not-active". If "active" is used, then only 6 characters are needed if "not- active" is used then 10 characters are used. Since we do not know how many characters will be used at which instance its better to use VARCHAR as it is more flexible than CHAR and can saves pace. |
| **Origin** | VARCHAR(40) | Some origin locations may have long names,and some have short so it better to use VARCHAR as it is more flexible. |

**Primary Key:** VariantID

**Foreign Key's:** VirusID,GeneID

## Gene Entity

| **Attributes** | **DataType** | **Explanation** |
| --- | --- | --- |
| **GeneID** | INT(7) | GeneID is a primary key. It is better for primary keys to be numeric as it is faster to match as compared to text. Length explanation is the same with VariantID |
| **GeneType** | VARCHAR(10) | A virus has either DNA or RNA gene and is called a DNA virus or an RNA virus.These genes are further classified as positive single strain or double strain for RNA and DNA. Example of value: "ssRNA(-) ", "dsDNA". As you can seethe length differs for each value therefore it isbetter to useVARCHAR in this case as it is more flexible and saves space. |
| **GeneLength** | INT(11) | Gene lengths can go as high as 11 digits so the best data type to use is INT as the value will be in integers and set it to 11 digits |

**Primary Key:** GeneID

## Virus Entity

| **Attributes** | **DataType** | **Explanation** |
| --- | --- | --- |
| **VirusID** | INT(5) | VirusID is a primary key.It is better for primary keys to be numeric as it is faster to match as compared to text. VirusID pk lengths are shorter, this is also used to identify tables. |
| **VirusName** | VARCHAR(40) | Some viruses have really long names, and some have short names,therefore it is better to use VARCHAR as it is more flexible than CHAR. |
| **Year_Discovered** | INT(4) | Year contains only 4 digits so its better to use INT. |
| **First_Origin** | VARCHAR(40) | Some Origin locations may hav every long names and some would have short names so its better to use VARCHAR over CHAR as it is flexible and will save space.Example of longname:"Democratic Republic Of Congo" |

**Primary Key:** VirusID

## Variant Location Entity

| **Attributes** | **DataType** | **Explanation** |
| --- | --- | --- |
| **VariantID** | INT(7) | Sameas in Variant Table |
| **LocationID** | INT(3) | Same as in Locations table |
| **Climate** | VARCHAR(10) | Climate length is not fixed hence it is better to use VARCHAR as it is more flexible than CHAR. |

**Primary Key:** VariantID,LocationID

**Foreign Key:** VariantID,LocationID

## Location Entity

| **Attributes** | **DataType** | **Explanation** |
| --- | --- | --- |
| **LocationID** | INT(3) | LocationsID is a primary key.It is better for primary keys to be numeric as it is faster to match as compared to text. |
| **CountryName** | VARCHAR(30) | Country Name value length is not fixed as some countries have long names and some countries have short names.Therefore, it is better to use VARCHAR as it is more flexible compared to CHAR. |
| **Population** | INT(11) | Population of countries are numeric as they can be counted.The length is put as 11 because there could be up to a billion people in a country. Example: India has more than a billion citizens. |

**Primary Key:** LocationID

## Variant-Host Entity

| **Attributes** | **DataType** | **Explanation** |
| --- | --- | --- |
| **VariantID** | INT(7) | Same as inVariant Table |
| **HostID** | INT(5) | Same as in Host Table |

**Primary Key:** VariantID,HostID

**Foreign Key:** VariantID,HostID

## Host Entity

| **Attributes** | **DataType** | **Explanation** |
| --- | --- | --- |
| **HostID** | INT(5) | HostID is a primary key. It is better for primary keys to be numeric as it is faster to match as compared to text. |
| **Host_Name** | VARCHAR(15) | The value length of this attribute is not fixed as some values could be long and some short. Therefore, it is better to use VARCHAR instead of CHAR as it is more flexible. |
| **Host_Type** | VARCHAR(15) | Sam eas Host_Name |

**Primary Key:** HostID

## Transmission-Mode Entity

| **Attributes** | **DataType** | **Explanation** |
| --- | --- | --- |
| **VariantD** | INT(7) | Same as in Variant Table |
| **TransmissionID** | INT(6) | Same as in Transmission Table |
| **Risk** | VARCHAR(9) | Risk levels have four type "Very High","High", "Moderate", "Low". Since each of these types are not fixed in length it is better to use varchar for this as it is more flexible than char and would save up more space. |

**Primary Key:** VariantID,TransmissionID

**Foreign Key:** VariantID,TransmissionID

## Transmission Entity

| **Attributes** | **DataType** | **Explanation** |
| --- | --- | --- |
| **TransmissionID** | INT(6) | TransmissionID is a primary key. It is better for primary keysto benumeric asitisfastertomatchascomparedto text. |
| **TransmissionType** | VARCHAR(20) | TransmissionType value would be a text value and could have various lengths hence the data type used should be flexible. That is why VARCHAR is used. |

**Primary Key:** TransmissionID

## Variant-Vaccine Entity

| **Attributes** | **DataType** | **Explanation** |
| --- | --- | --- |
| **VariantID** | INT(7) | Same as Variant Table |
| **VaccineID** | INT(6) | Same as Vaccine Table |
| **Vaccine_Status** | VARCHAR(3) | The status will be inserted as "A" for available,"N-A"for not available or"P" for pending.Therefore,the length of it can be either 1 or 3.Since the length of the value is not fixed it is better to use VARCHAR instead of CHAR as VARCHAR is more flexible. |

**Primary Key:** VariantID,VaccineID

**Foreign Key:** VariantID,VaccineID

## Vaccine Entity

| **Attributes** | **DataType** | **Explanation** |
| --- | --- | --- |
| **VaccineID** | INT(6) | VaccineID is a primary key.It is better for primary keys to be numeric as it is faster to match as compared to text. |
| **VaccineName** | VARCHAR(10) | Vaccines can have either long or short names therefore VARCHAR is used as it is more flexible. |

**Primary Key:** VaccineID

## Researchers Entity

| Attributes | Data Type | Explanation |
| --- | --- | --- |
| VariantID | INT(7) | Same as Variant Table |
| ResearcherID | VARCHAR(7) | Same as Researcher Table |
| Status\_of\_Research | VARCHAR(15) | States either if the research is complete or ongoing therefore the length is not set for the value so its better to use VARCHAR for this as it is more flexible and saves up more space when compared to CHAR. |

**Primary Key:**  VariantID,ResearcherID

**Foreign Key:** VariantD,ResearcherID

## Researcher Entity

| Attributes | Data Type | Explanation |
| --- | --- | --- |
| ResearcherID | INT(7) | ResearcherID is a primary key.It is better for primary keys to be numeric as it isfasterto match as compared to text. |
| ResearcherName | VARCHAR(40) | Australian Government sets about 100 characters including spaces, apostrophes, and hyphens for names. (Source: Australian Home Affairs Ministry).And since names can be any length, its not fixed hence better to use VARCHAR. |
| Institution | VARCHAR(40) | Some institution names are very long such as Western Sydney University which has 25 characters there are some which are even longer especially if it is in another language so the data type should be flexible to cater to this. Hence, we should use varchar for this data type as it is more flexible and saves up more space. |

**Primary Key:** ResearcherID



# Relationships

1. One **Variant** hasone **Parent Virus**, but one **Parent Virus** has many **Variants**.
2. One **Variant** has one type of **Gene** ,and one type of **Gene** has one **Variant**.
3. One **Variant** has many types of **Hosts** ,and one **Host** has many types of **Variants**
4. One **Variant** has many types of **Transmissions** ,and one **Transmission** has many type sof **Variants**
5. One **Variant** is active in **many Locations** and one **Location** may have one or **many Variants**.
6. One **Variant** may have **many Vaccines **,One** Vaccine** has only one or **more Variants**
7. Each **Variant** has **one** or **many Researchers** and each **Researcher** has **one or many Variants**.

# Justification of Entities.

As you can see this table has a few many to many relationships. Therefore, to implement a better design many weak entities were used. Now the question is why this database does have so many tables.Well based on my research all these tables are needed as they contain information that is used to track down different kinds of virus. For proper, virus tracing the user should be able to know the gene type as well as the gene length (gene table) this can be used by researchers to do gene sequencing a key important aspect in creating vaccines for viruses.On that note,knowing which parent virus(virus table) the current virus/variant that they are researching id from will help them to understand the current structure of the variant that they are studying. Besides that, researchers should know what host type (host table)and transmission type (transmission table)each variant is using as to know howmuch the virus has evolved hand how contagious it hasbecome. Furthermore, knowing about where the virus has originated from and what locations it has spread will give key insight to how fast it is spreading and how adaptable it is to different geolocations and climates. Knowing which researcher (researcher table) is also working on the virus would help current researchers to collaboratewith eachotheror reference existingwork from these researchers.Lastly, knowing what vaccines (vaccine table) are available for the virus could help researchers in two ways one they will know how to treat the diseases caused by the virus and two they will know if they should move on to research another virus as there is already a cure for the one that they're currently tracking/researching.

# Further Note
- See the report for the database class diagram.
