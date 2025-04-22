
--DROP TABLES
DROP TABLE TvWatchOn CASCADE CONSTRAINTS;
DROP TABLE MovieWatchOn CASCADE CONSTRAINTS;
DROP TABLE Movie_Directed_By CASCADE CONSTRAINTS;
DROP TABLE TV_Directed_By CASCADE CONSTRAINTS;
DROP TABLE TV_Review CASCADE CONSTRAINTS;
DROP TABLE Movie_Review CASCADE CONSTRAINTS;
DROP TABLE Act_TV CASCADE CONSTRAINTS;
DROP TABLE Act_Movie CASCADE CONSTRAINTS;
DROP TABLE TV_Genre CASCADE CONSTRAINTS;
DROP TABLE Writer CASCADE CONSTRAINTS;
DROP TABLE Movie_Genre CASCADE CONSTRAINTS;
DROP TABLE Season CASCADE CONSTRAINTS;
DROP TABLE streamingService CASCADE CONSTRAINTS;
DROP TABLE Director CASCADE CONSTRAINTS;
DROP TABLE Movie CASCADE CONSTRAINTS;
DROP TABLE TvShow CASCADE CONSTRAINTS;
DROP TABLE Actor CASCADE CONSTRAINTS;

--TABLE CREATION
CREATE TABLE Movie (
    Mname VARCHAR2(100),
    movieRating VARCHAR2(100),
    year NUMBER(4),
    synopsis VARCHAR2(100),
    runtime_min NUMBER(10),
    movie_html_id VARCHAR2(10) CONSTRAINT Movie_movie_html_id_PK PRIMARY KEY
);

CREATE TABLE TvShow (
    show_name VARCHAR2(100),
    Pilot VARCHAR2(100),
    synopsis VARCHAR2(100),
    tv_html_id VARCHAR2(10) CONSTRAINT TvShow_tv_html_id_PK PRIMARY KEY
);

CREATE TABLE Actor (
    First_name VARCHAR2(20),
    Last_name VARCHAR2(20),
    stageName VARCHAR2(40),
    filmography VARCHAR2(100),
    actor_html_id VARCHAR2(10) CONSTRAINT Actor_actor_html_id_PK PRIMARY KEY
);

CREATE TABLE Director (
    First_name VARCHAR2(20),
    Last_name VARCHAR2(20),
    filmography VARCHAR2(100),
    director_html_id VARCHAR2(10) CONSTRAINT Director_director_html_id_PK PRIMARY KEY
);

CREATE TABLE streamingService (
    stream_html_id VARCHAR2(10) CONSTRAINT streamingService_PK PRIMARY KEY,
    Service_Name VARCHAR2(100),
    price NUMBER(6,2),
    plan VARCHAR2(50)
);

CREATE TABLE TvWatchOn (
    Tv_html VARCHAR2(10),
    service_html VARCHAR2(10),
    CONSTRAINT TvWatchOn_PK PRIMARY KEY (Tv_html, service_html)
);

CREATE TABLE MovieWatchOn (
    Movie_html VARCHAR2(10),
    service_html VARCHAR2(10),
    CONSTRAINT MovieWatchOn_PK PRIMARY KEY (Movie_html, service_html)
);

CREATE TABLE Movie_Directed_By (
    Movie_HTML VARCHAR2(10),
    Director_HTML VARCHAR2(10),
    CONSTRAINT Movie_Directed_By_PK PRIMARY KEY (Movie_HTML, Director_HTML)
);

CREATE TABLE TV_Directed_By (
    TV_HTML VARCHAR2(10),
    Director_HTML VARCHAR2(10),
    CONSTRAINT TV_Directed_By_PK PRIMARY KEY (TV_HTML, Director_HTML)
);

CREATE TABLE TV_Review (
    TV_HTML VARCHAR2(10),
    review VARCHAR2(2000),
    stars NUMBER(2,1) CHECK (stars BETWEEN 0 AND 10),
    title VARCHAR2(255) NOT NULL,
    description VARCHAR2(1000),
    r_date DATE,
    CONSTRAINT Tv_Review_PK PRIMARY KEY (TV_HTML, review)
);

