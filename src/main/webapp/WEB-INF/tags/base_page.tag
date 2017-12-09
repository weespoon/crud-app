<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@attribute name="title" fragment="true" %>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<!doctype html>
<html lang="en">
<head>
    <title><jsp:invoke fragment="title"/></title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <c:url value="/resources/vendor/bootstrap4/css/bootstrap.css" var="bootstrapCss"/>
    <c:url value="/resources/css/crud.css" var="crudCss"/>
    <link href="${bootstrapCss}" rel="stylesheet"/>
    <link href="${crudCss}" rel="stylesheet"/>
</head>

<body>
<header id="pageheader" class="container">
    <h1><jsp:invoke fragment="title"/></h1>
    <jsp:invoke fragment="header"/>
</header>

<navigation>
    <div class="container">
        <c:url value="/person/list" var="personUrl" />
        <c:url value="/client/list" var="clientUrl" />
        <c:choose>
            <c:when test="${fn:containsIgnoreCase(pageContext.request.requestURL, 'person')}">
                <c:set value="active" var="personActive" />
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${fn:containsIgnoreCase(pageContext.request.requestURL, 'client')}">
                <c:set value="active" var="clientActive" />
            </c:when>
        </c:choose>
        <ul class="nav nav-pills">
           <li class="nav-item">
               <a class="nav-link ${personActive}" href="${personUrl}">Connections</a>
           </li>
            <li class="nav-item">
                <a class="nav-link ${clientActive}" href="${clientUrl}">Clients</a>
            </li>
        </ul>
    </div>
</navigation>

<div id="body" class="container">
    <jsp:doBody/>
</div>

<footer id="pagefooter" class="container">
    <jsp:invoke fragment="footer"/>
</footer>

<c:url value="/resources/vendor/jquery.js" var="jQueryJS"/>
<c:url value="/resources/vendor/jquery.validate.js" var="jQueryValidateJS"/>
<c:url value="/resources/vendor/popper.js" var="popperJs"/>
<c:url value="/resources/vendor/bootstrap4/js/bootstrap.js" var="bootstrapJs"/>

<script src="${jQueryJS}"></script>
<script src="${jQueryValidateJS}"></script>
<script src="${popperJs}"></script>
<script src="${bootstrapJs}"></script>

</body>
</html>

