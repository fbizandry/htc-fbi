package fr.htc.generique;

public class MainColumn {
	public static void main(String[] args) {
		Column<String> column = new Column<String>();
		column.setValue("c'est good");
		System.out.println(column);
		
		Column<Integer> column1 = new Column<Integer>();
		column1.setValue(1);
		System.out.println(column1);
		
		Column<Boolean> column2 = new Column<Boolean>();
		column2.setValue(true);
		System.out.println(column2);
		
		Column<User> column3 = new Column<User>();
		column3.setValue(new User("djgyf", 20));
		System.out.println(column3);
		
	}
}