CREATE TABLE Movie_Review (
    Movie_HTML VARCHAR2(10),
    review VARCHAR2(2000),
    stars NUMBER(2,1) CHECK (stars BETWEEN 0 AND 10),
    title VARCHAR2(255) NOT NULL,
    description VARCHAR2(1000),
    r_date DATE,
    CONSTRAINT Movie_Review_PK PRIMARY KEY (Movie_HTML, review)
);

CREATE TABLE Season (
    SeasonNum NUMBER(2),
    seasonFinale VARCHAR2(100),
    episodes VARCHAR2(300), --do we want this to be VARCHAR or NUM?
    TV_HTML VARCHAR2(10),
    CONSTRAINT Seasons_PK PRIMARY KEY (SeasonNum, TV_HTML)
);

CREATE TABLE Writer (
    TV_HTML VARCHAR2(10),
    SeasonNum NUMBER(2),
    writers VARCHAR2(200),
    CONSTRAINT Writer_PK PRIMARY KEY (TV_HTML, SeasonNum, writers)
);

CREATE TABLE Act_TV (
    TV_HTML VARCHAR2(10),
    Actor_HTML VARCHAR2(10),
    CONSTRAINT Act_TV_PK PRIMARY KEY (TV_HTML, Actor_HTML)
);

CREATE TABLE Act_Movie (
    Movie_HTML VARCHAR2(10),
    Actor_HTML VARCHAR2(10),
    CONSTRAINT Act_Movie_PK PRIMARY KEY (Movie_HTML, Actor_HTML)
);

CREATE TABLE TV_Genre (
    TV_HTML VARCHAR2(10),
    genre VARCHAR2(50),
    CONSTRAINT TV_Genre_PK PRIMARY KEY (TV_HTML, genre)
);

CREATE TABLE Movie_Genre (
    Movie_HTML VARCHAR2(10),
    genre VARCHAR2(200),
    CONSTRAINT MovieGenre_PK PRIMARY KEY (Movie_HTML, genre)
);

--MOVIE INSERTS
INSERT INTO Movie (Mname, movieRating, year, synopsis, runtime_min, movie_html_id) 
VALUES ('Inception', 'PG-13', 2010, 'Dream within a dream', 148, 'tt1375666');

INSERT INTO Movie (Mname, movieRating, year, synopsis, runtime_min, movie_html_id) 
VALUES ('Titanic', 'PG-13', 1997, 'Ship sinks, love story', 195, 'tt0120338');

INSERT INTO Movie (Mname, movieRating, year, synopsis, runtime_min, movie_html_id) 
VALUES ('A Minecraft Movie', 'PG', 2025, 'Minecraft but movie', 201, 'tt3566834');

INSERT INTO Movie (Mname, movieRating, year, synopsis, runtime_min, movie_html_id) 
VALUES ('The Shawshank Redemption', 'R', 1994, 'A banker convicted of uxoricide forms...', 142, 'tt0111161');

INSERT INTO Movie (Mname, movieRating, year, synopsis, runtime_min, movie_html_id)
VALUES ('The Revenant', 'R', 2015, 'Man survives wilderness for revenge', 156, 'tt1663202');

--TV INSERTS
INSERT INTO TvShow (show_name, Pilot, synopsis, tv_html_id) 
VALUES ('Breaking Bad', 'Pilot Episode', 'Teacher turns drug dealer', 'tt0903747'); 

INSERT INTO TvShow (show_name, Pilot, synopsis, tv_html_id) 
VALUES ('Game of Thrones', 'Winter is Coming', 'Fantasy kingdoms at war', 'tt0944947'); 

INSERT INTO TvShow (show_name, Pilot, synopsis, tv_html_id) 
VALUES ('Malcolm in the Middle', 'Pilot', 'Genius kid in a chaotic family', 'tt0212671');

INSERT INTO TvShow (show_name, Pilot, synopsis, tv_html_id) 
VALUES ('Avatar: The Last Airbender', 'The Boy in the Iceberg', 'Young Avatar must save the world', 'tt0417299');

INSERT INTO TvShow (show_name, Pilot, synopsis, tv_html_id) 
VALUES ('Better Call Saul', 'Uno', 'A lawyers moral slide', 'tt3032476');

--ACTOR INSERTS
INSERT INTO Actor (First_name, Last_name, stageName, filmography, actor_html_id) 
VALUES ('Leonardo', 'DiCaprio', 'Leo', 'Inception, Titanic', 'nm0000138');

