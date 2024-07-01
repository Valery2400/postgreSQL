 -- CREATE DATABASE home_practice; // создание бызы данных

-- One-to_Many

CREATE TABLE manufacturers (
    manufacturer_id SERIAL PRIMARY KEY,
    name varchar(80)
);

CREATE TABLE cars (
    car_id SERIAL PRIMARY KEY,
    model varchar(80),
    manufacturer_id int REFERENCES manufacturers(manufacturer_id)
);

-- Many-to-Many

CREATE TABLE
  drivers (driver_id SERIAL PRIMARY KEY, name varchar(50));

CREATE TABLE
  cars (
    car_id SERIAL PRIMARY KEY,
    model varchar(50),
    manufacturer_id int REFERENCES manufacturers (manufacturer_id)
  );

CREATE TABLE
  ownerships (
    driver_id int REFERENCES drivers (driver_id),
    car_id int REFERENCES cars (car_id),
    PRIMARY KEY (driver_id, car_id)
  );

-- Заполнение таблицы manufacturers

INSERT INTO
  manufacturers (name)
VALUES
  ('Manufacturer 1'),
  ('Manufacturer 2');

-- Заполнение таблицы cars

INSERT INTO
  cars (model, manufacturer_id)
VALUES
  ('Car Model 1', 1),
  ('Car Model 2', 1),
  ('Car Model 3', 2);

-- Заполнение таблицы drivers

INSERT INTO
  drivers (name)
VALUES
  ('Driver 1'),
  ('Driver 2');

-- Заполнение таблицы ownerships

INSERT INTO
  ownerships (driver_id, car_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 1);
  
  --One-to-Many: Получение автомобилей вместе с их производителями
  
  SELECT 
    cars.model AS car_model,
    manufacturers.name AS manufacturer_name
FROM 
    cars
JOIN 
    manufacturers ON cars.manufacturer_id = manufacturers.manufacturer_id;
    
  --Many-to-Many: Получение водителей и автомобилей, которыми они владеют  
    
    SELECT 
    drivers.name AS driver_name,
    cars.model AS car_model
FROM 
    ownerships
JOIN 
    drivers ON ownerships.driver_id = drivers.driver_id
JOIN 
    cars ON ownerships.car_id = cars.car_id;

