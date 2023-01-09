--TERMINAL SQL
-- CREATION DE LA BDD
CREATE DATABASE IF NOT EXISTS cinema CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- USE cinema;


-- CREATION DES TABLES
CREATE TABLE IF NOT EXISTS users (
        id_users INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
        lastname VARCHAR(30) NOT NULL,
        firstname VARCHAR(30) NOT NULL,
        email VARCHAR(30) NOT NULL,
        password VARCHAR(60) NOT NULL,
        creationDate DATETIME DEFAULT CURRENT_TIMESTAMP
    ) ENGINE=InnoDB;

    CREATE TABLE IF NOT EXISTS customers (
        id_customers INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
        dateOfBirth DATE NOT NULL,
        isStudent BOOLEAN DEFAULT FALSE NOT NULL,
        users_id INT(11) NOT NULL,
        prices_id INT(11) NOT NULL
    )  ENGINE=InnoDB;

    CREATE TABLE IF NOT EXISTS admin (
        id_admin INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
        users_id INT(11) NOT NULL,
        theater_id INT(11) NOT NULL
    ) ENGINE=InnoDB;

    CREATE TABLE IF NOT EXISTS theater (
        id_theater INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
        name VARCHAR(30) NOT NULL,
        address VARCHAR(30),
        city VARCHAR(30),
        quantity_room INT(11) NOT NULL
    ) ENGINE=InnoDB;
    
    CREATE TABLE IF NOT EXISTS hall (
        id_hall INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
        roomNumber INT(11) NOT NULL,
        capacity_place INT(11) NOT NULL,
        theater_id INT(11) NOT NULL
    ) ENGINE=InnoDB;

    CREATE TABLE IF NOT EXISTS movie (
        id_movie INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
        title VARCHAR(50) NOT NULL,
        release_date DATETIME NOT NULL,
        duration TIME NOT NULL,
        genre VARCHAR(30) NOT NULL,
        directed_by VARCHAR(30) NOT NULL
    )  ENGINE=InnoDB;

    CREATE TABLE IF NOT EXISTS cinema_session (
        id_cinema_session INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
        date DATE NOT NULL,
        hours TIME NOT NULL,
        movie_id INT(11) NOT NULL,
        hall_id INT(11) NOT NULL
    ) ENGINE=InnoDB;


    CREATE TABLE IF NOT EXISTS prices (
        id_prices INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
        label VARCHAR(30) NOT NULL,
        price FLOAT NOT NULL
    )  ENGINE=InnoDB;

    CREATE TABLE IF NOT EXISTS booking (
        id_booking INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
        no_ticket INT(11) NOT NULL,
        number_person INT(11) NOT NULL,
        total_price FLOAT NOT NULL,
        booking_date DATE NOT NULL,
        customers_id INT(11) NOT NULL,
        cinemaSession_id INT(11) NOT NULL,
        payment_id INT(11) NOT NULL
    ) ENGINE=InnoDB;
    
    CREATE TABLE IF NOT EXISTS payment (
        id_payment INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
        paymentType VARCHAR(30) NOT NULL
    ) ENGINE=InnoDB;


-- CALCUL DE L'AGE
-- Création d'une vue afin de sauvegarder une commande sql pour le calcul de l'age
CREATE VIEW age AS
    -> (SELECT
    ->     id_customers,
    ->     dateOfBirth,
    ->     ROUND(DATEDIFF(now(), dateOfBirth) / 365)
    -> FROM customers
    -> );

-- PRIVILEGES


mysqldump -u root -p cinema > C:\mysql\cinema.sql

-- https://buzut.net/maitrisez-mysql-en-cli/



-- CREATE SUPERADMIN
CREATE USER 'superAdmin'@'localhost' IDENTIFIED BY 'root';
-- CREATE ADMIN FOR THEATER
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'root';
--ADD PRIVILEGES
GRANT ALL PRIVILEGES ON cinema TO 'superAdmin'@'localhost'; 
GRANT ALL PRIVILEGES ON cinema.cinema_session TO 'admin'@'localhost'; 
-- Rechargement de la table des privilèges
FLUSH PRIVILEGES;
-- VERIFIER LES PRIVILEGES
show grants for "superAdmin"@"localhost";
show grants for "admin"@"localhost";


 SOURCE C:\Users\manon\Desktop\dump.sql