INSERT INTO Actor (First_name, Last_name, stageName, filmography, actor_html_id) 
VALUES ('Bryan', 'Cranston', 'Bryan Cranston', 'Breaking Bad, Malcolm', 'nm0186505'); 

INSERT INTO Actor (First_name, Last_name, stageName, filmography, actor_html_id) 
VALUES ('Jack', 'Black', 'Jack Black', 'A Minecraft Movie, Kung Fu Panda', 'nm0085312'); 

INSERT INTO Actor (First_name, Last_name, stageName, filmography, actor_html_id) 
VALUES ('Tim', 'Robbins', 'Tim Robbins', 'Mystic River, Howard the Duck', 'nm0000209'); 

INSERT INTO Actor (First_name, Last_name, stageName, filmography, actor_html_id) 
VALUES ('Emilia', 'Clarke', 'Emilia Clarke', 'Game of Thrones, Me Before You', 'nm3592338');

INSERT INTO Actor (First_name, Last_name, stageName, filmography, actor_html_id) 
VALUES ('Zach', 'Tyler', 'Zach Tyler Eisen', 'Avatar: The Last Airbender', 'nm0254735');


--DIRECTOR INSERTS
INSERT INTO Director (First_name, Last_name, filmography, director_html_id) 
VALUES ('Christopher', 'Nolan', 'Inception, Dark Knight', 'nm0634240'); 

INSERT INTO Director (First_name, Last_name, filmography, director_html_id) 
VALUES ('James', 'Cameron', 'Titanic, Avatar', 'nm0000116');

INSERT INTO Director (First_name, Last_name, filmography, director_html_id) 
VALUES ('Jared', 'Hess', 'A Minecraft Movie, Nacho Libre', 'nm0381478');

INSERT INTO Director (First_name, Last_name, filmography, director_html_id)
VALUES ('Alejandro', 'G. Inarritu', 'The Revenant, Birdman', 'nm0327944');

INSERT INTO Director (First_name, Last_name, filmography, director_html_id)
VALUES ('Frank', 'Darabont', 'The Shawshank Redemption, The Green Mile', 'nm0001104');

INSERT INTO Director (First_name, Last_name, filmography, director_html_id) 
VALUES ('Michael', 'DiMartino', 'Avatar: The Last Airbender, The Dragon Prince', 'nm0227476');

INSERT INTO Director (First_name, Last_name, filmography, director_html_id) 
VALUES ('Vince', 'Gilligan', 'Breaking Bad, Better Call Saul', 'nm0319213');

--STREAMING SERVICE INSERTS
INSERT INTO streamingService (stream_html_id, Service_Name, price, plan) 
VALUES ('NTFLX', 'Netflix', 15.99, 'Standard');

INSERT INTO streamingService (stream_html_id, Service_Name, price, plan) 
VALUES ('HBO', 'HBO Max', 14.99, 'Premium');

INSERT INTO streamingService (stream_html_id, Service_Name, price, plan) 
VALUES ('AMZPRM', 'Prime Video', 14.99, 'Premium');

INSERT INTO streamingService (stream_html_id, Service_Name, price, plan) 
VALUES ('THEAT', 'THEATRE', 14.99, 'One Time');

INSERT INTO streamingService (stream_html_id, Service_Name, price, plan)
VALUES ('HULU', 'Hulu', 14.99, 'Standard');



--WATCH ON INSERTS
INSERT INTO TvWatchOn (Tv_html, service_html) 
VALUES ('tt0903747', 'NTFLX'); 

INSERT INTO TvWatchOn (Tv_html, service_html) 
VALUES ('tt0944947', 'HBO');

INSERT INTO TvWatchOn (Tv_html, service_html) 
VALUES ('tt0212671', 'HULU');

INSERT INTO TvWatchOn (Tv_html, service_html) 
VALUES ('tt0417299', 'NTFLX');

INSERT INTO TvWatchOn (Tv_html, service_html) 
VALUES ('tt3032476', 'NTFLX');

--MOVIE WATCH ON INSERTS
INSERT INTO MovieWatchOn (Movie_html, service_html) 
VALUES ('tt1375666', 'AMZPRM');

INSERT INTO MovieWatchOn (Movie_html, service_html) 
VALUES ('tt0120338', 'HBO');

