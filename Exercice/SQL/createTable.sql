/*
	LOXHAJ DORIAN
	10.03.2024
	PROJET FOOTBALLEURS
*/

CREATE TABLE tblPays(
	numero INTEGER,
	nom VARCHAR(50),
	CONSTRAINT PK_tblPays
		PRIMARY KEY (numero)
);

CREATE TABLE tblClubs(
	numero INTEGER,
	nom VARCHAR(50),
	dateDeCreation DATE,
	CONSTRAINT PK_tblClubs
		PRIMARY KEY (numero)
);

CREATE TABLE tblPersonnes(
	numero INTEGER,
	num_tblPays INTEGER,
	nom VARCHAR(50),
	prenom VARCHAR(50),
	ddn DATE,
	taille INTEGER,
	CONSTRAINT PK_tblPersonnes
		PRIMARY KEY (numero)
	CONSTRAINT FK_tblPays_tblJoueurs
		FOREIGN KEY (num_tblPays)
		REFERENCES tblPays(numero)
);

CREATE TABLE tbl_PersonnesClubs(
	numero INTEGER,
	num_tblPersonnes INTEGER,
	num_tblClubs INTEGER,
	dateArrive DATE,
	dateFin DATE,
	CONSTRAINT PK_tblPersonnesClubs
		PRIMARY KEY (numero),
	CONSTRAINT FK_tblPersonnesClubs_tblPersonnes
		FOREIGN KEY (num_tblPersonnes)
		REFERENCES tblPersonnes(numero),
	CONSTRAINT FK_tblPersonnesClubs_tblClubs
		FOREIGN KEY (num_tblClubs)
		REFERENCES tblClubs(numero)
);