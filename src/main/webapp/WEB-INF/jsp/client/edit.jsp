<%-- 
    Document   : edit
    Created on : Dec 8, 2017, 4:12:00 PM
    Author     : ewith
--%>

<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Client</title>
    </head>
    <body>
        <h1>Edit Client</h1>
        <c:if test="${fn:length(errors) gt 0}">
            <p>Please correct the following errors in your submission:</p>
            <ul>
                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </c:if>
        <form action="${pageContext.request.contextPath}/client/edit" method="POST">
            <input type="hidden" name="clientId" value="${client.clientId}"/>
            <br/>
            <label for="companyName">Company Name:</label>
            <input type="text" name="companyName" value="${client.companyName}"/>
            <br/>
            <label for="websiteURI">Website URI:</label>
            <input type="text" name="websiteURI" value="${client.websiteURI}"/>
            <br/>
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" name="phoneNumber" value="${client.phoneNumber}"/>
            <br/>
            <label for="streetAddress">Street Address:</label>
            <input type="text" name="streetAddress" value="${client.streetAddress}"/>
            <br/>
            <label for="city">City:</label>
            <input type="text" name="city" value="${client.city}"/>
            <br/>
            <label for="state">State:</label>
            <input type="text" name="state" value="${client.state}"/>
            <br/>
            <label for="zipCode">Zip Code:</label>
            <input type="text" name="zipCode" value="${client.zipCode}"/>
            <br/>
            <input type="submit" name="Submit" value="Submit"/>
        </form>
    </body>
</html>
