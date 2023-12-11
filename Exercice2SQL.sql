-- Création de la table compte
CREATE TABLE compte (
    compte_id INT AUTO_INCREMENT,
    pseudo VARCHAR(50) NOT NULL,
    mot_de_passe VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    date_creation DATETIME NOT NULL,
    PRIMARY KEY (compte_id),
    UNIQUE (pseudo, email)
);

-- Création de la table compte_connexion
CREATE TABLE compte_connexion (
    compte_id INT NOT NULL,
    derniere_connexion DATETIME NOT NULL,
    PRIMARY KEY (compte_id, derniere_connexion), -- Correction : ajout de la colonne dans la clé primaire
    FOREIGN KEY (compte_id) REFERENCES compte(compte_id) ON DELETE CASCADE
);
