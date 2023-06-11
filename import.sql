-- Insert genres
INSERT INTO genre (name)
VALUES
    ('Action'),
    ('Comedy'),
    ('Drama'),
    ('Horror'),
    ('Sci-Fi');

-- Insert languages
INSERT INTO language (name)
VALUES
    ('English'),
    ('Spanish'),
    ('French'),
    ('German'),
    ('Japanese');

-- Insert locations
INSERT INTO location (name, address)
VALUES
    ('Los Angeles', '123 Main St'),
    ('New York', '456 Elm St'),
    ('London', '789 Oak St'),
    ('Paris', '567 Pine St'),
    ('Tokyo', '890 Maple St');

-- Insert movies
INSERT INTO movie (title, release_year, duration, description)
VALUES
    ('Movie 1', 2022, '01:30:00', 'Description for Movie 1'),
    ('Movie 2', 2023, '02:00:00', 'Description for Movie 2'),
    ('Movie 3', 2021, '01:45:00', 'Description for Movie 3'),
    ('Movie 4', 2023, '01:50:00', 'Description for Movie 4'),
    ('Movie 5', 2022, '02:15:00', 'Description for Movie 5');

-- Insert movie_genre relationships
INSERT INTO movie_genre (movie_id, genre_id, importance)
VALUES
    (1, 1, 1),
    (1, 2, 2),
    (2, 2, 1),
    (2, 3, 2),
    (3, 3, 1),
    (3, 4, 2),
    (4, 4, 1),
    (4, 5, 2),
    (5, 5, 1),
    (5, 1, 2);

-- Insert movie_language relationships
INSERT INTO movie_language (movie_id, language_id, importance)
VALUES
    (1, 1, 1),
    (1, 2, 2),
    (2, 2, 1),
    (2, 3, 2),
    (3, 3, 1),
    (3, 4, 2),
    (4, 4, 1),
    (4, 5, 2),
    (5, 5, 1),
    (5, 1, 2);

-- Insert movie_location relationships
INSERT INTO movie_location (movie_id, location_id, importance)
VALUES
    (1, 1, 1),
    (1, 2, 2),
    (2, 2, 1),
    (2, 3, 2),
    (3, 3, 1),
    (3, 4, 2),
    (4, 4, 1),
    (4, 5, 2),
    (5, 5, 1),
    (5, 1, 2);

-- Insert persons
INSERT INTO person (full_name, bio, date_of_birth, nationality, height)
VALUES
    ('Person 1', 'Bio for Person 1', '1990-01-01', 'USA', '180 cm'),
    ('Person 2', 'Bio for Person 2', '1985-02-02', 'UK', '175 cm'),
    ('Person 3', 'Bio for Person 3', '1995-03-03', 'France', '170 cm'),
    ('Person 4', 'Bio for Person 4', '1992-04-04', 'Germany', '185 cm'),
    ('Person 5', 'Bio for Person 5', '1991-05-05', 'Japan', '160 cm');


-- Insert data into the relative table
INSERT INTO relative (person_id, person_relative_id, type)
VALUES (1, 2, 'sibling'),
       (1, 3, 'cousin'),
       (2, 4, 'mother');


-- Insert roles
INSERT INTO role (movie_id, type, name, person_id)
VALUES
    (1, 'Actor', 'Role 1', 1),
    (1, 'Actress', 'Role 2', 2),
    (2, 'Actor', 'Role 2', 2),
    (2, 'Actress', 'Role 3', 3),
    (3, 'Actor', 'Role 3', 3),
    (3, 'Actress', 'Role 4', 4),
    (4, 'Actor', 'Role 4', 4),
    (4, 'Actress', 'Role 5', 5),
    (5, 'Actor', 'Role 5', 5),
    (5, 'Actress', 'Role 1', 1);


-- Insert images
INSERT INTO image (movie_id, role_id, type, source)
VALUES
    (1, 1, 'Poster', E'\\x0123456789ABCDEF'),
    (1, 1, 'Backdrop', E'\\xFEDCBA9876543210'),
    (1, 1, 'Profile photo', E'\\xFEDCBA9876543210'),
    (2, 2, 'Poster', E'\\x0123456789ABCDEF'),
    (2, 2, 'Backdrop', E'\\xFEDCBA9876543210'),
    (2, 2, 'Profile photo', E'\\xFEDCBA9876543210'),
    (3, 3, 'Poster', E'\\x0123456789ABCDEF'),
    (3, 3, 'Backdrop', E'\\xFEDCBA9876543210'),
    (4, 4, 'Poster', E'\\x0123456789ABCDEF'),
    (4, 4, 'Backdrop', E'\\xFEDCBA9876543210'),
    (5, 5, 'Poster', E'\\x0123456789ABCDEF'),
    (5, 5, 'Backdrop', E'\\xFEDCBA9876543210');

INSERT INTO image (movie_id, role_id, type, source)
VALUES
    (1, 1, 'poster', E'\\x89504e470d0a1a0a'),
    (1, 2, 'still', E'\\x89504e470d0a1a0a'),
    (2, 1, 'poster', E'\\x89504e470d0a1a0a'),
    (2, 2, 'still', E'\\x89504e470d0a1a0a'),
    (3, 1, 'poster', E'\\x89504e470d0a1a0a'),
    (3, 2, 'still', E'\\x89504e470d0a1a0a'),
    (4, 1, 'poster', E'\\x89504e470d0a1a0a'),
    (4, 2, 'still', E'\\x89504e470d0a1a0a');

