CREATE TABLE professeur (
    id INT PRIMARY KEY AUTO_INCREMENT,
    prenom VARCHAR(50),
    nom VARCHAR(50),
    numero_classe INT,
    numero_departement INT,
    email VARCHAR(100) UNIQUE,
    telephone VARCHAR(15) UNIQUE
);

CREATE TABLE etudiant (
    id INT PRIMARY KEY AUTO_INCREMENT,
    prenom VARCHAR(50),
    nom VARCHAR(50),
    telephone VARCHAR(15) NOT NULL,
    numero_classe INT,
    date_obtention_diplome DATE
);

CREATE TABLE etudiant_professeur (
    id_etudiant INT,
    id_professeur INT,
    PRIMARY KEY (id_etudiant, id_professeur),
    FOREIGN KEY (id_etudiant) REFERENCES etudiant(id),
    FOREIGN KEY (id_professeur) REFERENCES professeur(id)
);

-- Contrainte pour le numéro de téléphone unique dans la table etudiant
ALTER TABLE etudiant
ADD CONSTRAINT unique_telephone_etudiant UNIQUE (telephone);

-- Contrainte pour le numéro de téléphone unique dans la table professeur
ALTER TABLE professeur
ADD CONSTRAINT unique_telephone_professeur UNIQUE (telephone);

-- Contrainte pour l'email unique dans la table professeur
ALTER TABLE professeur
ADD CONSTRAINT unique_email_professeur UNIQUE (email);

-- Contrainte pour le minimum d'un numéro de téléphone pour chaque étudiant
ALTER TABLE etudiant
MODIFY telephone VARCHAR(15) NOT NULL;

-- Insérer des données dans la table professeur
INSERT INTO professeur (prenom, nom, numero_classe, numero_departement, email, telephone)
VALUES ('John', 'Doe', 1, 101, 'john.doe@example.com', '123456789');

-- Insérer des données dans la table etudiant
INSERT INTO etudiant (prenom, nom, telephone, numero_classe, date_obtention_diplome)
VALUES ('Alice', 'Smith', '987654321', 2, '2023-01-01');

-- Insérer des données dans la table etudiant_professeur
INSERT INTO etudiant_professeur (id_etudiant, id_professeur)
VALUES (1, 1);
