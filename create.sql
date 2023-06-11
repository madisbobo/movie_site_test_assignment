-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-06-06 15:59:58.514

-- tables
-- Table: genre
CREATE TABLE genre (
    id serial  NOT NULL,
    name varchar(255)  NOT NULL,
    CONSTRAINT genre_pk PRIMARY KEY (id)
);

-- Table: image
CREATE TABLE image (
    id serial  NOT NULL,
    movie_id int  NOT NULL,
    role_id int  NOT NULL,
    type varchar(255)  NOT NULL,
    source bytea  NOT NULL,
    CONSTRAINT movie_image_pk PRIMARY KEY (id)
);

-- Table: language
CREATE TABLE language (
    id serial  NOT NULL,
    name varchar(255)  NOT NULL,
    CONSTRAINT language_pk PRIMARY KEY (id)
);

-- Table: location
CREATE TABLE location (
    id serial  NOT NULL,
    name varchar(255)  NOT NULL,
    address varchar(255)  NOT NULL,
    CONSTRAINT location_pk PRIMARY KEY (id)
);

-- Table: movie
CREATE TABLE movie (
    id serial  NOT NULL,
    title varchar(255)  NOT NULL,
    release_year int  NOT NULL,
    duration interval  NOT NULL,
    description varchar(500)  NOT NULL,
    CONSTRAINT movie_pk PRIMARY KEY (id)
);

-- Table: movie_genre
CREATE TABLE movie_genre (
    id serial  NOT NULL,
    movie_id int  NOT NULL,
    genre_id int  NOT NULL,
    importance int  NULL,
    CONSTRAINT movie_genre_pk PRIMARY KEY (id)
);

-- Table: movie_language
CREATE TABLE movie_language (
    id serial  NOT NULL,
    movie_id int  NOT NULL,
    language_id int  NOT NULL,
    importance int  NULL,
    CONSTRAINT movie_language_pk PRIMARY KEY (id)
);

-- Table: movie_location
CREATE TABLE movie_location (
    id serial  NOT NULL,
    movie_id int  NOT NULL,
    location_id int  NOT NULL,
    importance int  NULL,
    CONSTRAINT movie_location_pk PRIMARY KEY (id)
);

-- Table: movie_person
CREATE TABLE movie_person (
    id serial  NOT NULL,
    movie_id int  NOT NULL,
    person_id int  NOT NULL,
    importance int  NULL,
    CONSTRAINT movie_person_pk PRIMARY KEY (id)
);

-- Table: official_site
CREATE TABLE official_site (
    id serial  NOT NULL,
    person_id int  NOT NULL,
    name varchar(255)  NOT NULL,
    url varchar(255)  NOT NULL,
    CONSTRAINT official_site_pk PRIMARY KEY (id)
);

-- Table: person
CREATE TABLE person (
    id serial  NOT NULL,
    full_name varchar(255)  NOT NULL,
    bio varchar(1000)  NULL,
    date_of_birth date  NULL,
    nationality varchar(255)  NULL,
    height varchar(255)  NULL,
    CONSTRAINT person_pk PRIMARY KEY (id)
);

-- Table: person_image
CREATE TABLE person_image (
    id serial  NOT NULL,
    image_id int  NOT NULL,
    person_id int  NOT NULL,
    CONSTRAINT person_image_pk PRIMARY KEY (id)
);

-- Table: person_video
CREATE TABLE person_video (
    id serial  NOT NULL,
    video_id int  NOT NULL,
    person_id int  NOT NULL,
    CONSTRAINT person_video_pk PRIMARY KEY (id)
);

-- Table: relative
CREATE TABLE relative (
    id serial  NOT NULL,
    person_id int  NOT NULL,
    person_relative_id int  NOT NULL,
    type varchar(255)  NOT NULL,
    CONSTRAINT relative_pk PRIMARY KEY (id)
);

-- Table: review
CREATE TABLE review (
    id serial  NOT NULL,
    movie_id int  NOT NULL,
    rating int  NOT NULL,
    comment_title varchar(255)  NULL,
    comment varchar(255)  NULL,
    anonymous_name varchar(255)  NOT NULL,
    timestamp timestamp  NOT NULL,
    CONSTRAINT review_pk PRIMARY KEY (id)
);

-- Table: role
CREATE TABLE role (
    id serial  NOT NULL,
    movie_id int  NOT NULL,
    person_id int  NOT NULL,
    type char(255)  NOT NULL,
    name char(255)  NOT NULL,
    CONSTRAINT role_pk PRIMARY KEY (id)
);

