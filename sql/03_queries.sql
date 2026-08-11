-- Articole Sportive de Varf
-- Oracle Database
-- 03_queries.sql

-- 1. Lista tuturor produselor
SELECT *
FROM produs
ORDER BY id_produs;

-- 2. Produse cu pretul sugerat peste 300
SELECT id_produs, nume_produs, pret_sugerat
FROM produs
WHERE pret_sugerat > 300
ORDER BY pret_sugerat DESC;

-- 3. Clientii si regiunile lor
SELECT c.id_client,
       c.nume_client,
       c.oras,
       c.tara,
       r.nume_regiune
FROM client c
JOIN regiune r ON r.id_regiune = c.id_regiune
ORDER BY c.id_client;

-- 4. Angajatii impreuna cu departamentul si depozitul
SELECT a.id_angajat,
       a.prenume_angajat,
       a.nume_angajat,
       a.titlu,
       d.nume_departament,
       z.oras AS oras_depozit
FROM angajat a
JOIN departament d ON d.id_departament = a.id_departament
JOIN depozit z ON z.id_depozit = a.id_depozit
ORDER BY a.id_angajat;

-- 5. Comenzile impreuna cu clientul si angajatul responsabil
SELECT co.id_comanda,
       co.data_comenzi,
       co.data_expedieri,
       co.tipul_de_plata,
       cl.nume_client,
       a.prenume_angajat || ' ' || a.nume_angajat AS angajat
FROM comanda co
JOIN client cl ON cl.id_client = co.id_client
JOIN angajat a ON a.id_angajat = co.id_angajat
ORDER BY co.data_comenzi;

-- 6. Produsele din fiecare comanda
SELECT co.id_comanda,
       cl.nume_client,
       p.nume_produs,
       o.pret,
       o.cantitate,
       o.cantitate_expediata
FROM obiect o
JOIN comanda co ON co.id_comanda = o.id_comanda
JOIN client cl ON cl.id_client = co.id_client
JOIN produs p ON p.id_produs = o.id_produs
ORDER BY co.id_comanda;

-- 7. Valoarea estimata a fiecarui obiect comandat
SELECT o.id_obiect,
       p.nume_produs,
       o.cantitate,
       o.pret,
       o.cantitate * o.pret AS valoare_totala
FROM obiect o
JOIN produs p ON p.id_produs = o.id_produs
ORDER BY valoare_totala DESC;

-- 8. Stocul disponibil pe depozite
SELECT z.id_depozit,
       z.oras,
       p.nume_produs,
       i.cantitate_in_stoc,
       i.punct_de_ordine,
       i.maxim_in_stoc,
       i.stoc_epuizat
FROM inventar i
JOIN produs p ON p.id_produs = i.id_produs
JOIN depozit z ON z.id_depozit = i.id_depozit
ORDER BY z.id_depozit, p.id_produs;

-- 9. Clientii al caror nume incepe cu "Decathlon A"
SELECT id_client, nume_client, oras, tara
FROM client
WHERE UPPER(nume_client) LIKE 'DECATHLON A%'
ORDER BY nume_client;

-- 10. Numarul de clienti din fiecare regiune
SELECT r.nume_regiune,
       COUNT(c.id_client) AS numar_clienti
FROM regiune r
LEFT JOIN client c ON c.id_regiune = r.id_regiune
GROUP BY r.id_regiune, r.nume_regiune
ORDER BY r.id_regiune;

-- 11. Salariul mediu pe departament
SELECT d.nume_departament,
       ROUND(AVG(a.salariu), 2) AS salariu_mediu
FROM departament d
JOIN angajat a ON a.id_departament = d.id_departament
GROUP BY d.id_departament, d.nume_departament
ORDER BY salariu_mediu DESC;

-- 12. Produsele care au stoc sub punctul de ordine
SELECT p.nume_produs,
       z.oras AS depozit,
       i.cantitate_in_stoc,
       i.punct_de_ordine
FROM inventar i
JOIN produs p ON p.id_produs = i.id_produs
JOIN depozit z ON z.id_depozit = i.id_depozit
WHERE i.cantitate_in_stoc < i.punct_de_ordine;

-- 13. Comenzile platite cu cardul
SELECT co.id_comanda,
       cl.nume_client,
       co.data_comenzi,
       co.data_expedieri
FROM comanda co
JOIN client cl ON cl.id_client = co.id_client
WHERE LOWER(co.tipul_de_plata) = 'card'
ORDER BY co.data_comenzi;

-- 14. Cantitatea totala comandata pentru fiecare produs
SELECT p.id_produs,
       p.nume_produs,
       SUM(o.cantitate) AS cantitate_totala
FROM produs p
JOIN obiect o ON o.id_produs = p.id_produs
GROUP BY p.id_produs, p.nume_produs
ORDER BY cantitate_totala DESC;

-- 15. Clienti impreuna cu angajatul care ii gestioneaza
SELECT c.id_client,
       c.nume_client,
       a.prenume_angajat || ' ' || a.nume_angajat AS angajat_responsabil
FROM client c
JOIN angajat a ON a.id_angajat = c.id_angajat
ORDER BY c.id_client;
