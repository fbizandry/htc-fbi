


/*------------------------------------------------------------
#        PRAGMA foreign_keys = ON;  Script SQLite  
#------------------------------------------------------------*/


/*
drop table fbi_vendre cascade;
drop table fbi_produits cascade;
drop table fbi_types cascade;
drop table fbi_date cascade;
*/


/*------------------------------------------------------------
# Table: types
#------------------------------------------------------------*/
CREATE TABLE fbi_types(
	CodeType     INTEGER NOT NULL ,
	Designation  TEXT ,
	PRIMARY KEY (CodeType)
);





/*------------------------------------------------------------
# Table: Produits
#------------------------------------------------------------*/
CREATE TABLE fbi_Produits(
	CodeProduit   INTEGER NOT NULL ,
	Designation   TEXT ,
	prix_au_kilo  DECIMAL(4,2) ,
	CodeType      INTEGER ,
	PRIMARY KEY (CodeProduit) ,
	
	FOREIGN KEY (CodeType) REFERENCES fbi_types(CodeType)
);


/*------------------------------------------------------------
# Table: Date
#------------------------------------------------------------*/
CREATE TABLE fbi_Date(
	date_de_vente  date NOT NULL ,
	PRIMARY KEY (date_de_vente)
);


/*------------------------------------------------------------
# Table: vendre
#------------------------------------------------------------*/
CREATE TABLE fbi_vendre(
	poids           DECIMAL(4,2) ,
	CodeProduit    INTEGER NOT NULL ,
	date_de_vente  date NOT NULL ,
	PRIMARY KEY (CodeProduit,date_de_vente) ,
	
	FOREIGN KEY (CodeProduit) REFERENCES fbi_Produits(CodeProduit),
	FOREIGN KEY (date_de_vente) REFERENCES fbi_Date(date_de_vente)
	
);



