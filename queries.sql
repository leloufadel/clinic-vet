/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

-- -- 1. Find all animals whose name ends in "mon."
 SELECT * FROM animals WHERE name LIKE '%mon';

-- -- 2. List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- -- 3. List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

-- -- 4. List the date of birth of all animals named either "Agumon" or "Pikachu."
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

-- 5. List name and escape attempts of animals that weigh more than 10.5kg.
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

-- 6. Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = TRUE;

-- 7. Find all animals not named Gabumon.
SELECT * FROM animals WHERE name != 'Gabumon';

-- 8. Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equal precisely 10.4kg or 17.3kg).
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


-- Start a transaction
BEGIN;

-- Update the "species" column to "unspecified" for all records
UPDATE animals
SET species = 'unspecified';

-- To Verify the change
SELECT * FROM animals; -- Check the updated data

-- To Roll back the transaction to revert the change
ROLLBACK;

--To Verify that the "species" column is back to its original state
SELECT * FROM animals; 
--start transaction: 
BEGIN
-- Update animals with names ending in "mon"
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

-- Update animals without a species
UPDATE animals SET species = 'pokemon' WHERE species IS NULL OR species = ' ';
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
--after ROLLBACK
SELECT * FROM animals;
