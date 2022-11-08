<%-- Document : timetable Created on : Nov 7, 2022, 11:42:40 AM Author : Admin --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
<!-- MDB -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css" rel="stylesheet" />
<style>
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

    .timetable__section {
        width: 100%;
        display: flex;
        justify-content: center;

    }

    .explain{
        margin-left: 69px;
    }

    .timetable__section table {
        width: 90%;

    }

    .timetable__section table p {
        font-size: 13px;
    }

    .heading {
        border-top : 1px solid white;
        border-right: 1px solid white;
        color: black;
        background-color: #2146C7;
    }

    .label-success {
        background-color: #379237;
        padding: 2px 5px;
        color: white;
        border-radius: 5px;
    }

    td, th {
        font-size: 13px;
    }

    .info{
        font-size: 12px;

    }
    .info1{
        margin-top: 40px;
        font-size: 25px;
        color: black;
    }

    .attendance__header {
        display: flex;
        width: 90%;
        justify-content: space-between;
        padding: 8px;
        border-radius: 3px;
    }

    .label-primary {
        background-color: #002E94;
        color: white;
        border-radius: 5px;
        padding: 2px 5px;
    }

    .timetable {
        margin: 0;
        padding: 0;
        height: 100vh;
        width: 100%;

    }

    footer {
        margin-left: 60px;
    }
