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

-- Start a transaction
BEGIN;

-- Delete all animals born after Jan 1st, 2022
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction
SAVEPOINT sp1;

-- Update all animals' weight to be their weight multiplied by -1
UPDATE animals
SET weight_kg = -1 * weight_kg;

-- Rollback to the savepoint
ROLLBACK TO sp1;

-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals
SET weight_kg = -1 * weight_kg
WHERE weight_kg < 0;

-- Commit transaction
COMMIT;
----------------------------------------------
-- How many animals are there : 
SELECT COUNT(*) AS total_Number_animals FROM animals;
--How many animals have never tried to escape?
SELECT COUNT(*) AS total_Neverescape FROM animals WHERE escape_attempts = 0;
-- the average weight of animals.
SELECT AVG (weight_kg) AS AVG_WEIGHT FROM animals;
----
SELECT neutered, SUM(escape_attempts) AS total_escape_attempts FROM animals GROUP BY neutered;
--- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weigh FROM animals GROUP BY species;
--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
Select species, AVG(escape_attempts) 
FROM animals 
where date_of_birth between '1990-01-01' AND '2000-12-31' GROUP BY species;

-----Write queries (using JOIN) to answer the following questions:
---What animals belong to Melody Pond?

select animals.name, owners.full_name
from animals 
inner join owners on 
animals.owner_id = owners.id
where owners.full_name ='Melody Pond'
;
---second question : 
select animals.name, species.name
from animals 
inner join species on 
animals.species_id = species.id
where species.name ='Pokemon'
;
---List all owners and their animals, remember to include those that don't own any animal.
select * from owners 
left join animals on 
owners.id = animals.owner_id
;
---How many animals are there per species?
select species.name, count (*) from animals 
inner join species on 
animals.species_id = species.id
Group by species.name
;
--List all Digimon owned by Jennifer Orwell.

select animals.name, species.name, owners.full_name
from animals inner join species on species.id = animals.species_id
inner join owners on owners.id = animals.owner_id
where owners.full_name = 'Jennifer Orwell' and species.name ='Digimon'
;
--List all animals owned by Dean Winchester that haven't tried to escape.

select animals.name, owners.full_name, animals.escape_attempts
from animals
inner join owners on owners.id = animals.owner_id
where owners.full_name = 'Dean Winchester' and animals.escape_attempts =0
;

--Who owns the most animals?

select owners.full_name, count(animals.id) as max_number
from owners
inner join animals on owners.id = animals.owner_id
Group by owners.id order by max_number desc
limit 1;
