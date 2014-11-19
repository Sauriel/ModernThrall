package Tools;

import Database.SQLConnector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class Register extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		// Create Database.User
		boolean valid = true;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = null;
		if (email1.equals(email2)) {
			email = email1;
		} else {

			session.setAttribute("error", "email mismatch");

			valid = false;
		}

		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String password = null;
		String salt = null;
		if (password1.equals(password2)) {
			password = CryptoTools.md5(password1);
		} else {

			session.setAttribute("error", "password mismatch");

			valid = false;
		}

		if (valid) {
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			String street = request.getParameter("street");
			String zip = request.getParameter("zip");
			String city = request.getParameter("city");
			String phone = request.getParameter("phone");
			String mobile = request.getParameter("mobile");
			String bankAccount = request.getParameter("bankAccount");
			String bankCode = request.getParameter("bankCode");

			String command = "INSERT INTO users VALUES('" + email + "', '" + password + "', '" + name + "', '" + surname + "', '" + street + "', '" + zip + "', '" + city + "', '" + phone + "', '" + mobile + "', '" + bankAccount + "', '" + bankCode + "');";

			try {
				SQLConnector.execute(command);

				session.setAttribute("loggedIn", true);

			} catch (SQLException e) {

				session.setAttribute("error", "user already exist");
			}
		}

		String url = "/~dw19/index.jsp";
		response.sendRedirect( url );
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}