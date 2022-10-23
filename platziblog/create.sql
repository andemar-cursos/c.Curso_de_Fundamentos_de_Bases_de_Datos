-- 24. Tablas independientes
create table platziblog.categorias
(
    id        int         null,
    categoria varchar(30) null,
    constraint categorias_pk
        primary key (id)
);

create table platziblog.usuarios
(
    id       int         null,
    login    varchar(30) not null,
    password varchar(32) not null,
    nickname varchar(40) not null,
    email    varchar(40) not null,
    constraint usuarios_pk
        primary key (id),
    constraint usuarios_pk
        unique (email)
);

create table platziblog.etiquetas
(
    id              int         null,
    nombre_etiqueta varchar(30) not null,
    constraint etiquetas_pk
        primary key (id)
);

