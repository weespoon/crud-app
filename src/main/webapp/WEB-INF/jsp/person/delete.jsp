<%-- 
    Document   : delete
    Created on : Apr 22, 2011, 3:55:55 PM
    Author     : FMilens
--%>

<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@taglib prefix='t' tagdir='/WEB-INF/tags' %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<t:base_page>
    <jsp:attribute name="title">Delete Person</jsp:attribute>

    <jsp:body>

        <p>You are about to delete the person ${person.firstName} ${person.lastName}:  Are you sure?</p>

        <form action="${pageContext.request.contextPath}/person/delete" method="post">
            <input type="hidden" name="personId" value="${person.personId}"/>
            <input class="btn btn-primary" type="submit" name="command" value="Cancel"/>
            <input class="btn btn-dark" type="submit" name="command" value="Delete"/>
        </form>

    </jsp:body>
</t:base_page>

