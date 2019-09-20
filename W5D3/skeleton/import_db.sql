  -- DROP TABLE cattoys;
  -- DROP TABLE cats;
  -- DROP TABLE toys;

CREATE TABLE cats (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  color VARCHAR,
  breed VARCHAR

);

CREATE TABLE toys (
  id SERIAL PRIMARY KEY,
  price INTEGER,
  color VARCHAR,
  name VARCHAR
);

CREATE TABLE cattoys (
  id SERIAL PRIMARY KEY,
  cat_id INTEGER,
  toy_id INTEGER,
  FOREIGN KEY (cat_id) REFERENCES cats(id),
  FOREIGN KEY (toy_id) REFERENCES toys(id)
);

-- inserts

-- cats
INSERT INTO
  cats 
  (name, color, breed)
VALUES
  ('Snowball', 'white', 'persian'),
  ('Lucky', 'black', 'short-hair'),
  ('Tiger', 'striped', 'tabby'),
  ('Shortie', 'grey', 'munchkin'),
  ('Lion', 'dark-grey', 'maine coon')
  ;

-- toys
INSERT INTO 
  toys
  (price, color, name)
VALUES
  (3, 'red', 'small jingle ball'),
  (8, 'grey', 'mouse toy'),
  (50, 'chrome', 'electric mouse toy'),
  (30000, 'beige', 'human slave'),
  (700, 'taupe', 'warming cat tree')
  ;

-- cattoys
INSERT INTO
  cattoys
  (cat_id, toy_id)
VALUES
  
  ((SELECT id
  FROM cats
  WHERE name = 'Snowball'),
  (SELECT id
  FROM toys
  WHERE name = 'small jingle ball')),
  
  ((SELECT id
  FROM cats
  WHERE name = 'Lucky'),
  (SELECT id
  FROM toys
  WHERE name = 'mouse toy')),
  
  ((SELECT id
  FROM cats
  WHERE name = 'Tiger'),
  (SELECT id
  FROM toys
  WHERE name = 'electric mouse toy')),
  
  ((SELECT id
  FROM cats
  WHERE name = 'Shortie'),
  (SELECT id
  FROM toys
  WHERE name = 'human slave')),
  
  ((SELECT id
  FROM cats
  WHERE name = 'Lion'),
  (SELECT id
  FROM toys
  WHERE name = 'warming cat tree'))
  ;

