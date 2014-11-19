<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Neue Produkte eingeben</title>
</head>
<body>
    <form method="post" action="servlet/EnterNewProducts">
        Name: <input type="text" name="name">
        </br>
        Alter: <input type="text" name="age">
        </br>
        Beruf: <input type="text" name="profession">
        </br>
        Berufserfahrung: <input type="text" name="workExperience">
        </br>
        Lebenslauf: <input type="text" name="vita">
        </br>
        Bild: <input type="text" name="picture" value="content/images/products/ID-10088806.jpg">
        </br>
        Kosten: <input type="text" name="cost">
        <input type="submit" name="submit" value="Eintragen">
    </form>
</body>
</html>