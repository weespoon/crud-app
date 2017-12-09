<%-- 
    Document   : edit
    Created on : Apr 22, 2011, 3:04:46 PM
    Author     : FMilens
--%>

<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@taglib prefix='t' tagdir='/WEB-INF/tags' %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<t:base_page>
    <jsp:attribute name="title">Edit Person</jsp:attribute>

    <jsp:body>

        <c:if test="${fn:length(errors) gt 0}">
            <p>Please correct the following errors in your submission:</p>
            <ul>
                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </c:if>

        <form action="${pageContext.request.contextPath}/person/edit" method="POST">
            <input type="hidden" name="personId" value="${person.personId}"/>
            <t:person_form person="${person}"/>

            <c:forEach items="${clients}" var="client">
                <br/>
                <input type="radio" id="${client.clientId}" name="clientId" value="${client.clientId}"
                    <c:choose>
                        <c:when test="${client.clientId eq person.clientId}">
                            checked
                        </c:when>
                    </c:choose>
                />
                <label for="${client.clientId}">${client.companyName}</label>
            </c:forEach>
            <br/>
            <input type="submit" name="Submit" value="Submit"/>
        </form>


    </jsp:body>
</t:base_page>
