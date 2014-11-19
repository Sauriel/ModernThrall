package Tools;

import Database.Product;
import Database.SQLConnector;
import Database.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class OrderExec extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		// get user
		User user = (User) session.getAttribute("user");
		ArrayList<Product> basket = (ArrayList<Product>) session.getAttribute("basket");
		String email = user.getEmail();
		Date date = new Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		String datetime = timestamp.toString();

		// create order in DB
		for (Product product : basket) {
			String command = "INSERT INTO orders VALUES('" + datetime + "', '" + email + "', '" + product.getId() + "');";

			try {
				SQLConnector.execute(command);

			} catch (SQLException e) {

				//session.setAttribute("error", "can't execute order");
			}
		}

		session.removeAttribute("basket");

		session.setAttribute("site", "Bestellbest&auml;tigung");

		String url = "/~dw19/index.jsp";
		response.sendRedirect( url );
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
