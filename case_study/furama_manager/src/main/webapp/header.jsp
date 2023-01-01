<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/29/2022
  Time: 9:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header-custom">
    <div class="row">
        <div class="">
            <nav class="navbar navbar-dark bg-primary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.jsp">
                        <img src="https://cdn-icons-png.flaticon.com/512/5273/5273660.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
                        Furuma
                    </a>
                </div>
            </nav>
        </div>
    </div>
    <div class="row">
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="position: sticky; top: 0px">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="navbarScroll">
                        <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="/employee">Employee</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="/customer">Customer</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="/facility">Service</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="/contract">Contract</a>
                            </li>

                        </ul>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
