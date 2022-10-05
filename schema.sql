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
