/*
	LOXHAJ DORIAN
	10.03.2024
	PROJET FOOTBALLEURS
	PERMET DE VIDER LES TABLES PUIS DE LES SUPPRIMER. DéPART à 0.
*/

DELETE FROM tbl_PersonnesClubs;
DELETE FROM tblPersonnes;
DELETE FROM tblClubs;
DELETE FROM tblPays;

DROP TABLE IF EXISTS tblClubs;
DROP TABLE IF EXISTS tblPays;
DROP TABLE IF EXISTS tblPersonnes;
DROP TABLE IF EXISTS tbl_PersonnesClubs;