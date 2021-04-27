<%-- 
    Document   : person-form
    Created on : Mar 13, 2021, 9:42:35 PM
    Author     : TriPham
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html >
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <title>Person</title>
    </head>
    <body>

        <h1>Create New Record</h1>
        <c:url var="saveUrl" value="/person/savePerson" />
        <c:if test= "${isUpdate}">
            <c:url var="saveUrl" value="/person/updatePerson" />
        </c:if>

        <form:form modelAttribute="person" method="POST" action="${saveUrl}">
            <form:hidden path="id" />
            <%--
           This line is very important. Without this line, we'd actually lose context or we actually lose the id of the
           original customer. So we need to use this line to actually track the customer just so the back end system 
           knows which customer to form the update operation on. 
            --%>
            <table class="table table-bordered">
                <tr>
                    <td><form:label path="firstName">First Name:</form:label></td>
                    <td><form:input path="firstName"/></td>
                </tr>

                <tr>
                    <td><form:label path="lastName">Last Name</form:label></td>
                    <td><form:input path="lastName"/></td>
                </tr>

                <tr>
                    <td><form:label path="money">Money</form:label></td>
                    <td><form:input path="money"/></td>
                </tr>
            </table>
                <input class="btn btn-warning ml-1" type="submit" value="Save" />
                <a class="ml-3" href="list">
                    <input class="btn btn-danger" type="button" value="Exit" />
                </a>
        </form:form>

    </body>
</html>
