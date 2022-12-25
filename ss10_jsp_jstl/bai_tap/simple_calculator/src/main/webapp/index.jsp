<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/12/2022
  Time: 8:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Máy tính đơn giản</title>
    <link rel="stylesheet" href="../../../css/bootstrap.css">
</head>
<body>
<div class="container">
    <form class="row g-3" method="post" action="/calculator">

        <div class="col-md-3">
            <label for="number1" class="form-label">First operand</label>
            <input type="number" class="form-control" id="number1" name="number1">
        </div>
        <div class="col-md-4">
            <label for="inputState" class="form-label" >Operator</label>
            <select id="inputState" class="form-select" name="operator">
                <option value="+">Addition</option>
                <option value="-">Subtraction</option>
                <option value="*">Multiplication</option>
                <option value="/">Division</option>
            </select>
        </div>
        <div class="col-md-3">
            <label for="number2" class="form-label">Second operand</label>
            <input type="number" class="form-control" id="number2" name="number2">
        </div>

        <div class="col-12">
            <button type="submit" class="btn btn-primary">Tính toán</button>
        </div>
    </form>
</div>
</body>
</html>
