/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

---------------------------------------------------------

BEGIN;
UPDATE animals
SET species = 'unspecified';

select * from animals;

ROLLBACK;

select * from animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
select * from animals;
COMMIT;
select * from animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-1-1';
SAVEPOINT p_point;

UPDATE animals
SET weight_kg = weight_kg * -1;

select * from animals;

ROLLBACK TO p_point;

select * from animals;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

select * from animals;

COMMIT;

select * from animals;

select COUNT(*) FROM animals;
select COUNT(*) FROM animals WHERE escape_attempts = 0;
select AVG(weight_kg) FROM animals;

select neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;

select species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

select species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-12-31' GROUP BY species;

----------------------------------------------------------------------------

SELECT name FROM animals
JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.id) AS count
FROM species
LEFT JOIN animals ON species.id = animals.species_id
GROUP BY species.id;

SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

SELECT owners.full_name, COUNT(animals.id) AS count
FROM owners
JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.id
ORDER BY count DESC
LIMIT 1;