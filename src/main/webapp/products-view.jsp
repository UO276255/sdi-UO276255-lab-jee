<%--
  Created by IntelliJ IDEA.
  User: uo276255
  Date: 07/02/2022
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.uniovi.sdi.ProductsService" %>
<%@ page import="com.uniovi.sdi.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="com.uniovi.sdi.* , java.util.List"%>
<html lang="en">
<head>
    <title>Servlets</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" id="main-container">
    <h2>Productos</h2>
    <div class="row ">
        <jsp:useBean id="productsService" class="com.uniovi.sdi.ProductsService"/>
        <c:forEach var="product" begin="0" items="${productsService.products}">
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div>
                    <img src="<c:out value="${product.image}"/>"/>
                    <div><c:out value="${product.name}"/></div>
                    <a href="AddToShoppingCart?product=<c:out value="${product.name}"/>"
                       class="btn btn-default">
                        <c:out value="${product.price}"/> €
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
