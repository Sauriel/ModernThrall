package Database;

import java.sql.*;
import java.util.ArrayList;

public class SQLConnector {

	// Configuration
    private static String server = "jdbc:mysql://localhost:3306/dw19";
    private static String user = "dw19";
    private static String password = "VKYD";

    public static void execute(String command) throws SQLException {
        try {
	        Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            // TODO Handle Exception
            e.printStackTrace();
        }

	    // connect to DB
        Connection connection = DriverManager.getConnection(server, user, password);
        Statement statement = connection.createStatement();

	    // execute command
        statement.executeUpdate(command);

        statement.close();
        connection.close();
    }

    public static String getPassword(String email) {
        String passwordDB = "NULL";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            // TODO Handle Exception
            e.printStackTrace();
        }

        try {
	        // connect to DB
            Connection connection = DriverManager.getConnection(server, user, password);
            Statement statement = connection.createStatement();

	       ResultSet resultSet = statement.executeQuery("SELECT password FROM users WHERE email='" + email + "' LIMIT 1");
            while (resultSet.next()) {
	            // get password
	            passwordDB = resultSet.getString("password");
            }

            statement.close();
            connection.close();

            return passwordDB;
        } catch (SQLException e) {
            // TODO Handle Exception
	        e.printStackTrace();
	        return null;
        }
    }

	public static User getUser(String email) {
		User dbUser = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			// TODO Handle Exception
			e.printStackTrace();
		}

		try {
			// connect to DB
			Connection connection = DriverManager.getConnection(server, user, password);
			Statement statement = connection.createStatement();

			ResultSet resultSet = statement.executeQuery("SELECT * FROM users WHERE email='" + email + "' LIMIT 1");
			while (resultSet.next()) {
				// get user data
				String dbEmail = resultSet.getString("email");
				String dbName = resultSet.getString("name");
				String dbSurname = resultSet.getString("surname");
				String dbStreet = resultSet.getString("street");
				String dbZip = resultSet.getString("zip");
				String dbCity = resultSet.getString("city");
				String dbPhone = resultSet.getString("phone");
				String dbMobile = resultSet.getString("mobile");
				String dbBankAccount = resultSet.getString("bankAccount");
				String dbBankCode = resultSet.getString("bankCode");

				// create user
				dbUser = new User(dbEmail, dbName, dbSurname, dbStreet, dbZip, dbCity, dbPhone, dbMobile, dbBankAccount, dbBankCode);
			}

			statement.close();
			connection.close();

			return dbUser;
		} catch (SQLException e) {
			// TODO Handle Exception
			e.printStackTrace();
			return null;
		}
	}

	public static ArrayList<Product> getProducts() {

		ArrayList<Product> products = new ArrayList<Product>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			// TODO Handle Exception
			e.printStackTrace();
		}

		try {
			// connect to DB
			Connection connection = DriverManager.getConnection(server, user, password);
			Statement statement = connection.createStatement();

			ResultSet resultSet = statement.executeQuery("SELECT * FROM products");
			while (resultSet.next()) {
				// get product informations
				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				int age = resultSet.getInt("age");
				String profession = resultSet.getString("profession");
				int workExperience = resultSet.getInt("workExperience");
				String vita = resultSet.getString("vita");
				String picture = resultSet.getString("picture");
				int cost = resultSet.getInt("cost");

				// create product
				Product product = new Product(id, name, age, profession, workExperience, vita, picture, cost);

				// add product to list
				products.add(product);
			}

			statement.close();
			connection.close();

			return products;
		} catch (SQLException e) {
			// TODO Handle Exception
			e.printStackTrace();
			return null;
		}
	}
}


