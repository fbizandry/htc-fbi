package fr.htc.op;

import java.util.Scanner;

public class Operations {
	Scanner scan = new Scanner(System.in);

	public void EquationSecondDegre() {
		System.out.println("EQUTION_SECOND_DEGRE");
	}

	public void factoriel() {
		System.out.println("FACTORIEL");
	}

	public void pgcd() {
		System.out.println("PGCD");
	}

	public void maxArray() {
		System.out.println("MAX_ARRAY");
	}

	public void avgAndEquartType() {
		System.out.println("AVG_EQUART_TYPE");
	}

	public void personList() {
		System.out.println("PERSON_LIST");
		System.out.print("Combien de personne voulez_vous entrer?");
		int nbrPerson = scan.nextInt();

		String firstNames[];
		firstNames= new String [100];
		String lastNames[];
		lastNames= new String [100];
		int ages[];
		ages= new int [100];
		
		
		for (int i = 0; i < nbrPerson; i++) {
			Person p = new Person();
			
			System.out.println("entrer le nom de la personne:" + (i+1));
			p.firstName = scan.next();
			firstNames [i] = p.firstName;
			
			System.out.println("entrer le prenom de la personne:" + (i+1));
			p.lastName = scan.next();
			lastNames [i] = p.lastName;
			
			System.out.println("entrer l'age de la personne:" + (i+1));
			p.age = scan.nextInt();
			ages [i] = p.age;
			
			/*String affiche = firstNames[i] + " " + lastNames[i] + " " + ages[i];*/
			
			System.out.println(firstNames[i]);
			System.out.println(lastNames[i]);
			System.out.println(ages[i]);
		}	
			
		
	}

	public void add() {
		System.out.println("ADD : 2 numbers ");
		System.out.print("Entrer le nombre 1 : ");
		int n1 = scan.nextInt();
		System.out.print("Entrer le nombre 2 : ");
		int n2 = scan.nextInt();
		int somm = n1 + n2;
		System.out.println("La somme des deux nombres est " + somm);
	}

	public void exit() {
		System.out.println("Good bye !!!");
		scan.close();
	}

}
