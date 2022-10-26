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


-- 32. WHERE
-- Comparadores, menor, mayor, igual, etc etc.
SELECT *
FROM posts
WHERE id < 50;

SELECT *
FROM posts
WHERE id <= 50;

SELECT *
FROM posts
WHERE id >= 50;

SELECT *
FROM posts
WHERE estatus = 'activo';

SELECT *
FROM posts
WHERE estatus != 'activo';

SELECT *
FROM posts
WHERE id != 50;

-- Like, permite mostrar resultados, que en el interior de la data contenga x dato. Sin el % al principio, 
--el registro debe comenzar con X, sin el % al final el registro debe terminar con X.
SELECT *
FROM posts
WHERE titulo LIKE '%escandalo%';

SELECT *
FROM posts
WHERE titulo LIKE 'escandalo%';

SELECT *
FROM posts
WHERE titulo LIKE '%escandalo';

-- Podemos buscar fechas, con <>=, entre fechas con BETWEEN y AND (Tambien numeros) y buscar especificamente por
-- años, meses, dias, etc...
SELECT *
FROM posts
WHERE fecha_publicacion > '2025-01-01';

SELECT *
FROM posts
WHERE fecha_publicacion BETWEEN '2023-01-01' AND '2025-12-31';

SELECT *
FROM posts
WHERE id BETWEEN '50' AND '60';

SELECT *
FROM posts
WHERE YEAR(fecha_publicacion) BETWEEN '2023' AND '2024';

SELECT *
FROM posts
WHERE MONTH(fecha_publicacion) = '04';


-- 33. Where null and not null
-- Usuario_id que son nullos
SELECT *
FROM posts
WHERE usuario_id IS NULL;

-- Categoria_id que son nullos
SELECT *
FROM posts
WHERE posts.categoria_id IS NULL;

-- Usuario_id que no son nullos
SELECT *
FROM posts
WHERE usuario_id IS NOT NULL;

-- Varias filtros, incluyendo usuario_id no son nullos
SELECT *
FROM posts
WHERE usuario_id IS NOT NULL
    AND estatus = 'activo'
    AND id < 50
    AND categoria_id = 2
    AND YEAR(fecha_publicacion) = '2025';



-- 34. GROUP BY
SELECT estatus, COUNT(*) AS post_quantity
FROM posts
GROUP BY estatus;

SELECT YEAR(fecha_publicacion) AS post_year, COUNT(*) AS post_quantity
FROM posts
GROUP BY post_year;

SELECT MONTHNAME(fecha_publicacion) AS post_month, COUNT(*) AS post_quantity
FROM posts
GROUP BY post_month;

SELECT estatus, MONTHNAME(fecha_publicacion) AS post_month, COUNT(*) AS post_quantity
FROM posts
GROUP BY estatus, post_month;

-- 35. Order by & having
SELECT *
FROM posts
ORDER BY fecha_publicacion ASC;

SELECT *
FROM posts
ORDER BY fecha_publicacion DESC;

SELECT *
FROM posts
ORDER BY titulo ASC;

SELECT *
FROM posts
ORDER BY usuario_id ASC;

SELECT *
FROM posts
ORDER BY fecha_publicacion ASC
LIMIT 5;

SELECT MONTHNAME(fecha_publicacion) AS post_month, estatus, COUNT(*) AS post_quantity
FROM posts
GROUP BY estatus, post_month
HAVING post_quantity > 1
ORDER BY post_month;

-- 36. Nested queries
SELECT new_table_projection.date, COUNT(*) AS posts_count
FROM (
    SELECT DATE(MIN(fecha_publicacion)) AS date, YEAR(fecha_publicacion) AS post_year
    FROM posts
    GROUP BY post_year
     ) AS new_table_projection
GROUP BY new_table_projection.date
ORDER BY date ASC;


SELECT *
FROM posts
WHERE fecha_publicacion = (
    SELECT MAX(fecha_publicacion)
    FROM posts
    )