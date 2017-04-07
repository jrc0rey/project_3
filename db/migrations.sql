-- psql -a -f migrations.sql

CREATE DATABASE decision_maker;

\c decision_maker;

CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(255), password_digest VARCHAR(255));

CREATE TABLE questions(id SERIAL PRIMARY KEY, question VARCHAR(255), created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, image_url VARCHAR(255), user_id INT references users(id), username VARCHAR(255),
good INT, bad INT, creepy INT);

-- CREATE TABLE comments(id SERIAL PRIMARY KEY, comment VARCHAR(255), good INT, bad INT, creepy INT);