INSERT INTO MovieWatchOn (Movie_html, service_html) 
VALUES ('tt3566834', 'THEAT');

INSERT INTO MovieWatchOn (Movie_html, service_html) 
VALUES ('tt1663202', 'AMZPRM');

INSERT INTO MovieWatchOn (Movie_HTML, service_html) 
VALUES ('tt0111161', 'NTFLX');

--MOVIE DIRECTED BY INSERTS
INSERT INTO Movie_Directed_By (Movie_HTML, Director_HTML) 
VALUES ('tt1375666', 'nm0634240');

INSERT INTO Movie_Directed_By (Movie_HTML, Director_HTML) 
VALUES ('tt0120338', 'nm0000116');

INSERT INTO Movie_Directed_By (Movie_HTML, Director_HTML) 
VALUES ('tt3566834', 'nm0381478');

INSERT INTO Movie_Directed_By (Movie_HTML, Director_HTML)
VALUES ('tt1663202', 'nm0327944');

INSERT INTO Movie_Directed_By (Movie_HTML, Director_HTML)
VALUES ('tt0111161', 'nm0001104');

--TV DIRECTED BY INSERTS
INSERT INTO TV_Directed_By (TV_HTML, Director_HTML) 
VALUES ('tt0903747', 'nm0634240');

INSERT INTO TV_Directed_By (TV_HTML, Director_HTML) 
VALUES ('tt0944947', 'nm0000116');

INSERT INTO TV_Directed_By (TV_HTML, Director_HTML)
VALUES ('tt0417299', 'nm0227476');

INSERT INTO TV_Directed_By (TV_HTML, Director_HTML)
VALUES ('tt3032476', 'nm0319213');

--TV REVIEW INSERTS
INSERT INTO TV_Review (TV_HTML, review, stars, title, description, r_date) 
VALUES ('tt0903747', 'Amazing show!', 9.5, 'Best Ever', 'Breaking Bad is incredible.', TO_DATE('2023-01-01','YYYY-MM-DD'));

INSERT INTO TV_Review (TV_HTML, review, stars, title, description, r_date) 
VALUES ('tt0212671', 'Everyone needs to sit through the first season!', 8.2, 'Classic 90s sitcom.', 'Great Family Sitcom!', TO_DATE('2013-05-08','YYYY-MM-DD'));

INSERT INTO TV_Review (TV_HTML, review, stars, title, description, r_date) 
VALUES ('tt0417299', 'For someone who loves fantasy this is an excellent show.', 8.3, 'Excellent Show', 'Just a classis for adults and children alike', TO_DATE('2021-12-16','YYYY-MM-DD'));

INSERT INTO TV_Review (TV_HTML, review, stars, title, description, r_date) 
VALUES ('tt3032476', 'Tense and character-driven.', 9.2, 'Solid Prequel', 'Better Call Saul lives up to Breaking Bad.', TO_DATE('2023-09-18','YYYY-MM-DD'));

INSERT INTO TV_Review (TV_HTML, review, stars, title, description, r_date) 
VALUES ('tt0944947', 'Epic and unforgettable.', 9.0, 'Fantasy at its best', 'GoT delivers shocking twists and battles.', TO_DATE('2023-04-02','YYYY-MM-DD'));

--MOVIE REVIEW INSERTS
INSERT INTO Movie_Review (Movie_HTML, review, stars, title, description, r_date) 
VALUES ('tt1375666', 'Mind-blowing!', 9.0, 'Nolan Masterpiece', 'Inception makes you think.', TO_DATE('2023-02-01','YYYY-MM-DD'));

INSERT INTO Movie_Review (Movie_HTML, review, stars, title, description, r_date) 
VALUES ('tt0120338', 'Job well done!', 9.0, 'One hell of a movie', 'The characters were phenomenal.', TO_DATE('2023-06-25','YYYY-MM-DD'));

INSERT INTO Movie_Review (Movie_HTML, review, stars, title, description, r_date) 
VALUES ('tt3566834', 'Entertaining, but thats it', 7.0, 'I do recommend watching this movie', 'As a longtime Minecraft player, Ive waited years for this movie...', TO_DATE('2025-04-01','YYYY-MM-DD'));

INSERT INTO Movie_Review (Movie_HTML, review, stars, title, description, r_date) 
VALUES ('tt1663202', 'Raw and powerful performance.', 8.5, 'Intense Survival', 'DiCaprio delivers an unforgettable performance.', TO_DATE('2024-12-10','YYYY-MM-DD'));

