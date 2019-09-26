CREATE SCHEMA employee;

CREATE TABLE pracownik (
id INT (3) auto_increment PRIMARY KEY,
imie VARCHAR (20),
nazwisko VARCHAR (30),
wypłata DECIMAL (7,2),
data_urodzenia DATE,
stanowisko VARCHAR (20),
stanowisko_szczegoly_id INT(3),
adres_id INT(3)
);

DROP TABLE pracownik;

INSERT INTO pracownik (imie, nazwisko, wypłata, data_urodzenia, stanowisko)
VALUES ('Bartosz', 'Galiński', '2400.23', '1992-04-07', 'Robotnik');

INSERT INTO pracownik (imie, nazwisko, wypłata, data_urodzenia, stanowisko)
VALUES ('Anna', 'Kowalska', 3400.23, '1981-03-03', 'Produkcja');
INSERT INTO pracownik (imie, nazwisko, wypłata, data_urodzenia, stanowisko)
VALUES ('Jarosław', 'Abacki', 7400.23, '1970-01-07', 'Zarząd');
INSERT INTO pracownik (imie, nazwisko, wypłata, data_urodzenia, stanowisko)
VALUES ('Adam', 'Nowak', 2600.23, '1990-10-07', 'Robotnik');
INSERT INTO pracownik (imie, nazwisko, wypłata, data_urodzenia, stanowisko)
VALUES ('Grażyna', 'Należna', 9400.23, '1989-07-20', 'Zarząd');
INSERT INTO pracownik (imie, nazwisko, wypłata, data_urodzenia, stanowisko)
VALUES ('Stefan', 'Kowalski', 3400.23, '1991-06-07', 'Produkcja');

SELECT * FROM pracownik
ORDER BY nazwisko;

SELECT * FROM pracownik
WHERE stanowisko = 'Zarząd';

SELECT * FROM pracownik
WHERE (SELECT EXTRACT(YEAR FROM NOW())) - (SELECT EXTRACT(YEAR FROM data_urodzenia))  > 30;

SELECT *, wypłata*1.1 AS 'wypłata' FROM pracownik
WHERE stanowisko = 'Produkcja';

SELECT SUM(wypłata) FROM pracownik;

CREATE TABLE stanowisko (
id INT(3) auto_increment PRIMARY KEY,
nazwa_stanowiska VARCHAR (50),
opis VARCHAR (300),
wypłata_na_stanowisku DECIMAL (5,2)
);

DROP TABLE stanowisko;

CREATE TABLE adres (
id INT(3) auto_increment PRIMARY KEY,
ulica_NR_DOMU_MIESZKANIA VARCHAR (100),
kod_pocztowy VARCHAR (6),
miejscowosc VARCHAR(20)
);

DROP TABLE adres;
 
 SELECT * FROM pracownik p JOIN stanowisko s ON p.stanowisko_szczegoly_id = s.id;
 SELECT * FROM pracownik p JOIN adres a ON p.adres_id = a.id;
