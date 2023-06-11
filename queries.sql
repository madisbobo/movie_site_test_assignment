-------------------------------------------
-- ************* HOME VIEW ************* --
-------------------------------------------

-- Search bar
SELECT m.title, m.release_year
FROM movie m
WHERE LOWER(m.title) LIKE LOWER('%search_term%');

SELECT p.full_name, p.nationality
FROM person p
WHERE LOWER(p.full_name) LIKE LOWER('%search_term%');


--10 most popular (based ON page views) movie trailers from last 2 months
SELECT m.title, v.title, v.url, v.duration, v.view_count
FROM movie m
JOIN video v on m.id = v.movie_id AND v.type = 'Trailer'
ORDER BY v.view_count DESC
LIMIT 10;


--10 highest rated movies from last 2 months
SELECT m.title, m.release_year, avg_rating, poster_source
FROM movie m
         JOIN(SELECT r.movie_id, ROUND(AVG(r.rating), 1) AS avg_rating
              FROM review r
              WHERE r.timestamp >= NOW() - INTERVAL '2 months'
              GROUP BY r.movie_id) r ON m.id = r.movie_id
         JOIN (SELECT i.movie_id, i.source AS poster_source
               FROM image i
               WHERE i.type = 'Poster') i ON m.id = i.movie_id
ORDER BY avg_rating DESC
LIMIT 10;


-- List of 100 all-time highest rated movies
SELECT m.title, m.release_year, STRING_AGG(g.name, ', '), avg_rating, poster_source
FROM movie m
         JOIN movie_genre mg ON m.id = mg.movie_id
         JOIN genre g ON mg.genre_id = g.id
         JOIN(SELECT r.movie_id, ROUND(AVG(r.rating), 1) AS avg_rating
              FROM review r
              GROUP BY r.movie_id) r ON m.id = r.movie_id
         JOIN (SELECT i.movie_id, i.source AS poster_source
               FROM image i
               WHERE i.type = 'Poster') i ON m.id = i.movie_id
GROUP BY m.title, m.release_year, avg_rating, poster_source
ORDER BY avg_rating DESC;


--------------------------------------------
-- ************* MOVIE VIEW ************* --
--------------------------------------------

/*Movie details p1 */
SELECT m.title, m.description, mv.url AS trailer_url, mv.duration AS trailer_duration, rating_count, avg_rating
FROM movie m
         JOIN(SELECT v.movie_id, v.url, v.duration
              FROM video v
              WHERE v.movie_id = 1
                AND v.type = 'Trailer') mv ON m.id = mv.movie_id
         JOIN(SELECT r.movie_id, COUNT(*) AS rating_count, ROUND(AVG(r.rating), 1) AS avg_rating
              FROM review r
              WHERE r.movie_id = 1
              GROUP BY r.movie_id) r ON m.id = r.movie_id;


/*Movie details p2*/
SELECT
       -- Release year
       (SELECT m.release_year
        FROM movie m
        WHERE m.id = 1) AS release_year,
       -- Duration
       (SELECT m.duration
        FROM movie m
        WHERE m.id = 1) AS duration,
       -- Genres
       (SELECT STRING_AGG(genre_name, ', ') AS genre
        FROM (SELECT g.name as genre_name
              FROM movie_genre mg
                       JOIN genre g ON g.id = mg.genre_id
              WHERE mg.movie_id = 1
              ORDER BY mg.importance) AS genre) AS genre,
       -- Director
       (SELECT p.full_name AS director
        FROM role r
        JOIN person p ON r.person_id = p.id
        WHERE r.movie_id = 1 AND LOWER(r.type) = 'director') AS director,
       -- Writer
       (SELECT rp.full_name AS writer
        FROM role r
        JOIN person rp ON r.person_id = rp.id
        WHERE r.movie_id = 1 AND LOWER(r.type) = 'writer') AS writer,
       -- Actors
       (SELECT STRING_AGG(full_name, ', ') AS top_actors
        FROM (SELECT p.full_name
              FROM person p
                       JOIN movie_person mp ON p.id = mp.person_id
                       JOIN role r ON p.id = r.person_id
              WHERE mp.movie_id = 1 AND LOWER(r.type) = 'actor'
              ORDER BY mp.importance ASC
              LIMIT 3) AS top_actors) AS top_actors,
       -- Languages
       (SELECT STRING_AGG(l_name, ', ') AS languages
        FROM (SELECT l.name as l_name
              FROM movie_language ml
                       JOIN language l ON l.id = ml.language_id
              WHERE movie_id = 1
              ORDER BY ml.importance) AS languages) AS languages,
       -- Filming locations
       (SELECT STRING_AGG(l.name, ', ')
        FROM movie_location ml
        JOIN location l ON l.id = ml.location_id
        WHERE ml.movie_id = 1) AS filming_locations;


