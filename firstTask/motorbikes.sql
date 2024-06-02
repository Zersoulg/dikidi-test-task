
-- create
CREATE TABLE motorbikes_types (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name CHAR(255) NOT NULL
);

CREATE TABLE motorbikes (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name CHAR(255) NOT NULL,
  is_discontinued TINYINT(1) NOT NULL,
  motorbikes_types_id INTEGER,
  FOREIGN KEY (motorbikes_types_id)
        REFERENCES motorbikes_types(id)
);

-- insert
INSERT INTO motorbikes_types (name) VALUES ('cruiser');
INSERT INTO motorbikes_types (name) VALUES ('scooter');

INSERT INTO motorbikes (name, is_discontinued, motorbikes_types_id) VALUES ('BMW', 0, 1);
INSERT INTO motorbikes (name, is_discontinued, motorbikes_types_id) VALUES ('Mercedes', 0, 1);
INSERT INTO motorbikes (name, is_discontinued, motorbikes_types_id) VALUES ('Java', 1, 1);
INSERT INTO motorbikes (name, is_discontinued, motorbikes_types_id) VALUES ('Honda', 1, 2);
INSERT INTO motorbikes (name, is_discontinued, motorbikes_types_id) VALUES ('Suzuki', 0, 2);

-- fetch 
SELECT mt.name, COUNT(m.id) AS num_bikes
     FROM motorbikes m 
LEFT JOIN motorbikes_types mt ON m.motorbikes_types_id = mt.id
where m.is_discontinued = 0
GROUP BY mt.name
