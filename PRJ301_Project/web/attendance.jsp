<%-- 
    Document   : attendance
    Created on : Nov 7, 2022, 11:41:56 AM
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
    .attendance__title {
        margin: 20px;
    }

    .attendance__content {
        display: flex;
        justify-content: center;
        text-align: center;
    }
    .attendance__content table td {
        padding: 30px;
        border: 1px solid black;
    }
    .attendance__content table .Image {
        padding: 30px;
    }
    .attendance__content img {
        width: 150px;
        height: 200px;
    }
    .attendance__content textarea {
        border: none;
    }
    .attendance__content span {
        padding-left: 3px;
    }

    .attendance__footer {
        margin-top: 20px;
        text-align: center;
    }
    .attendance__footer button {
        width: 80px;
        height: 45px;
        border-radius: 10px;
        margin: 10px;
        text-align: center;
    }/*# sourceMappingURL=attendance.css.map */
</style>
<body>
    <div class="attendance container-fluid">
        <header class="attendance__header">
            <div style="background-color: #d8d9cf" class="attendance__header--left">
                <span
                    style="
                    color: blue;
                    border-right: 1px solid black;
                    padding-right: 5px;
                    "
                    ><a>Home</a></span
                >
                <span>View TimeTable</span>
            </div>
            <div class="attendance__header--right"></div>
        </header>
        <div class="attendance__title">
            <h1 style="text-align: center; color: #628e90; font-weight: bold">
                Taking Attendance
            </h1>
            Teacher:
            <span style="color: #628e90; font-weight: bold">${requestScope.ses.lecturer.name}</span>
            <span> - </span>
            <select name="teacher" id="teacher">
                <option value="">Slot 1 - SE1633</option>
                <option value="">Slot 2 - SE1633</option>
                <option value="">Slot 3 - SE1712</option>
                <option value="">Slot 4 - SE1621</option>
            </select>
        </div>
        <form action="attendance" method="post">
            <div class="attendance__content">
                <input type="hidden" name="sesid" value="${param.lid}"/>
                <table>
                    <thead style="background-color: #5f9df7">
                        <tr>
                            <td>NO</td>
                            <td>StudentID</td>
                            <td>Full Name</td>
                            <td class="Image">IMAGE</td>
                            <td>Absent</td>
                            <td>Present</td>
                            <td>Description</td>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${requestScope.ses.atts}" var="a" varStatus="loop">
                            <tr>
                                <td>${loop.index+1}</td>
                                <td>${a.student.id}
                                    <input type="hidden" name="stdid" value="${a.student.id}" />
                                </td>
                                <td>${a.student.name}</td>
                                <td>
                                    <img
                                        width="100px;"
                                        src=""
                                        alt=""
                                        />
                                </td>
                                <td>
                                    <input type="radio" 
                                           <c:if test="${!a.present}">
                                               checked="checked"
                                           </c:if>
                                           name="present${a.student.id}" value="absent" /><span
                                           style="font-weight: bold; color: red"
                                           >Absent</span
                                    >
                                </td>

                                <td>

                                    <input type="radio" 
                                           <c:if test="${a.present}">
                                               checked="checked"
                                           </c:if>
                                           name="present${a.student.id}" value="present" /><span
                                           style="font-weight: bold; color: green"
                                           >Absent</span
                                    >
                                </td>
                                <td>
                                    <div class="">
                                        <textarea
                                            name="description${a.student.id}"
                                            rows="8"
                                            value="${a.description}"
                                            ></textarea>
                                        <label class="form-label" for="textAreaExample"></label>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
            <footer class="attendance__footer">
                <input style="padding: 5px; background-color: #2146C7; border-radius: 10px; " type="submit" value="Save">
            </footer>
        </form>   
    </div>
    <!-- MDB -->
    <script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"
    ></script>
    <script>
        let btn = document.getElementById("btn-save");
        btn.addEventListener("click", () => {
            alert("Take attendance success!");
        });
    </script>


</body>
</html>
