<%-- 
    Document   : forwardInfo4
    Created on : 21 Apr 2026, 3:36:42 pm
    Author     : Nazmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Information</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <div class="container">
            <h1>User Registration Details</h1>

            <div class="card">
                <h2 class="form-title">Forwarded Information</h2>

                <%
                    // Retrieve parameters sent from the previous page
                    String name = request.getParameter("uname");
                    String email = request.getParameter("email");
                    String nationality = request.getParameter("nationality");
                    String background = request.getParameter("background");
                %>

                <div class="form-group">
                    <label>Full Name:</label>
                    <p><%= (name != null) ? name : "Not Provided"%></p>
                </div>

                <div class="form-group">
                    <label>Email Address:</label>
                    <p><%= (email != null) ? email : "Not Provided"%></p>
                </div>

                <div class="form-group">
                    <label>Nationality:</label>
                    <p><%= (nationality != null) ? nationality : "Not Provided"%></p>
                </div>

                <div class="form-group">
                    <label>Academic Background:</label>
                    <p><%= (background != null) ? background : "Not Provided"%></p>
                </div>


            </div>
        </div>
    </body>
</html>