<%-- 
    Document   : report
    Created on : Nov 7, 2022, 11:42:34 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./css/report.css" />
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
  <body>
    <div class="report">
      <header class="report__header">
        <div style="background-color: #d8d9cf" class="report__header--left">
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
        <div class="report__header--right"></div>
      </header>
      <div style="text-align: center" class="report__title">
        <h1>View Attendance for Nguyễn Ngọc Tùng Lâm (LamNNTHE163504)</h1>
      </div>

      <!-- Table attendance report -->
      <div class="report__table">
        <table>
          <tbody>
            <tr>
              <td>
                <h3 class="title--left">Select a campus/program, term, course...</h3>
                <table class="table--two">
                  <thead >
                    <tr>
                      <th style="width: 160px;">Campus/program</th>
                      <th style="width: 150px;">Term</th>
                      <th style="width: 200px;">Course</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                        <td>FU-HL</td>
                        <td>
                            <table>
                                <tbody class="report--term">
                                    <tr> 
                                        <td><a>Summer2017</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>Fall2017</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>Spring2018</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>Fall2018</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>Fall2018</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>Fall2018</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>Fall2018</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>Fall2018</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>Fall2018</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>Fall2018</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>Fall2018</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>Fall2018</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>Fall2018</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>Fall2018</a>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </td>
                        <td>
                            <table>
                                <tbody class="report--course">
                                    <tr> 
                                        <td><a>PRJ301</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>JPD123</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>MAS291</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>IOT102</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>IOT102</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>IOT102</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>IOT102</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>IOT102</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>IOT102</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>IOT102</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>IOT102</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>IOT102</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>IOT102</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>IOT102</a>
                                        </td>
                                    </tr>
                                    <tr> 
                                        <td><a>IOT102</a>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </td>
                    </tr>
                  </tbody>
                </table>
              </td>
              <td class="table--right">
                <h3>...then see report</h3>
                <table class="table--last">
                    <thead style="background-color: #5f9df7">
                      <tr class="title-bar">
                        <td style="width:50px;">NO</td>
                        <td style="width:100px;">DATE</td>
                        <td style="width:80px;">SLOT</td>
                        <td style="width:70px;"> ROOM</td>
                        <td style="width:100px;">GROUP NAME</td>
                        <td style="width:100px;">ATTENDANCE STATUS</td>
                        <td>LECTURER'S COMMENT</td>
                      </tr>
                    </thead>
          
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>
                            <span><label class="label label-primary" for="">Monday 05/09/2022</label></span>
                        </td>
                        <td>3_(10:50-12:20)</td>
                        <td>DE-217</td>
                        <td>
                          SE1629-NET
                        </td>
                        <td >
                          <span style="color: green">Present</span>
                        </td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>
                            <span><label class="label label-primary" for="">Monday 05/09/2022</label></span>
                        </td>
                        <td>3_(10:50-12:20)</td>
                        <td>DE-217</td>
                        <td>
                          SE1629-NET
                        </td>
                        <td >
                          <span style="color: green">Present</span>
                        </td>
                        <td></td>
                      </tr>
                        <td>1</td>
                        <td>
                            <span><label class="label label-primary" for="">Monday 05/09/2022</label></span>
                        </td>
                        <td>3_(10:50-12:20)</td>
                        <td>DE-217</td>
                        <td>
                          SE1629-NET
                        </td>
                        <td >
                          <span style="color: green">Present</span>
                        </td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>
                            <span><label class="label label-primary" for="">Monday 05/09/2022</label></span>
                        </td>
                        <td>3_(10:50-12:20)</td>
                        <td>DE-217</td>
                        <td>
                          SE1629-NET
                        </td>
                        <td >
                          <span style="color: green">Present</span>
                        </td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>
                            <span><label class="label label-primary" for="">Monday 05/09/2022</label></span>
                        </td>
                        <td>3_(10:50-12:20)</td>
                        <td>DE-217</td>
                        <td>
                          SE1629-NET
                        </td>
                        <td >
                          <span style="color: green">Present</span>
                        </td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>
                            <span><label class="label label-primary" for="">Monday 05/09/2022</label></span>
                        </td>
                        <td>3_(10:50-12:20)</td>
                        <td>DE-217</td>
                        <td>
                          SE1629-NET
                        </td>
                        <td >
                          <span style="color: green">Present</span>
                        </td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>
                            <span><label class="label label-primary" for="">Monday 05/09/2022</label></span>
                        </td>
                        <td>3_(10:50-12:20)</td>
                        <td>DE-217</td>
                        <td>
                          SE1629-NET
                        </td>
                        <td >
                          <span style="color: green">Present</span>
                        </td>
                        <td></td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>
                            <span><label class="label label-primary" for="">Monday 05/09/2022</label></span>
                        </td>
                        <td>3_(10:50-12:20)</td>
                        <td>DE-217</td>
                        <td>
                          SE1629-NET
                        </td>
                        <td >
                          <span style="color: green">Present</span>
                        </td>
                        <td></td>
                      </tr>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <!-- MDB -->
    <script
      type="text/javascript"
      src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"
    ></script>
  </body>
</html>
