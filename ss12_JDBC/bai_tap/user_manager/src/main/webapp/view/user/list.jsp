<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/14/2022
  Time: 7:47 PM
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
<c:import url="nav.jsp"></c:import>
<div class="container">
    <div class="row" style="margin: 10px">
        <div class="col-3">
            <a href="/user?action=create">
                <button type="button" class="btn btn-primary">Thêm mới sản phẩm</button>
            </a>
        </div>
        <div class="col-9">
            <form action="/user?action=search" method="get" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                <input type="search" hidden value="search" name="action">
                <input type="search" class="form-control" placeholder="Tìm kiếm" name="nameSearch">
                <button type="submit" class="btn btn-light " hidden>Tìm kiếm</button>
            </form>
        </div>
    </div>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">ID: lấy để test</th>
            <th scope="col">Tên</th>
            <th scope="col">Email</th>
            <th scope="col">Quê quán</th>
            <th colspan="2" style="text-align: center">Thao tác</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="user" items="${userList}" varStatus="status">
            <tr>
                <th scope="row">${status.count}</th>
                <td>${user.getId()}</td>
                <td>${user.getName()}</td>
                <td>${user.getEmail()}</td>
                <td>${user.getCountry()}</td>
                <td>
                    <a href="/user?action=edit&&id=${user.getId()}">
                        <button type="button" class="btn btn-warning">Sửa</button>
                    </a>
                </td>
                <td>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"
                            onclick="deleteUser(${user.getId()},'${user.getName()}')">Xoá
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
                    Bạn có muốn xoá người dùng <span id="nameUserDelete"></span> ?
                </div>
                <form action="/user?action=delete" method="get">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng
                        </button>
                        <button type="submit" class="btn btn-danger">Xoá</button>
                        <input  hidden name="id"  type="text" id="idDelete">
                        <input  hidden name="action" value="delete"  type="text" id="">

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
    function deleteUser(id, name) {
        document.getElementById('nameUserDelete').innerText = name;
        document.getElementById('idDelete').value = id;
    }
</script>
</html>
