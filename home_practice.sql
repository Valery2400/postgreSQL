 -- CREATE DATABASE home_practice; // создание бызы данных

-- One-to_Many

CREATE TABLE manufacturer (
    manufacturer_id SERIAL PRIMARY KEY,
    name varchar(80)
);

CREATE TABLE car (
    car_id SERIAL PRIMARY KEY,
    model varchar(80),
    manufacturer_id int REFERENCES manufacturer(manufacturer_id)
);

-- Many-to-Many

CREATE TABLE
  driver (driver_id SERIAL PRIMARY KEY, name varchar(50));

CREATE TABLE
  car (
    car_id SERIAL PRIMARY KEY,
    model varchar(50),
    manufacturer_id int REFERENCES manufacturer (manufacturer_id)
  );

CREATE TABLE
  ownership (
    driver_id int REFERENCES driver (driver_id),
    car_id int REFERENCES car (car_id),
    PRIMARY KEY (driver_id, car_id)
  );

-- Заполнение таблицы manufacturer

INSERT INTO
  manufacturer (name)
VALUES
  ('Manufacturer 1'),
  ('Manufacturer 2');

-- Заполнение таблицы car

INSERT INTO
  car (model, manufacturer_id)
VALUES
  ('Car Model 1', 1),
  ('Car Model 2', 1),
  ('Car Model 3', 2);

-- Заполнение таблицы driver

INSERT INTO
  driver (name)
VALUES
  ('Driver 1'),
  ('Driver 2');

-- Заполнение таблицы ownership

INSERT INTO
  ownership (driver_id, car_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 1);
  
  --One-to-Many: Получение автомобилей вместе с их производителями
  
  SELECT 
    car.model AS car_model,
    manufacturer.name AS manufacturer_name
FROM 
    car
JOIN 
    manufacturer ON cars.manufacturer_id = manufacturer.manufacturer_id;
    
  --Many-to-Many: Получение водителей и автомобилей, которыми они владеют  
    
    SELECT 
    driver.name AS driver_name,
    car.model AS car_model
FROM 
    ownership
JOIN 
    driver ON ownership.driver_id = driver.driver_id
JOIN 
    car ON ownership.car_id = car.car_id;
    
--    WHERE driver.driver_id = 1;

