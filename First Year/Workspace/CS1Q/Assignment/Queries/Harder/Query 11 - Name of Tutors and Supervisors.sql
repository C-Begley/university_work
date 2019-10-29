SELECT CONCAT_WS(' ', S.Forename, S.Surname) as `Name`, CONCAT_WS(' ', M.Forename, M.Surname) as `Manager Name`
From Staff as S, Staff as M, Tutor as T
WHERE T.Staff_ID = S.Staff_ID AND S.Manager= M.Staff_ID 
