<%@ page import="java.util.ArrayList" %>
<%@ page import="Database.Product" %>
<%@ page import="Database.User" %>

<!-- check if user is logged in -->
<% if (session.getAttribute("loggedIn") == null) { %>
<h2>Bitte melde dich an um deine Bestellung abzuschlie&szlig;en</h2>
<%
    } else {
        User user = (User) session.getAttribute("user");
%>

<!-- Show user informations -->
<div class="row">
    <div class="col-md-6">
        <h3>Anschrift:</h3>
        <p><%=user.getName()%> <%=user.getSurname()%></p>
        <p><%=user.getStreet()%></p>
        <p><%=user.getZip()%> <%=user.getCity()%></p></div>
    <div class="col-md-6">
        <h3>Kontodaten:</h3>
        <p>Kontonummer: <%=user.getBankAccount()%></p>
        <p>Bankleitzahl: <%=user.getBankCode()%></p></div>
</div>

<% } %>

<!-- Show Products in Basket -->
<table class="table table-hover">
    <thead>
    <tr>
        <th></th>
        <th>Name</th>
        <th>Beruf</th>
        <th>Stundensatz</th>
    </tr>
    </thead>
    <tbody>

    <%
    int orderCost = 0;
    ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("basket");

    for (Product product : products) {
        orderCost += product.getCost();

    %>

    <tr>
        <td><img src="<%= product.getPicture() %>" alt="<%= product.getName() %>" class="img-thumbnail"></td>
        <td><%= product.getName() %></td>
        <td><%= product.getProfession() %></td>
        <td><%= product.getCost() %> &euro;</td>
    </tr>

    <% } %>

    <tr>
        <td></td>
        <td></td>
        <td></td>
        <td><%= orderCost %> &euro;</td>
    </tr>

    </tbody>
</table>

<% if (session.getAttribute("loggedIn") != null) { %>
<a href="servlet/OrderExec" class="btn btn-primary">Bestellen</a>
<% } %>