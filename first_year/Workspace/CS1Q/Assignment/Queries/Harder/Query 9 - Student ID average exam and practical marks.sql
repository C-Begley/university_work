SELECT Matric_No, AVG (Exam) as `Average Exam Marl`, AVG (Practical) AS `Average Practical Mark`
FROM Student as S , Takes as T
WHERE S.Matric_No = T.Student
GROUP BY S.Matric_No