-- Insert person images
INSERT INTO person_image (image_id, person_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 3),
    (6, 3),
    (7, 4),
    (8, 4);

-- Insert movie_person relationships
INSERT INTO movie_person (movie_id, importance, person_id)
VALUES
    (1, 1, 1),
    (1, 2, 2),
    (2, 1, 2),
    (2, 2, 3),
    (3, 1, 3),
    (3, 2, 4),
    (4, 1, 4),
    (4, 2, 5),
    (5, 1, 5),
    (5, 2, 1);


-- Insert videos
INSERT INTO video (movie_id, role_id, type, title, url, duration, view_count)
VALUES
    (1, 1, 'Trailer', 'Trailer 1', 'https://example.com/trailer1', '00:02:30', 1000),
    (1, 1, 'Clip', 'Clip 1', 'https://example.com/clip1', '00:01:30', 500),
    (2, 2, 'Trailer', 'Trailer 2', 'https://example.com/trailer2', '00:02:00', 800),
    (2, 2, 'Clip', 'Clip 2', 'https://example.com/clip2', '00:01:45', 400),
    (3, 3, 'Trailer', 'Trailer 3', 'https://example.com/trailer3', '00:02:15', 900),
    (3, 3, 'Clip', 'Clip 3', 'https://example.com/clip3', '00:01:20', 600),
    (4, 4, 'Trailer', 'Trailer 4', 'https://example.com/trailer4', '00:02:30', 1100),
    (4, 4, 'Clip', 'Clip 4', 'https://example.com/clip4', '00:01:30', 300),
    (5, 5, 'Trailer', 'Trailer 5', 'https://example.com/trailer5', '00:02:00', 700),
    (5, 5, 'Clip', 'Clip 5', 'https://example.com/clip5', '00:01:45', 200);

INSERT INTO person_video (video_id, person_id) VALUES (2, 1);

-- Insert viewerships
INSERT INTO viewership (video_id, timestamp)
VALUES
    (1, '2023-01-01 10:00:00'),
    (1, '2023-01-02 11:30:00'),
    (1, '2023-01-03 14:15:00'),
    (2, '2023-01-04 16:45:00'),
    (2, '2023-01-05 19:30:00'),
    (2, '2023-01-06 21:00:00'),
    (3, '2023-01-07 09:30:00'),
    (3, '2023-01-08 12:00:00'),
    (3, '2023-01-09 15:45:00'),
    (4, '2023-01-10 18:00:00'),
    (4, '2023-01-11 20:30:00'),
    (4, '2023-01-12 22:15:00'),
    (5, '2023-01-13 10:30:00'),
    (5, '2023-01-14 13:15:00'),
    (5, '2023-01-15 16:00:00');


-- Insert reviews
INSERT INTO review (movie_id, rating, comment_title, comment, anonymous_name, timestamp)
VALUES
    (1, 4, 'Great movie!', 'Really enjoyed the plot.', 'Anonymous1', '2023-06-01 10:00:00'),
    (1, 3, 'Decent film', 'Some parts were confusing.', 'Anonymous2', '2023-05-02 11:30:00'),
    (1, 5, 'Fantastic!', 'Highly recommended.', 'Anonymous3', '2023-01-03 14:15:00'),
    (2, 4, 'Solid performance', 'The acting was impressive.', 'Anonymous4', '2023-06-04 16:45:00'),
    (2, 3, 'Not my cup of tea', 'Didn''t resonate with me.', 'Anonymous5', '2023-04-05 19:30:00'),
    (2, 5, 'Visual delight', 'Stunning visuals throughout.', 'Anonymous6', '2023-03-03 21:00:00'),
    (3, 3, 'Interesting storyline', 'Kept me engaged.', 'Anonymous7', '2023-05-07 09:30:00'),
    (3, 4, 'Impressive performances', 'The actors did a great job.', 'Anonymous8', '2023-05-08 12:00:00'),
    (3, 3, 'Slow-paced', 'A bit long but still enjoyable.', 'Anonymous9', '2023-05-09 15:45:00'),
    (4, 5, 'Masterpiece!', 'Absolutely loved every minute.', 'Anonymous10', '2023-05-10 18:00:00'),
    (4, 4, 'Highly recommended', 'Must-watch for all movie buffs.', 'Anonymous11', '2023-05-11 20:30:00'),
    (4, 4, 'Great chemistry', 'The actors had great chemistry.', 'Anonymous12', '2023-05-12 22:15:00'),
    (5, 3, 'Average movie', 'Had its moments, but not outstanding.', 'Anonymous13', '2023-05-13 10:30:00'),
    (5, 3, 'Some good moments', 'Certain scenes were enjoyable.', 'Anonymous14', '2023-05-14 13:15:00'),
    (5, 2, 'Disappointing ending', 'Ending left me unsatisfied.', 'Anonymous15', '2023-05-15 16:00:00');

COMMIT;
