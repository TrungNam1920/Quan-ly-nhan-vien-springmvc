

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
							code="global.menu.record" /></a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)"><s:message
							code="global.submenu.record.insert" /></a></li>
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
							<s:message code="global.submenu.record.insert" />
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
							<form:form method="post" commandName="record"
								action="record/danhSachThanhTich.html">
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.record.type" /></label>
									<form:select path="type" class="form-control form-control">
										<form:option value="">Chọn loại</form:option>
										<form:option value="true">Thành tích</form:option>
										<form:option value="false">Kỷ luật</form:option>
									</form:select>
									<c:set var="checkType">
										<form:errors path="type" />
									</c:set>
									<c:if test="${not empty checkType}">
										<div class="loi">
											<s:message code="global.field.record.type" />
										</div>
									</c:if>
								</div>
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.record.reason" /></label>
									<form:textarea path="reason" class="form-control h-150px"
										rows="4" id="comment" />
									<c:set var="checkReason">
										<form:errors path="reason" />
									</c:set>
									<c:if test="${not empty checkReason}">
										<div class="loi">
											<s:message code="global.field.record.reason" />
										</div>
									</c:if>
								</div>
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.record.date" /></label>
									<form:input id="mdate" path="date" class="form-control" />
									<c:set var="checkDate">
										<form:errors path="date" />
									</c:set>
									<c:if test="${not empty checkDate}">
										<div class="loi">
											<s:message code="global.field.record.date" />
										</div>
									</c:if>
								</div>
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.record.name" /></label>
									<form:select path="staff.id" items="${staffs}" itemValue="id"
										itemLabel="name" class="form-control form-control" />
								</div>
								<button class="btn btn-dark mb-2">
									<s:message code="global.insert.record.add" />
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
