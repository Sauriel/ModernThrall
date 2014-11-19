package Tools;

import Database.SQLConnector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class EnterNewProducts extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// get post data
		String pName = request.getParameter("name");
		int pAge = Integer.parseInt(request.getParameter("age"));
		String pProfession = request.getParameter("profession");
		int pWorkExperience = Integer.parseInt(request.getParameter("workExperience"));
		String pVita = request.getParameter("vita");
		String pPicture = request.getParameter("picture");
		int cost = Integer.parseInt(request.getParameter("cost"));

		// create sql query
		String command = "INSERT INTO products VALUES(NULL, '" + pName + "', " + pAge + ", '" + pProfession + "', " + pWorkExperience + ", '" + pVita + "', '" + pPicture + "', " + cost + ");";

		// execute query
		try {
			SQLConnector.execute(command);
		} catch (SQLException e) {
		}


		String url = "/~dw19/newProducts.jsp";
		response.sendRedirect( url );
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}