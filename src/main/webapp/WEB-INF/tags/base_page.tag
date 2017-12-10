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

    <c:url value="/resources/vendor/bootstrap3/css/bootstrap.css" var="bootstrapCss"/>
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
        <c:if test="${fn:containsIgnoreCase(pageContext.request.requestURL, 'person')}">
            <c:set value="active" var="personActive" />
        </c:if>
        <c:if test="${fn:containsIgnoreCase(pageContext.request.requestURL, 'client')}">
            <c:set value="active" var="clientActive" />
        </c:if>
        <ul class="nav nav-pills">
           <li class="nav-item ${personActive}">
               <a class="nav-link ${personActive}" href="${personUrl}">People</a>
           </li>
            <li class="nav-item ${clientActive}">
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
<c:url value="/resources/vendor/popper.js" var="popperJs"/>
<c:url value="/resources/vendor/bootstrap3/js/bootstrap.js" var="bootstrapJs"/>
<c:url value="/resources/vendor/validator.js" var="bootstrapValidatorJs"/>

<script src="${jQueryJS}"></script>
<script src="${popperJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="${bootstrapValidatorJs}"></script>

</body>
</html>

