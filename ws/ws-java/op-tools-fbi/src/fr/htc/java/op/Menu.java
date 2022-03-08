package fr.htc.java.op;

import java.util.Scanner;

public class Menu {
	public static void main(String[] args) {
		int choix;
		Scanner scan = new Scanner(System.in);
		do {

			System.out.print("Bienvenue à l’application : ‘’ Opérations Mathématiques ‘’" + "\n" + "\n"
					+ "- Addition 		Tapez 1" + "\n" + "- Soustraction		Tapez 2" + "\n"
					+ "- Multiplication 	Tapez 3" + "\n" + "- Division 		Tapez 4" + "\n"
					+ "- Equation 2 Deg. 	Tapez 5" + "\n" + "- Factoriel 		Tapez 6" + "\n"
					+ "- Quitter               Tapez 0" + "\n"
					+ "                                            Faites votre choix :");

			choix = scan.nextInt();
		
		} while (choix != 0);
		switch (choix) {

		case 0:
			System.out.println("vous avez choisi de quitter");
			
			break;
		case 1:
			System.out.println("vous avez choisi l'addition");
			break;

		case 2:
			System.out.println("vous avez choisi la soustraction");
			break;

		case 3:
			System.out.println("vous avez choisi la multiplication");
			break;
		case 4:
			System.out.println("vous avez choisi la division");
			break;
		case 5:
			System.out.println("vous avez choisi l'équation");
			break;
		case 6:
			System.out.println("vous avez choisi la division");
			break;
		default:
			System.out.println("Choix incorrect");
			break;
		}
		scan.close();
	}
}
