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
	}

	public void add() {
		System.out.println("ADD : 2 numbers ");
		System.out.print("Entrer le nombre 1 : ");
		int n1 = scan.nextInt();
		System.out.print("Entrer le nombre 2 : ");
		int n2 = scan.nextInt();
		int somm = n1+ n2 ; 
		System.out.println("La somme des deux nombres est " + somm);
	}
	
	public void exit() {
		System.out.println("Good bye !!!");
		scan.close();
	}

}
