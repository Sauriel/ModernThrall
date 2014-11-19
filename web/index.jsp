<%@ page import="Database.Product" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>ModernThrall</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <!-- Custom CSS -->
    <link href="css/fonts.css" rel="stylesheet" media="screen">
    <link href="css/style.css" rel="stylesheet" media="screen">
</head>
<body>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>

<div class="logo">
    <img src="images/logo.png" alt="ModernThrall">
</div>

<!-- This is the Navbar -->
<nav class="navbar navbar-default" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="servlet/GetHome"><span class="glyphicon glyphicon-home"></span></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <% if (session.getAttribute("site") == null) { %>
                <li><a>ModernThrall</a></li>
            <%
                } else {
                    String site = (String) session.getAttribute("site");
            %>
                <li><a><%=site%></a></li>
            <% } %>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <!-- Show register and log in if user isn't logged in -->
            <% if (session.getAttribute("loggedIn") == null) { %>
                <li><a href="#" data-toggle="modal" data-target="#register">Registrieren</a></li>
                <li><a href="#" data-toggle="modal" data-target="#login">Anmelden</a></li>
            <% } else { %>
                <li><a href="servlet/LogOut">Abmelden</a></li>
            <% }
                int basket = 0;
                try {
                    int basketSize = ((ArrayList<Product>) session.getAttribute("basket")).size();
                    basket = basketSize;
                } catch (NullPointerException e) {
                    //TODO Handle it
                }
            %>
            <!-- Basket Dropdown Menu -->
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-shopping-cart"></span> &nbsp; <span class="badge"><%= basket %></span> <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <%
                        int overallCost = 0;
                        try {
                            for (Product product : (ArrayList<Product>)session.getAttribute("basket")) {
                                overallCost += product.getCost();
                    %>
                                <li><a><%= product.getProfession() %> - <%= product.getCost() %> &euro;</a></li>
                    <%      }
                        } catch (NullPointerException e) {
                    %>
                                <li><a>leer</a></li>
                    <% } %>
                    <li class="divider"></li>
                    <li><a href="servlet/Order">zum Warenkorb - <%= overallCost %> &euro;</a></li>
                </ul>
            </li>
        </ul>
    </div><!-- /.navbar-collapse -->
</nav>

<!-- Content -->
<div class="content">

    <%
        if (session.getAttribute("error") == null) {
            if (session.getAttribute("site") == null) {
    %>

    <!-- SHow shop if nothing is selected -->
    <jsp:include page="shop.jsp" />

    <%
    } else {

        String site = (String) session.getAttribute("site");

        if (site.equals("Warenkorb")) {
    %>

    <!-- Show Basket if it is selected -->
    <jsp:include page="order.jsp" />

    <% } else if(site.equals("Bestellbest&auml;tigung")) { %>

    <!-- Show thanks after order -->
    <jsp:include page="thanks.jsp" />

    <%            }
            }

        } else {

        // Hanndle Errors
        String error = (String) session.getAttribute("error");

        if (error.equals("user already exist")) {

            out.println("<h1>Die eMail Adresse wurde bereits vergeben.</h1>");
            out.println("<p>Bitte verwende eine andere.</p>");
            session.removeAttribute("error");

        } else if (error.equals("email mismatch")) {

            out.println("<h1>Die eMail Adressen stimmen nicht &uuml;berein.</h1>");
            session.removeAttribute("error");

        } else if (error.equals("password mismatch")) {

            out.println("<h1>Die Passw&ouml;rter stimmen nicht &uuml;berein.</h1>");
            session.removeAttribute("error");

        } else if (error.equals("login error")) {

            out.println("<h1>Die eMail oder das Passwort sind nicht korrekt.</h1>");
            session.removeAttribute("error");

        } else {

            out.println("<h1>Ein unbekannter Fehler trat auf.</h1>");
            out.println("<p>Fehlermeldung: " + error + "</p>");
            session.removeAttribute("error");

        }

    } %>

    <div class="footer">
        Diese Seite und alle hier angebotenen Waren und Dienstleistungen sind reine Fiktion.</br>
        ModernThrall ist ein Datenbank-Projekt des Media Systems Studienganges and der HAW Hamburg.</br>
    </div>

</div>
<!-- / Content -->

<!-- Modal - Anmelden -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Anmelden</h4>
            </div>
            <form method="post" action="servlet/LogIn">
                <div class="modal-body">
                    <div class="input-group">
                        <span class="input-group-addon">@</span>
                        <input type="email" class="form-control" name="email" placeholder="eMail">
                    </div>
                    </br>
                    <div class="input-group">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                        <input type="password" class="form-control" name="password" placeholder="Passwort">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">abbrechen</button>
                    <input type="submit" class="btn btn-primary" name="submit" value="anmelden">
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Modal - Registrieren -->
<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Registrieren</h4>
            </div>
            <form method="post" action="servlet/Register">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input type="text" class="form-control" name="name" placeholder="Vorname">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input type="text" class="form-control" name="surname" placeholder="Nachname">
                            </div>
                        </div>
                    </div>
                    </br>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                <input type="text" class="form-control" name="street" placeholder="Stra&szlig;e &amp; Hausnummer">
                            </div>
                        </div>
                    </div>
                    </br>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                <input type="text" class="form-control" name="zip" placeholder="Postleitzahl">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                <input type="text" class="form-control" name="city" placeholder="Ort">
                            </div>
                        </div>
                    </div>
                    </br>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-phone-alt"></span></span>
                                <input type="tel" class="form-control" name="phone" placeholder="Festnetz">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                                <input type="tel" class="form-control" name="mobile" placeholder="Mobiltelefon">
                            </div>
                        </div>
                    </div>
                    </br>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-euro"></span></span>
                                <input type="text" class="form-control" name="bankAccount" placeholder="Kontonummer">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-euro"></span></span>
                                <input type="text" class="form-control" name="bankCode" placeholder="Bankleitzahl">
                            </div>
                        </div>
                    </div>
                    </br>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon">@</span></span>
                                <input type="email" class="form-control" name="email1" placeholder="eMail">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon">@</span></span>
                                <input type="email" class="form-control" name="email2" placeholder="eMail wiederholen">
                            </div>
                        </div>
                    </div>
                    </br>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                                <input type="password" class="form-control" name="password1" placeholder="Passwort">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                                <input type="password" class="form-control" name="password2" placeholder="Passwort wiederholen">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">abbrechen</button>
                    <input type="submit" class="btn btn-primary" name="submit" value="registrieren">
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>