</style>
<body>
    <div class="timetable container-fluid">
        <header class="timetable__header">
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
                        <span>View TimeTable</span>
                        <span style="
                              color: blue;
                              border-left: 1px solid black;
                              padding-left: 5px;"><a href="report?lid=${param.lid}">View Report</a></span>
                    </div>
                    <div class="attendance__header--right">
                        <span
                            style="background-color: #54B435; padding: 5px; color: white; border-radius: 5px; font-size: 11px;">CAMPUS:
                            FPTU-Hoà Lạc</span>
                    </div>
                </div>
            </div>

            <div class="explain">
                <h1 class="info1">Activities for ${requestScope.lecturer.name}  </h1>

                <p class="info">
                    <b class="info">Note</b>: These activities do not include extra-curriculum activities, such
                    as
                    club activities ...
                </p class="info">
                <p class="info">
                    <b>Chú thích</b>: Các hoạt động trong bảng dưới không bao gồm hoạt động ngoại khóa,
                    ví dụ như hoạt động câu lạc bộ ...
                </p>
                <div class="info">
                    <p>
                        Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL...<br>
                        Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,..<br>
                        Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...<br>
                        Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.<br>
                        Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,..<br>
                        Little UK (LUK) thuộc tầng 5 tòa nhà Delta
                    </p>
                </div>
            </div>
        </header>
        <section class="timetable__section">
            <table>
                
                <thead>
                    <tr>
                
                    <th class="heading" rowspan="2">
                        <form action="timetable" method="get">
                        <input type="hidden" name="lid" value="${param.lid}"/>
                        <span class="auto-style1"><strong>From:</strong></span>
                        <input type="date" name="from" value="${requestScope.from}" />
                        <br />
                        To:
                        <input type="date" name="to" value="${requestScope.to}" />
                        <input type="submit" value="View"/>
                        </form>
                
                </th>
                <c:forEach items="${requestScope.dates}" var="d">
                    <th class="heading">${helper.getDayNameofWeek(d)}</th>
                    </c:forEach>
                </tr>
                <tr>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <th class="heading  ">${d}</th>
                        </c:forEach>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.slots}" var="slot">
                        <tr style="border-top: 0.5px dotted black">
                            <td>Slot ${slot.id}</td>
                            <c:forEach items="${requestScope.dates}" var="d">
                                <td>
                                    <c:forEach items="${requestScope.sessions}" var="ses">
                                        <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.slot.id eq slot.id)}">
                                            <p>
                                                    <a
                                                        href="attendance?id=${ses.id}&lid=${ses.lecturer.id}">${ses.group.name} <br><a
                                                        class="label label-warning"
                                                        href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=8sZdLpFF7Vpk3D03Vczy4A%3d%3d&amp;SessionNo=zo6W5ogDesMsd0QdzaFnUA%3d%3d"
                                                        target="_blank"
                                                        style="background-color: orange; padding: 3px; border-radius: 10px; color: white;">View
                                                            Materials</a><br></a>
                                                    at ${ses.room.name} <a> </a>
                                                    <a class="label label-primary"
                                                                          href="https://fu.edunext.vn/?CampusCode=APHL&amp;subjectCode=SWR302&amp;semester=Fall2022&amp;ClassName=SE1629-NET&amp;SessionN0=21">-EduNext
                                                    </a><br />
                                                    <c:if test="${ses.attended}">
                                                    (<font color="Green">attended</font>)<br /><span
                                                        class="label label-success">(${slot.description})</span><br />
                                                    </c:if>
                                                    <c:if test="${!ses.attended}">
                                                    (<font color="Red">not yet</font>)<br /><span
                                                        class="label label-success">(${slot.description})</span><br />
                                                    </c:if>
                                                </p>
                                        </c:if>

                                    </c:forEach>
                                </td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                    <!--                    <tr>
                                            <td>Slot 1</td>
                                            <td>-</td>
                                            <td>
                    
                                            </td>
                                            <td>-</td>
                                            <td>
                                                <p>
                                                    <a
                                                        href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=1023140">MAS291-</a><br />
                                                    at DE-314A <a> </a><a class="label label-primary"
                                                                          href="https://fu.edunext.vn/?CampusCode=APHL&amp;subjectCode=SWR302&amp;semester=Fall2022&amp;ClassName=SE1629-NET&amp;SessionN0=21">-EduNext
                                                    </a><br />(<font color="Green">attended</font>)<br /><span
                                                        class="label label-success">(7:30-9:00)</span><br />
                                                </p>
                                            </td>
                                            <td>-</td>
                                            <td>-</td>
                                            <td>-</td>
                                        </tr>-->



                    <!--                        <tr >
                                                <td>Slot 2</td>
                                                <td>
                                                    <p>
                                                        <a
                                                            href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=1025958">PRJ301-</a><a
                                                            class="label label-warning"
                                                            href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=GTJiuwxGNDd1MUm4wrFEDA%3d%3d&amp;SessionNo=otr087PrZR6f6b44meJdfw%3d%3d"
                                                            target="_blank"
                                                            style="background-color: orange; padding: 3px; border-radius: 10px; color: white;">View
                                                            Materials</a><br />
                                                        at DE-C205
                                                        <a>
                                                            <br />(<font color="Green">attended</font>)<br /><span
                                                                class="label label-success">(9:10-10:40)</span><br /></a>
                                                    </p>
                                                </td>
                    
                                                <td>
                                                    <p>
                                                        <a
                                                            href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=1023130">MAS291-</a><a
                                                            class="label label-warning"
                                                            href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=8sZdLpFF7Vpk3D03Vczy4A%3d%3d&amp;SessionNo=xSlZOxVbP058dyJqVHLTPg%3d%3d"
                                                            target="_blank"
                                                            style="background-color: orange; padding: 3px; border-radius: 10px; color: white;">View
                                                            Materials</a><br />
                                                        at DE-314A <a> </a><a class="label label-primary"
                                                                              href="https://fu.edunext.vn/?CampusCode=APHL&amp;subjectCode=SWR302&amp;semester=Fall2022&amp;ClassName=SE1629-NET&amp;SessionN0=20">-EduNext
                                                        </a><br />(<font color="Green">attended</font>)<br /><span
                                                            class="label label-success">(9:10-10:40)</span><br />
                                                    </p>
                                                </td>
                                                <td>
                                                    <p>
                                                        <a
                                                            href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=1025959">PRJ301-</a><a
                                                            class="label label-warning"
                                                            href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=GTJiuwxGNDd1MUm4wrFEDA%3d%3d&amp;SessionNo=xSlZOxVbP058dyJqVHLTPg%3d%3d"
                                                            target="_blank"
                                                            style="background-color: orange; padding: 3px; border-radius: 10px; color: white;">View
                                                            Materials</a><br />
                                                        at DE-C205
                                                        <a>
                                                            <br />(<font color="Green">attended</font>)<br /><span
                                                                class="label label-success">(9:10-10:40)</span><br /></a>
                                                    </p>
                                                </td>
                                                <td>
                                                    <p>
                                                        <a
                                                            href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=1023520">JPD123-</a><a
                                                            class="label label-warning"
                                                            href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=8voYXgJZt%2f0minCZOaNJAw%3d%3d&amp;SessionNo=xSlZOxVbP058dyJqVHLTPg%3d%3d"
                                                            target="_blank"
                                                            style="background-color: orange; padding: 3px; border-radius: 10px; color: white;">View
                                                            Materials</a><br />
                                                        at DE-C303 <a> </a><a class="label label-primary"
                                                                              href="https://fu.edunext.vn/?CampusCode=APHL&amp;subjectCode=SWT301&amp;semester=Fall2022&amp;ClassName=SE1629-NET&amp;SessionN0=20">-EduNext
                                                        </a><br />(<font color="Green">attended</font>)<br /><span
                                                            class="label label-success">(9:10-10:40)</span><br />
                                                    </p>
                                                </td>
                                                <td>
                                                    <p>
                                                        <a
                                                            href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=1025960">PRJ301-</a><a
                                                            class="label label-warning"
                                                            href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=GTJiuwxGNDd1MUm4wrFEDA%3d%3d&amp;SessionNo=zo6W5ogDesMsd0QdzaFnUA%3d%3d"
                                                            target="_blank"
                                                            style="background-color: orange; padding: 3px; border-radius: 10px; color: white;">View
                                                            Materials</a><br />
                                                        at DE-C205 -
                                                        <a>
                                                            <br />(<font color="red">Not yet</font>)<br /><span
                                                                class="label label-success">(9:10-10:40)</span><br /></a>
                                                    </p>
                                                </td>
                                                <td>-</td>
                                                <td>-</td>
                                            </tr>
                                            <tr style="border-top: 0.5px dotted black">
                                                <td>Slot 3</td>
                                                <td>
                                                    <p>
                                                        <a
                                                            href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=1025540">PRN211-</a><a
                                                            class="label label-warning"
                                                            href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=n4InBWsubsA3Ztp9N3Ot0A%3d%3d&amp;SessionNo=otr087PrZR6f6b44meJdfw%3d%3d"
                                                            target="_blank"
                                                            style="background-color: orange; padding: 3px; border-radius: 10px; color: white;">View
                                                            Materials</a><br />
                                                        at DE-C210 <a> </a><a class="label label-primary"
                                                                              href="https://fu.edunext.vn/?CampusCode=APHL&amp;subjectCode=PRN211&amp;semester=Fall2022&amp;ClassName=SE1629-NET&amp;SessionN0=19">-EduNext
                                                        </a><br />(<font color="Green">attended</font>)<br /><span
                                                            class="label label-success">(10:50-12:20)</span><br />
                                                    </p>
                                                </td>
                                                <td>
                                                    <p>
                                                        <a
                                                            href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=1023510">JPD123-</a><a
                                                            class="label label-warning"
                                                            href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=8voYXgJZt%2f0minCZOaNJAw%3d%3d&amp;SessionNo=otr087PrZR6f6b44meJdfw%3d%3d"
                                                            target="_blank"
                                                            style="background-color: orange; padding: 3px; border-radius: 10px; color: white;">View
                                                            Materials</a><br />
                                                        at DE-C303 <a> </a><a class="label label-primary"
                                                                              href="https://fu.edunext.vn/?CampusCode=APHL&amp;subjectCode=SWT301&amp;semester=Fall2022&amp;ClassName=SE1629-NET&amp;SessionN0=19">-EduNext
                                                        </a><br />(<font color="Green">attended</font>)<br /><span
                                                            class="label label-success">(10:50-12:20)</span><br />
                                                    </p>
                                                </td>
                                                <td>
                                                    <p>
                                                        <a
                                                            href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=1025541">PRN211-</a><a
                                                            class="label label-warning"
                                                            href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=n4InBWsubsA3Ztp9N3Ot0A%3d%3d&amp;SessionNo=xSlZOxVbP058dyJqVHLTPg%3d%3d"
                                                            target="_blank"
                                                            style="background-color: orange; padding: 3px; border-radius: 10px; color: white;">View
                                                            Materials</a><br />
                                                        at DE-C210 <a> </a><a class="label label-primary"
                                                                              href="https://fu.edunext.vn/?CampusCode=APHL&amp;subjectCode=PRN211&amp;semester=Fall2022&amp;ClassName=SE1629-NET&amp;SessionN0=20">-EduNext
                                                        </a><br />(<font color="Green">attended</font>)<br /><span
                                                            class="label label-success">(10:50-12:20)</span><br />
                                                    </p>
                                                </td>
                                                <td>
                                                    <p>
                                                        <a
                                                            href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=1023530">JPD123-</a><a
                                                            class="label label-warning"
                                                            href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=8voYXgJZt%2f0minCZOaNJAw%3d%3d&amp;SessionNo=zo6W5ogDesMsd0QdzaFnUA%3d%3d"
                                                            target="_blank"
                                                            style="background-color: orange; padding: 3px; border-radius: 10px; color: white;">View
                                                            Materials</a><br />
                                                        at DE-C303 <a> </a><a class="label label-primary"
                                                                              href="https://fu.edunext.vn/?CampusCode=APHL&amp;subjectCode=SWT301&amp;semester=Fall2022&amp;ClassName=SE1629-NET&amp;SessionN0=21">-EduNext
                                                        </a><br />(<font color="red">Not yet</font>)<br /><span
                                                            class="label label-success">(10:50-12:20)</span><br />
                                                    </p>
                                                </td>
                                                <td>
                                                    <p>
                                                        <a
                                                            href="https://fap.fpt.edu.vn/Schedule/ActivityDetail.aspx?id=1025542">PRN211-</a><a
                                                            class="label label-warning"
                                                            href="http://flm.fpt.edu.vn/gui/role/guest/ListScheduleSyllabus?subjectCode=n4InBWsubsA3Ztp9N3Ot0A%3d%3d&amp;SessionNo=zo6W5ogDesMsd0QdzaFnUA%3d%3d"
                                                            target="_blank"
                                                            style="background-color: orange; padding: 3px; border-radius: 10px; color: white;">View
                                                            Materials</a><br />
                                                        at DE-C210 -
                                                        <a> </a><a class="label label-primary"
                                                                   href="https://fu.edunext.vn/?CampusCode=APHL&amp;subjectCode=PRN211&amp;semester=Fall2022&amp;ClassName=SE1629-NET&amp;SessionN0=21">-EduNext
                                                        </a><br />(<font color="red">Not yet</font>)<br /><span
                                                            class="label label-success">(10:50-12:20)</span><br />
                                                    </p>
                                                </td>
                                                <td>-</td>
                                                <td>-</td>
                                            </tr>
                                            <tr style="border-top: 0.5px dotted black">
                                                <td>Slot 4</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                            </tr>
                                            <tr style="border-top: 0.5px dotted black">
                                                <td>Slot 5</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                            </tr>
                                            <tr style="border-top: 0.5px dotted black">
                                                <td>Slot 6</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                            </tr>
                                            <tr style="border-top: 0.5px dotted black">
                                                <td>Slot 7</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                            </tr>
                                            <tr style="border-top: 0.5px dotted black">
                                                <td>Slot 8</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>-</td>
                                            </tr>-->
                </tbody>
            </table>

        </section>
        <footer class="timetable__footer">
            <p><b>More note / Chú thích thêm</b>:</p>
            <div id="ctl00_mainContent_divfoot">
                <ul>
                    <li>
                        (<font color="green">attended</font>):
                        LamNNTHE163504 had attended this activity / Nguyễn
                        Ngọc Tùng Lâm đã tham gia hoạt động này
                    </li>
                    <li>
                        (<font color="red">absent</font>): LamNNTHE163504
                        had NOT attended this activity / Nguyễn Ngọc Tùng
                        Lâm đã vắng mặt buổi này
                    </li>
                    <li>(-): no data was given / chưa có dữ liệu</li>
                </ul>
            </div>
        </footer>

    </div>
    <!-- MDB -->
    <script type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"></script>
</body>

</html>