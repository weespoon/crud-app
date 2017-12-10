<%--
  Created by IntelliJ IDEA.
  User: ewith
  Date: 12/9/17
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@taglib prefix='t' tagdir='/WEB-INF/tags' %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<t:base_page>
    <jsp:attribute name="title">View Person</jsp:attribute>

    <jsp:body>
        <table class="table">
            <tbody>
                <tr>
                    <td>First Name:</td><td>${person.firstName}</td>
                </tr>
                <tr>
                    <td>Last Name:</td><td>${person.lastName}</td>
                </tr>
                <tr>
                    <td>Email Address:</td><td>${person.emailAddress}</td>
                </tr>
                <tr>
                    <td>Street Address:</td><td>${person.streetAddress}</td>
                </tr>
                <tr>
                    <td>City:</td><td>${person.city}</td>
                </tr>
                <tr>
                    <td>State:</td><td>${person.state}</td>
                </tr>
                <tr>
                    <td>Zip Code:</td><td>${person.zipCode}</td>
                </tr>
                <tr>
                    <td>Client:</td><td>${client.companyName}</td>
                </tr>
            </tbody>
        </table>
        <div class="btn-group btn-group-sm">
            <a class="btn btn-default" href="${pageContext.request.contextPath}/person/edit/${person.personId}">Edit</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/person/delete/${person.personId}">Delete</a>
        </div>
    </jsp:body>
</t:base_page>
