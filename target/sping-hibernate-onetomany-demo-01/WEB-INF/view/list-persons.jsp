<%-- 
    Document   : person
    Created on : Mar 13, 2021, 7:43:39 PM
    Author     : TriPham
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

        <title>Person List</title>
    </head>
    <body>
        <h1>Records</h1>

        <c:url var="editImgUrl" value="/resources/img/edit.png" />
        <c:url var="deleteImgUrl" value="/resources/img/delete.png" />
        <c:url var="collectionImgUrl" value="/resources/img/collection.svg" />
        <c:url var="addUrl" value="/person/showFormForAdd" />

        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Money</th>
                    <th>Edit</th>
                    <th>Delete</th>
                    <th>CC Info</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${persons}" var="person">
                    <%--<c:url var="editUrl" value="/person/showFormForUpdate?personId=${person.id}" />
                    <c:url var="deleteUrl" value="/person/delete?personId=${person.id}" />--%>
                    <c:url var="editUrl" value="/person/showFormForUpdate">
                        <c:param name="personId" value="${person.id}" />
                    </c:url>					
                    <!-- construct an "delete" link with customer id -->
                    <c:url var="deleteUrl" value="/person/delete">
                        <c:param name="personId" value="${person.id}" />
                    </c:url>
                   
                    <tr>
                        <td><c:out value="${person.id}" /></td>
                        <td><c:out value="${person.firstName}" /></td>
                        <td><c:out value="${person.lastName}" /></td>
                        <td><c:out value="${person.money}" /></td>
                        <td><a href="${editUrl}"><img src="${editImgUrl}"/></a></td>
                        <td><a href="${deleteUrl}"><img src="${deleteImgUrl}"/></a></td>
                        <!-- construct an "cc info" link with customer id -->
                        <c:url var="ccInfoUrl" value="/person/showInfo">
                            <c:param name="personId" value="${person.id}" />
                        </c:url>
                        <td><a href="${ccInfoUrl}"><img src="${collectionImgUrl}"/></a></td>
                    </tr>

                </c:forEach>
            </tbody>
        </table>
        
        
        <c:if test="${empty persons}">
            No records found. 
        </c:if>

        <p><a href="${addUrl}">Create new record</a></p>

    </body>
</html>
