<%-- 
    Document   : credit-info
    Created on : Apr 27, 2021, 10:15:50 AM
    Author     : nhoxc
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <title>Credit Info</title>
</head>
<body>
    <h1>Person Info</h1>
    
    <c:url var="editImgUrl" value="/resources/img/edit.png" />
    <c:url var="deleteImgUrl" value="/resources/img/delete.png" />
    
    <table class="table table-bordered">
        <tr>
            <td>First Name</td>
            <td><c:out value="${person.firstName}"/></td>
        </tr>

        <tr>
            <td>Last Name</td>
            <td><c:out value="${person.lastName}"/></td>
        </tr>

        <tr>
            <td>Money</td>
            <td><c:out value="${person.money}"/></td>
        </tr>
    </table>
        
    </br>
    <h3>CC List</h3>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>CC Type</th>
                <th>CC Number</th>
                <th>Add</th>
                <th>Edit</th>
                <th>Remove</th>
            </tr>
        </thead>
        <tbody>
        <c:if test="${!empty person.creditCards}">
            <c:forEach items="${person.creditCards}" var="creditCard">
                <tr>
                    <td><c:out value="${creditCard.type}" /></td>
                    <td><c:out value="${creditCard.number}" /></td>
                    <c:url var="addCcUrl" value="/creditcard/showFormForAdd?personId=${person.id}" />
                    <c:url var="editCcUrl" value="/creditcard/showFormForUpdate?personId=${person.id}&creditCardId=${creditCard.id}" />
                    <c:url var="deleteCcUrl" value="/creditcard/delete?personId=${person.id}&creditCardId=${creditCard.id}" />
                    <td><a href="${addCcUrl}">+</a></td>
                    <td><a href="${editCcUrl}"><img src="${editImgUrl}"/></a></td>
                    <td><a href="${deleteCcUrl}"><img src="${deleteImgUrl}"/></a></td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${empty person.creditCards}">
            <tr>
                <td>N/A</td>
                <td>N/A</td>
                <c:url var="addCcUrl" value="/creditcard/showFormForAdd?personId=${person.id}" />
                <td><a href="${addCcUrl}">+</a></td>
                <td></td>
                <td></td>
            </tr>
        </c:if>
        </tbody>
    </table>
    <p><a href="list">Person list</a></p>
</body>
</html>
