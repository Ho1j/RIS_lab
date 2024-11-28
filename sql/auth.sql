SELECT * FROM internal_users
WHERE login='$login'
UNION
SELECT * FROM external_users
WHERE login='$login'
