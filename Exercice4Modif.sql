-- Création de la table professeur
CREATE TABLE professeur (
    id INT PRIMARY KEY AUTO_INCREMENT,
    prenom VARCHAR(50),
    nom VARCHAR(50),
    num_classe INT,
    num_departement INT,
    email VARCHAR(100) UNIQUE,
    telephone VARCHAR(15) UNIQUE
);

-- Création de la table etudiant
CREATE TABLE etudiant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    prenom VARCHAR(50),
    nom VARCHAR(50),
    telephone VARCHAR(15) NOT NULL,
    num_classe INT,
    date_obtention_diplome DATE
);

-- Création de la table d'association entre etudiants et professeurs
CREATE TABLE etudiant_professeur (
    id_etudiant INT,
    id_professeur INT,
    PRIMARY KEY (id_etudiant, id_professeur),
    FOREIGN KEY (id_etudiant) REFERENCES etudiant(id),
    FOREIGN KEY (id_professeur) REFERENCES professeur(id)
);

-- Ajout des contraintes
ALTER TABLE etudiant
ADD CONSTRAINT chk_telephone_min
CHECK (LENGTH(telephone) >= 1);

ALTER TABLE professeur
ADD CONSTRAINT pk_professeur PRIMARY KEY (id),
ADD CONSTRAINT uk_telephone_prof UNIQUE (telephone),
ADD CONSTRAINT uk_email_prof UNIQUE (email);

ALTER TABLE etudiant
ADD CONSTRAINT pk_etudiant PRIMARY KEY (id),
ADD CONSTRAINT uk_telephone_etudiant UNIQUE (telephone),
ADD CONSTRAINT uk_email_etudiant UNIQUE (email);
