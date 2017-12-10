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
    <jsp:attribute name="title">View Client</jsp:attribute>

    <jsp:body>
        <table class="table">
            <tbody>
            <tr>
                <td>Company Name:</td><td>${client.companyName}</td>
            </tr>
            <tr>
                <td>Website URI:</td><td>${client.websiteURI}</td>
            </tr>
            <tr>
                <td>Phone Number:</td><td>${client.phoneNumber}</td>
            </tr>
            <tr>
                <td>Street Address:</td><td>${client.streetAddress}</td>
            </tr>
            <tr>
                <td>City:</td><td>${client.city}</td>
            </tr>
            <tr>
                <td>State:</td><td>${client.state}</td>
            </tr>
            <tr>
                <td>Zip Code:</td><td>${client.zipCode}</td>
            </tr>
            <tr>
                <td>Contacts:</td>
                <td>
                    <c:forEach items="${people}" var="person">
                        <ul>
                            <li>
                                ${person.firstName} ${person.lastName}
                            </li>
                        </ul>
                    </c:forEach>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="btn-group btn-group-sm">
            <a class="btn btn-default" href="${pageContext.request.contextPath}/client/edit/${client.clientId}">Edit</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/client/delete/${client.clientId}">Delete</a>
        </div>
    </jsp:body>
</t:base_page>
