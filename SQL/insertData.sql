/*
	LOXHAJ DORIAN
	10.03.2024
	PROJET FOOTBALLEURS
	INSERTION DES VALEURS DANS LES TABLES.
*/

-- Pays

INSERT INTO tblPays (numero, nom)
	VALUES (1, 'Portugal');
	
INSERT INTO tblPays (numero, nom)
	VALUES (2, 'Angleterre');
	
-- Clubs

INSERT INTO tblClubs (numero, nom, dateDeCreation)
	VALUES (1, 'Real Madrid', '1902');
	
INSERT INTO tblClubs (numero, nom, dateDeCreation)
	VALUES (2, 'Manchester United', '1878');

INSERT INTO tblClubs (numero, nom, dateDeCreation)
	VALUES (3, 'Borussia Dortmund', '1909');
	
-- Personnes

INSERT INTO tblPersonnes (numero, num_tblPays, nom, prenom, ddn, taille)
	VALUES (1, 1, 'Ronaldo', 'Cristiano', '05.02.1985', 185);
	
INSERT INTO tblPersonnes (numero, num_tblPays, nom, prenom, ddn, taille)
	VALUES (2, 2, 'Bellingham', 'Jude', '29.06.2003', 186);
	
-- tbl_PersonnesClubs

INSERT INTO tbl_PersonnesClubs (num_tblPersonnes, num_tblClubs, dateArrive, dateFin)
	VALUES (2,3,'20.07.2020','07.06.2023');

INSERT INTO tbl_PersonnesClubs (num_tblPersonnes, num_tblClubs, dateArrive)
	VALUES (2,1,'07.06.2023');

INSERT INTO tbl_PersonnesClubs (num_tblPersonnes, num_tblClubs, dateArrive, dateFin)
	VALUES (1,2,'12.08.2003','26.06.2009');

INSERT INTO tbl_PersonnesClubs (num_tblPersonnes, num_tblClubs, dateArrive, dateFin)
	VALUES (1,2,'26.06.2009','10.07.2018');