<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Conversion Result</title>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <%!
            // JSP Declaration: Define constants and methods
            final double USD_RATE = 0.25;
            final double EURO_RATE = 0.21;
            final double JPY_RATE = 40.0;
            final double SGD_RATE = 0.32;

            private double calculateRate(String currency, int amount) {
                double currencyChange = 0.0;
                if (currency != null) {
                    if (currency.equals("1")) {
                        currencyChange = amount * USD_RATE;
                    } else if (currency.equals("2")) {
                        currencyChange = amount * EURO_RATE;
                    } else if (currency.equals("3")) {
                        currencyChange = amount * JPY_RATE;
                    } else if (currency.equals("4")) {
                        currencyChange = amount * SGD_RATE;
                    }
                }
                return currencyChange;
            }
        %>

        <%
            // JSP Scriptlet: Retrieve and process data
            String currencyType = request.getParameter("currencyType");
            String amountRaw = request.getParameter("amount");
            int amount = 0;
            double total = 0;
            
            try {
                if (amountRaw != null) {
                    amount = Integer.parseInt(amountRaw);
                    total = calculateRate(currencyType, amount);
                }
            } catch (Exception e) {
                amount = 0;
            }

            String currencyName = "N/A";
            if ("1".equals(currencyType)) currencyName = "USD";
            else if ("2".equals(currencyType)) currencyName = "EURO";
            else if ("3".equals(currencyType)) currencyName = "JPY";
            else if ("4".equals(currencyType)) currencyName = "SGD";
        %>

        <div class="container">
            <h1>Use JSP Declaration Tag, JSP Scriptlet and JSP Expression in Application</h1>
            
            <div class="card">
                <h2 class="form-title">Currency Conversion</h2>

                <div class="form-group">
                    <label>Amount in Ringgit Malaysia (RM):</label>
                    <p>RM <%= amount %></p>
                </div>

                <div class="form-group">
                    <label>Converted to (<%= currencyName %>):</label>
                    <p><strong><%= String.format("%.2f", total) %> <%= currencyName %></strong></p>
                </div>

                <div class="button-group">
                    <button type="button" class="btn btn-submit" onclick="history.back()">Back</button>
                </div>
            </div>
        </div>
    </body>
</html>