<%-- 
    Document   : InsertStudent
    Created on : 12 May 2026, 4:01:19 pm
    Author     : Nazmi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>

    <style>
        body{
            font-family: Arial;
        }

        fieldset{
            width: 500px;
        }

        table{
            padding: 10px;
        }

        td{
            padding: 8px;
        }
    </style>

</head>

<body>

    <h2>Insert Student </h2>

    <fieldset>

        <form action="processStudent.jsp" method="post">

            <table>

                <tr>
                    <td>Student No</td>

                    <td>
                        <input type="text"
                               name="stuno"
                               placeholder="E.g.: UK000XX"
                               pattern="[A-Z0-9]*"
                               required>
                    </td>
                </tr>

                <tr>
                    <td>Name</td>

                    <td>
                        <input type="text"
                               name="name"
                               placeholder="Enter your name"
                               required>
                    </td>
                </tr>

                <tr>
                    <td>Program</td>

                    <td>
                        <select name="program">

                            <option>BSc. Soft. Eng.</option>
                            <option>BSc. with IM</option>
                            <option>BSc. in Networking</option>
                            <option>BSc. in Robotics</option>

                        </select>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">

                        <input type="submit" value="Submit">

                        <input type="reset" value="Cancel">

                    </td>
                </tr>

            </table>

        </form>

    </fieldset>

</body>
</html>