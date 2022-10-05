/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');


INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals VALUES (2, 'Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals VALUES (3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals VALUES (4, 'Devimon.', '2017-05-12', 5, TRUE, 11);

-- Insert after adding species column
INSERT INTO animals VALUES (5, 'Charmander', '2020-02-08', 0, FALSE, -11);
INSERT INTO animals VALUES (6, 'Plantmon', '2021-11-15', 2, TRUE, -5.7);
INSERT INTO animals VALUES (7, 'Skuirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals VALUES (8, 'Angemon', '2005-06-12', 1, TRUE, -45);
INSERT INTO animals VALUES (9, 'Boarmon', '2005-06-07', 7, TRUE, 20.4);
INSERT INTO animals VALUES (10, 'Blossom', '1998-10-13', 3, TRUE, 17);
INSERT INTO animals VALUES (11, 'Ditto', '2022-05-14', 4, TRUE, 22);


-- Insert into the owners table
INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES ('Jeniffer Orwel', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38);

-- Insert into the species table
INSERT INTO species(name) VALUES ('Pokemon');
INSERT INTO species(name) VALUES ('Digimon');

-- Modify your inserted animals to include owner information (owner_id)
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN  ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN  ('Devimon.', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN  ('Charmander', 'Skuirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN  ('Angemon', 'Boarmon');

-- Modify animals table so it includes the species_id value
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

-- Insert into the vets table
INSERT INTO vets(name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 38);






