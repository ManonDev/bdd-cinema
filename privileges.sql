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