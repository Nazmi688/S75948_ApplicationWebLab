<%-- 
    Document   : subjectinfo
    Created on : 21 Apr 2026, 3:24:39 pm
    Author     : Nazmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    This page is designed to be included inside another page. 
    It receives 'code', 'subject', and 'credit' as parameters.
--%>
<div class="card">
    <h2 class="form-title">Subject Information Detail</h2>

    <div class="form-group">
        <label>Subject Code:</label>
        <p><%= request.getParameter("code") %></p>
    </div>

    <div class="form-group">
        <label>Subject Name:</label>
        <p><%= request.getParameter("subject") %></p>
    </div>

    <div class="form-group">
        <label>Credit Hours:</label>
        <p><%= request.getParameter("credit") %></p>
    </div>

    <div class="button-group">
        <button type="button" class="btn btn-submit" onclick="alert('Information Verified!')">Confirm</button>
    </div>
</div>