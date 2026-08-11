-- Articole Sportive de Varf
-- Oracle Database
-- 02_insert_data.sql

-- Regions
INSERT INTO regiune (id_regiune, nume_regiune) VALUES ('1', 'AMERICA DE NORD');
INSERT INTO regiune (id_regiune, nume_regiune) VALUES ('2', 'AMERICA DE SUD');
INSERT INTO regiune (id_regiune, nume_regiune) VALUES ('3', 'AFRICA');
INSERT INTO regiune (id_regiune, nume_regiune) VALUES ('4', 'ASIA');
INSERT INTO regiune (id_regiune, nume_regiune) VALUES ('5', 'EUROPA');

-- Products
INSERT INTO produs VALUES ('1', 'benzi de alergat', 'foarte accesibila la pret si foarte compacta', 600, 'buc');
INSERT INTO produs VALUES ('2', 'gantere', 'foarte comfortabile si cu un numar foarte mare de discuri', 300, 'buc');
INSERT INTO produs VALUES ('3', 'bicicleta', 'dispune de 7 trepte de viteza', 400, 'buc');
INSERT INTO produs VALUES ('4', 'proteine', 'anduranta si masa musculara in doar 3 saptamani de sala', 80, 'buc');
INSERT INTO produs VALUES ('5', 'haltere', 'rezistente la shock si cu prindere anti-alunecare', 500, 'buc');

-- Warehouses
INSERT INTO depozit VALUES ('1', 'BROOCKLIN 34', 'CA', 'USA', 'SAN FRANCISCO', '08540', '0740011962', '1');
INSERT INTO depozit VALUES ('2', 'Dolce Gabana 21', 'PZ', 'Brazilia', 'State of Bahia', '12572', '0740157962', '2');
INSERT INTO depozit VALUES ('3', 'Uvuewue 3', 'CP', 'Africa', 'Zimbabwe', '21152', '0741215215', '3');
INSERT INTO depozit VALUES ('4', 'Xin Jin Ping 14', 'XA', 'China', 'Beijing', '62181', '0741468911', '4');
INSERT INTO depozit VALUES ('5', 'Liberatii 4', 'OT', 'Romania', 'Caracal', '235200', '0741111962', '5');

-- Departments
INSERT INTO departament VALUES ('1', 'AMERICA DE NORD', '1');
INSERT INTO departament VALUES ('2', 'AMERICA DE SUD', '2');
INSERT INTO departament VALUES ('3', 'AFRICA', '3');
INSERT INTO departament VALUES ('4', 'ASIA', '4');
INSERT INTO departament VALUES ('5', 'EUROPA', '5');

-- Inventory
INSERT INTO inventar VALUES ('1', 59, 1, 100, 'nu', TO_DATE('13-01-2012','DD-MM-YYYY'), '1', '1');
INSERT INTO inventar VALUES ('2', 519, 2, 1000, 'nu', TO_DATE('13-01-2012','DD-MM-YYYY'), '2', '2');
INSERT INTO inventar VALUES ('3', 159, 3, 10100, 'nu', TO_DATE('13-01-2002','DD-MM-YYYY'), '3', '3');
INSERT INTO inventar VALUES ('4', 559, 4, 800, 'nu', TO_DATE('13-01-2002','DD-MM-YYYY'), '4', '4');
INSERT INTO inventar VALUES ('5', 119, 5, 124, 'nu', TO_DATE('13-01-2002','DD-MM-YYYY'), '5', '5');

-- Employees
INSERT INTO angajat VALUES ('1', 'Marinel', 'Columbeanu', TO_DATE('13-09-2002','DD-MM-YYYY'), 'presedinte', 1900, 10, 'Comanda a fost deja plasata sper sa va bucurati', '1', '1');
INSERT INTO angajat VALUES ('2', 'Costel', 'Meltenel', TO_DATE('15-01-2006','DD-MM-YYYY'), 'distribuitor', 1100, 4, 'Comanda va veni in 2 zile', '2', '2');
INSERT INTO angajat VALUES ('3', 'Francesca', 'Cambara', TO_DATE('03-07-2012','DD-MM-YYYY'), 'resurse umane', 1200, 7, 'Angajatii sunt foarte productivi', '3', '3');
INSERT INTO angajat VALUES ('4', 'Ionel', 'Popescu', TO_DATE('01-11-2021','DD-MM-YYYY'), 'angajat', 900, 3, 'Este prima mea slujba', '4', '4');
INSERT INTO angajat VALUES ('5', 'Alin', 'Dumitrescu', TO_DATE('03-09-2010','DD-MM-YYYY'), 'gardian', 100, 1, 'Lucrez pentru prima data full time', '5', '5');

