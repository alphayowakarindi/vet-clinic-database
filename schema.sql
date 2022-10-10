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


-- Vets table
CREATE TABLE vets(
    id SERIAL PRIMARY KEY, 
    name VARCHAR (255),
    age INT,
    date_of_graduation DATE
);

-- Specializations table
CREATE TABLE specializations(
    id SERIAL PRIMARY KEY, 
    species_id INT references species(id),
    vet_id INT references vets(id)
);

-- Visits table
CREATE TABLE visits(
    id SERIAL PRIMARY KEY, 
    animal_id INT references animals(id),
    vet_id INT references vets(id),
    date_of_visit DATE
);

-- Performance audit
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

-- Decreasing query speed
CREATE INDEX visits_of_animal_idx ON visits (animal_id); 
CREATE INDEX email_index ON owners(email); 
CREATE INDEX vet_id_index ON visits(vet_id ASC);