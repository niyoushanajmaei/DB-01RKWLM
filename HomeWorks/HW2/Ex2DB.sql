CREATE DATABASE IF NOT EXISTS movies;
USE movies;

DROP TABLE IF EXISTS evaluation;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS movie;

CREATE TABLE users(
	ssn CHAR(20) PRIMARY KEY,
    nameU CHAR(20) NOT NULL,
    surnameU CHAR(20) NOT NULL,
    city CHAR(20) NOT NULL,
    yearOfBirth CHAR(10) NOT NULL,
    userType CHAR(20) NOT NULL
);

CREATE TABLE movie(
	codM INTEGER PRIMARY KEY,
    title CHAR(20) NOT NULL,
    nation CHAR(20) NOT NULL,
    language CHAR(20) NOT NULL,
    movieStudio CHAR(20) NOT NULL,
    genre CHAR(20) NOT NULL
);

CREATE TABLE evaluation (
	SSN CHAR(20),
    codM INTEGER,
    evaluation INTEGER NOT NULL,
    Date CHAR(10) NOT NULL,
    PRIMARY KEY(SSN, codM),
    FOREIGN KEY(SSN) REFERENCES users(SSN),
    FOREIGN KEY(codM) REFERENCES movie(codM)
);

INSERT INTO users (ssn, nameU, surnameU, city, yearOfBirth, userType)
    VALUES ('NPNECHQWBQSCNJIQHVGX', 'Christian', 'Merlu', 'Turin', '04-23-1985', 'Expert');
INSERT INTO users (ssn, nameU, surnameU, city, yearOfBirth, userType)
    VALUES ('IXOIEZHXSWFVPQPISNBS', 'Marco', 'Laurent', 'Paris', '03-27-2015', 'Newbie');
INSERT INTO users (ssn, nameU, surnameU, city, yearOfBirth, userType)
    VALUES ('HJYFLPWYJVJWQUGJDCIJ', 'Gennaro', 'Pizzettaru', 'Aosta', '12-14-1932', 'Expert');
INSERT INTO users (ssn, nameU, surnameU, city, yearOfBirth, userType)
    VALUES ('ISVOSFXRSYGVQQNVFYCV', 'Luca', 'Balengo', 'Naples', '06-08-2003', 'Expert');
INSERT INTO users (ssn, nameU, surnameU, city, yearOfBirth, userType)
    VALUES ('WFNDCEUCLLHHCVLEDSFJ', 'Mario', 'Porridge', 'London', '04-23-1985', 'Expert');

INSERT INTO movie (codM, title, nation, language, movieStudio, genre)
    VALUES(1, 'Batman', 'USA', 'Italian', 'Marvel', 'Horror');
INSERT INTO movie (codM, title, nation, language, movieStudio, genre)
    VALUES(2, 'Superman', 'Italy', 'Italian', 'Medusa', 'Horror');
INSERT INTO movie (codM, title, nation, language, movieStudio, genre)
    VALUES(3, 'Rocco', 'Italy', 'Mixed', 'Rocco', 'Adult');
INSERT INTO movie (codM, title, nation, language, movieStudio, genre)
    VALUES(4, 'Evergreen', 'USA', 'Italian', 'Marvel', 'Comedy');
INSERT INTO movie (codM, title, nation, language, movieStudio, genre)
    VALUES(5, 'Root', 'France', 'Greek', 'Marvel', 'Comedy');
INSERT INTO movie (codM, title, nation, language, movieStudio, genre)
    VALUES(6, 'Sleep', 'USA', 'Italian', 'Marvel', 'Comedy');

INSERT INTO evaluation (SSN, codM, evaluation, Date)
    VALUES('NPNECHQWBQSCNJIQHVGX', 1, 3, '02-22-2013');
INSERT INTO evaluation (SSN, codM, evaluation, Date)
    VALUES('IXOIEZHXSWFVPQPISNBS', 5, 6, '02-23-2013');
INSERT INTO evaluation (SSN, codM, evaluation, Date)
    VALUES('NPNECHQWBQSCNJIQHVGX', 4, 5, '02-15-2013');
INSERT INTO evaluation (SSN, codM, evaluation, Date)
    VALUES('WFNDCEUCLLHHCVLEDSFJ', 4, 9, '02-19-2013');
INSERT INTO evaluation (SSN, codM, evaluation, Date)
    VALUES('WFNDCEUCLLHHCVLEDSFJ', 2, 3, '03-04-2013');
INSERT INTO evaluation (SSN, codM, evaluation, Date)
    VALUES('ISVOSFXRSYGVQQNVFYCV', 6, 2, '02-06-2020');
INSERT INTO evaluation (SSN, codM, evaluation, Date)
    VALUES('HJYFLPWYJVJWQUGJDCIJ', 6, 2, '02-22-2010');
INSERT INTO evaluation (SSN, codM, evaluation, Date)
    VALUES('HJYFLPWYJVJWQUGJDCIJ', 4, 1, '02-25-2005');
INSERT INTO evaluation (SSN, codM, evaluation, Date)
    VALUES('HJYFLPWYJVJWQUGJDCIJ', 5, 1, '01-27-2013');
INSERT INTO evaluation (SSN, codM, evaluation, Date)
    VALUES('HJYFLPWYJVJWQUGJDCIJ', 3, 10, '02-22-2013');
