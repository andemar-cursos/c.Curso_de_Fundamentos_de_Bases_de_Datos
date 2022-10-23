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

-- 29. SELECT
SELECT *
FROM posts;


SELECT titulo, fecha_publicacion, estatus
FROM posts;


SELECT titulo AS encabezado, fecha_publicacion AS publicado_en, estatus AS estado
FROM posts;


SELECT COUNT(*) AS total_posts
FROM posts;