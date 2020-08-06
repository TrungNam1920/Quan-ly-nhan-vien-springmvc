<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>PC00409 - Java 5</title>
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
        <!-- Pignose Calender -->
        <link href="plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
        <!-- Chartist -->
        <link rel="stylesheet" href="plugins/chartist/css/chartist.min.css">
        <link rel="stylesheet" href="plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
        <!-- Custom Stylesheet -->
        <link href="../css/style.css" rel="stylesheet">
        <base href="${pageContext.servletContext.contextPath}/">
    </head>
    <c:if test="${bien != 1}">
        <body>

            <!--**********************************
                Main wrapper start
            ***********************************-->
            <div id="main-wrapper">

                <!--**********************************
                    Nav header start
                ***********************************-->
                <div class="nav-header" style="background-color: #BC11A5;">
                    <div class="brand-logo">
                        <a href="index.html?ngonngu=${lang}">
                            <b class="logo-abbr"><img src="images/logo.png" alt=""> </b>
                            <span class="logo-compact"><img src="images/logo-compact.png" alt=""></span>
                            <span class="brand-title">

                                <p style="color: #FAF8F8;">PC00409 - Java 5<br>HTN</p>
                            </span>
                        </a>
                    </div>
                </div>
                <!--**********************************
                    Nav header end
                ***********************************-->

                <jsp:include page="header.jsp"/>

                <!--**********************************
                    Sidebar start
                ***********************************-->
                <div class="nk-sidebar">           
                    <div class="nk-nav-scroll">
                        <ul class="metismenu" id="menu">
                            <li class="nav-label"><s:message code="global.menu"/></li>
                            <li>
                                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                    <i class="icon-speedometer menu-icon"></i><span class="nav-text"><s:message code="global.menu.home"/></span>
                                </a>
                                <ul aria-expanded="false">
                                    <li><a href="index.html?ngonngu=${lang}"><s:message code="global.submenu.home"/></a></li>
                                </ul>
                            </li>
                            <li></br></li>
                            <li class="mega-menu mega-menu-sm">
                                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                    <i class="icon-note menu-icon"></i><span class="nav-text"><s:message code="global.menu.user"/></span>
                                </a>
                                <ul aria-expanded="false">
                                    <li><a href="user/themTaiKhoan.html"><s:message code="global.submenu.user.insert"/></a></li>
                                    <li><a href="user/danhSachTaiKhoan.html"><s:message code="global.submenu.user.table"/></a></li>
                                </ul>
                            </li>
                            <li></br></li>
                            <li class="mega-menu mega-menu-sm">
                                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                    <i class="icon-note menu-icon"></i><span class="nav-text"><s:message code="global.menu.depart"/></span>
                                </a>
                                <ul aria-expanded="false">
                                    <li><a href="depart/themPhongBan.html"><s:message code="global.submenu.depart.insert"/></a></li>
                                    <li><a href="depart/danhSachPhongBan.html"><s:message code="global.submenu.depart.table"/></a></li>
                                </ul>
                            </li>
                            <li></br></li>
                            <li class="mega-menu mega-menu-sm">
                                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                    <i class="icon-note menu-icon"></i><span class="nav-text"><s:message code="global.menu.staff"/></span>
                                </a>
                                <ul aria-expanded="false">
                                    <li><a href="staff/themNhanVien.html"><s:message code="global.submenu.staff.insert"/></a></li>
                                    <li><a href="staff/danhSachNhanVien.html"><s:message code="global.submenu.staff.table"/></a></li>
                                </ul>
                            </li>
                            <li></br></li>
                            <li class="mega-menu mega-menu-sm">
                                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                    <i class="icon-note menu-icon"></i><span class="nav-text"><s:message code="global.menu.record"/></span>
                                </a>
                                <ul aria-expanded="false">
                                    <li><a href="record/themThanhTich.html"><s:message code="global.submenu.record.insert"/></a></li>
                                    <li><a href="record/danhSachThanhTich.html"><s:message code="global.submenu.record.table"/></a></li>
                                    <li><a href="record/tongHopThanhTich.html"><s:message code="global.submenu.record.include"/></a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--**********************************
                    Sidebar end
                ***********************************-->

                <!--**********************************
                    Content body start
                ***********************************-->
                <div class="content-body">
                    <jsp:include page="${param.view}"/>
                    <!-- #/ container -->
                </div>
                <!--**********************************
                    Content body end
                ***********************************-->


                <!--**********************************
                    Footer start
                ***********************************-->
                <div class="footer">
                    <div class="copyright">
                        <p><s:message code="global.footer"/> <a href="#">@HTN</a></p>
                    </div>
                </div>
                <!--**********************************
                    Footer end
                ***********************************-->
            </div>
            <!--**********************************
                Main wrapper end
            ***********************************-->

            <!--**********************************
                Scripts
            ***********************************-->
            <script src="plugins/common/common.min.js"></script>
            <script src="js/custom.min.js"></script>
            <script src="js/settings.js"></script>
            <script src="js/gleek.js"></script>
            <script src="js/styleSwitcher.js"></script>

            <!-- Chartjs -->
            <script src="plugins/chart.js/Chart.bundle.min.js"></script>
            <!-- Circle progress -->
            <script src="plugins/circle-progress/circle-progress.min.js"></script>
            <!-- Datamap -->
            <script src="plugins/d3v3/index.js"></script>
            <script src="plugins/topojson/topojson.min.js"></script>
            <script src="plugins/datamaps/datamaps.world.min.js"></script>
            <!-- Morrisjs -->
            <script src="plugins/raphael/raphael.min.js"></script>
            <script src="plugins/morris/morris.min.js"></script>
            <!-- Pignose Calender -->
            <script src="plugins/moment/moment.min.js"></script>
            <script src="plugins/pg-calendar/js/pignose.calendar.min.js"></script>
            <!-- ChartistJS -->
            <script src="plugins/chartist/js/chartist.min.js"></script>
            <script src="plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>



            <script src="js/dashboard/dashboard-1.js"></script>

        </body>
    </c:if>
    <c:if test="${bien == 1}">
        <body>
            <jsp:include page="${param.view}"/>
        </body>
    </c:if>

</html>
