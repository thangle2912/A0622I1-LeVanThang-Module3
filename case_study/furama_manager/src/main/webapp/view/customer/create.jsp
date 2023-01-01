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
    <title>Thêm mới khách hàng</title>
    <link rel="stylesheet" href="../../../css/bootstrap.css">
</head>
<body>
<c:import url="../../header.jsp"></c:import>

<div class="container">
    <div class="row">
        <div class="col-12">
            <a href="/customer"><button type="button" class="btn btn-primary" style="margin: 10px">Quay lại danh sách</button></a>
        </div>
    </div>
    <h3>${mess}</h3>
    <form class=" g-3" action="/customer?action=create" method="post">
        <div class="row">
            <div class="col-md-6">
                <label for="name" class="form-label">Tên khách hàng</label>
                <input type="text" class="form-control" id="name" name="name">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="birthday" class="form-label">Ngày sinh</label>
                <input  max="2004-01-01" min="1922-01-01" type="date" class="form-control" id="birthday" name="birthday">
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <label for="phoneNumber" class="form-label">Số điện thoại</label>
                <input type="number" class="form-control" id="phoneNumber" name="phoneNumber">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label for="idCard" class="form-label">Id Card</label>
                <input type="number" class="form-control" id="idCard" name="idCard">
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <label for="address" class="form-label">Địa chỉ</label>
                <input type="text" class="form-control" id="address" name="address">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label class="form-label">Giới tính</label>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="selectGender" id="inlineRadio1" value="true">
                    <label class="form-check-label" for="inlineRadio1">Nam</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="selectGender" id="inlineRadio2" value="false">
                    <label class="form-check-label" for="inlineRadio2">Nữ</label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label  class="form-label">Loại khách hàng</label>
                <select  class="form-select" name="customerTypeId">
                    <option value="0">Chọn loại khách hàng</option>
                    <c:forEach var="customerType" items="${customerTypeList}">
                        <option value="${customerType.getId()}">${customerType.getName()}</option>
                    </c:forEach>
                </select><br>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <button type="submit" class="btn btn-primary" >Thêm mới</button>
            </div>
        </div>

    </form>
</div>

</body>
</html>
