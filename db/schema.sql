DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS candidate;

CREATE TABLE post
(
    id   SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE candidate
(
    id   SERIAL PRIMARY KEY,
    name TEXT
);