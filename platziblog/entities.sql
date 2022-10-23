-- Entity People
create table platziblog.people
(
    last_name  varchar(255)  null,
    first_name varchar(255)  null,
    address    varchar(255)  null,
    city       varchar(255)  null,
    person_id  int default 0 not null
        primary key
);

