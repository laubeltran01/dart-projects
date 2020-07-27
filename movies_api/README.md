# movies_api

## Description
This Rest API interacts (insert, search, delete and update) with a Postgres database about movies.

Database has the following structure:
- id (int) as a primarykey for the DB
- title (string)
- director (string)
- year (int)

NOTE: Field "director" was used instead of author for movies

## Use of movies_api
It's possible to use the following RestAPI requests (tested with Postman) in movies_api:

#### GET all movies
Shows all movies existing in the DB.  
		[GET] http://localhost:8888/movies_api

#### GET a movie by ID
Returns the movie with the ID specified in the URL.  
[GET] http://localhost:8888/movies_api/id

#### POST a movie
Inserts a new movie into the DB. Json format is required. ID is assigned automatically.

    {
        "title": "a",
        "director": "a",
        "year": 1
    }

[POST] http://localhost:8888/movies_api

#### DELETE a movie
An existing movie is deleted from DB specifying the ID of the movie to delete in the URL.  
[DELETE] http://localhost:8888/movies_api/id

#### PUT a movie
Updates an existing  movie in the DB specifying the ID of the movie to update in the URL. Json format is required (title, director or year fields can be updated separately)

    {
        "title": "a",
        "director": "a",
        "year": 1
    }

[PUT] http://localhost:8888/movies_api/id

## Running the Application Locally

Run `aqueduct serve` from this directory to run the application. For running within an IDE, run `bin/main.dart`. 

Configuration file `config.yaml` contains DB connection information.


