package controller;

import model.*;
import repository.VillaRepository;
import service.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.RoundingMode;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet(name = "FacilityServlet",value = "/facility")
public class FacilityServlet extends HttpServlet {
    private FacilityService facilityService = new FacilityService();
    private HouseService houseService = new HouseService();
    private RoomService roomService = new RoomService();
    private VillaService villaService = new VillaService();
    private RentalService rentalService = new RentalService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                saveFacility(request, response);
                break;
            case "edit":
                editFacility(request, response);
                break;
            default:
                showList(request, response);

        }
    }



    private void editFacility(HttpServletRequest request, HttpServletResponse response) {

        String facilityType = request.getParameter("facilityType");
        switch (facilityType){
            case "villa":
                editFacilityVilla(request,response);
                break;
            case "house":
                editFacilityHouse(request,response);
                break;
            case "room":
                editFacilityRoom(request,response);
                break;
            default:
                String mess = "Thêm mới thất bại";
                request.setAttribute("messCreate",mess);
                showCreateForm(request,response);
        }
    }

    private void editFacilityRoom(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        float area = Float.parseFloat(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));

        int rentalTypeId = Integer.parseInt(request.getParameter("rentalTypeId"));

        RentalType rentalType = new RentalType(rentalTypeId);
        String facilityFree = request.getParameter("facilityFree");
        String mess = "";
        if (roomService.update(id,name,area,cost,maxPeople,rentalType,facilityFree)) {
            mess = "Chỉnh sửa thành công";
        }else {
            mess = "Chỉnh sửa thất bại";
        }
        request.setAttribute("messUpdate", mess);
        showList(request,response);
    }

    private void editFacilityHouse(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        float area = Float.parseFloat(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));

        int rentalTypeId = Integer.parseInt(request.getParameter("rentalTypeId"));

        RentalType rentalType = new RentalType(rentalTypeId);
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        int numberFloor = Integer.parseInt(request.getParameter("numberFloor"));
        String mess = "";
        if (houseService.update(id,name,area,cost,maxPeople,rentalType,standardRoom,descriptionOtherConvenience,numberFloor)) {
            mess = "Chỉnh sửa thành công";
        }else {
            mess = "Chỉnh sửa thất bại";
        }
        request.setAttribute("messUpdate", mess);
        showList(request,response);

    }

    private void editFacilityVilla(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        float area = Float.parseFloat(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));

        int rentalTypeId = Integer.parseInt(request.getParameter("rentalTypeId"));

        RentalType rentalType = new RentalType(rentalTypeId);
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double areaPool = Double.parseDouble(request.getParameter("areaPool"));
        int numberFloor = Integer.parseInt(request.getParameter("numberFloor"));
        String mess = "";
        if (villaService.update(id,name,area,cost,maxPeople,rentalType,standardRoom,descriptionOtherConvenience,areaPool,numberFloor)) {
            mess = "Chỉnh sửa thành công";
        }else {
            mess = "Chỉnh sửa thất bại";
        }
        request.setAttribute("messUpdate", mess);
        showList(request,response);
    }

    private void saveFacility(HttpServletRequest request, HttpServletResponse response) {

        String facilityType =request.getParameter("facilityType");

        switch (facilityType){
            case "villa":
                saveFacilityVilla(request,response);
                break;
            case "house":
                saveFacilityHouse(request,response);
                break;
            case "room":
                saveFacilityRoom(request,response);
                break;
            default:
                String mess = "Thêm mới thất bại";
                request.setAttribute("messCreate",mess);
                showCreateForm(request,response);
        }

    }

    private void saveFacilityRoom(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        float area = Float.parseFloat(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));

        int rentalTypeId = Integer.parseInt(request.getParameter("rentalTypeId"));

        RentalType rentalType = new RentalType(rentalTypeId);
        String facilityFree = request.getParameter("facilityFree");
        Room room = new Room(name,area,cost,maxPeople,rentalType,facilityFree);
        boolean check = roomService.add(room);
        String mess = "Thêm mới thành công";
        if (!check) {
            mess = "Thêm mới không thành công";
        }
        request.setAttribute("mess", mess);
        showCreateForm(request, response);
    }

    private void saveFacilityHouse(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        float area = Float.parseFloat(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));

        int rentalTypeId = Integer.parseInt(request.getParameter("rentalTypeId"));

        RentalType rentalType = new RentalType(rentalTypeId);
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        int numberFloor = Integer.parseInt(request.getParameter("numberFloor"));
        House house = new House(name,area,cost,maxPeople,rentalType,standardRoom,descriptionOtherConvenience,numberFloor);
        boolean check = houseService.add(house);
        String mess = "Thêm mới thành công";
        if (!check) {
            mess = "Thêm mới không thành công";
        }
        request.setAttribute("mess", mess);
        showCreateForm(request, response);
    }

    private void saveFacilityVilla(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        float area = Float.parseFloat(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));

        int rentalTypeId = Integer.parseInt(request.getParameter("rentalTypeId"));

        RentalType rentalType = new RentalType(rentalTypeId);
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double areaPool = Double.parseDouble(request.getParameter("areaPool"));
        int numberFloor = Integer.parseInt(request.getParameter("numberFloor"));
        Villa villa = new Villa(name,area,cost,maxPeople,rentalType,standardRoom,descriptionOtherConvenience,areaPool,numberFloor);
        boolean check = villaService.add(villa);
        String mess = "Thêm mới thành công";
        if (!check) {
            mess = "Thêm mới không thành công";
        }
        request.setAttribute("mess", mess);
        showCreateForm(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "delete":
                deleteFacility(request, response);
                break;
//            case "search":
//                searchByCountry(request,response);
//                break;
            case "edit":
                showEditForm(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        String facilityType = request.getParameter("facilityType");
        int id = Integer.parseInt(request.getParameter("id"));
        switch (facilityType){
            case "villa":
                List<Villa> villaList = villaService.findAll();
                Villa villa = null;
                for(Villa villa1 : villaList){
                    if (villa1.getId()==id){
                        villa = villa1;
                    }
                }
                request.setAttribute("villa",villa);
                break;
            case "house":
                List<House> houseList = houseService.findAll();
                House house = null;
                for(House house1 : houseList){
                    if (house1.getId()==id){
                        house = house1;
                    }
                }
                request.setAttribute("house",house);
                break;
            case "room":
                List<Room> roomList = roomService.findAll();
                Room room = null;
                for(Room room1 : roomList){
                    if (room1.getId()==id){
                        room = room1;
                    }
                }
                request.setAttribute("room",room);
                break;
            default:
                break;

        }
        request.setAttribute("facilityType",facilityType);
        List<RentalType> rentalTypeList= rentalService.findAll();
        request.setAttribute("rentalTypeList",rentalTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/edit.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        String mess = "Xoá thành công";
        if (!facilityService.delete(id)){
            mess = "Xoá thất bại";
        }
        request.setAttribute("messDelete", mess);
        showList(request,response);

    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<RentalType> rentalTypeList= rentalService.findAll();
        request.setAttribute("rentalTypeList",rentalTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<House> houseList = houseService.findAll();
        List<Room> roomList = roomService.findAll();
        List<Villa> villaList = villaService.findAll();
        request.setAttribute("houseList", houseList);
        request.setAttribute("roomList", roomList);
        request.setAttribute("villaList", villaList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
