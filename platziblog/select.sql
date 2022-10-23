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

-- 31. Sentencia FROM

-- left join
SELECT *
FROM usuarios
LEFT JOIN posts ON usuarios.id = posts.usuario_id;

SELECT *
FROM usuarios
LEFT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;

-- Right join
SELECT *
FROM usuarios
RIGHT JOIN posts ON usuarios.id = posts.usuario_id;

SELECT *
FROM usuarios
RIGHT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;

-- Inner Join
SELECT *
FROM usuarios
INNER JOIN posts ON usuarios.id = posts.usuario_id;

-- Union
SELECT *
FROM usuarios
LEFT JOIN posts ON usuarios.id = posts.usuario_id
UNION
SELECT *
FROM usuarios
RIGHT JOIN posts ON usuarios.id = posts.usuario_id;

-- Simetric diference
SELECT *
FROM usuarios
LEFT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL
UNION
SELECT *
FROM usuarios
RIGHT JOIN posts ON usuarios.id = posts.usuario_id
WHERE posts.usuario_id IS NULL;