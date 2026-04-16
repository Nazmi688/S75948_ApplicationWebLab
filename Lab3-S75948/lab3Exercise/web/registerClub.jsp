<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%@ include file="header.jsp" %>

<h2>Club Registration</h2>

<form action="processRegistration.jsp" method="post">
    Name:
    <input type="text" name="name" required><br><br>

    Matric No:
    <input type="text" name="matric" required><br><br>

    Club:
    <select name="club">
        <option value="Robotics Club">Robotics Club</option>
        <option value="Sports Club">Sports Club</option>
        <option value="Art Club">Art Club</option>
    </select><br><br>

    <input type="submit" value="Register">
</form>

<%@ include file="footer.jsp" %>

</body>
</html>