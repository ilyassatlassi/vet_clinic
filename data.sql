/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES
  ('Agumon', '2020-02-03', 0, TRUE, 10.23),
  ('Gabumon', '2018-11-15', 2, TRUE, 8),
  ('Pikachu', '2021-01-07', 1, FALSE, 15.04),
  ('Devimon', '2017-05-12', 5, TRUE, 11)
  (5, 'Charmander', '2020-02-08', 0, 'false', -11),
  (6, 'Plantmon', '2021-11-15', 2, 'true', -5.7),
  (7, 'Squirtle', '1993-04-02', 3, 'false', -12.13),
  (8, 'Angemon', '2005-06-12', 1, 'true', -45),
  (9, 'Boarmon', '2005-06-07', 7, 'true', 20.4),
  (10, 'Blossom', '1998-10-13', 3, 'true', 17),
  (11, 'Ditto', '2022-05-14', 4, 'true', 22)
  ;
--------------------------------------------------------------------------------

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');
BEGIN;
UPDATE animals
SET species_id = species.id
FROM species
WHERE species.name = 'Digimon' AND animals.name LIKE '%mon';
UPDATE animals
SET species_id = species.id
FROM species
WHERE species.name = 'Pokemon' AND animals.species_id IS NULL;
COMMIT;


BEGIN;
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name = 'Agumon' AND owners.full_name = 'Sam Smith';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Gabumon', 'Pikachu') AND owners.full_name = 'Jennifer Orwell';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Charmander', 'Squirtle', 'Blossom') AND owners.full_name = 'Melody Pond';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Angemon', 'Boarmon') AND owners.full_name = 'Dean Winchester';
UPDATE animals
SET owner_id = owners.id
FROM owners
WHERE animals.name IN ('Devimon', 'Plantmon') AND owners.full_name = 'Bob';
COMMIT;