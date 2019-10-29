SELECT Forename, Surname, AVG (Exam) as `Average Exam Marl`, AVG (Practical) AS `Average Practical Mark`
FROM Student as S , Takes as T
WHERE S.Matric_No = T.Student AND (S.Surname = 'Smith' OR S.Surname = 'Saunders')
GROUP BY S.Matric_No