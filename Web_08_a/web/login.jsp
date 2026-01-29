<%-- 
    Document   : login
    Created on : Jan 8, 2026, 11:20:22 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="login"/>
            Username: <input type="text" name="txtUsername" required/> <br>
            Password: <input type="password" name="txtPassword" required/> <br>
            <input type="submit" value="Login" />
        </form>
        <c:if test="not epty message">
            ${mesage}
        </c:if>
    </body>
</html>
