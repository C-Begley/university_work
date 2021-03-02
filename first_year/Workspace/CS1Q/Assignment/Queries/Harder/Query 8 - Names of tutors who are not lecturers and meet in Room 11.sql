SELECT DISTINCT Forename, Surname 
FROM Tutor as T, Tutorial_Group as G, Staff as S
WHERE T.Staff_ID = S.Staff_ID AND G.Room = 11 AND S.Status != 'professor' 