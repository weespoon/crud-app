<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="title" fragment="true" %>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><jsp:invoke fragment="title"/></title>
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
</body>
</html>

