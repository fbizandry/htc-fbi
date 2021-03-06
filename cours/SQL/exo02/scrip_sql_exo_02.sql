/*1*/

select detail.ncmd, cli_societe, pro_libelle, sum(pro_prix*qtite) 
	from client 
	inner join commande
	on client.ncli = commande.ncli 
	inner join detail 
	on  commande.ncmd = detail.ncmd
	inner join produit
	on detail.nprod = produit.nprod 
group by detail.ncmd, cli_societe, pro_libelle 



/*2*/

select rep_nom, bur_adresse, vil_nom, bureau.nbur 
	from representant 
	inner join bureau
	on representant.nbur = bureau.nbur
	inner join ville
	on bureau.cp = ville.cp


/*3*/

select nbur, sum (qtite*pro_prix) as CA 
from (
	select bureau.nbur, qtite, pro_prix
		from bureau inner 
		join representant
		on bureau.nbur = representant.nbur
		inner join origine
		on representant.nrep = origine.nrep
		inner join detail 
		on origine.ncmd = detail.ncmd
		inner join produit
		on detail.nprod = produit.nprod
) as chiffre
group by nbur



/*4*/

select ncmd, sum (montant) as Chiffre , rep_nom ||' '|| rep_prenom as représentant , vil_nom 
	from (
	select detail.ncmd, qtite*pro_prix as montant, 	rep_nom,rep_prenom , vil_nom
		from ville 
	inner join bureau 
	on ville.cp = bureau.cp
	inner join representant
	on bureau.nbur = representant.nbur
	inner join origine
	on representant.nrep = origine.nrep
	inner join detail 
	on origine.ncmd = detail.ncmd
	inner join produit
	on detail.nprod = produit.nprod
	) as CA
group by rep_nom,rep_prenom , vil_nom, ncmd 
order by représentant


/*5*/

select cli_societe, rep_nom ||' '|| rep_prenom as représentant ,
pay_nom, vil_nom 
	from (
	select rep_nom, rep_prenom, bureau.nbur, qtite, pro_prix, 	cli_societe, pay_nom, vil_nom
		from pays 
	inner join ville 
	on pays.npays = ville.npays
	inner join bureau
	on ville.cp = bureau.cp
	inner join representant
	on bureau.nbur = representant.nbur
	inner join origine
	on representant.nrep = origine.nrep
	inner join commande
	on origine.ncmd = commande.ncmd
	inner join detail
	on commande.ncmd = detail.ncmd
	inner join client
	on commande.ncli = client.ncli
	inner join produit
	on detail.nprod = produit.nprod
	) AS info_client 
where cli_societe like 'ACE INTERNATIONAL%'


	/*ou*/

select cli_societe, rep_nom ||' '|| rep_prenom as représentant ,
pay_nom, vil_nom from (
	select rep_nom, rep_prenom, bureau.nbur, qtite, pro_prix, client.ncli, cli_societe, pay_nom, vil_nom
		from pays 
			inner join ville 
			on pays.npays = ville.npays
			inner join bureau
			on ville.cp = bureau.cp
			inner join representant
			on bureau.nbur = representant.nbur
			inner join origine
			on representant.nrep = origine.nrep
			inner join commande
			on origine.ncmd = commande.ncmd
			inner join detail
			on commande.ncmd = detail.ncmd
			inner join client
			on commande.ncli = client.ncli
			inner join produit
			on detail.nprod = produit.nprod
	) AS info_client 
	where ncli like '%1'


/*6*/

select cli_societe, STRING_AGG(pro_libelle, ' , ' ORDER BY pro_libelle) AS libellé
	from client 
		inner join commande
		on client.ncli = commande.ncli 
		inner join detail 
		on  commande.ncmd = detail.ncmd
		inner join produit
		on detail.nprod = produit.nprod 
GROUP BY cli_societe
	

/*7*/

select detail.ncmd, pro_libelle, sum (pro_prix*qtite) as montant, cli_societe, vil_nom
	from ville 
		inner join bureau 
		on ville.cp = bureau.cp
		inner join representant
		on bureau.nbur = representant.nbur
		inner join origine
		on representant.nrep = origine.nrep
		inner join commande
		on origine.ncmd = commande.ncmd
		inner join client
		on commande.ncli = client.ncli
		inner join detail 
		on origine.ncmd = detail.ncmd
		inner join produit
		on detail.nprod = produit.nprod
group by detail.ncmd, pro_libelle, cli_societe, vil_nom



/*8*/

select rep_nom ||' '|| rep_prenom as représentant, che_nom ||' '|| che_prenom as chef, bureau.nbur
	from chef 
		inner join representant
		on chef.nchef = representant.nchef
		inner join bureau
		on representant.nbur = bureau.nbur
order by nbur


/*9*/

select client.cli_societe, che_nom ||' '||che_prenom as chef, vil_nom
	from ville 
		inner join bureau 
		on ville.cp = bureau.cp
		inner join representant
		on bureau.nbur = representant.nbur
		inner join chef 
		on representant.nchef = chef.nchef 
		inner join origine
		on representant.nrep = origine.nrep
		inner join commande
		on origine.ncmd = commande.ncmd
		inner join client
		on commande.ncli = client.ncli
where vil_nom = 'NEW YORK'

/* cela marche mais il n'y a pas de resultat pour cette ville */




/*10*/






/*11*/

select rep_nom ||' '||rep_prenom as Représentant
	from representant
		inner join origine
		on representant.nrep = origine.nrep
		inner join commande
		on origine.ncmd = commande.ncmd
		inner join client
		on commande.ncli = client.ncli
where cli_societe like '%FIRST CORP%'


/*12*/


/*17*/
SELECT nbur, COUNT(nbur) as nb FROM representant 
GROUP BY nbur;




