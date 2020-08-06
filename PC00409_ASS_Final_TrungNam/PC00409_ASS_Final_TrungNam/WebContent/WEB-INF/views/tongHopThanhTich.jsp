

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
        <base href="${pageContext.servletContext.contextPath}/">
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
        <!-- Custom Stylesheet -->
        <link href="plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

    </head>
    <body style="background-image: url('https://i.pinimg.com/736x/70/79/48/70794809ac1ad01280d5b30860d7829d.jpg'); background-size: 100%;">
        <div class="row page-titles mx-0">
            <div class="col p-md-0">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="javascript:void(0)"><s:message code="global.menu.record"/></a></li>
                    <li class="breadcrumb-item active"><a href="javascript:void(0)"><s:message code="global.submenu.record.include"/></a></li>
                </ol>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title"><s:message code="global.summary.record.staff"/></h4>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered zero-configuration">
                                    <thead>
                                        <tr>
                                            <th><s:message code="global.summary.staff"/></th>
                                            <th><s:message code="global.summary.sumgood"/></th>
                                            <th><s:message code="global.summary.sumbad"/></th>
                                            <th><s:message code="global.summary.sum"/></th>
                                            <th>#</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="nv" items="${listNV}">
                                            <tr>
                                                <td>${nv[0]} - ${nv[1]}</td>
                                                <td>${nv[2]}</td>
                                                <td>${nv[3]}</td>
                                                <td>${nv[2] - nv[3]}</td>
                                                <td>
                                                    <form method="POST" action="record/sendEmail.html">
                                                        <input type="hidden" name="email" value="${nv[4]}"/>
                                                        <input type="hidden" name="thanhtich" value="${nv[2]}"/>
                                                        <input type="hidden" name="kyluat" value="${nv[3]}"/>
                                                        <input type="submit" value="Gửi email" class="btn btn-secondary btn-sm">
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            </br></br></br></br></br>
                            <h4 class="card-title"><s:message code="global.summary.record.depart"/></h4>
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered zero-configuration">
                                    <thead>
                                        <tr>
                                            <th><s:message code="global.summary.depart"/></th>
                                            <th><s:message code="global.summary.sumgood"/></th>
                                            <th><s:message code="global.summary.sumbad"/></th>
                                            <th><s:message code="global.summary.sum"/></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="pb" items="${listPB}">
                                            <tr>
                                                <td>${pb[0]} - ${pb[1]}</td>
                                                <td>${pb[2]}</td>
                                                <td>${pb[3]}</td>
                                                <td>${pb[2] - pb[3]}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!--**********************************
                Scripts
            ***********************************-->
        <script src="plugins/common/common.min.js"></script>
        <script src="js/custom.min.js"></script>
        <script src="js/settings.js"></script>
        <script src="js/gleek.js"></script>
        <script src="js/styleSwitcher.js"></script>

        <script src="plugins/tables/js/jquery.dataTables.min.js"></script>
        <script src="plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
        <script src="plugins/tables/js/datatable-init/datatable-basic.min.js"></script>

    </body>

</html>
