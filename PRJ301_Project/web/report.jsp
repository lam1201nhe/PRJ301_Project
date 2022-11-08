<%-- 
    Document   : report
    Created on : Nov 7, 2022, 11:42:34 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Font Awesome -->
<link
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    rel="stylesheet"
    />
<!-- Google Fonts -->
<link
    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
    rel="stylesheet"
    />
<!-- MDB -->
<link
    href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css"
    rel="stylesheet"
    />
<style>
    .body {
        width: 100%;
        height: 100vh;
        margin: 0;
        padding: 0;

    }

    .main {
        display: flex;
        justify-content: space-around;
    }
    .timetable__header--logo {
        width: 90%;
        height: 9vh;
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin: 30px 65px;
    }

    .timetable__header--logo img {
        width: 100px;
        height: 50px;
    }

    .attendance__header {
        display: flex;
        width: 90%;
        justify-content: space-between;
        padding: 8px;
        border-radius: 3px;
        margin-bottom: 30px;
    }
    td {
        font-size: 15px;
    }

    .heading {
        border-right: 1px solid white;
        font-weight: bold;
    }


</style>
<body>
    <header class="attendancehuy__header">
        <div class="timetable__header--logo">
            <h1>FPT University Academic Portal</h1>
            <img src="../img/logo.png" alt="logo">
        </div>
        <div style="width: 100%; justify-content: center; display: flex;">
            <div class="attendance__header" style="background-color: #d8d9cf">
                <div class="attendance__header--left">
                    <span style="
                          color: blue;
                          border-right: 1px solid black;
                          padding-right: 5px;
                          "><a href="timetable?lid=${param.lid}">Home</a></span>
                    <span>View Take Attendance</span>
                </div>
                <div class="attendance__header--right">
                    <span
                        style="background-color: #54B435; padding: 5px; color: white; border-radius: 5px; font-size: 11px;">CAMPUS:
                        FPTU-Hoà Lạc</span>
                </div>
            </div>
        </div>
    </header>
    <div class="main">
        <div>
            <table class="one">
                <tbody>
                    <tr>
                        <td>
                            <h3 class="title--left">Select a campus/program, term, course...</h3>
                            <table class="table--two">
                                <thead style="background-color: #5f9df7">
                                    <tr>
                                        <th class="heading" style="width: 160px;">Campus/program</th>
                                        <th class="heading" style="width: 150px;">Term</th>
                                        <th class="heading" style="width: 200px;">Course</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>FU-HL</td>
                                        <td>
                                            <table>
                                                <tbody class="report--term">
                                                    <c:forEach items="${requestScope.listGroup}" var="o">
                                                        <tr>
                                                            <td style="color: blue; font-size: 13px;"><a>${o.sem}${o.year}</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </td>
                                        <td>
                                            <table>
                                                <tbody class="report--course">
                                                    <c:forEach items="${requestScope.listGroup}" var="o">
                                                        <tr>
                                                            <td style="color: blue; font-size: 13px;"><a>${o.name}</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>


                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>

                            </table>
                        </td>
            </table>
        </div>

        <div>
            <h3>... then see report</h3>
            <table border="1px">
                <tr>
                <thead style="background-color: #5f9df7">
                    <tr class="title-bar">
                        <td class="heading" style="width:50px;">NO</td>
                        <td class="heading" style="width:100px;">DATE</td>
                        <td class="heading" style="width:80px;">SLOT</td>
                        <td  class="heading" style="width:70px;"> ROOM</td>
                        <td class="heading" style="width:100px;">GROUP NAME</td>
                        <td class="heading" style="width:100px;">ATTENDANCE STATUS</td>
                        <td class="heading" >LECTURER'S COMMENT</td>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${requestScope.listSes}" var="s">
                        <tr>
                            <td>${s.id}</td>
                            <td>
                                <span style="font-size: 12px; background-color: #990000; color: white; padding: 3px; border-radius: 5px;">${s.date}</span>
                            </td>
                            <td> <span style="font-size: 12px; background-color: #3E6D9C; color: white; padding: 3px; border-radius: 5px;">${s.slot.id}_${s.slot.description}</span></td>
                            <td>${s.room.name}</td>
                            <td>
                                ${s.group.name}
                            </td>
                            <td>
                                <c:if test="${s.attended}">
                                    <span style="color: green; font-weight: bold">Attended</span>
                                </c:if>
                                <c:if test="${!s.attended}">
                                    <span style="color: red; font-weight: bold">Not yet</span>
                                </c:if>
                            </td>
                            <td></td>
                        </tr>
                    </c:forEach>

                </tbody>
                </tr>
            </table>
        </div>
    </div>
</body>

</html>
