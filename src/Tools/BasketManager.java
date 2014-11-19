package Tools;

import Database.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class BasketManager extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);

		// get post data
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String profession = request.getParameter("profession");
		int workExperience = Integer.parseInt(request.getParameter("workExperience"));
		String vita = request.getParameter("vita");
		String picture = request.getParameter("picture");
		int cost = Integer.parseInt(request.getParameter("cost"));

		// create product
		Product product = new Product(id, name, age, profession, workExperience, vita, picture, cost);

		//product.print();

		ArrayList<Product> basket = new ArrayList<Product>();

		// get old basket
		ArrayList<Product> oldBasket = (ArrayList<Product>) session.getAttribute("basket");
		if (oldBasket != null) {
			// if the old basket exist make it the new basket
			basket = oldBasket;
		}

		// add product to basket
		basket.add(product);

		session.setAttribute("basket", basket);

		String url = "/~dw19/index.jsp";
		response.sendRedirect( url );
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
}
