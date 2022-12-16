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
    <title>Sửa thông tin sản phẩm</title>
    <link rel="stylesheet" href="../../../css/bootstrap.css">

</head>
<body>
<c:import url="nav.jsp"></c:import>

<div class="container">
    <div class="row">
        <div class="col-12">
            <a href="/product"><button type="button" class="btn btn-primary" style="margin: 10px">Quay lại danh sách</button></a>
        </div>

    </div>

    <form class=" g-3" action="/product?action=edit" method="post">
        <div class="row">
            <div class="col-md-6">
                <label  class="form-label">ID sản phẩm : ${product.getId()}</label>
                <input type="text" class="form-control"  name="id" value="${product.getId()}" hidden>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="name" class="form-label">Tên sản phẩm</label>
                <input type="text" class="form-control " id="name" name="name" value="${product.getName()}" >
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="price" class="form-label">Đơn giá</label>
                <input type="number" class="form-control" id="price" name="price" value="${product.getPrice()}">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="amount" class="form-label">Số lượng</label>
                <input type="number" class="form-control" id="amount" name="amount" value="${product.getAmount()}">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label class="form-label">Danh mục</label>
                <select class="form-select" aria-label="Default select example" name="category" value="${product.getCategory()}">
                    <option selected value="SamSung">SamSung</option>
                    <option value="Nokia">Nokia</option>
                    <option value="IPhone">IPhone</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <button type="submit" class="btn btn-primary" style="margin: 10px">Xác nhận</button>
            </div>
        </div>

    </form>
</div>
</body>
</html>
