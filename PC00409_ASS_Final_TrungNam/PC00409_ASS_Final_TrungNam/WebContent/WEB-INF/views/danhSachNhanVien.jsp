

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
background-image: url("https://i.pinimg.com/736x/70/79/48/70794809ac1ad01280d5b30860d7829d.jpg");
background-size: 100%;	
}
</style>
</head>
<body>
	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
							code="global.menu.staff" /></a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)"><s:message
							code="global.submenu.staff.table" /></a></li>
			</ol>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">
							<s:message code="global.submenu.staff.table" />
						</h4>
						<div class="tk">
							<label><s:message code="global.table.search" />:</label>
							<form method="post" action="staff/timKiem.html">
								<input type="text" name="tkiem"></br>
								<button class="btn mb-1 btn-primary btn-xs">Tìm</button>
							</form>
						</div>
						<div class="table-responsive">
							<table
								class="table table-striped table-bordered zero-configuration">
								<thead>
									<tr>
										<th style="width: 5%;"><s:message code="global.staff.id" /></th>
										<th style="width: 12%;"><s:message
												code="global.staff.name" /></th>
										<th style="width: 4%;"><s:message
												code="global.staff.gender" /></th>
										<th style="width: 8%;"><s:message
												code="global.staff.birthday" /></th>
										<th><s:message code="global.staff.photo" /></th>
										<th><s:message code="global.staff.email" /></th>
										<th><s:message code="global.staff.phone" /></th>
										<th><s:message code="global.staff.salary" /></th>
										<th style="width: 10%;"><s:message
												code="global.staff.note" /></th>
										<th style="width: 8%;"><s:message
												code="global.staff.depart" /></th>
										<th style="width: 17%;">#<s:message
												code="global.table.navigation" /></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="staff" items="${list}">
										<tr>
											<td style="width: 5%;">${staff.id}</td>
											<td style="width: 12%;">${staff.name}</td>
											<td style="width: 4%;">${staff.gender?'Nam':'Nữ'}</td>
											<td style="width: 8%;">${staff.birthday}</td>
											<td style="text-align: center;"><img
												style="width: 70px; height: 100px;"
												src="images/${staff.photo}"></td>
											<td>${staff.email}</td>
											<td>${staff.phone}</td>
											<td>${staff.salary}</td>
											<td style="width: 10%;">${staff.note}</td>
											<td style="width: 8%;">${staff.depart.name}</td>
											<td style="width: 17%;">
												<button class="btn mb-1 btn-rounded btn-outline-success"
													data-toggle="modal" data-target="#${staff.id}_Update">
													<s:message code="global.table.update" />
												</button>
												<button class="btn mb-1 btn-rounded btn-outline-warning"
													data-toggle="modal" data-target="#${staff.id}_Delete">
													<s:message code="global.table.delete" />
												</button>
											</td>
										</tr>
										<div class="modal fade" id="${staff.id}_Update">
											<form:form method="post" commandName="staff"
												action="staff/tableNhanVien.html"
												enctype="multipart/form-data">
												<div class="modal-dialog modal-dialog-centered"
													role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title">Cập nhật nhân viên</h5>
															<button type="button" class="close" data-dismiss="modal">
																<span>&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<div class="form-group">
																<label class="col-form-label">Mã nhân viên</label>
																<form:input readonly="true" path="id"
																	value="${staff.id}" class="form-control" />
															</div>
															<div class="form-group">
																<label class="col-form-label">Họ và tên</label>
																<form:input path="name" value="${staff.name}"
																	class="form-control" />
															</div>
															<div class="form-group">
																<label class="col-form-label">Giới tính</label>
																<c:choose>
																	<c:when test="${staff.gender == true}">
																		<form:select path="gender"
																			class="form-control form-control">
																			<form:option value="">Chọn giới tính</form:option>
																			<form:option selected="selected" value="true">Nam</form:option>
																			<form:option value="false">Nữ</form:option>
																		</form:select>
																	</c:when>
																	<c:when test="${staff.gender == false}">
																		<form:select path="gender"
																			class="form-control form-control">
																			<form:option value="">Chọn giới tính</form:option>
																			<form:option value="true">Nam</form:option>
																			<form:option selected="selected" value="false">Nữ</form:option>
																		</form:select>
																	</c:when>
																</c:choose>
															</div>
															<div class="form-group">
																<label class="col-form-label">Ngày sinh</label>
																<form:input id="mdate" path="birthday"
																	value="${staff.birthday}" class="form-control"
																	placeholder="Ngày sinh" />
															</div>
															<div class="form-group">
																<label class="col-form-label">Hình</label> <input
																	type="file" name="hinh" class="form-control" />
																<form:hidden path="photo" value="${staff.photo}" />
															</div>
															<div class="form-group">
																<label class="col-form-label">Email</label>
																<form:input path="email" value="${staff.email}"
																	class="form-control input-flat" placeholder="Email" />
															</div>
															<div class="form-group">
																<label class="col-form-label">Điện thoại</label>
																<form:input path="phone" value="${staff.phone}"
																	class="form-control input-flat"
																	placeholder="Số điện thoại" />
															</div>
															<div class="form-group">
																<label class="col-form-label">Lương</label>
																<form:input path="salary" value="${staff.salary}"
																	maxlength="3" class="form-control input-flat"
																	placeholder="Lương (triệu)" />
															</div>

															<div class="form-group">
																<label class="col-form-label">Ghi chú</label>
																<form:input path="note" value="${staff.note}"
																	class="form-control input-flat"
																	placeholder="Ghi chú..." />
															</div>
															<div class="form-group">
																<label class="col-form-label">Phòng ban</label>
																<form:select path="depart.id"
																	class="form-control form-control">
																	<c:forEach var="dp" items="${departs}">
																		<c:if test="${dp.name == staff.depart.name}">
																			<form:option selected="selected" value="${dp.id}">${dp.id} - ${dp.name}</form:option>
																		</c:if>
																		<c:if test="${dp.name != staff.depart.name}">
																			<form:option value="${dp.id}">${dp.id} - ${dp.name}</form:option>
																		</c:if>
																	</c:forEach>
																</form:select>
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

										<div class="modal fade" id="${staff.id}_Delete">
											<form:form method="post" commandName="staff"
												action="staff/danhSach.html">
												<div class="modal-dialog modal-dialog-centered"
													role="document">
													<div class="modal-content">
														<div class="modal-body">
															<div class="form-group" style="text-align: center;">
																<img src="images/delete.png">
																<h2 style="color: #ff0000;">THÔNG BÁO!!!</h2>
																<p style="font-size: 20px; color: black;">Bạn thật
																	sự cần xóa nhân viên ${staff.name}?</p>
																<form:hidden path="id" value="${staff.id}" />
																<form:hidden path="name" value="${staff.name}" />
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
