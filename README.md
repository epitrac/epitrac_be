<div align="center">
  <h1>Epitrac API</h1>
  <h1>-WIP-</h1>
</div>

## Table of Contents
- [Project Overview](#project-overview)
- [Learning Goals](#learning-goals)
- [Setup](#setup)
- [Endpoints](#endpoints)
- [Schema](#schema)
- [Contributors](#contributors)
- [Gems](#gems)


## Project Overview
Epitrac is an application that aims to solve the problem of the general public not having user-friendly access to epidemiological data by creating a user friendly interactive map to display weekly disease cases and view disease related articles.

This repo is the Back End part of a project built by students at [Turing School of Software and Design](https://turing.edu/). You can find the Front End repo [HERE](https://github.com/epitrac/epitrac_fe).



## Learning Goals
[Project Spec](https://backend.turing.edu/module3/projects/consultancy/)

This project's goal is creating a successful web application from a student-led project idea, focusing on Service-Oriented Architecture with a separate front and back end.
The back-end handles the project's API consumption and acts as the interface to the project's database.

## Setup

1. Clone the repository
2. cd into the root directory
3. Install gem packages: `bundle install`
4. Setup the database: `rails db:create`

## Endpoints
<details close>
<summary>Get State Latest Week Disease Cases</summary>
<br>

Request:
**GET** `/api/v1/disease_cases?state=#{state_name}`

Headers: <br>
```

```

Response:
```json
{
    "data": [
        {
            "type": "disease_cases",
            "id": "1",
            "attributes": {
                "state" :" GEORGIA",
                "year" : "2022",
                "current_week": 1,
                "disease" : "Anthrax",
                "current_week_cases": 2,
                "cumulative_current" : 200,
                "cumulative_last" : 150,
                "coordinates" : [-83.426, 32.638]
            }
        }
       ]
}
```
</details>

<details close>
<summary>Get All Disease Cases for Current Week</summary>
<br>

Request:
**GET** `/api/v1/disease_cases`

Headers: <br>
```

```

Response:
```json
{
    "data": [
        {
            "type": "disease_cases",
            "id": "1",
            "attributes": {
                "state" :" GEORGIA",
                "year" : "2022",
                "current_week": 1,
                "disease" : "Anthrax",
                "current_week_cases": 2,
                "cumulative_current" : 200,
                "cumulative_last" : 150,
                "coordinates" : [-83.426, 32.638]
            }
        },
        {
            "type": "disease_cases",
            "id": "2",
            "attributes": {
                "state" :" COLORADO",
                "year" : "2022",
                "current_week": 1,
                "disease" : "Measles",
                "current_week_cases": 1,
                "cumulative_current" : 100,
                "cumulative_last" : 50,
                "coordinates" : [-83.426, 32.638]
            }
        },
        {...},
        {...},
        ...
        ...
       ]
}
```
</details>

<details close>
<summary>Get Disease Articles</summary>
<br>

Request:
**GET** `/api/v1/articles?disease=#{disease}`

Headers: <br>
```

```

Response:
```json
{
 "data": [
        {
            "id": "1076",
            "type": "article",
            "attributes": {
                "id": "1076",
                "author": "de Oliveira, F. F. M. M., S.;Gonti, S.;Brey, R. N.;Li, H.;Schiffer, J.;Casadevall, A.;Bann, J. G.",
                "title": "Binding of the von Willebrand factor a domain of capillary morphogenesis protein 2 to anthrax protective antigen vaccine reduces immunogenicity in mice",
                "year": "2020",
                "date": "15-01",
                "isbn_issn": "2379-5042",
                "keywords": "anthrax:antigen processing:immunization:protein stability",
                "abstract": "Protective antigen (PA)
....
....},
{
 "id": "1380",
            "type": "article",
            "attributes": {
                "id": "1380",
                "author": "Hupert, N. W., D.,  Cuomo, J.,  Hollingsworth, E.,  Neukermans, K.,  Xiong, W.,",
                "title": "Predicting hospital surge after a large-scale anthrax attack: a model-based analysis of CDC's cities readiness initiative prophylaxis recommendations",
                "year": "2009"
.....}
]
```
</details>

<details close>
<summary>Get Info about a given disease </summary>
<br>

Request:
**GET** `/api/v1/disease_info?disease=#{disease}`

Headers: <br>
```

```

Response:
```json
{
    "data": {
        "id": "1",
        "type": "disease_info",
        "attributes": {
            "disease": "Anthrax",
            "information": "Anthrax is a serious infectious disease caused by gram-positive, rod-shaped bacteria known as Bacillus anthracis. It occurs naturally in soil and commonly affects domestic and wild animals around the world. People can get sick with anthrax if they come in contact with infected animals or contaminated animal products. Anthrax can cause severe illness in both humans and animals.",
            "link": "https://www.cdc.gov/anthrax/"
        }
    }
}
```
</details>

<details close>
<summary>Get a user's saved articles from user_aritcles table in back_end </summary>
<br>

Request:
**GET** `/api/v1/user_articles?user_id=#{user_id}`

Headers: <br>
```

```

Response:
```json
{
 "data": [
        {
            "id": "8",
            "type": "article",
            "attributes": {
                "article_id": "4",
                "author": "Auld, A. F. V., Pelletier, Robin, E. G., Shiraishi, R. W., Dee, J., Antoine, M., Desir, Y., Desforges, G., Delcher, C., Duval, N., Joseph, N., Francois, K., Griswold, M., Domercant, J. W., Patrice Joseph, Y. A., Van Onacker, J. D., Deyde, V., Lowrance, D. W., And The Groupe d'Analyses, Salvh,",
                "title": "Retention throughout the HIV care...",
                "year": "2017",
                "date": "Oct",
                "isbn_issn": "0002-9637",
                "keywords": null,
                "abstract": "Monitoring retention of people living with HIV (PLHIV) in the HIV care...",
                "url": "http://www.ncbi.nlm.nih.gov/pubmed/29064357/?otool=cdciclib",
                "doi": "10.4269/ajtmh.17-0116"
            }
        },
        {
            "id": "4",
            "type": "article",
            "attributes": {
                "article_id": "3",
                "author": "Crepaz, N. T., T., Marks, G., Hall, H. I.,",
                "title": "...
            }
        }
   ]
}
```
</details>

<details close>
<summary> Store an article to a user in the user_articles table </summary>
<br>

Request:
**POST** `/api/v1/user_articles?user_id=#{user_id}&article_id=#{article_id}`

Headers: <br>
```

```

Response:
```json
{
 "data": {
        "id": "10",
        "type": "user_article",
        "attributes": {
            "user_id": 1,
            "article_id": 88
        }
    }
}
```
</details>

## Schema

-WIP-

## Contributors
<table>
  <tr>
    <td>Shawn Lee</td>
    <td>Madeline Mauser</td>
    <td>Emily Port</td>
    <td>Darby Smith</td>
    <td>William Wang</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/Shawnl93">GitHub</a><br>
      <a href="https://www.linkedin.com/in/shawn-lee-3382aa8b/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/MadelineMauser">GitHub</a><br>
      <a href="https://www.linkedin.com/in/madeline-mauser-644239245/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/eport01">GitHub</a><br>
      <a href="https://www.linkedin.com/in/emily-port-3ab6389b/">LinkedIn</a>
    </td>
    <td>
    <a href="https://github.com/DarbySmith">GitHub</a><br>
    <a href="https://www.linkedin.com/in/darby-m-smith/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/willjw2">GitHub</a><br>
      <a href="https://www.linkedin.com/in/william-wang-814442240/">LinkedIn</a>
    </td>
  </tr>
</table>

## Gems
- Pry
- rspec
- capybara
- simplecov
- shoulda-matchers
- webmock
- vcr
- faraday
- faker
- factorybot

## Known Issues/Future Goals
Future features could include:
- WIP
