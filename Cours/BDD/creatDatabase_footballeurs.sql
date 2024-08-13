CREATE TABLE tblPays(
   numero INTEGER,
   nom VARCHAR(50) ,
   drapeau VARCHAR(50) ,
   PRIMARY KEY(numero)
);

CREATE TABLE tblTitres(
   numero INTEGER,
   titre VARCHAR(50) ,
   PRIMARY KEY(numero)
);

CREATE TABLE tblPostes(
   numero INTEGER,
   nom VARCHAR(50) ,
   PRIMARY KEY(numero)
);

CREATE TABLE tblStades(
   numero INTEGER,
   nom VARCHAR(50) ,
   PRIMARY KEY(numero)
);

CREATE TABLE tblPersonnes(
   numero INTEGER,
   nom VARCHAR(50) ,
   prenom VARCHAR(50) ,
   ddn DATE,
   taille VARCHAR(50) ,
   num_tblPersonne_estParentDe INTEGER,
   num_tblPays INTEGER,
   num_tblPostes INTEGER,
   PRIMARY KEY(numero),
   FOREIGN KEY(num_tblPersonne_estParentDe) REFERENCES tblPersonnes(numero),
   FOREIGN KEY(num_tblPays) REFERENCES tblPays(numero),
   FOREIGN KEY(num_tblPostes) REFERENCES tblPostes(numero)
);

CREATE TABLE tblChampionnats(
   numero INTEGER,
   nom VARCHAR(50) ,
   num_tblPays INTEGER,
   PRIMARY KEY(numero),
   FOREIGN KEY(num_tblPays) REFERENCES tblPays(numero)
);

CREATE TABLE tblClubs(
   numero INTEGER,
   nom VARCHAR(50) ,
   date_de_creation DATE,
   fortune VARCHAR(50) ,
   num_tblChampionnats INTEGER,
   num_tblPays INTEGER,
   num_tblStades INTEGER,
   PRIMARY KEY(numero),
   FOREIGN KEY(num_tblChampionnats) REFERENCES tblChampionnats(numero),
   FOREIGN KEY(num_tblPays) REFERENCES tblPays(numero),
   FOREIGN KEY(num_tblStades) REFERENCES tblStades(numero)
);

CREATE TABLE tblCentreFormations(
   numero INTEGER,
   nom VARCHAR(50) ,
   num_tblClubs INTEGER,
   PRIMARY KEY(numero),
   FOREIGN KEY(num_tblClubs) REFERENCES tblClubs(numero)
);

CREATE TABLE tblMatchs(
   numero INTEGER,
   dateMatch DATE,
   num_tblChampionnats INTEGER,
   num_tblClubs_equipeDeux INTEGER,
   num_tblClubs_equipeUn INTEGER,
   num_tblStades INTEGER,
   PRIMARY KEY(numero),
   FOREIGN KEY(num_tblChampionnats) REFERENCES tblChampionnats(numero),
   FOREIGN KEY(num_tblClubs_equipeDeux) REFERENCES tblClubs(numero),
   FOREIGN KEY(num_tblClubs_equipeUn) REFERENCES tblClubs(numero),
   FOREIGN KEY(num_tblStades) REFERENCES tblStades(numero)
);

CREATE TABLE tblTransferts(
   numero INTEGER,
   date_transfert DATE,
   montant DECIMAL(15,2)  ,
   num_tblClubs INTEGER NOT NULL,
   num_tblPersonnes INTEGER NOT NULL,
   PRIMARY KEY(numero),
   FOREIGN KEY(num_tblClubs) REFERENCES tblClubs(numero),
   FOREIGN KEY(num_tblPersonnes) REFERENCES tblPersonnes(numero)
);

CREATE TABLE tblGoals(
   numero INTEGER,
   temps TIME,
   num_tblPersonnes INTEGER,
   num_tblMatchs INTEGER,
   PRIMARY KEY(numero),
   FOREIGN KEY(num_tblPersonnes) REFERENCES tblPersonnes(numero),
   FOREIGN KEY(num_tblMatchs) REFERENCES tblMatchs(numero)
);

CREATE TABLE tbl_PersonnesClubs_faitParti(
   num_tblPersonnes INTEGER,
   num_tblClubs INTEGER,
   dateArrive DATE,
   dateFin VARCHAR(50) ,
   PRIMARY KEY(num_tblPersonnes, num_tblClubs),
   FOREIGN KEY(num_tblPersonnes) REFERENCES tblPersonnes(numero),
   FOREIGN KEY(num_tblClubs) REFERENCES tblClubs(numero)
);

CREATE TABLE tbl_PersonnesClubs_Entraineur(
   num_tblPersonnes INTEGER,
   num_tblClubs INTEGER,
   dateArrive VARCHAR(50) ,
   dateFin VARCHAR(50) ,
   PRIMARY KEY(num_tblPersonnes, num_tblClubs),
   FOREIGN KEY(num_tblPersonnes) REFERENCES tblPersonnes(numero),
   FOREIGN KEY(num_tblClubs) REFERENCES tblClubs(numero)
);

CREATE TABLE tbl_PersonnesCentreFormations(
   num_tblPersonnes INTEGER,
   num_tblCentreFormations INTEGER,
   dateArrive DATE,
   dateDepart INTEGER,
   PRIMARY KEY(num_tblPersonnes, num_tblCentreFormations),
   FOREIGN KEY(num_tblPersonnes) REFERENCES tblPersonnes(numero),
   FOREIGN KEY(num_tblCentreFormations) REFERENCES tblCentreFormations(numero)
);

CREATE TABLE tbl_PersonnesTitres(
   num_tblPersonnes INTEGER,
   num_tblTitres INTEGER,
   dateObtention DATE,
   PRIMARY KEY(num_tblPersonnes, num_tblTitres),
   FOREIGN KEY(num_tblPersonnes) REFERENCES tblPersonnes(numero),
   FOREIGN KEY(num_tblTitres) REFERENCES tblTitres(numero)
);

CREATE TABLE tbl_ClubsChampionnats(
   num_tblClubs INTEGER,
   num_tblChampionnats INTEGER,
   dateVictoire DATE,
   PRIMARY KEY(num_tblClubs, num_tblChampionnats),
   FOREIGN KEY(num_tblClubs) REFERENCES tblClubs(numero),
   FOREIGN KEY(num_tblChampionnats) REFERENCES tblChampionnats(numero)
);