INSERT INTO Movie_Review (Movie_HTML, review, stars, title, description, r_date) 
VALUES ('tt0111161', 'Hope is a good thing.', 9.3, 'Timeless Classic', 'One of the greatest stories ever told.', TO_DATE('2022-04-15','YYYY-MM-DD'));

--SEASON INSERTS
INSERT INTO Season (SeasonNum, seasonFinale, episodes, TV_HTML) 
VALUES (1, 'Felina', 'S01E01, S01E02, S01E03', 'tt0903747');

INSERT INTO Season (SeasonNum, seasonFinale, episodes, TV_HTML) 
VALUES (1, 'Dragon and the Wolf', 'S07E01, S07E02, S07E03', 'tt0944947');

INSERT INTO Season (SeasonNum, seasonFinale, episodes, TV_HTML) 
VALUES (1, 'Water Park', 'S01E01, S01E02, S01E03', 'tt0212671');

INSERT INTO Season (SeasonNum, seasonFinale, episodes, TV_HTML) 
VALUES (1, 'The Siege of the North, Part 2', 'S01E01, S01E02, S01E03', 'tt0417299');

INSERT INTO Season (SeasonNum, seasonFinale, episodes, TV_HTML) 
VALUES (1, 'Marco', 'S01E01, S01E02, S01E03', 'tt3032476');

--WRITER INSERTS
INSERT INTO Writer (TV_HTML, SeasonNum, writers) 
VALUES ('tt0903747', 1, 'Vince Gilligan');

INSERT INTO Writer (TV_HTML, SeasonNum, writers) 
VALUES ('tt0944947', 1, 'George R. R. Martin');

INSERT INTO Writer (TV_HTML, SeasonNum, writers) 
VALUES ('tt0212671', 1, 'Linwood Boomer');

INSERT INTO Writer (TV_HTML, SeasonNum, writers) 
VALUES ('tt0417299', 1, 'Michael Dante DiMartino, Bryan Konietzko');

INSERT INTO Writer (TV_HTML, SeasonNum, writers) 
VALUES ('tt3032476', 1, 'Peter Gould');

--ACTOR TV INSERTS
INSERT INTO Act_TV (TV_HTML, Actor_HTML) 
VALUES ('tt0903747', 'nm0186505');

INSERT INTO Act_TV (TV_HTML, Actor_HTML) 
VALUES ('tt0212671', 'nm0186505');

INSERT INTO Act_TV (TV_HTML, Actor_HTML) 
VALUES ('tt3032476', 'nm0186505');

INSERT INTO Act_TV (TV_HTML, Actor_HTML) 
VALUES ('tt0944947', 'nm3592338');

INSERT INTO Act_TV (TV_HTML, Actor_HTML) 
VALUES ('tt0417299', 'nm0254735');

--ACT MOVIE INSERTS
INSERT INTO Act_Movie (Movie_HTML, Actor_HTML) 
VALUES ('tt1375666', 'nm0000138');

INSERT INTO Act_Movie (Movie_HTML, Actor_HTML) 
VALUES ('tt0120338', 'nm0000138');

INSERT INTO Act_Movie (Movie_HTML, Actor_HTML) 
VALUES ('tt3566834', 'nm0085312');

INSERT INTO Act_Movie (Movie_HTML, Actor_HTML) 
VALUES ('tt1663202', 'nm0000138');

INSERT INTO Act_Movie (Movie_HTML, Actor_HTML) 
VALUES ('tt0111161', 'nm0000209');

--TV GENRE INSERTS
INSERT INTO TV_Genre (TV_HTML, genre) 
VALUES ('tt0903747', 'Crime');

INSERT INTO TV_Genre (TV_HTML, genre) 
VALUES ('tt0944947', 'Fantasy');

INSERT INTO TV_Genre (TV_HTML, genre) 
VALUES ('tt0212671', 'Comedy');

INSERT INTO TV_Genre (TV_HTML, genre) 
VALUES ('tt0417299', 'Animation');

INSERT INTO TV_Genre (TV_HTML, genre) 
VALUES ('tt3032476', 'Crime');

--MOVIE GENRE INSERTS
INSERT INTO Movie_Genre (Movie_HTML, genre) 
VALUES ('tt1375666', 'Sci-Fi');

