<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
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
    <jsp:invoke fragment="footer"/>
</footer>
</body>
</html>

