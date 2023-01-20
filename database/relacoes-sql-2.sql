-- Active: 1674131451325@@127.0.0.1@3306
CREATE TABLE users (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  create_at TEXT DEFAULT(DATETIME('now', 'localtime')) NOT NULL
);

SELECT * FROM users;

SELECT DATETIME("now", "localtime");

DROP TABLE users;

INSERT INTO users (id, name, email, password)
VALUES
("U001", "Indio", "indio@gmail.com", "indio123"),
("U002", "Marcelinho", "marcelo@gmail.com", "marcelo123"),
("U003", "Vinicius", "vini@gmail.com", "vini123");

--criar tabela relação
CREATE TABLE follows (
  follower_id TEXT NOT NULL,
  followed_id TEXT NOT NULL,
  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (followed_id) REFERENCES users(id)
);

INSERT INTO follows (follower_id, followed_id)
VALUES
("U001", "U002"), 
("U001", "U003"), 
("U002", "U001"); 

SELECT * FROM follows;

SELECT * FROM users
INNER JOIN follows
ON follows.follower_id = users.id
INNER JOIN users AS usersFollowed
ON follows.followed_id = usersFollowed.id;

--REMOVENDO AMBIGUIDADES
SELECT 
users.id AS usersId,
users.name,
users.email,
users.password,
users.create_at AS createAt,
follows.follower_id AS folowerId,
follows.followed_id AS followedId,
usersFollowed.name AS nameFollowed
FROM users
INNER JOIN follows
ON follows.follower_id = users.id
INNER JOIN users AS usersFollowed
ON follows.followed_id = usersFollowed.id;

