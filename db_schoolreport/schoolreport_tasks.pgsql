SELECT *
FROM STUDENT;

SELECT *
FROM GRADES;

SELECT *
FROM SUBJECTS;

-- q1: Calculate the average score of each subject scored by the students

WITH 
score_sheet AS
(
    SELECT 
        name as subject, student_name as student, score
    FROM 
        subjects S JOIN grades G ON S.code=G.subject_code
)

SELECT
     subject, ROUND(AVG(score),2) as avg
FROM 
    score_sheet
GROUP BY
    subject;

-- q2: Create a table indicating students as PASS or FAIL on the condition that their score is greater than the average

WITH 
score_sheet AS
(
    SELECT 
        name as subject, student_name as student, score
    FROM 
        subjects S 
        JOIN grades G ON S.code=G.subject_code
),
avg_scores AS
(
    SELECT
         subject, ROUND(AVG(score),2) as avg
    FROM 
        score_sheet
    GROUP BY
        subject
)

SELECT
    student,ss.subject,score,avg,
    CASE
        WHEN score > avg 
            THEN 'PASS'
        ELSE 'FAIL'
    END as status
FROM
    score_sheet ss, avg_scores av
WHERE
    ss.subject = av.subject;


