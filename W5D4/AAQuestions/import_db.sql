PRAGMA foreign_keys = ON;
-- let's drop some tables
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

-- create tables
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255),
  lname VARCHAR(255)
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255),
  body TEXT,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)  
);

CREATE TABLE follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT,
  parent_id INTEGER,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- seed tables
INSERT INTO
  users(fname, lname)
VALUES
  ('Rosy', 'Donald'),
  ('Scyther', 'Lonely'),
  ('Penta', 'Gram')
  ;

INSERT INTO
  questions(title, body, user_id)
VALUES
  ('Pokemen allowed?', 'Do wings count as clothes? Pls help.', 2),
  ('Where is the lost and found?', 'I can''t find the lost and found. I left my pokedex on a table last night.', 1),
  ('Will I be able to clone instagram after this course?','I''ll name it Pentagram. After the devil. HAHA', 3)
  ;

INSERT INTO
  likes(user_id, question_id)
VALUES
  (2, 1),
  (2, 3),
  (3, 3)
  ;

INSERT INTO
  follows(user_id, question_id)
VALUES
  (3, 3),
  (2, 2),
  (2, 3),
  (1, 2)
  ;

INSERT INTO
  replies(body, parent_id, question_id, user_id)
VALUES
  ('Scyther you''re so cute!!!!!!!!!!@#!%!^#%!', NULL, 1, 1),
  ('Awww shucks', 1, 1, 2),
  ('eww gross', 1, 1, 3),
  ('hey that''s mean', 3, 1, 2)
  ;
