<%-- 
    Document   : create
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
    <jsp:attribute name="title">Create Client</jsp:attribute>

    <jsp:body>

        <c:if test="${fn:length(errors) gt 0}">
            <p>Please correct the following errors in your submission:</p>
            <ul>
                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </c:if>

        <form action="${pageContext.request.contextPath}/client/create" method="POST">
            <t:client_form client="${client}"/>

            <c:forEach items="${people}" var="person">
                <div class="form-check">
                    <label class="form-check-label" for="${person.personId}">
                        <input class="form-check-input" type="checkbox" id="${person.personId}" name="personId" value="${person.personId}"/>
                        ${person.firstName} ${person.lastName}
                    </label>
                </div>
            </c:forEach>
            <div class="form-group">
                <input class="form-control" type="submit" name="Submit" value="Submit"/>
            </div>

        </form>

    </jsp:body>
</t:base_page>

