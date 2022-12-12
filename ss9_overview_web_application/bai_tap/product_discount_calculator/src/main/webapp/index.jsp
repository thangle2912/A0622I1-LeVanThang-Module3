<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/9/2022
  Time: 8:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ứng dụng Product Discount Calculator</title>
    <link rel="stylesheet"href="../../../css/bootstrap.css">
    <style>
        button{
            width: 100px;
        }
    </style>
</head>
<body>
<div class="container">
    <form class="row g-3" action="/display-discount" method="post">
        <div class="col-md-6">
            <div class="form-floating" style="margin-top:32px ">
                <textarea class="form-control" placeholder="Leave a comment here" id="description" name="description"></textarea>
                <label for="description">Mô tả sản phẩm</label>
            </div>
        </div>
        <div class="col-md-4">
            <label for="list_price" class="form-label">Giá niên yết</label>
            <input type="text" class="form-control" id="list_price" name="list_price">
        </div>
        <div class="col-md-2">
            <label for="discount_percent" class="form-label">Tỉ lệ chiết khấu(%)</label>
            <input type="text" class="form-control" id="discount_percent" name="discount_percent">
        </div>
        <div class="col-12">
            <button type="submit" style="width: auto" class="btn btn-primary">Tính chiết khấu</button>
        </div>
    </form>
</div>

</body>
</html>
