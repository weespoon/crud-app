<%-- 
    Document   : list
    Created on : Dec 8, 2017, 4:12:00 PM
    Author     : ewith
--%>


<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@taglib prefix='t' tagdir='/WEB-INF/tags' %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<t:base_page>
    <jsp:attribute name="title">Client Listing</jsp:attribute>

    <jsp:body>

        <c:choose>
            <c:when test="${fn:length(clients) gt 0}">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Company Name</th>
                            <th>Website URI</th>
                            <th>Phone Number</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${clients}" var="client">
                            <tr>
                                <td>${client.companyName}</td>
                                <td>${client.websiteURI}</td>
                                <td>${client.phoneNumber}</td>
                                <td>
                                    <a class="badge badge-primary" href="${pageContext.request.contextPath}/client/edit/${client.clientId}">Edit</a>
                                    <a class="badge badge-dark" href="${pageContext.request.contextPath}/client/delete/${client.clientId}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p>No results found.</p>
            </c:otherwise>
        </c:choose>

        <a class="btn btn-primary breathe" href="${pageContext.request.contextPath}/client/create">Create New Client</a>

    </jsp:body>
</t:base_page>
