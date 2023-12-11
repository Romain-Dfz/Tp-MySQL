-- Création de la table personne
CREATE TABLE personne (
    personne_id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(4) CHECK(titre IN ('M.', 'Mme')),
    prenom VARCHAR(50),
    nom VARCHAR(50),
    telephone VARCHAR(15),
    email VARCHAR(100) UNIQUE
);

-- Création de la table adresse
CREATE TABLE adresse (
    adresse_id INT PRIMARY KEY AUTO_INCREMENT,
    personne_id INT,
    rue VARCHAR(100),
    ville VARCHAR(50),
    code_postal VARCHAR(10),
    pays VARCHAR(50),
    FOREIGN KEY (personne_id) REFERENCES personne(personne_id)
);
