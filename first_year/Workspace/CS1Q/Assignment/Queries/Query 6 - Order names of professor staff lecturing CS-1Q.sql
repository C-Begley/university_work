SELECT Forename, Surname
FROM Staff as S, Taught as T 
WHERE S.Staff_ID = T.Staff_ID AND S.Status = 'professor'
