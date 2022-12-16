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
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="../../../css/bootstrap.css">
</head>
<body>
<c:import url="nav.jsp"></c:import>
<div class="container">
    <div class="row" style="margin: 10px">
        <div class="col-3">
            <a href="/product?action=create">
                <button type="button" class="btn btn-primary">Thêm mới sản phẩm</button>
            </a>
        </div>
        <div class="col-9">
            <form action="/product?action=search" method="get" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
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
            <th scope="col">Đơn giá</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Danh mục</th>
            <th colspan="3" style="text-align: center">Thao tác</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="product" items="${productList}" varStatus="status">
            <tr>
                <th scope="row">${status.count}</th>
                <td>${product.getId()}</td>
                <td>${product.getName()}</td>
                <td>${product.getPrice()}</td>
                <td>${product.getAmount()}</td>
                <td>${product.getCategory()}</td>
                <td>
                    <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#detailProduct">
                        Chi tiết
                    </button>
                    <div class="modal fade" id="detailProduct" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel"> Chi tiết sản phẩm</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-4"><h5>Tên sản phẩm</h5></div>
                                            <h5></h5>
                                            <div class="col-md-8 ms-auto">${product.getName()}</div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-4"><h5>Giá sản phẩm</h5></div>
                                            <div class="col-md-8 ms-auto">${product.getPrice()}</div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-4"><h5>Số lượng</h5></div>
                                            <div class="col-md-8 ms-auto">${product.getAmount()}</div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-md-4"><h5>Danh mục</h5></div>
                                            <div class="col-md-8 ms-auto">${product.getCategory()}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
                <td>
                    <a href="/product?action=edit&&id=${product.getId()}">
                        <button type="button" class="btn btn-warning">Sửa</button>
                    </a>

                </td>
                <td>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"
                            onclick="deleteProduct(${product.getId()},'${product.getName()}')">Xoá
                    </button>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
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
                    Bạn có muốn xoá sản phẩm <span id="nameProductDelete"></span> ?
                </div>
                <form action="/product?action=delete" method="get">
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

</div>

</body>
<script src="../../../js/bootstrap.js"></script>
<script>
    function deleteProduct(id, name) {
        document.getElementById('nameProductDelete').innerText = name;
        let deleteBtn = document.getElementById('deleteOption');
        document.getElementById('idDelete').value = id;


    }


</script>
</html>
