-- MODIFICATIONS (avec ALTER TABLE) DES TABLES EN AJOUTANT (ADD) DES CLEFS ETRANGERES (FOREIGN KEY)

--------------------------------------------------------
-- TABLE CUSTOMERS

ALTER TABLE customers 
    ADD CONSTRAINT fk_customers_users_id 
    FOREIGN KEY (users_id) 
    REFERENCES users(id_users) 
    ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE customers 
    ADD CONSTRAINT fk_prices_id 
    FOREIGN KEY (prices_id) 
    REFERENCES prices(id_prices) 
    ON DELETE RESTRICT ON UPDATE CASCADE;

--------------------------------------------------------
-- TABLE ADMIN

ALTER TABLE admin 
    ADD CONSTRAINT fk_admin_users_id 
    FOREIGN KEY (users_id) 
    REFERENCES users(id_users) 
    ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE admin 
    ADD CONSTRAINT fk_theater_id 
    FOREIGN KEY (theater_id) 
    REFERENCES theater(id_theater) 
    ON DELETE RESTRICT ON UPDATE CASCADE;

--------------------------------------------------------
-- TABLE HALL

ALTER TABLE hall 
    ADD CONSTRAINT fk_hall_theater_id 
    FOREIGN KEY (theater_id) 
    REFERENCES theater(id_theater) 
    ON DELETE RESTRICT ON UPDATE CASCADE;

--------------------------------------------------------
-- TABLE CINEMA SESSION

ALTER TABLE cinema_session 
    ADD CONSTRAINT fk_movie_id 
    FOREIGN KEY (movie_id) 
    REFERENCES movie(id_movie) 
    ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE cinema_session 
    ADD CONSTRAINT fk_hall_id 
    FOREIGN KEY (hall_id) 
    REFERENCES hall(id_hall) 
    ON DELETE RESTRICT ON UPDATE CASCADE;

--------------------------------------------------------
-- TABLE BOOKING

ALTER TABLE booking 
    ADD CONSTRAINT fk_cinemaSession_id 
    FOREIGN KEY (cinemaSession_id) 
    REFERENCES cinema_session(id_cinema_session) 
    ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE booking 
    ADD CONSTRAINT fk_customers_id 
    FOREIGN KEY (customers_id) 
    REFERENCES customers(id_customers) 
    ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE booking 
    ADD CONSTRAINT fk_payment_id 
    FOREIGN KEY (payment_id) 
    REFERENCES payment(id_payment) 
    ON DELETE RESTRICT ON UPDATE CASCADE;

--------------------------------------------------------

-- JOINTURES
 SELECT * FROM customers JOIN prices ON customers.prices_id = id_prices;3
 -- Affiche un tableau répertoriant la liste des utilisateurs en fonction des prix