-- Movie gallery with short video clips (including trailers)
SELECT v.title, v.duration, v.url, v.type
FROM video v
WHERE v.movie_id = 1;


-- Movie gallery with images
SELECT i.type, i.source
FROM image i
WHERE i.movie_id = 1;


-- List of related persons grouped by person roles
SELECT r.type, r.name, p.full_name, mp.importance
FROM person p
JOIN movie_person mp ON p.id = mp.person_id
JOIN role r ON p.id = r.person_id
WHERE r.movie_id = 1 AND mp.movie_id = 1
ORDER BY r.type, mp.importance ASC;


-- Reviews table + possibility to anonymously rate the movie with commenting support (no user accounts are required)
SELECT r.rating, r.comment_title, r.comment, r.anonymous_name, r.timestamp
FROM review r
WHERE r.movie_id = 1
ORDER BY r.timestamp DESC;

INSERT INTO review (id, movie_id, rating, comment_title, comment, anonymous_name, timestamp)
VALUES (DEFAULT, 1, 4, 'Good movie', 'This was a good movie', 'John', NOW());


--------------------------------------------
-- ************* PERSON VIEW ************* --
--------------------------------------------

-- Person details p1
SELECT p.full_name, p.bio, i.source as profile_image
FROM person p
    JOIN person_image pi ON p.id = pi.person_id
    JOIN image i ON pi.image_id = i.id
    WHERE pi.person_id = 1 AND i.type = 'Profile photo';


-- Person details p2
SELECT p.date_of_birth, p.nationality, p.height,
       STRING_AGG('<a href="' || os.url || '">' || os.name || '</a>', ', ') AS official_sites,
       STRING_AGG(r.relative_name || ' (' || r.type || ')', ', ') AS relatives
FROM person p
LEFT JOIN official_site os ON p.id = os.person_id
LEFT JOIN (
    SELECT p.full_name AS relative_name, r.type
    FROM relative r
    JOIN person p ON r.person_relative_id = p.id
    WHERE r.person_id = 1
    UNION
    SELECT p.full_name AS relative_name, r.type
    FROM relative r
    JOIN person p ON r.person_id = p.id
    WHERE r.person_relative_id = 1
) r ON 1=1
WHERE p.id = 1
GROUP BY p.date_of_birth, p.nationality, p.height;


-- List of movies related to this person (including roles)
SELECT i.source as movie_poster, m.title || ' (' || r.name || ') ' as movie_and_role, m.release_year
FROM role r
JOIN movie m ON r.movie_id = m.id
JOIN image i ON m.id = i.movie_id
WHERE r.person_id = 1 AND lower(i.type) = 'poster'
ORDER BY m.release_year DESC;


-- Image gallery
SELECT i.source as image_gallery
FROM image i
JOIN person_image pi on i.id = pi.image_id
WHERE pi.person_id = 1;


-- Video gallery
SELECT v.title, v.duration, v.type, v.url
FROM video v
JOIN person_video pv on v.id = pv.video_id
WHERE pv.person_id = 1;

