q3

do $$
declare nom_produit varchar (20);
begin
select designation into nom_produit from fbi_produits where code_produit = 2;
if nom_produit = 'banane'
then raise notice 'Le produit % est présent ', nom_produit;
else raise notice 'Le produit banane n_est pas présent ';
end if;
end
$$;





q6

create function addition(a integer, b integer) returns integer as $$
declare somme integer;
begin
somme = a + b ;
return somme;
raise notice 'ce produit n_est pas une banane';
end
$$ language plpgsql;


q7



select date::date,
       extract('isodow' from date) as dow,
       to_char(date, 'dy') as day,
       extract('isoyear' from date) as "iso year",
       extract('week' from date) as week,
       extract('day' from
               (date + interval '2 month - 1 day')
              )
        as feb,
       extract('year' from date) as year,
       extract('day' from
               (date + interval '2 month - 1 day')
              ) = 29
       as leap
  from generate_series(date '2000-01-01',
                       date '2010-01-01',
                       interval '1 year')
       as t(date);