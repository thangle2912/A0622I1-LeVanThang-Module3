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
    <title>Thêm mới dịch vụ</title>
    <link rel="stylesheet" href="../../../css/bootstrap.css">

</head>
<body>
<c:import url="../../header.jsp"></c:import>
<div class="container">
    <div class="row">
        <div class="col-12">
            <a href="/facility">
                <button type="button" class="btn btn-primary" style="margin: 10px">Quay lại danh sách dịch vụ</button>
            </a>
        </div>
    </div>
    <h3>${mess}</h3>
    <div>
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="pills-villa-tab" data-bs-toggle="pill" data-bs-target="#pills-villa"
                        type="button" role="tab" aria-controls="pills-villa" aria-selected="true">Villa
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="pills-house-tab" data-bs-toggle="pill" data-bs-target="#pills-house"
                        type="button" role="tab" aria-controls="pills-house" aria-selected="false">House
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="pills-room-tab" data-bs-toggle="pill" data-bs-target="#pills-room"
                        type="button" role="tab" aria-controls="pills-room" aria-selected="false">Room
                </button>
            </li>
        </ul>
        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-villa" role="tabpanel" aria-labelledby="pills-villa-tab">
                <form class=" g-3" action="/facility?action=create" method="post">
                    <input name="facilityType" value="villa" hidden>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="name" class="form-label">Tên dịch vụ</label>
                            <input type="text" class="form-control" id="name" name="name">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="area" class="form-label">Diện tích sử dụng</label>
                            <input  type="number" class="form-control" id="area" name="area">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label for="cost" class="form-label">Chi phí thuê</label>
                            <input type="number" class="form-control" id="cost" name="cost">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="maxPeople" class="form-label">Số người tối da</label>
                            <input type="number" class="form-control" id="maxPeople" name="maxPeople">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label  class="form-label">Kiểu thuê</label>
                            <select  class="form-select" name="rentalTypeId">
                                <option value="0">Chọn kiểu thuê</option>
                                <c:forEach var="rentalType" items="${rentalTypeList}">
                                    <option value="${rentalType.getId()}">${rentalType.getName()}</option>
                                </c:forEach>
                            </select><br>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label for="standardRoom" class="form-label">Tiêu chuẩn phòng</label>
                            <input type="text" class="form-control" id="standardRoom" name="standardRoom">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label for="descriptionOtherConvenience" class="form-label">Mô tả tiện nghi khác</label>
                            <input type="text" class="form-control" id="descriptionOtherConvenience" name="descriptionOtherConvenience">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="areaPool" class="form-label">Diện tích hồ bơi </label>
                            <input type="number" class="form-control" id="areaPool" name="areaPool">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="numberFloor" class="form-label">Số tầng</label>
                            <input type="number" class="form-control" id="numberFloor" name="numberFloor">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Thêm mới</button>
                        </div>
                    </div>

                </form>
            </div>
            <div class="tab-pane fade" id="pills-house" role="tabpanel" aria-labelledby="pills-house-tab">
                <form class=" g-3" action="/facility?action=create" method="post">
                    <input name="facilityType" value="house" hidden>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="nameHouse" class="form-label">Tên dịch vụ</label>
                            <input type="text" class="form-control" id="nameHouse" name="name">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="areaHouse" class="form-label">Diện tích sử dụng</label>
                            <input  type="number" class="form-control" id="areaHouse" name="area">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label for="costHouse" class="form-label">Chi phí thuê</label>
                            <input type="number" class="form-control" id="costHouse" name="cost">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="maxPeopleHouse" class="form-label">Số người tối da</label>
                            <input type="number" class="form-control" id="maxPeopleHouse" name="maxPeople">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label  class="form-label">Kiểu thuê</label>
                            <select  class="form-select" name="rentalTypeId">
                                <option value="0">Chọn kiểu thuê</option>
                                <c:forEach var="rentalType" items="${rentalTypeList}">
                                    <option value="${rentalType.getId()}">${rentalType.getName()}</option>
                                </c:forEach>
                            </select><br>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label for="standardRoomHouse" class="form-label">Tiêu chuẩn phòng</label>
                            <input type="text" class="form-control" id="standardRoomHouse" name="standardRoom">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label for="descriptionOtherConvenienceHouse" class="form-label">Mô tả tiện nghi khác</label>
                            <input type="text" class="form-control" id="descriptionOtherConvenienceHouse" name="descriptionOtherConvenience">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="numberFloorHouse" class="form-label">Số tầng</label>
                            <input type="number" class="form-control" id="numberFloorHouse" name="numberFloor">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Thêm mới</button>
                        </div>
                    </div>

                </form>
            </div>
            <div class="tab-pane fade" id="pills-room" role="tabpanel" aria-labelledby="pills-room-tab">
                <form class=" g-3" action="/facility?action=create" method="post">
                    <input name="facilityType" value="room" hidden>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="nameRoom" class="form-label">Tên dịch vụ</label>
                            <input type="text" class="form-control" id="nameRoom" name="name">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="areaRoom" class="form-label">Diện tích sử dụng</label>
                            <input  type="number" class="form-control" id="areaRoom" name="area">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label for="costRoom" class="form-label">Chi phí thuê</label>
                            <input type="number" class="form-control" id="costRoom" name="cost">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="maxPeopleRoom" class="form-label">Số người tối da</label>
                            <input type="number" class="form-control" id="maxPeopleRoom" name="maxPeople">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label  class="form-label">Kiểu thuê</label>
                            <select  class="form-select" name="rentalTypeId">
                                <option value="0">Chọn kiểu thuê</option>
                                <c:forEach var="rentalType" items="${rentalTypeList}">
                                    <option value="${rentalType.getId()}">${rentalType.getName()}</option>
                                </c:forEach>
                            </select><br>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label for="standardRoomRoom" class="form-label">Tiêu chuẩn phòng</label>
                            <input type="text" class="form-control" id="standardRoomRoom" name="standardRoom">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label for="facilityFree" class="form-label">Dịch vụ miễn phí đi kèm</label>
                            <input type="text" class="form-control" id="facilityFree" name="facilityFree">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Thêm mới</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
<script src="../../../js/bootstrap.js"></script>

</body>
</html>
