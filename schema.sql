psql/* Database schema to keep the structure of entire database. */


CREATE DATABASE vet_clinic;

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(5,2)
);
------------------------------------------------
ALTER TABLE animals
ADD COLUMN species VARCHAR(50);
---------------------------------------------

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name TEXT,
  age INTEGER
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name TEXT
);

ALTER TABLE animals
DROP COLUMN species,
ADD COLUMN species_id INT,
ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_species
  FOREIGN KEY (species_id)
  REFERENCES species(id),
ADD CONSTRAINT fk_owner
  FOREIGN KEY (owner_id)
  REFERENCES owners(id);



