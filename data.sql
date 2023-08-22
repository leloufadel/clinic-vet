/* Populate database with sample data. */



-- Animal: Agumon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23);

-- Animal: Gabumon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8);

-- Animal: Pikachu
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-01-07', 1, FALSE, 15.04);

-- Animal: Devimon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '2017-05-12', 5, TRUE, 11);


-- Insert all new animals in a single statement
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES
  (5, 'Charmander', '2020-02-08', 0, FALSE, -11, 'Fire'),
  (6, 'Plantmon', '2021-11-15', 2, TRUE, -5.7, 'Plant'),
  (7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13, 'Water'),
  (8, 'Angemon', '2005-06-12', 1, TRUE, -45, 'Angel'),
  (9, 'Boarmon', '2005-06-07', 7, TRUE, 20.4, 'Mammal'),
  (10, 'Blossom', '1998-10-13', 3, TRUE, 17, 'Flower'),
  (11, 'Ditto', '2022-05-14', 4, TRUE, 22, 'Transforming');
