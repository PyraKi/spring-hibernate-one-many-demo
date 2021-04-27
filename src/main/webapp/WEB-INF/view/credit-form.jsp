<%-- 
    Document   : credit-form
    Created on : Mar 14, 2021, 10:48:21 AM
    Author     : TriPham
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <title>Credit Card</title>
    </head>
    <body>

        <h1>Credit Card</h1>

        <c:url var="saveUrl" value="/creditcard/saveCard?personId=${personId}" />
        <c:if test= "${isUpdate}">
            <c:url var="saveUrl" value="/creditcard/updateCard?personId=${personId}" />
        </c:if> 
        <form:form modelAttribute="creditCardAttribute" method="POST" action="${saveUrl}">
            <form:hidden path="id" />
            <table class="table">
                <tr>
                <tr>
                    <td><form:label path="type">Type:</form:label></td>
                    <td><form:input path="type"/></td>
                </tr>

                <tr>
                    <td><form:label path="number">Number:</form:label></td>
                    <td><form:input path="number"/></td>
                </tr>
            </table>
            <c:url var="ccInfoUrl" value="/person/showInfo">
                <c:param name="personId" value="${personId}" />
            </c:url>
            <input class="btn btn-success ml-1" type="submit" value="Save" />
            <a class="ml-3" href="${ccInfoUrl}">
                <input class="btn btn-secondary" type="button" value="Back" />
            </a>
        </form:form>

    </body>
</html>
