SELECT Forename, Surname, Exam
FROM Student as S, Course as C, Takes as T
WHERE C.Course = T.Course AND S.Matric_No = T.Student AND C.Title = 'CS-1Q' 
ORDER BY Surname ASC
