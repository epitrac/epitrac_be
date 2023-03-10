<div align="center">
  <h1>EpiTrac API</h1>
  <img width="500" alt="Covid virus" src="https://user-images.githubusercontent.com/60988144/211962791-a35a0709-52af-493a-bfaf-e10b88db5738.jpg">
</div>

## Table of Contents
- [Project Overview](#project-overview)
- [Learning Goals](#learning-goals)
- [Built With](#built-with)
- [Setup](#setup)
- [Endpoints](#endpoints)
- [Contributors](#contributors)
- [Gems](#gems)
- [Schema](#schema)


## Project Overview
EpiTrac is an interactive public health application that enables users to view weekly notifiable disease counts by state as well as relevant articles and information for each disease. 

This repo is the Back End part of a project built by students at [Turing School of Software and Design](https://turing.edu/). You can find the Front End repo [HERE](https://github.com/epitrac/epitrac_fe).



## Learning Goals
[Project Spec](https://backend.turing.edu/module3/projects/consultancy/)

This project's goal is to create a successful web application from a student-led project idea, focusing on Service-Oriented Architecture with a separate front and back end.
The back-end handles the project's API consumption and acts as the interface to the project's database.

## Built With
- Rails 5.2.8
- Ruby 2.7.4

## Setup

1. Clone the repository
2. cd into the root directory
3. Install gem packages: `bundle install`
4. Setup the database: `rails db:{drop,create,migrate}`
5. Import [Disease Info](https://github.com/epitrac/epitrac_be/blob/main/db/data/nndss_diseases_info.csv) into diseases table: `rake csv_load:diseases`
6. Run `rails c` and then `Disease.count`. You should have 109 diseases.
7. You may run the RSpec test suite locally with `bundle exec rspec`

## Endpoints
Available endpoints:

[![Run in Postman](https://run.pstmn.io/button.svg)](https://god.gw.postman.com/run-collection/24609974-f8181aac-9ff7-47af-8cc7-8327e8ef5773?action=collection%2Ffork&collection-url=entityId%3D24609974-f8181aac-9ff7-47af-8cc7-8327e8ef5773%26entityType%3Dcollection%26workspaceId%3Ddeeca8bb-73db-4695-9e91-f4f93a443f2b)


Back End Server: https://epitrac-be.herokuapp.com/
### Disease Cases
<details close>
<summary>Get the Latest Week Disease Cases by State</summary>
<br>


Returns a list of diseases in that state for the most recent MMWR week recorded in the [NNDSS Weekly Dataset](https://data.cdc.gov/NNDSS/NNDSS-Weekly-Data/x9gk-5huc).
Data Sourced from the [NNDSS Weekly Data API](https://dev.socrata.com/foundry/data.cdc.gov/x9gk-5huc)

Request: <br>
```
GET /api/v1/disease_cases?state=#{state_name}
```
Example:
[Get Disease Cases in Georgia](https://epitrac-be.herokuapp.com/api/v1/disease_cases?state=GEORGIA)

JSON Response Example:
```json
{
    "data": [
        {
            "id": "20225200032",
            "type": "disease_case",
            "attributes": {
                "state": "GEORGIA",
                "year": "2022",
                "current_week": 52,
                "disease": "Anthrax",
                "cumulative_current": 0,
                "cumulative_last": 0,
                "coordinates": [
                    -84.39111,
                    33.74831
                ],
                "id": "20225200032",
                "current_week_cases": 0
              }
        },
        {
            "id": "20225200102",
            "type": "disease_case",
            "attributes": {
                "state": "GEORGIA",
                "year": "2022",
                "current_week": 52,
                "disease": "Arboviral diseases, Chikungunya virus disease",
                "cumulative_current": 0,
                "cumulative_last": 0,
                "coordinates": [
                    -84.39111,
                    33.74831
                ],
                "id": "20225200102",
                "current_week_cases": 0
              }
        },
        {...},
        {...},
        ]
}

```
</details>

<details close>
<summary>Get All Disease Cases for Current Week</summary>
<br>


Returns a list of diseases in all states for the most recent MMWR week recorded in the [NNDSS Weekly Dataset](https://data.cdc.gov/NNDSS/NNDSS-Weekly-Data/x9gk-5huc).

Data Sourced from the [NNDSS Weekly Data API](https://dev.socrata.com/foundry/data.cdc.gov/x9gk-5huc).

Request: <br>
```
GET /api/v1/disease_cases
```
Example: 
[Get All Disease Cases For Latest Week](https://epitrac-be.herokuapp.com/api/v1/disease_cases)

JSON Response Example:
```json
{
    "data": [
        {
            "id": "20225200003",
            "type": "disease_case",
            "attributes": {
                "state": "CONNECTICUT",
                "year": "2022",
                "current_week": 52,
                "disease": "Anthrax",
                "cumulative_current": 0,
                "cumulative_last": 0,
                "coordinates": [
                    -72.67399,
                    41.76376
                ],
                "id": "20225200003",
                "current_week_cases": 0
            }
        },
        {
            "id": "20225200004",
            "type": "disease_case",
            "attributes": {
                "state": "MAINE",
                "year": "2022",
                "current_week": 52,
                "disease": "Anthrax",
                "cumulative_current": 0,
                "cumulative_last": 0,
                "coordinates": [
                    -69.77631,
                    44.31804
                ],
                "id": "20225200004",
                "current_week_cases": 0
            }
        },
        {...},
        {...},
    ]
}
```
</details>

### Articles
<details close>

<summary>Get Articles for a Disease</summary>
<br>


Returns a list of articles related to that disease.

Data sourced from [Science Clips](https://dev.socrata.com/foundry/data.cdc.gov/biid-68vb).

Request: <br>
```
GET /api/v1/articles?disease=#{disease}
```
Example: 
[Get Articles Related to Anthrax](https://epitrac-be.herokuapp.com/api/v1/articles?disease=anthrax)

JSON Response Example:
```json
{
 "data": [
        {
            "id": "1076",
            "type": "article",
            "attributes": {
                "article_id": "1076",
                "author": "de Oliveira, F. F. M. M., S.;Gonti, S.;Brey, R. N.;Li, H.;Schiffer, J.;Casadevall, A.;Bann, J. G.",
                "title": "Binding of the von Willebrand factor a domain of capillary morphogenesis protein 2 to anthrax protective antigen vaccine reduces immunogenicity in mice",
                "year": "2020",
                "date": "15-01",
                "isbn_issn": "2379-5042",
                "keywords": "anthrax:antigen processing:immunization:protein stability",
                "abstract": "Protective antigen (PA) is a component of anthrax toxin ....",
                "url": "https://www.ncbi.nlm.nih.gov/pubmed/31941807",
                "doi": "10.1128/mSphere.00556-19"
            }
        },
        {
            "id": "1380",
            "type": "article",
            "attributes": {
                "article_id": "1380",
                "author": "Hupert, N. W., D.,  Cuomo, J.,  Hollingsworth, E.,  Neukermans, K.,  Xiong, W.,",
                "title": "Predicting hospital surge after a large-scale anthrax attack: a model-based analysis of CDC's cities readiness initiative prophylaxis recommendations",
                "year": "2009",
                "date": "Jul-Aug",
                "isbn_issn": "0272-989X (Print)",
                "keywords": null,
                "abstract": "BACKGROUND: A CRI-compliant prophylaxis...",
                "url": "http://mdm.sagepub.com/cgi/reprint/29/4/424",
                "doi": "10.1177/0272989X09341389"
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
<summary> Save an Article for a User </summary>
<br>

Request: <br>
```
POST /api/v1/user_articles?user_id=#{user_id}&article_id=#{article_id}
```

JSON Response Example:
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

<details close>
<summary> Delete a Saved Article for a User </summary>
<br>

Request: <br>
```
DELETE /api/v1/user_articles/:id
```

JSON Response Example:
```json
{
    "message": "The article was successfully deleted from your dashboard"
}
```
</details>

<details close>
<summary> Get a Users Saved Articles </summary>
<br>


Request: <br>
```
GET /api/v1/user_articles/?user_id=#{user_id}
```

JSON Response Example:
```json
{
    "data": [
        {
            "id": "1",
            "type": "article",
            "attributes": {
                "article_id": "50",
                "author": "Johnson, T. L. G., C. B., Maes, S. E., Hojgaard, A., Fleshman, A., Boegler, K. A., Delory, M. J., Slater, K. S., Karpathy, S. E., Bjork, J. K., Neitzel, D. F., Schiffman, E. K., Eisen, R. J.,",
                "title": "Prevalence and distribution of seven human pathogens in host-seeking Ixodes scapularis (Acari: Ixodidae) nymphs in Minnesota, USA",
                "year": "2018",
                "date": "20-07",
                "isbn_issn": "1877-959x",
                "keywords": "Anaplasmosis:Babesiosis:Coinfection:Density of infected nymphs (DIN):Lyme disease:Nymphal infection prevalence (NIP)",
                "abstract": "In the north-central United States,...",
                "url": "https://www.ncbi.nlm.nih.gov/pubmed/30055987",
                "doi": "10.1016/j.ttbdis.2018.07.009"
            }
        },
        {...}
    ]
}



```
</details>

### Disease Info
<details close>
<summary> Get Information for all Diseases </summary>
<br>


Request: <br>
```
GET /api/v1/disease_info
```
Example:
[Get information for all diseases](https://epitrac-be.herokuapp.com/api/v1/disease_info)

JSON Response Example:
```json
{
    "data": [
        {
            "id": "1",
            "type": "disease_info",
            "attributes": {
                "disease": "Anthrax",
                "short_name": "Anthrax",
                "information": "Anthrax is a serious infectious disease...",
                "link": "https://www.cdc.gov/anthrax/"
            }
        },
        {
            "id": "2",
            "type": "disease_info",
            "attributes": {
                "disease": "Arboviral diseases, Chikungunya virus disease",
                "short_name": "Chikungunya",
                "information": "Chikungunya virus is spread to people...",
                "link": "https://www.cdc.gov/chikungunya/index.html"
            }
        },
        {....}
    ]
}
```
</details>

<details close>
<summary> Get Information for One Disease </summary>
<br>


Request: <br>
```
GET /api/v1/disease_info?disease=#{disease}
```
Example:
[Get Information for Anthrax](https://epitrac-be.herokuapp.com/api/v1/disease_info?disease=anthrax)

JSON Response Example:
```json
{
    "data": [
        {
            "id": "1",
            "type": "disease_info",
            "attributes": {
                "disease": "Anthrax",
                "short_name": "Anthrax",
                "information": "Anthrax is a serious infectious disease...",
                "link": "https://www.cdc.gov/anthrax/"
            }
        }
    ]
}
```
</details>

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
- [Pry](https://github.com/pry/pry)
- [RSpec-rails](https://github.com/rspec/rspec-rails)
- [Capybara](https://github.com/teamcapybara/capybara)
- [SimpleCov](https://github.com/simplecov-ruby/simplecov)
- [Shoulda-Matchers](https://github.com/thoughtbot/shoulda-matchers)
- [Webmock](https://github.com/bblimke/webmock)
- [VCR](https://github.com/vcr/vcr)
- [Faraday](https://lostisland.github.io/faraday/usage/)
- [Faker](https://github.com/vajradog/faker-rails)
- [Factory Bot](https://github.com/thoughtbot/factory_bot_rails)

## Schema
![Screen Shot 2023-01-11 at 10 08 15 PM](https://user-images.githubusercontent.com/60988144/211966702-9debd7ad-280e-4525-befc-b94ef2eb4ad8.png)

## Known Issues/Future Goals
Future features could include:
- Delete all articles endpoint
