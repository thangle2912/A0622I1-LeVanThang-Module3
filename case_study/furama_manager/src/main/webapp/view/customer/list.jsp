<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/26/2022
  Time: 8:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sách người dùng</title>
    <link rel="stylesheet" href="../../../css/bootstrap.css">
</head>
<body>
<c:import url="../../header.jsp"></c:import>

<div class="container">
    <div class="row">
        <h4> ${messDelete}</h4>
        <h4> ${messUpdate}</h4>
    </div>
    <div class="row" style="margin: 10px">
        <div class="col-3">
            <a href="/customer?action=create">
                <button type="button" class="btn btn-primary">Thêm mới khách hàng</button>
            </a>
        </div>
        <div class="col-9">
            <form action="/customer?action=search" method="get" class=" row d-flex">
                <input name="action" value="search" hidden>
                <div class="col-md-3">
                    <input type="search" class="form-control"  placeholder="Nhập tên" name="nameSearch">
                </div>
                <div class="col-md-3">
                    <input type="search" class="form-control" placeholder="Nhập địa chỉ" name="addressSearch">
                </div>
                <div class="col-md-3">
                    <input type="search" class="form-control" placeholder="Nhập số điên thoại" name="phoneNumberSearch">
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary ">Tìm kiếm</button>
                </div>

            </form>
        </div>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">ID: lấy để test</th>
            <th scope="col">Tên</th>
            <th scope="col">Ngày sinh</th>
            <th scope="col">Số điện thoại</th>
            <th scope="col">Email</th>
            <th scope="col">Id Card</th>
            <th scope="col">Địa chỉ</th>
            <th scope="col">Giới tính</th>
            <th scope="col">Loại khách hàng</th>
            <th colspan="2" style="text-align: center">Thao tác</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="customer" items="${customerList}" varStatus="status">
            <tr>
                <th scope="row">${status.count}</th>
                <td>${customer.getId()}</td>
                <td>${customer.getName()}</td>
                <td>${customer.getBirthdayFormat()}</td>
                <td>${customer.getPhoneNumber()}</td>
                <td>${customer.getEmail()}</td>
                <td>${customer.getId_card()}</td>
                <td>${customer.getAddress()}</td>

                <c:if test="${customer.isGender()}">
                    <td>Nam</td>
                </c:if>
                <c:if test="${!customer.isGender()}">
                    <td>Nữ</td>
                </c:if>
                <td>${customer.getCustomerType().getName()}</td>

                <td>
                    <a href="/customer?action=edit&&id=${customer.getId()}">
                        <button type="button" class="btn btn-warning">Sửa</button>
                    </a>
                </td>
                <td>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"
                            onclick="deleteCustomer(${customer.getId()},'${customer.getName()}')">Xoá
                    </button>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--    Modal delete--%>
    <div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false"
         tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Xoá sản phẩm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có muốn xoá người dùng <span id="nameCustomerDelete"></span> ?
                </div>
                <form action="/customer?action=delete" method="get">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng
                        </button>
                        <button type="submit" class="btn btn-danger">Xoá</button>
                        <input hidden name="id" type="text" id="idDelete">
                        <input hidden name="action" value="delete" type="text">
                    </div>
                </form>

            </div>
        </div>
    </div>
    <%--    Modal detail--%>

</div>

</div>

</body>
<script src="../../../js/bootstrap.js"></script>
<script>
    function deleteCustomer(id, name) {
        document.getElementById('nameCustomerDelete').innerText = name;
        document.getElementById('idDelete').value = id;
    }
</script>
</html>
