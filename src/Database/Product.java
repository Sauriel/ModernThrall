package Database;

public class Product {

	private int id;
	private String name;
	private int age;
	private String profession;
	private int workExperience;
	private String vita;
	private String picture;
	private int cost;

	public Product (int id, String name, int age, String profession, int workExperience, String vita, String picture, int cost) {
		this.id = id;
		this.name = name;
		this.age = age;
		this.profession = profession;
		this.workExperience = workExperience;
		this.vita = vita;
		this.picture = picture;
		this.cost = cost;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public int getAge() {
		return age;
	}

	public String getProfession() {
		return profession;
	}

	public int getWorkExperience() {
		return workExperience;
	}

	public String getVita() {
		return vita;
	}

	public String getPicture() {
		return picture;
	}

	public int getCost() {
		return cost;
	}

	public void print() {
		System.out.println("ID: " + id);
		System.out.println("Name: " + name);
		System.out.println("Alter: " + age);
		System.out.println("Beruf: " + profession);
		System.out.println("Berufserfahrung: " + workExperience);
		System.out.println("Lebenslauf: " + vita);
		System.out.println("Bild: " + picture);
		System.out.println("Kosten: " + cost);
	}
}
