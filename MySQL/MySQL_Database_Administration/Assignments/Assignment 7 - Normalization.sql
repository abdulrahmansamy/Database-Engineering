USE onlinelearningschool;

SELECT * FROM courses
;

SELECT * FROM course_ratings
;

SELECT * FROM course_ratings_summaries
;


SELECT DISTINCT
	course_id,
	course_name,
    instructor
FROM course_ratings
;

CREATE TABLE course_ratings_normalized
SELECT
	rating_id,
    course_id,
    star_rating
FROM course_ratings
;

SELECT * FROM course_ratings_normalized;




ALTER TABLE `onlinelearningschool`.`course_ratings_normalized` 
ADD PRIMARY KEY (`rating_id`),
ADD INDEX `course_id_idx` (`course_id` ASC) VISIBLE;
;

ALTER TABLE `onlinelearningschool`.`course_ratings_normalized` 
ADD CONSTRAINT `course_id`
  FOREIGN KEY (`course_id`)
  REFERENCES `onlinelearningschool`.`courses` (`course_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  



SELECT * FROM courses;
SELECT * FROM course_ratings;
SELECT * FROM course_ratings_normalized;



SELECT rating_id,courses.course_id,course_name,instructor,star_rating 
FROM course_ratings_normalized
INNER JOIN courses ON courses.course_id = course_ratings_normalized.course_id
ORDER BY rating_id
;

SELECT course_ratings_normalized.course_id,course_name,instructor,star_rating 
FROM course_ratings_normalized
INNER JOIN courses ON courses.course_id = course_ratings_normalized.course_id
WHERE course_ratings_normalized.rating_id = 7
;



SELECT * FROM course_ratings_summaries;

SELECT course_id,COUNT(course_id),ROUND(AVG(star_rating),1)
FROM course_ratings_normalized
GROUP BY course_id;