<%-- 
    Document   : list
    Created on : Apr 22, 2011, 2:25:22 PM
    Author     : FMilens
--%>

<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@taglib prefix='t' tagdir='/WEB-INF/tags' %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<t:base_page>
    <jsp:attribute name="title">People Listing</jsp:attribute>

    <jsp:body>
        <c:choose>
            <c:when test="${fn:length(persons) gt 0}">
                <table class="table">
                    <thead>
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email Address</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${persons}" var="person">
                            <tr>
                                <td>${person.firstName}</td>
                                <td>${person.lastName}</td>
                                <td>${person.emailAddress}</td>
                                <td>
                                    <div class="btn-group btn-group-sm">
                                        <a class="btn btn-default" href="${pageContext.request.contextPath}/person/view/${person.personId}">View</a>
                                        <a class="btn btn-default" href="${pageContext.request.contextPath}/person/edit/${person.personId}">Edit</a>
                                        <a class="btn btn-default" href="${pageContext.request.contextPath}/person/delete/${person.personId}">Delete</a>
                                    </div>
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

        <a class="btn btn-primary breathe" href="${pageContext.request.contextPath}/person/create">Create New Person</a>
    </jsp:body>
</t:base_page>
