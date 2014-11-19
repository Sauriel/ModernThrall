package Database;

public class User {

	private String email;
	private String name;
	private String surname;
	private String street;
	private String zip;
	private String city;
	private String phone;
	private String mobile;
	private String bankAccount;
	private String bankCode;

	public User(String email, String name, String surname, String street, String zip, String city, String phone, String mobile, String bankAccount, String bankCode) {
		this.email = email;
		this.name = name;
		this.surname = surname;
		this.street = street;
		this.zip = zip;
		this.city = city;
		this.phone = phone;
		this.mobile = mobile;
		this.bankAccount = bankAccount;
		this.bankCode = bankCode;
	}

	public String getEmail() {
		return email;
	}

	public String getName() {
		return name;
	}

	public String getSurname() {
		return surname;
	}

	public String getStreet() {
		return street;
	}

	public String getZip() {
		return zip;
	}

	public String getCity() {
		return city;
	}

	public String getPhone() {
		return phone;
	}

	public String getMobile() {
		return mobile;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public String getBankCode() {
		return bankCode;
	}
}
