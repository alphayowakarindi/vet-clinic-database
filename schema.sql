/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    name varchar(100)
);

CREATE TABLE animals (
    id INT, name VARCHAR(100), 
    date_of_birth DATE,  
    escape_attempts INT, 
    neutered BOOLEAN, 
    weight_kg  DECIMAL
);

-- After adding species column
-- ALTER TABLE animals ADD species varchar(255);
CREATE TABLE animals (
    id INT, name VARCHAR(100), 
    date_of_birth DATE,  
    escape_attempts INT, 
    neutered BOOLEAN, 
    weight_kg  DECIMAL
    species varchar(255)
);

-- Owners table
CREATE TABLE owners(
    id SERIAL PRIMARY KEY, 
    full_name VARCHAR (255), 
    age INT
);

-- Species table
CREATE TABLE species(
    id SERIAL PRIMARY KEY, 
    name VARCHAR (255)
);

-- Modify animals table
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD species_id INT references species(id);
ALTER TABLE animals ADD owner_id INT references owners(id);