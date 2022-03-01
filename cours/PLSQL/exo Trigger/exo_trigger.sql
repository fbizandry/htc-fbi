CREATE TABLE evenement (id_event SERIAL primary key, 
						type_event character varying, 
						date_event timestamp with time zone)


CREATE TABLE date_evenement_detail (
	id_event SERIAL REFERENCES evenement (id_event),
	heure_24 time,
	heure numeric,
	minute_ev numeric,
	seconde numeric,
	jour_libelle character varying,
	jour numeric,
	mois numeric,
	annee numeric,
	n_semaine numeric,
	n_trimestre numeric,
	n_semestre numeric
    );
	


create or replace function remplissage_tab()
   returns trigger language plpgsql
  as
$$
DECLARE
event_d_date timestamp;
BEGIN
select into event_d_date date_event from evenement;
UPDATE date_evenement_detail SET heure_24 = date(SUBSTRING(event_d_date FROM 1 FOR 10) from evenement;
UPDATE date_evenement_detail SET heure = extract ('hour' from event_d_date);
UPDATE date_evenement_detail SET minute_ev = extract ('minute' from event_d_date);
UPDATE date_evenement_detail SET seconde = extract ('second' from event_d_date);
UPDATE date_evenement_detail SET jour_libelle = To_Char(event_d_date, 'Day');
UPDATE date_evenement_detail SET jour = extract ('day' from event_d_date);
UPDATE date_evenement_detail SET mois = extract ('month' from event_d_date);
UPDATE date_evenement_detail SET annee = extract ('year' from event_d_date);
UPDATE date_evenement_detail SET n_semaine = DATE_PART('week',event_d_date);
UPDATE date_evenement_detail SET n_trimestre = EXTRACT(QUARTER FROM event_d_date);
UPDATE date_evenement_detail SET n_semestre = EXTRACT(semester FROM event_d_date);
end;
$$

CREATE TRIGGER trig_remplissage AFTER INSERT ON evenement
    FOR EACH ROW EXECUTE FUNCTION remplissage_tab();
	
	
	
create or replace function remplissage_tab()
   returns trigger language plpgsql
  as
$$
DECLARE
event_d_date timestamp;
sem integer;
BEGIN
select into event_d_date date_event from evenement;
UPDATE date_evenement_detail SET heure_24 = cast(event_d_date as time);
UPDATE date_evenement_detail SET heure = extract ('hour' from event_d_date);
UPDATE date_evenement_detail SET minute_ev = extract ('minute' from event_d_date);
UPDATE date_evenement_detail SET seconde = extract ('second' from event_d_date);
UPDATE date_evenement_detail SET jour_libelle = To_Char(event_d_date, 'Day');
UPDATE date_evenement_detail SET jour = extract ('day' from event_d_date);
UPDATE date_evenement_detail SET mois = extract ('month' from event_d_date);
UPDATE date_evenement_detail SET annee = extract ('year' from event_d_date);
UPDATE date_evenement_detail SET n_semaine = DATE_PART('week',event_d_date);
UPDATE date_evenement_detail SET n_trimestre = EXTRACT(QUARTER FROM event_d_date);
UPDATE date_evenement_detail SET n_semestre = DATE_PART(QUARTER, event_d_date) + 1 ) / 2
;
end;
$$
SELECT DATE(SUBSTRING(current_timestamp FROM 1 FOR 10));
CREATE TRIGGER trig_remplissage AFTER INSERT ON evenement
    FOR EACH ROW EXECUTE FUNCTION remplissage_tab();
	
insert into evenement (type_event,date_event) values('CONCERT','2016-06-22 19:10:25-07');