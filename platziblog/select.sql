-- 28. Estructura basica de un query
SELECT city, count(*) AS total
FROM people
WHERE active = true
GROUP BY city
ORDER BY total DESC
HAVING total >= 2;

SELECT * 
FROM posts
WHERE fecha_publicacion > '2024';