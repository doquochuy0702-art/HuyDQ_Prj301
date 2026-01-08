<%-- 
    Document   : index
    Created on : Jan 8, 2026, 9:46:34 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form action="MainController" method="get">
            a:<input type="text" name="txtA" value="" /> <br> 
            b:<input type="text" name="txtB" value="" /> <br>
            <select name="txtOp">
                <option value="+">+</option>
                <option value="-">-</option>
                <option value="*">*</option>
                <option value="/">/</option>
            </select>
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>
