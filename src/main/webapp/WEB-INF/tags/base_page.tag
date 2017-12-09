<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${bootstrapCss}" rel="stylesheet"/>
</head>

<body>
<header id="pageheader">
    <h1><jsp:invoke fragment="title"/></h1>
    <jsp:invoke fragment="header"/>
</header>

<div id="body">
    <jsp:doBody/>
</div>

<footer id="pagefooter">
    <c:url value="/person/list" var="personUrl" />
    <c:url value="/client/list" var="clientUrl" />
    <a href="${personUrl}">connection</a> | <a href="${clientUrl}">client</a>
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

