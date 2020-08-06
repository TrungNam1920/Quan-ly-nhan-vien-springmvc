

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Quixlab - Bootstrap Admin Dashboard Template by
	Themefisher.com</title>
<base href="${pageContext.servletContext.contextPath}/">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="images/favicon.png">
<!-- Custom Stylesheet -->
<link href="plugins/tables/css/datatable/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<style>
.tk {
	width: 100%;
	height: 40px;
	margin-bottom: 20px;
	position: relative;
}

.tk label {
	position: absolute;
	right: 23%;
	line-height: 40px;
}

.tk input {
	position: absolute;
	right: 7%;
	width: 165px;
	height: 25px;
	margin-top: 7px;
	background-color: transparent;
	border: none;
	border-bottom: 1px solid black;
}

.tk button {
	position: absolute;
	right: 0%;
	top: 0px;
	width: 70px;
	height: 30px;
	line-height: 5px;
	margin-top: 5px;
	font-size: 12px;
}

body {
	background-image:
		url("https://i.pinimg.com/736x/70/79/48/70794809ac1ad01280d5b30860d7829d.jpg");
	background-size: 100%;
}
</style>
</head>
<body>
	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
							code="global.menu.user" /></a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)"><s:message
							code="global.submenu.user.table" /></a></li>
			</ol>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">
							<s:message code="global.submenu.user.table" />
						</h4>
						<div class="tk">
							<label><s:message code="global.table.search" />:</label>
							<form method="post" action="user/timKiem.html">
								<input type="text" name="tkiem"></br>
								<button class="btn mb-1 btn-primary btn-xs">Tìm</button>
							</form>
						</div>
						<div class="table-responsive">
							<table
								class="table table-striped table-bordered zero-configuration">
								<thead>
									<tr>
										<th style="width: 20%;"><s:message
												code="global.user.username" /></th>
										<th style="width: 20%;"><s:message
												code="global.user.password" /></th>
										<th style="width: 30%;"><s:message
												code="global.user.fullname" /></th>
										<th style="width: 30%;">#<s:message
												code="global.table.navigation" /></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${list}">
										<tr>
											<td style="width: 20%;">${user.username}</td>
											<td style="width: 20%;">${user.password}</td>
											<td style="width: 30%;">${user.fullname}</td>
											<td style="width: 30%;">
												<button class="btn mb-1 btn-rounded btn-outline-success"
													data-toggle="modal" data-target="#${user.username}_Update">
													<s:message code="global.table.update" />
												</button>
												<button class="btn mb-1 btn-rounded btn-outline-warning"
													data-toggle="modal" data-target="#${user.username}_Delete">
													<s:message code="global.table.delete" />
												</button>
											</td>
										</tr>
										<div class="modal fade" id="${user.username}_Update">
											<form:form method="post" commandName="user"
												action="user/tableTaiKhoan.html">
												<div class="modal-dialog modal-dialog-centered"
													role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title">Cập nhật tài khoản</h5>
															<button type="button" class="close" data-dismiss="modal">
																<span>&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<div class="form-group">
																<label class="col-form-label">Tên đăng nhập</label>
																<form:input readonly="true" path="username"
																	value="${user.username}" class="form-control" />
															</div>
															<div class="form-group">
																<label class="col-form-label">Mật khẩu</label>
																<form:input path="password" value="${user.password}"
																	class="form-control" />
															</div>
															<div class="form-group">
																<label class="col-form-label">Họ và tên</label>
																<form:input path="fullname" value="${user.fullname}"
																	class="form-control" />
															</div>
														</div>
														<div class="modal-footer">
															<button class="btn btn-secondary" data-dismiss="modal">Đóng</button>
															<button class="btn btn-primary">Lưu thay đổi</button>
														</div>
													</div>
												</div>
											</form:form>
										</div>

										<div class="modal fade" id="${user.username}_Delete">
											<form:form method="post" commandName="user"
												action="user/danhSach.html">
												<div class="modal-dialog modal-dialog-centered"
													role="document">
													<div class="modal-content">
														<div class="modal-body">
															<div class="form-group" style="text-align: center;">
																<img src="images/delete.png">
																<h2 style="color: #ff0000;">THÔNG BÁO!!!</h2>
																<p style="font-size: 20px; color: black;">Bạn thật
																	sự cần xóa tài khoản ${user.fullname}?</p>
																<form:hidden path="username" value="${user.username}" />
															</div>
														</div>
														<div class="modal-footer"
															style="margin: 0 auto; text-align: center;">
															<button class="btn btn-secondary" data-dismiss="modal">Đóng</button>
															<button class="btn btn-primary">Xóa</button>
														</div>
													</div>
												</div>
											</form:form>
										</div>
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
