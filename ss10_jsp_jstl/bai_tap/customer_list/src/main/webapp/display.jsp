<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/12/2022
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Hiển thị danh sách khách hàng</title>
    <link rel="stylesheet" href="../../../css/bootstrap.css">
    <style>
        img{
            max-width: 200px;
        }
    </style>
</head>
<body>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Tên</th>
            <th scope="col">Ngày sinh</th>
            <th scope="col">Địa Chỉ</th>
            <th scope="col">Ảnh</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="customer" items="${customerList}" varStatus="status">
            <tr>
                <th scope="row">${status.count}</th>
                <td>${customer.getName()}</td>
                <td>${customer.getBirthday()}</td>
                <td>${customer.getAddress()}</td>
                <td>
                    <img src="${customer.getImgUrl()}">
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