-- Table: video
CREATE TABLE video (
    id serial  NOT NULL,
    movie_id int  NOT NULL,
    role_id int  NOT NULL,
    type varchar(255)  NOT NULL,
    title varchar(255)  NOT NULL,
    url varchar(255)  NOT NULL,
    duration interval  NOT NULL,
    view_count bigint  NOT NULL,
    CONSTRAINT video_pk PRIMARY KEY (id)
);

-- Table: viewership
CREATE TABLE viewership (
    id serial  NOT NULL,
    video_id int  NOT NULL,
    timestamp timestamp  NOT NULL,
    CONSTRAINT viewership_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: Table_19_image (table: person_image)
ALTER TABLE person_image ADD CONSTRAINT Table_19_image
    FOREIGN KEY (image_id)
    REFERENCES image (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: image_movie (table: image)
ALTER TABLE image ADD CONSTRAINT image_movie
    FOREIGN KEY (movie_id)
    REFERENCES movie (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: image_role (table: image)
ALTER TABLE image ADD CONSTRAINT image_role
    FOREIGN KEY (role_id)
    REFERENCES role (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: movie_genre_genre (table: movie_genre)
ALTER TABLE movie_genre ADD CONSTRAINT movie_genre_genre
    FOREIGN KEY (genre_id)
    REFERENCES genre (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: movie_genre_movie (table: movie_genre)
ALTER TABLE movie_genre ADD CONSTRAINT movie_genre_movie
    FOREIGN KEY (movie_id)
    REFERENCES movie (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: movie_language_language (table: movie_language)
ALTER TABLE movie_language ADD CONSTRAINT movie_language_language
    FOREIGN KEY (language_id)
    REFERENCES language (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: movie_language_movie (table: movie_language)
ALTER TABLE movie_language ADD CONSTRAINT movie_language_movie
    FOREIGN KEY (movie_id)
    REFERENCES movie (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: movie_location_location (table: movie_location)
ALTER TABLE movie_location ADD CONSTRAINT movie_location_location
    FOREIGN KEY (location_id)
    REFERENCES location (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: movie_location_movie (table: movie_location)
ALTER TABLE movie_location ADD CONSTRAINT movie_location_movie
    FOREIGN KEY (movie_id)
    REFERENCES movie (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: movie_person_movie (table: movie_person)
ALTER TABLE movie_person ADD CONSTRAINT movie_person_movie
    FOREIGN KEY (movie_id)
    REFERENCES movie (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: movie_person_person (table: movie_person)
ALTER TABLE movie_person ADD CONSTRAINT movie_person_person
    FOREIGN KEY (person_id)
    REFERENCES person (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: official_site_person (table: official_site)
ALTER TABLE official_site ADD CONSTRAINT official_site_person
    FOREIGN KEY (person_id)
    REFERENCES person (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: person_image_person (table: person_image)
ALTER TABLE person_image ADD CONSTRAINT person_image_person
    FOREIGN KEY (person_id)
    REFERENCES person (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: person_video (table: person_video)
ALTER TABLE person_video ADD CONSTRAINT person_video
    FOREIGN KEY (video_id)
    REFERENCES video (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: person_video_person (table: person_video)
ALTER TABLE person_video ADD CONSTRAINT person_video_person
    FOREIGN KEY (person_id)
    REFERENCES person (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: relative_person (table: relative)
ALTER TABLE relative ADD CONSTRAINT relative_person
    FOREIGN KEY (person_id)
    REFERENCES person (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: relative_person_2 (table: relative)
ALTER TABLE relative ADD CONSTRAINT relative_person_2
    FOREIGN KEY (person_relative_id)
    REFERENCES person (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: review_movie (table: review)
ALTER TABLE review ADD CONSTRAINT review_movie
    FOREIGN KEY (movie_id)
    REFERENCES movie (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: role_movie (table: role)
ALTER TABLE role ADD CONSTRAINT role_movie
    FOREIGN KEY (movie_id)
    REFERENCES movie (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: role_person (table: role)
ALTER TABLE role ADD CONSTRAINT role_person
    FOREIGN KEY (person_id)
    REFERENCES person (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: video_movie (table: video)
ALTER TABLE video ADD CONSTRAINT video_movie
    FOREIGN KEY (movie_id)
    REFERENCES movie (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: video_role (table: video)
ALTER TABLE video ADD CONSTRAINT video_role
    FOREIGN KEY (role_id)
    REFERENCES role (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: viewership_video (table: viewership)
ALTER TABLE viewership ADD CONSTRAINT viewership_video
    FOREIGN KEY (video_id)
    REFERENCES video (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- End of file.

