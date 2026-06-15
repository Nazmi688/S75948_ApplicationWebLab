<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
           prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Car List</title>
    </head>

    <body>

        <h2>Car List</h2>

        <a href="new">Add New Car</a>

        <br><br>

        <table border="1">

            <tr>
                <th>ID</th>
                <th>Brand</th>
                <th>Model</th>
                <th>Cyclinder</th>
                <th>Price</th>
                <th>Action</th>
            </tr>

            <c:forEach var="car"
                       items="${listCar}">

                <tr>

                    <td>${car.carId}</td>
                    <td>${car.brand}</td>
                    <td>${car.model}</td>
                    <td>${car.cyclinder}</td>
                    <td>${car.price}</td>

                    <td>

                        <a href="edit?id=${car.carId}">
                            Edit
                        </a>

                        |

                        <a href="delete?id=${car.carId}">
                            Delete
                        </a>

                    </td>

                </tr>

            </c:forEach>

        </table>

    </body>
</html>