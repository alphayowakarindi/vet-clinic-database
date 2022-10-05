/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';


-- 1  Find all animals whose name ends in "mon".

SELECT * FROM animals WHERE name LIKE '%mon';

-- 2 List the name of all animals born between 2016 and 2019.-->
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';

-- 3  name of all animals that are neutered and have less than 3 escape attempts-->
SELECT * FROM animals WHERE neutered=TRUE escape_attempts < 3;


--4 List the date of birth of all animals named either "Agumon" or "Pikachu" -->
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';

-- 5  List name and escape attempts of animals that weigh more than 10.5kg-->
SELECT date_of_birth AND escape_attempts FROM animals WHERE weight_kg>10.5;

-- 6  Find all animals that are neutered.-->
SELECT * FROM animals WHERE neutered=TRUE;

-- 7   Find all animals not named Gabumon. -->
SELECT * FROM animals WHERE name<>'Gabumon';

-- 8 Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
 -->
 SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.37;

--  Transactions
BEGIN;

UPDATE animals SET species = 'unspecified';
ROLLBACK

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokeman' WHERE species IS NULL;
COMMIT;


BEGIN;

DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01'

SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT MAX(escape_attempts) FROM animals GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?

SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;

-- JOIN quieries
SELECT  name FROM owners INNER JOIN animals ON owners.id = animals.owner_id WHERE full_name = 'Melody Pond';
SELECT  name FROM owners INNER JOIN animals ON owners.id = animals.owner_id WHERE species_id = 1;
SELECT  full_name, name FROM owners FULL JOIN animals ON owners.id = animals.owner_id;
SELECT  COUNT(*) FROM owners INNER JOIN animals ON owners.id = animals.owner_id GROUP BY species_id;
SELECT name FROM animals INNER JOIN owners ON owners.id = animals.owner_id WHERE species_id = 2 AND full_name = 'Jennifer Orwell';
SELECT  name FROM owners INNER JOIN animals ON owners.id = animals.owner_id WHERE full_name = 'Dean Winchester' AND escape_attempts = 0;
SELECT full_name FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY full_name ORDER BY COUNT(*) DESC LIMIT (1);

-- Join tables queries

-- Who was the last animal seen by William Tatcher?
SELECT name from animals INNER JOIN visits ON visits.animal_id = animals.id WHERE visits.vet_id = 1 ORDER BY date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(name) from animals INNER JOIN visits ON visits.animal_id = animals.id WHERE visits.vet_id = 3;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON specializations.vet_id = vets.id LEFT JOIN species ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT name FROM animals INNER JOIN visits ON visits.animal_id = animals.id WHERE visits.vet_id = 3 AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT name FROM animals INNER JOIN visits ON visits.animal_id = animals.id GROUP BY animal_id, name ORDER BY COUNT(animal_id) DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT name FROM animals INNER JOIN visits ON visits.animal_id = animals.id WHERE visits.vet_id = 2 ORDER bY visits.date_of_visit ASC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name, vets.name, visits.date_of_visit FROM animals INNER JOIN visits ON visits.animal_id = animals.id INNER JOIN vets ON vets.id = visits.vet_id ORDER BY visits.date_of_visit LIMIT 1; 

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT COUNT(animal_id), species.name FROM visits JOIN animals ON animals.id = visits.animal_id JOIN species ON animals.species_id = species.id WHERE visits.vet_id = 2 GROUP BY species.name ORDER BY COUNT(visits.animal_id) DESC LIMIT 1;