INSERT INTO Movie_Genre (Movie_HTML, genre) 
VALUES ('tt0120338', 'Romance');

INSERT INTO Movie_Genre (Movie_HTML, genre) 
VALUES ('tt3566834', 'Action, Adeventure, Fantasy');

INSERT INTO Movie_Genre (Movie_HTML, genre) 
VALUES ('tt1663202', 'Adventure, Drama');

INSERT INTO Movie_Genre (Movie_HTML, genre) 
VALUES ('tt0111161', 'Drama');

--FOREIGN KEY ALTER TABLES
ALTER TABLE TvWatchOn
    ADD CONSTRAINT TvWatchOn_Tv_html_FK FOREIGN KEY (Tv_html)
    REFERENCES TvShow(tv_html_id);

ALTER TABLE TvWatchOn
    ADD CONSTRAINT TvWatchOn_service_html_FK FOREIGN KEY (service_html)
    REFERENCES streamingService(stream_html_id);

ALTER TABLE MovieWatchOn
    ADD CONSTRAINT MovieWatchOn_Movie_html_FK FOREIGN KEY (Movie_html)
    REFERENCES Movie(movie_html_id);

ALTER TABLE MovieWatchOn
    ADD CONSTRAINT MovieWatchOn_service_html_FK FOREIGN KEY (service_html)
    REFERENCES streamingService(stream_html_id);

ALTER TABLE Movie_Directed_By
    ADD CONSTRAINT Movie_Directed_By_movHTML_FK FOREIGN KEY (Movie_HTML)
    REFERENCES Movie(movie_html_id);

ALTER TABLE Movie_Directed_By
    ADD CONSTRAINT Movie_Directed_By_dirHTML_FK FOREIGN KEY (Director_HTML)
    REFERENCES Director(director_html_id);

ALTER TABLE TV_Directed_By
    ADD CONSTRAINT TV_Directed_By_TV_HTML_FK FOREIGN KEY (TV_HTML)
    REFERENCES TvShow(tv_html_id);

ALTER TABLE TV_Directed_By
    ADD CONSTRAINT TV_Directed_By_dirHTML_FK FOREIGN KEY (Director_HTML)
    REFERENCES Director(director_html_id);

ALTER TABLE TV_Review
    ADD CONSTRAINT TV_Review_TV_HTML_FK FOREIGN KEY (TV_HTML)
    REFERENCES TvShow(tv_html_id);

ALTER TABLE Movie_Review
    ADD CONSTRAINT Movie_Review_Movie_HTML_FK FOREIGN KEY (Movie_HTML)
    REFERENCES Movie(movie_html_id);

ALTER TABLE Season
    ADD CONSTRAINT Season_TV_HTML_FK FOREIGN KEY (TV_HTML)
    REFERENCES TvShow(tv_html_id);

ALTER TABLE Writer
    ADD CONSTRAINT Writer_Season_FK FOREIGN KEY (SeasonNum, TV_HTML)
    REFERENCES Season(SeasonNum, TV_HTML);

ALTER TABLE Act_TV
    ADD CONSTRAINT Act_TV_TV_HTML_FK FOREIGN KEY (TV_HTML)
    REFERENCES TvShow(tv_html_id);

ALTER TABLE Act_TV
    ADD CONSTRAINT Act_TV_Actor_HTML_FK FOREIGN KEY (Actor_HTML)
    REFERENCES Actor(actor_html_id);

ALTER TABLE Act_Movie
    ADD CONSTRAINT Act_Movie_Movie_HTML_FK FOREIGN KEY (Movie_HTML)
    REFERENCES Movie(movie_html_id);

ALTER TABLE Act_Movie
    ADD CONSTRAINT Act_Movie_Actor_HTML_FK FOREIGN KEY (Actor_HTML)
    REFERENCES Actor(actor_html_id);

ALTER TABLE TV_Genre
    ADD CONSTRAINT TV_Genre_TV_HTML_FK FOREIGN KEY (TV_HTML)
    REFERENCES TvShow(tv_html_id);

ALTER TABLE Movie_Genre
    ADD CONSTRAINT Movie_Genre_Movie_HTML_FK FOREIGN KEY (Movie_HTML)
    REFERENCES Movie(movie_html_id);
