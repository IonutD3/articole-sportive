-- Articole Sportive de Varf
-- Oracle Database
-- 01_create_tables.sql

-- Drop in reverse dependency order (safe for a clean rebuild).
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE obiect CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE comanda CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE client CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE angajat CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE inventar CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE departament CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE depozit CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE produs CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE regiune CASCADE CONSTRAINTS';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE regiune (
    id_regiune   VARCHAR2(5) CONSTRAINT regiune_pk PRIMARY KEY,
    nume_regiune VARCHAR2(30) NOT NULL
);

CREATE TABLE produs (
    id_produs         VARCHAR2(5) CONSTRAINT produs_pk PRIMARY KEY,
    nume_produs       VARCHAR2(50) NOT NULL,
    descriere_scurta VARCHAR2(200),
    pret_sugerat      NUMBER(10,2),
    unitate_de_vanzare VARCHAR2(10),
    CONSTRAINT produs_pret_ck CHECK (pret_sugerat >= 0)
);

CREATE TABLE depozit (
    id_depozit      VARCHAR2(5) CONSTRAINT depozit_pk PRIMARY KEY,
    adresa          VARCHAR2(100),
    stat            VARCHAR2(50),
    tara            VARCHAR2(50),
    oras            VARCHAR2(50),
    cod_zip         VARCHAR2(10),
    numar_de_telefon VARCHAR2(20),
    id_regiune      VARCHAR2(5) NOT NULL,
    CONSTRAINT depozit_regiune_fk
        FOREIGN KEY (id_regiune) REFERENCES regiune(id_regiune)
);

CREATE TABLE departament (
    id_departament VARCHAR2(5) CONSTRAINT departament_pk PRIMARY KEY,
    nume_departament VARCHAR2(50) NOT NULL,
    id_regiune     VARCHAR2(5) NOT NULL,
    CONSTRAINT departament_regiune_fk
        FOREIGN KEY (id_regiune) REFERENCES regiune(id_regiune)
);

CREATE TABLE inventar (
    id_inventar       VARCHAR2(5) CONSTRAINT inventar_pk PRIMARY KEY,
    cantitate_in_stoc NUMBER(10) NOT NULL,
    punct_de_ordine   NUMBER(10) NOT NULL,
    maxim_in_stoc     NUMBER(10) NOT NULL,
    stoc_epuizat      VARCHAR2(3) NOT NULL,
    data_restocari    DATE,
    id_produs         VARCHAR2(5) NOT NULL,
    id_depozit        VARCHAR2(5) NOT NULL,
    CONSTRAINT inventar_produs_fk
        FOREIGN KEY (id_produs) REFERENCES produs(id_produs),
    CONSTRAINT inventar_depozit_fk
        FOREIGN KEY (id_depozit) REFERENCES depozit(id_depozit),
    CONSTRAINT inventar_stoc_ck
        CHECK (cantitate_in_stoc >= 0 AND punct_de_ordine >= 0 AND maxim_in_stoc >= 0),
    CONSTRAINT inventar_epuizat_ck
        CHECK (stoc_epuizat IN ('da', 'nu'))
);

CREATE TABLE angajat (
    id_angajat       VARCHAR2(5) CONSTRAINT angajat_pk PRIMARY KEY,
    prenume_angajat  VARCHAR2(30) NOT NULL,
    nume_angajat     VARCHAR2(30) NOT NULL,
    data_de_incepere DATE,
    titlu            VARCHAR2(50),
    salariu          NUMBER(10,2),
    procent_comision NUMBER(5,2),
    comentarii       VARCHAR2(200),
    id_departament   VARCHAR2(5) NOT NULL,
    id_depozit       VARCHAR2(5) NOT NULL,
    CONSTRAINT angajat_departament_fk
        FOREIGN KEY (id_departament) REFERENCES departament(id_departament),
    CONSTRAINT angajat_depozit_fk
        FOREIGN KEY (id_depozit) REFERENCES depozit(id_depozit),
    CONSTRAINT angajat_salariu_ck CHECK (salariu >= 0),
    CONSTRAINT angajat_comision_ck CHECK (procent_comision BETWEEN 0 AND 100)
);

CREATE TABLE client (
    id_client       VARCHAR2(5) CONSTRAINT client_pk PRIMARY KEY,
    nume_client     VARCHAR2(100) NOT NULL,
    adresa          VARCHAR2(100),
    oras            VARCHAR2(50),
    stat            VARCHAR2(50),
    cod_zip         VARCHAR2(10),
    tara            VARCHAR2(50),
    numar_de_telefon VARCHAR2(20),
    id_regiune      VARCHAR2(5) NOT NULL,
    id_angajat      VARCHAR2(5),
    CONSTRAINT client_regiune_fk
        FOREIGN KEY (id_regiune) REFERENCES regiune(id_regiune),
    CONSTRAINT client_angajat_fk
        FOREIGN KEY (id_angajat) REFERENCES angajat(id_angajat)
);

CREATE TABLE comanda (
    id_comanda     VARCHAR2(5) CONSTRAINT comanda_pk PRIMARY KEY,
    data_comenzi   DATE,
    data_expedieri DATE,
    tipul_de_plata VARCHAR2(20),
    id_client      VARCHAR2(5) NOT NULL,
    id_angajat     VARCHAR2(5) NOT NULL,
    CONSTRAINT comanda_client_fk
        FOREIGN KEY (id_client) REFERENCES client(id_client),
    CONSTRAINT comanda_angajat_fk
        FOREIGN KEY (id_angajat) REFERENCES angajat(id_angajat),
    CONSTRAINT comanda_date_ck
        CHECK (data_expedieri IS NULL OR data_comenzi IS NULL OR data_expedieri >= data_comenzi)
);

CREATE TABLE obiect (
    id_obiect          VARCHAR2(5) CONSTRAINT obiect_pk PRIMARY KEY,
    pret               NUMBER(10,2) NOT NULL,
    cantitate          NUMBER(10) NOT NULL,
    cantitate_expediata NUMBER(10) NOT NULL,
    id_produs          VARCHAR2(5) NOT NULL,
    id_comanda        VARCHAR2(5) NOT NULL,
    CONSTRAINT obiect_produs_fk
        FOREIGN KEY (id_produs) REFERENCES produs(id_produs),
    CONSTRAINT obiect_comanda_fk
        FOREIGN KEY (id_comanda) REFERENCES comanda(id_comanda),
    CONSTRAINT obiect_pret_ck CHECK (pret >= 0),
    CONSTRAINT obiect_cantitate_ck CHECK (cantitate >= 0),
    CONSTRAINT obiect_expediata_ck CHECK (cantitate_expediata >= 0 AND cantitate_expediata <= cantitate)
);
