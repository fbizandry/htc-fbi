/*bloc anonyme dans un prog plpgsql*/

do language plpgsql $$
declare

begin


end
$$;


/*memo create VIEW*/
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;


/*memo create FUNCTION*/
create [or replace] function function_name(param_list)
   returns return_type 
   language plpgsql
  as
$$
declare 
-- variable declaration
begin
 -- logic
end;
$$


/*memo create function qui retourne une TABLE*/

create or replace function get_film (
  p_pattern varchar
) 
	returns table (
		film_title varchar,
		film_release_year int
	) 
	language plpgsql
as $$
begin
	return query 
		select
			title,
			release_year::integer
		from
			film
		where
			title ilike p_pattern;
end;$$


/*exemple RAISE NOTICE*/
do language plpgsql $$
declare
valeur integer := 10;
begin
raise notice 'bonjour %',valeur;

end
$$;


/*exemple RAISE NOTICE1*/
do language plpgsql $$
declare
valeur1 integer := 10;
valeur2 integer := 20;
begin
raise notice 'bonjour % %',valeur1,valeur2;


/*exemple RAISE NOTICE2*/
do language plpgsql $$
declare

begin
raise notice '% %', current_user, current_timestamp;

end
$$;


/*exemple RAISE NOTICE fonction*/
do language plpgsql $$
begin
raise notice 'somme %',fbi_addition(1,2);
end
$$;

/*exemple d'une EXCEPTION*/
do language plpgsql $$
declare 
resultat real;
begin
resultat=1/0;
raise notice 'ok';
exception
when division_by_zero then
raise exception 'ko';
end $$;

/*memo CASE*/
declare
num_jour double precision;
libelle_jour text;

BEGIN
num_jour = extract (dow from date_name);
	   case num_jour
	   when 0 then libelle_jour :='dimanche';
	   when 1 then libelle_jour :='lundi';
	   when 2 then libelle_jour :='mardi';
	   when 3 then libelle_jour :='mercredi';
	   when 4 then libelle_jour :='jeudi';
	   when 5 then libelle_jour :='vendredi';
	   when 6 then libelle_jour :='samedi';
	   end case;
RETURN libelle_jour;
END;




/*CURSOR*/
do language plpgsql $$
declare
curs refcursor;
cur cursor for select * from produit;
begin
for rec in cur loop
raise notice 'prpduit: % %',rec.pro_libelle, rec.nprod;
end loop;
end
$$;

/*curseur FETCH*/
declare
cur cursor for select * from produit;
rec record;
begin
open cur;
fetch from cur into rec;
loop
exit when rec is null;
raise notice '%', rec.pro_libelle;



/*exo2 q2 memo extract et current_date*/

select  extract (month from cmd_date) as month_cmd, cmd_date
 from commande
where extract (month from cmd_date) = extract (month from current_date)

