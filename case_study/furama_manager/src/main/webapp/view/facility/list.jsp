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
    <title>Danh sách dịch vụ</title>
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
            <a href="/facility?action=create">
                <button type="button" class="btn btn-primary">Thêm mới dịch vụ</button>
            </a>
        </div>
        <div class="col-9">
            <form action="/facility?action=search" method="get" class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                <input type="search" hidden value="search" name="action">
                <input type="search" class="form-control" placeholder="Tìm kiếm" name="nameSearch">
                <button type="submit" class="btn btn-light " hidden>Tìm kiếm</button>
            </form>
        </div>
    </div>
    <h2>Villa</h2>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">ID: lấy để test</th>
            <th scope="col">Tên</th>
            <th scope="col">Diện tích</th>
            <th scope="col">Chi phí</th>
            <th scope="col">Số người tối đa</th>
            <th scope="col">Kiểu thuê</th>
            <th scope="col">Tiêu chuẩn phòng</th>
            <th scope="col">Mô tả tiện nghi khác</th>
            <th scope="col">Diện tích hồ bơi</th>
            <th scope="col">Số tầng</th>
            <th colspan="2" style="text-align: center">Thao tác</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="villa" items="${villaList}" varStatus="status">
            <tr>
                <th scope="row">${status.count}</th>
                <td>${villa.getId()}</td>
                <td>${villa.getName()}</td>
                <td>${villa.getArea()}</td>
                <td>${villa.getCost()}</td>
                <td>${villa.getMaxPeople()}</td>
                <td>${villa.getRentalType().getName()}</td>
                <td>${villa.getStandardRoom()}</td>
                <td>${villa.getDescriptionOtherConvenience()}</td>
                <td>${villa.getAreaPool()}</td>
                <td>${villa.getNumberFloor()}</td>

                <td>
                    <a href="/facility?action=edit&&facilityType=villa&&id=${villa.getId()}">
                        <button type="button" class="btn btn-warning">Sửa</button>
                    </a>
                </td>
                <td>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"
                            onclick="deleteFacility(${villa.getId()},'${villa.getName()}')">Xoá
                    </button>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <h2>House</h2>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">ID: lấy để test</th>
            <th scope="col">Tên</th>
            <th scope="col">Diện tích</th>
            <th scope="col">Chi phí</th>
            <th scope="col">Số người tối đa</th>
            <th scope="col">Kiểu thuê</th>
            <th scope="col">Tiêu chuẩn phòng</th>
            <th scope="col">Mô tả tiện nghi khác</th>
            <th scope="col">Số tầng</th>
            <th colspan="2" style="text-align: center">Thao tác</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="house" items="${houseList}" varStatus="status">
            <tr>
                <th scope="row">${status.count}</th>
                <td>${house.getId()}</td>
                <td>${house.getName()}</td>
                <td>${house.getArea()}</td>
                <td>${house.getCost()}</td>
                <td>${house.getMaxPeople()}</td>
                <td>${house.getRentalType().getName()}</td>
                <td>${house.getStandardRoom()}</td>
                <td>${house.getDescriptionOtherConvenience()}</td>
                <td>${house.getNumberFloor()}</td>

                <td>
                    <a href="/facility?action=edit&&facilityType=house&&id=${house.getId()}">
                        <button type="button" class="btn btn-warning">Sửa</button>
                    </a>
                </td>
                <td>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"
                            onclick="deleteFacility(${house.getId()},'${house.getName()}')">Xoá
                    </button>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <h2>Room</h2>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">ID: lấy để test</th>
            <th scope="col">Tên</th>
            <th scope="col">Diện tích</th>
            <th scope="col">Chi phí</th>
            <th scope="col">Số người tối đa</th>
            <th scope="col">Kiểu thuê</th>
            <th scope="col">Dịch vụ miễn phí đi kèm</th>
            <th colspan="2" style="text-align: center">Thao tác</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="room" items="${roomList}" varStatus="status">
            <tr>
                <th scope="row">${status.count}</th>
                <td>${room.getId()}</td>
                <td>${room.getName()}</td>
                <td>${room.getArea()}</td>
                <td>${room.getCost()}</td>
                <td>${room.getMaxPeople()}</td>
                <td>${room.getRentalType().getName()}</td>
                <td>${room.getFacilityFree()}</td>

                <td>
                    <a href="/facility?action=edit&&facilityType=room&&id=${room.getId()}">
                        <button type="button" class="btn btn-warning">Sửa</button>
                    </a>
                </td>
                <td>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal"
                            onclick="deleteFacility(${room.getId()},'${room.getName()}')">Xoá
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
                    <h5 class="modal-title" id="staticBackdropLabel">Xoá dịch vụ</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có muốn xoá dịch vụ <span id="nameFacilityDelete"></span> ?
                </div>
                <form action="/facility?action=delete" method="get">
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
    function deleteFacility(id, name) {
        document.getElementById('nameFacilityDelete').innerText = name;
        document.getElementById('idDelete').value = id;
    }
</script>
</html>