-- Clients
INSERT INTO client VALUES ('1', 'BIG JOHN', 'Cajaca 54', 'SAN FRANCISCO', 'CA', '08540', 'USA', '05299919282', '1', '1');
INSERT INTO client VALUES ('2', 'WOMANSPORTS', 'Camaca 76', 'SEATTLE', 'WASHINGTON', '08541', 'USA', '05299919281', '1', '1');
INSERT INTO client VALUES ('3', 'Decathlon Alabama', 'Cambogia 5', 'Mobile', 'Al', '07140', 'USA', '05299919582', '1', '1');
INSERT INTO client VALUES ('4', 'Decathlon Amazonas', 'Majamba 154', 'Manaus', 'SOA', '15240', 'Brazilia', '01499419782', '2', '2');
INSERT INTO client VALUES ('5', 'Decathlon Bahia', 'Manamba 1154', 'Salvador', 'SOB', '15157', 'Brazilia', '01496411761', '2', '2');
INSERT INTO client VALUES ('6', 'Decatlhon Alagoras', 'Maxamba 153', 'Maceio', 'SOAL', '15288', 'Brazilia', '01392419482', '2', '2');
INSERT INTO client VALUES ('7', 'Decathlon Zimbabwe', 'Najamba 254', 'Mutare', 'ZMB', '22222', 'Zimbabwe', '01499419781', '3', '3');
INSERT INTO client VALUES ('8', 'Decathlon Zimbabwe', 'Naxamba 2154', 'Harare', 'ZMB', '21212', 'Zimbabwe', '01499419781', '3', '3');
INSERT INTO client VALUES ('9', 'Decathlon Zimbabwe', 'Namamba 234', 'Gweru', 'ZMB', '23232', 'Zimbabwe', '01499419781', '3', '3');
INSERT INTO client VALUES ('10', 'Decathlon Hiroshima', 'Nihon 1524', 'Hiroshima', 'HRS', '32323', 'Japonia', '01499419781', '4', '4');
INSERT INTO client VALUES ('11', 'Decathlon Nagasaki', 'Mihon 2514', 'Nagasaki', 'NGS', '42424', 'Japonia', '01499419711', '4', '4');
INSERT INTO client VALUES ('12', 'Decathlon Fukushima', 'Kihon 2514', 'Nakatsu', 'FKS', '44444', 'Japonia', '07499419781', '4', '4');
INSERT INTO client VALUES ('13', 'Decathlon Craiova', 'C.Bucuresti 80', 'Craiova', 'DJ', '20040', 'Romania', '07219419781', '5', '5');
INSERT INTO client VALUES ('14', 'Decathlon Braila', 'Liberatii 10', 'Braila', 'Br', '20140', 'Romania', '07219419721', '5', '5');
INSERT INTO client VALUES ('15', 'Decathlon Vaslui', 'Calugareni 80', 'Vaslui', 'VS', '21040', 'Romania', '07211411781', '5', '5');

-- Orders
INSERT INTO comanda VALUES ('1', TO_DATE('13-02-2001','DD-MM-YYYY'), TO_DATE('15-02-2001','DD-MM-YYYY'), 'ramburs', '5', '1');
INSERT INTO comanda VALUES ('2', TO_DATE('15-05-2005','DD-MM-YYYY'), TO_DATE('17-05-2005','DD-MM-YYYY'), 'card', '7', '2');
INSERT INTO comanda VALUES ('3', TO_DATE('06-09-2019','DD-MM-YYYY'), TO_DATE('08-09-2019','DD-MM-YYYY'), 'ramburs', '1', '3');
INSERT INTO comanda VALUES ('4', TO_DATE('14-11-2009','DD-MM-YYYY'), TO_DATE('16-11-2009','DD-MM-YYYY'), 'card', '9', '4');
INSERT INTO comanda VALUES ('5', TO_DATE('09-06-1999','DD-MM-YYYY'), TO_DATE('10-06-1999','DD-MM-YYYY'), 'ramburs', '15', '5');

-- Order items
INSERT INTO obiect VALUES ('1', 1800, 57, 3, '1', '1');
INSERT INTO obiect VALUES ('2', 30000, 419, 100, '2', '2');
INSERT INTO obiect VALUES ('3', 4800, 147, 12, '3', '3');
INSERT INTO obiect VALUES ('4', 4720, 500, 59, '4', '4');
INSERT INTO obiect VALUES ('5', 50000, 19, 19, '5', '5');

COMMIT;
