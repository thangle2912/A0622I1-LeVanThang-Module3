<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/14/2022
  Time: 8:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Thêm mới sản phẩm</title>
    <link rel="stylesheet" href="../../../css/bootstrap.css">

</head>
<body>
<c:import url="nav.jsp"></c:import>

<div class="container">
    <div class="row">
        <div class="col-12">
            <a href="/user"><button type="button" class="btn btn-primary" style="margin: 10px">Quay lại danh sách</button></a>
        </div>
    </div>
    <h3>${mess}</h3>
    <form class=" g-3" action="/user?action=create" method="post">
        <div class="row">
            <div class="col-md-6">
                <label for="name" class="form-label">Tên người dùng</label>
                <input type="text" class="form-control" id="name" name="name">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="price" class="form-label">Email</label>
                <input type="email" class="form-control" id="price" name="email">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="amount" class="form-label">Country</label>
                <input type="text" class="form-control" id="amount" name="country">
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Thêm mới</button>
            </div>
        </div>

    </form>
</div>
</body>
</html>
