<%-- 
    Document   : create
    Created on : Apr 22, 2011, 3:24:13 PM
    Author     : FMilens
--%>
<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@taglib prefix='t' tagdir='/WEB-INF/tags' %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<t:base_page>
    <jsp:attribute name="title">Create Person</jsp:attribute>

    <jsp:body>

        <c:if test="${fn:length(errors) gt 0}">
            <p>Please correct the following errors in your submission:</p>
            <ul>
                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </c:if>

        <form role="form" data-toggle="validator" action="${pageContext.request.contextPath}/person/create" method="POST">
            <t:person_form person="${person}"/>

            <c:forEach items="${clients}" var="client">

                <div class="form-check">
                    <label class="form-check-label" for="${client.clientId}">
                        <input class="form-check-input" type="radio" id="${client.clientId}" name="clientId" value="${client.clientId}"/>
                        ${client.companyName}
                    </label>
                </div>
            </c:forEach>
                <div class="form-group">
                    <input class="form-control" type="submit" name="Submit" value="Submit"/>
                </div>
        </form>

    </jsp:body>
</t:base_page>


