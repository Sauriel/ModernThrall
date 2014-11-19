<%@ page import="Database.SQLConnector" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Database.Product" %>
<table class="table table-hover">
    <thead>
        <tr>
            <th>Name</th>
            <th>Beruf</th>
            <th>Stundensatz</th>
            <th></th>
        </tr>
    </thead>
        <tbody>
        <%
            // Get all Products from database
            ArrayList<Product> products = SQLConnector.getProducts();

            for (Product product : products) {

        %>
        <form method="post" action="servlet/BasketManager">

        <tr>
            <td>
                <!-- Show Name with tooltip -->
                <a id="product_<%= product.getId() %>" href="#" data-trigger="hover" data-content="
                                    <img src='<%= product.getPicture() %>' alt='<%= product.getName() %>' class='img-thumbnail pull-left'>
                                    <p>
                                        <b>Alter: </b><%= product.getAge() %></br>
                                        <b>Ausbildung: </b><%= product.getProfession() %></br>
                                        <b>Berufserfahrung: </b><%= product.getWorkExperience() %> Jahre</br>
                                        <b>Lebenslauf: </b><%= product.getVita() %>
                                    </p>
                                " data-placement="bottom" title="<%= product.getName() %>">
                    <%= product.getName() %>
                </a>
            </td>
            <td><%= product.getProfession() %></td>
            <td><%= product.getCost() %> &euro;</td>
            <!-- Hidden input fields for the form -->
            <input type="hidden" name="id" value="<%= product.getId() %>">
            <input type="hidden" name="name" value="<%= product.getName() %>">
            <input type="hidden" name="age" value="<%= product.getAge() %>">
            <input type="hidden" name="profession" value="<%= product.getProfession() %>">
            <input type="hidden" name="workExperience" value="<%= product.getWorkExperience() %>">
            <input type="hidden" name="vita" value="<%= product.getVita() %>">
            <input type="hidden" name="picture" value="<%= product.getPicture() %>">
            <input type="hidden" name="cost" value="<%= product.getCost() %>">

            <td><input type="submit" class="btn btn-primary pull-right" name="submit" value="in den Warenkorb"></td>
        </form>
        </tr>

        <!-- Javascript for tooltip -->
        <script type="text/javascript">
            $('#product_<%= product.getId() %>').popover({ container: 'body', html: true})
        </script>

        <% } %>
    </tbody>
</table>