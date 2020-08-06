

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<base href="${pageContext.servletContext.contextPath}/">
<title>Quixlab - Bootstrap Admin Dashboard Template by
	Themefisher.com</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="images/favicon.png">
<!-- Custom Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<!-- Custom Stylesheet -->
<link
	href="plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css"
	rel="stylesheet">
<!-- Page plugins css -->
<link href="plugins/clockpicker/dist/jquery-clockpicker.min.css"
	rel="stylesheet">
<!-- Color picker plugins css -->
<link href="plugins/jquery-asColorPicker-master/css/asColorPicker.css"
	rel="stylesheet">
<!-- Date picker plugins css -->
<link href="plugins/bootstrap-datepicker/bootstrap-datepicker.min.css"
	rel="stylesheet">
<!-- Daterange picker plugins css -->
<link href="plugins/timepicker/bootstrap-timepicker.min.css"
	rel="stylesheet">
<link href="plugins/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">
<style>
.loi {
	color: red;
	font-style: italic;
	font-size: 12px;
}

h5 {
	color: red;
	text-align: center;
	padding-top: 10px;
}

body {
	background-image:
		url("https://i.pinimg.com/736x/70/79/48/70794809ac1ad01280d5b30860d7829d.jpg");
	background-size: 100%;
}
</style>

</head>

<body>
	<!--**********************************
            Content body start
        ***********************************-->

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
							code="global.menu.staff" /></a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)"><s:message
							code="global.submenu.staff.insert" /></a></li>
			</ol>
		</div>
	</div>
	<!-- row -->

	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">
							<s:message code="global.submenu.staff.insert" />
						</h4>
						<p class="text-muted m-b-15 f-s-12">
							<s:message code="global.insert.warning" />
							<c:if test="${not empty mes}">
								<code>
									<s:message code="global.title_warning.insert" />
								</code>
							</c:if>
						</p>
						<div class="basic-form">
							<form:form method="post" commandName="staff"
								action="staff/danhSachNhanVien.html"
								enctype="multipart/form-data">
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.staff.id" /></label>
									<form:input path="id" class="form-control input-flat" />
									<c:set var="checkId">
										<form:errors path="id" />
									</c:set>
									<c:if test="${not empty checkId}">
										<div class="loi">
											<s:message code="global.field.staff.id" />
										</div>
									</c:if>
								</div>
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.staff.name" /></label>
									<form:input path="name" class="form-control input-flat" />
									<c:set var="checkName">
										<form:errors path="name" />
									</c:set>
									<c:if test="${not empty checkName}">
										<div class="loi">
											<s:message code="global.field.staff.name" />
										</div>
									</c:if>
								</div>
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.staff.gender" /></label>
									<form:select path="gender" class="form-control form-control">
										<form:option value="">Chọn giới tính</form:option>
										<form:option value="true">Nam</form:option>
										<form:option value="false">Nữ</form:option>
									</form:select>
									<c:set var="checkGender">
										<form:errors path="gender" />
									</c:set>
									<c:if test="${not empty checkGender}">
										<div class="loi">
											<s:message code="global.field.staff.gender" />
										</div>
									</c:if>
								</div>
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.staff.birthday" /></label>
									<form:input id="mdate" path="birthday" class="form-control" />
									<c:set var="checkBirthday">
										<form:errors path="birthday" />
									</c:set>
									<c:if test="${not empty checkBirthday}">
										<div class="loi">
											<s:message code="global.field.staff.birthday" />
										</div>
									</c:if>
								</div>
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.staff.photo" /></label> <input type="file" name="photo"
										class="form-control" />
									<c:set var="language" value="${lang}" />
									<c:if test="${not empty loi && language == 'English'}">
										<p class="loi">Not empty image</p>
									</c:if>

									<c:if test="${not empty loi && language == 'Vietnamese'}">
										<p class="loi">Vui lòng chọn hình</p>
									</c:if>

								</div>
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.staff.email" /></label>
									<form:input path="email" class="form-control input-flat" />
									<c:set var="checkEmail">
										<form:errors path="email" />
									</c:set>
									<c:if test="${not empty checkEmail}">
										<div class="loi">
											<s:message code="global.field.staff.email" />
										</div>
									</c:if>
								</div>
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.staff.phone" /></label>
									<form:input path="phone" class="form-control input-flat" />
									<c:set var="checkPhone">
										<form:errors path="phone" />
									</c:set>
									<c:if test="${not empty checkPhone}">
										<div class="loi">
											<s:message code="global.field.staff.phone" />
										</div>
									</c:if>
								</div>
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.staff.salary" /></label>
									<form:input path="salary" maxlength="3"
										class="form-control input-flat" />
									<c:set var="checkSalary">
										<form:errors path="salary" />
									</c:set>
									<c:if test="${not empty checkSalary}">
										<div class="loi">
											<s:message code="global.field.staff.salary" />
										</div>
									</c:if>
								</div>

								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.staff.note" /></label>
									<form:textarea path="note" class="form-control h-150px"
										rows="4" id="comment" />
								</div>
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.staff.depart" /></label>
									<form:select path="depart.id" items="${departs}" itemValue="id"
										itemLabel="name" class="form-control form-control" />
								</div>
								<button type="submit" class="btn btn-dark mb-2">
									<s:message code="global.insert.staff.add" />
								</button>
								<button type="reset" class="btn btn-dark mb-2">
									<s:message code="global.insert.reset" />
								</button>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- #/ container -->
	<!--**********************************
            Content body end
        ***********************************-->

	<!--**********************************
            Scripts
        ***********************************-->
	<script src="plugins/common/common.min.js"></script>
	<script src="js/custom.min.js"></script>
	<script src="js/settings.js"></script>
	<script src="js/gleek.js"></script>
	<script src="js/styleSwitcher.js"></script>

	<script src="plugins/moment/moment.js"></script>
	<script
		src="plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
	<!-- Clock Plugin JavaScript -->
	<script src="plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
	<!-- Color Picker Plugin JavaScript -->
	<script
		src="plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
	<script
		src="plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
	<script
		src="plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
	<!-- Date Picker Plugin JavaScript -->
	<script src="plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<!-- Date range Plugin JavaScript -->
	<script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<script src="plugins/bootstrap-daterangepicker/daterangepicker.js"></script>

	<script src="js/plugins-init/form-pickers-init.js"></script>

</body>

</html>
