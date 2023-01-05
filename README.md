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
            "type": "articles",
            "id": "1",
            "attributes": {
                "disease" : "anthrax",
                "article_id" : "10.1371/journal.pone.0122004",
                "journal" : "PLOS ONE",
                "eissn" : "1932-6203",
                "publication_date" : "2015-03-16T00:00:00Z",
                "author_display" : ["Hiroshito Ogawa", "Daisuke Fujikura", "Miyuki Ohnuma"],
                "abstract" : [ "Anthrax is an important zoonotic disease worldwide...."],
                "title_display" : "A novel Multiplex PCR..."
            }
        },
        {
            "type": "articles",
            "id": "2",
            "attributes": {
                "disease" : "anthrax",
                ...
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
