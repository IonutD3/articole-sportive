# Articole Sportive de Vârf

**RO | EN**

---

## 🇷🇴 Română

### Despre proiect

**Articole Sportive de Vârf** este un proiect de bază de date relațională pentru gestionarea activității unei companii en-gros de articole sportive.

Baza de date gestionează produse, clienți, comenzi, inventar, depozite, angajați, departamente și regiuni.

### Tehnologii

- SQL
- Oracle Database
- Git / GitHub

### Structura repository-ului

```text
articole-sportive/
├── README.md
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   └── 03_queries.sql
├── diagrams/
│   ├── conceptual-schema.png
│   └── logical-schema.png
└── docs/
    └── project.pdf
```

### Scripturi SQL

- `01_create_tables.sql` — creează tabelele, cheile primare și relațiile.
- `02_insert_data.sql` — inserează datele de test.
- `03_queries.sql` — conține interogări pentru explorarea și analizarea bazei de date.

### Entități principale

- Produs
- Regiune
- Depozit
- Departament
- Inventar
- Angajat
- Client
- Comandă
- Obiect

### Instalare

1. Configurează o bază de date Oracle.
2. Rulează `sql/01_create_tables.sql`.
3. Rulează `sql/02_insert_data.sql`.
4. Rulează interogările din `sql/03_queries.sql`.

> Scripturile sunt organizate pentru Oracle Database și trebuie executate în ordinea de mai sus.


---

## 🇬🇧 English

### About the project

**Articole Sportive de Vârf** is a relational database project designed to manage the activity of a wholesale sports equipment company.

The database manages products, customers, orders, inventory, warehouses, employees, departments, and regions.

### Technologies

- SQL
- Oracle Database
- Git / GitHub

### Repository structure

```text
articole-sportive/
├── README.md
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_data.sql
│   └── 03_queries.sql
├── diagrams/
│   ├── conceptual-schema.png
│   └── logical-schema.png
└── docs/
    └── project.pdf
```

### SQL scripts

- `01_create_tables.sql` — creates the tables, primary keys, and relationships.
- `02_insert_data.sql` — inserts the test data.
- `03_queries.sql` — contains queries for exploring and analyzing the database.

### Main entities

- Product
- Region
- Warehouse
- Department
- Inventory
- Employee
- Customer
- Order
- Order Item

### Setup

1. Configure an Oracle Database instance.
2. Run `sql/01_create_tables.sql`.
3. Run `sql/02_insert_data.sql`.
4. Run the queries from `sql/03_queries.sql`.

> The scripts are designed for Oracle Database and should be executed in the order shown above.

