/*q1 creation table*/

create table traitement (
	batch character varying(50),
	date_heure_debut timestamp,
	date_heure_fin timestamp,
	statut character varying
)

/*q2 remplissage table*/

insert into traitement (batch, date_heure_debut, date_heure_fin, statut) values ('POST_TRAITEMENT',to_timestamp('07/10/2013 15:25:00','dd/mm/yyyy hh24:mi:ss'),to_timestamp('07/10/2013 15:25:02','dd/mm/yyyy hh24:mi:ss'),'1');


/*q3 creation d'une table à partir d'une autre table*/

create table traitement_ref as select distinct batch from traitement 

/*q4 creation d'une colonne dans la table traitement_ref*/

alter table traitement_ref add column id_ref integer


/* question 5 a. insérer les index uniques à la colonne id_traitement_ref */

DO language plpgsql $$
DECLARE


curs CURSOR FOR SELECT * FROM fbi_traitement_ref;
it integer := 0 ;

BEGIN
 
 	FOR rec IN curs loop
    it = it + 1;
    UPDATE fbi_traitement_ref SET id_traitement_ref = it WHERE CURRENT OF curs;
	
   
    END LOOP;
END;
$$;


/* question 5 b. definir la colonne id_ref comme clé primaire*/

ALTER TABLE traitement_ref
ADD PRIMARY KEY (id_ref);


/* question 6 ajout colonne cf question 4*/

/*Question 7 remplir id_traitement cf question 5 a */

/*Question 8 ajout de clé étrangre dans table traitement*/

DO language plpgsql $$
DECLARE


curs CURSOR FOR SELECT * FROM fbi_traitement;
it integer := 0 ;

BEGIN
 
 	FOR rec IN curs loop
    select into it id_traitement_ref from fbi_traitement 
	right join fbi_traitement_ref using (batch);
    UPDATE fbi_traitement SET for_key = it WHERE CURRENT OF curs;
	
   
    END LOOP;
END;
$$;




