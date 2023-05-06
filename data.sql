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
-----------------------------------------------------------------------

INSERT INTO vets (name, age, date_of_graduation)
VALUES 
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id)
VALUES 
(9,1),
(11,1),
(11,2),
(12,2);

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES
((SELECT id from animals WHERE name = 'Agumon'), (SELECT id from vets WHERE name = 'William Tatcher'), '2020-05-24');
((SELECT id from animals WHERE name = 'Agumon'), (SELECT id from vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),
((SELECT id from animals WHERE name = 'Gabumon'), (SELECT id from vets WHERE name = 'Jack Harkness'), '2021-02-02'),
((SELECT id from animals WHERE name = 'Pikachu'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2020-01-05'),
((SELECT id from animals WHERE name = 'Pikachu'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2020-03-08'),
((SELECT id from animals WHERE name = 'Pikachu'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2020-05-14'),
((SELECT id from animals WHERE name = 'Devimon'), (SELECT id from vets WHERE name = 'Stephanie Mendez'), '2021-05-04'),
((SELECT id from animals WHERE name = 'Charmander'), (SELECT id from vets WHERE name = 'Jack Harkness'), '2021-02-24'),
((SELECT id from animals WHERE name = 'Plantmon'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2019-12-21'),
((SELECT id from animals WHERE name = 'Plantmon'), (SELECT id from vets WHERE name = 'William Tatcher'), '2020-08-10'),
((SELECT id from animals WHERE name = 'Plantmon'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2021-04-07'),
((SELECT id from animals WHERE name = 'Squirtle'), (SELECT id from vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),
((SELECT id from animals WHERE name = 'Angemon'), (SELECT id from vets WHERE name = 'Jack Harkness'), '2020-10-03'),
((SELECT id from animals WHERE name = 'Angemon'), (SELECT id from vets WHERE name = 'Jack Harkness'), '2020-11-04'),
((SELECT id from animals WHERE name = 'Boarmon'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2019-01-24'),
((SELECT id from animals WHERE name = 'Boarmon'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2019-05-15'),
((SELECT id from animals WHERE name = 'Boarmon'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2020-02-27'),
((SELECT id from animals WHERE name = 'Boarmon'), (SELECT id from vets WHERE name = 'Maisy Smith'), '2020-08-03'),
((SELECT id from animals WHERE name = 'Blossom'), (SELECT id from vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),
((SELECT id from animals WHERE name = 'Blossom'), (SELECT id from vets WHERE name = 'William Tatcher'), '2021-01-11');