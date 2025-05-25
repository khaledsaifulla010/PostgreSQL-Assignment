
-- Rangers Table --
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);


-- Species Table --
CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) CHECK (conservation_status IN ('Endangered', 'Vulnerable', 'Historic'))
);


-- Sightings Table --
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(species_id),
    ranger_id INT REFERENCES rangers(ranger_id),
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(100) NOT NULL,
    notes TEXT
);


-- Rangers Sample Data (INSERTS) --
INSERT INTO rangers(ranger_id, name, region) VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');
SELECT * FROM rangers


-- Species Sample Data (INSERTS) --
INSERT INTO species(species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');
SELECT * FROM species

-- Sightings Sample Data (INSERTS) --
INSERT INTO sightings(sighting_id, species_id, ranger_id, sighting_time, location, notes) VALUES
(1, 1, 1, '2024-05-10 07:45:00', 'Peak Ridge', 'Camera trap image captured'),
(2, 2, 2, '2024-05-12 16:20:00', 'Bankwood Area', 'Juvenile seen'),
(3, 3, 3, '2024-05-15 09:10:00', 'Bamboo Grove East', 'Feeding observed'),
(4, 1, 2, '2024-05-18 18:30:00', 'Snowfall Pass', NULL);
SELECT * FROM sightings


-------------------------------------------- Problem 1 --------------------------------------------
INSERT INTO rangers ( ranger_id,name, region) VALUES
(4,'Derek Fox', 'Coastal Plains');

-------------------------------------------- Problem 2 --------------------------------------------
SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;