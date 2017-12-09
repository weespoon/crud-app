<%-- 
    Document   : delete
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
    <jsp:attribute name="title">Delete Client</jsp:attribute>

    <jsp:body>
        <p>You are about to delete the client ${client.companyName}:  Are you sure?</p>

        <form action="${pageContext.request.contextPath}/client/delete" method="post">
            <input type="hidden" name="clientId" value="${client.clientId}"/>
            <input class="btn btn-primary" type="submit" name="command" value="Cancel"/>
            <input class="btn btn-dark" type="submit" name="command" value="Delete"/>
        </form>

    </jsp:body>
</t:base_page>


