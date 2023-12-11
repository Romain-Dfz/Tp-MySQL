-- Création de la table role
CREATE TABLE role (
    role_id INT AUTO_INCREMENT,
    libelle VARCHAR(50) NOT NULL,
    PRIMARY KEY (role_id)
);

-- Création de la table compte
CREATE TABLE compte (
    compte_id INT AUTO_INCREMENT,
    pseudo VARCHAR(50) NOT NULL,
    mot_de_passe VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    date_creation DATETIME NOT NULL,
    derniere_connexion DATETIME,
    PRIMARY KEY (compte_id),
    UNIQUE (email)
);

-- Création de la table compte_role
CREATE TABLE compte_role (
    compte_id INT NOT NULL,
    role_id INT NOT NULL,
    date_ajout DATETIME NOT NULL,
    PRIMARY KEY (compte_id, role_id),
    FOREIGN KEY (compte_id) REFERENCES compte (compte_id),
    FOREIGN KEY (role_id) REFERENCES role (role_id)
);
