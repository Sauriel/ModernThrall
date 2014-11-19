package Tools;

import Database.SQLConnector;
import Database.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogIn extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		// get post data
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String passwordCheck = null;

		String passwordDB = SQLConnector.getPassword(email);

		// get md5 password hash
		passwordCheck = CryptoTools.md5(password);

		// check if the password is the same as in the DB
		if (passwordCheck.equals(passwordDB)) {
			session.setAttribute("loggedIn", true);

			User user = SQLConnector.getUser(email);
			session.setAttribute("user", user);

			String url = "/~dw19/index.jsp";
			response.sendRedirect( url );
		} else {
			// wrong password

			session.setAttribute("error", "login error");

			String url = "/~dw19/index.jsp";
			response.sendRedirect( url );
		}
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

}
