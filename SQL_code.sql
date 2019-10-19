CREATE SCHEMA

CREATE TABLE movie_genre (
	title_id varchar(100),
	genre varchar(100)
);


CREATE Table movie_rating (
	title_id varchar(100),
	rated varchar(100),
	imdbrating float,
	imdbvotes INT
);

CREATE Table movie_id (
	title_id varchar(100),
	title varchar(100),
	year INT,
	lifetime_gross INT
);

--Query the data to return all the rows from 2015

SELECT title, title_id, year 
	FROM movie_id 
	WHERE year = 2015;

-- Query the data to sort by highest grossing film in 2014
SELECT title, title_id, lifetime_gross 
	FROM movie_id 
	ORDER BY lifetime_gross DESC;

-- Query the data to sort by highest rating in 2014
SELECT movie_rating.title_id, title, imdbrating, imdbvotes 
	FROM movie_rating 
	inner join movie_id 
	ON movie_rating.title_id=movie_id.title_id 
	ORDER BY imdbrating DESC;

-- Query return highest grossing comedies 
SELECT distinct movie_id.title_id, title, lifetime_gross, genre
   FROM movie_id
   LEFT JOIN movie_genre
   ON movie_id.title_id = movie_genre.title_id
   WHERE genre = 'comedy' and year = 2014
   ORDER BY lifetime_gross desc;
   
 -- Query returns count of movies in each genre
 SELECT genre
 	count(1) as movies 
	FROM movie_genre 
	GROUP BY genre;

