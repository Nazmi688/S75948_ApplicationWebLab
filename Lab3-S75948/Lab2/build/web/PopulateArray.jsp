<%-- 
    Document   : PopulateArray
    Created on : 14 Apr 2026, 2:57:08 PM
    Author     : MP2-4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            Table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even){
                background-color: #f2f2f2
            }

            th {
                background-color: orange;
                color: white;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>


        <Table>
            <tr>
                <th> Salesman</th>
                <th> Jan</th>
                <th> Feb</th>
                <th> Mar</th>
            </tr>

            <tr>
                <td> Salesman1</td>
                <td> 2500</td>
                <td> 2100</td>
                <td> 2200</td>
            </tr>

            <tr>
                <td> Salesman2</td>
                <td> 2000</td>
                <td> 1900</td>
                <td> 2400</td>
            </tr>

            <tr>
                <td> Salesman3</td>
                <td> 1800</td>
                <td> 2200</td>
                <td> 2450</td>
            </tr>

        </Table>
    </body>
</html>
