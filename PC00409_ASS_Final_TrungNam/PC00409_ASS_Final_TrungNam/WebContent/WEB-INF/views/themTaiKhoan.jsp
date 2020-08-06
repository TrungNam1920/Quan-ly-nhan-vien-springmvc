
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
<title>Quixlab - Bootstrap Admin Dashboard Template by
	Themefisher.com</title>
<base href="${pageContext.servletContext.contextPath}/">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="images/favicon.png">
<!-- Custom Stylesheet -->
<link href="css/style.css" rel="stylesheet">
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
							code="global.menu.user" /></a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)"><s:message
							code="global.submenu.user.insert" /></a></li>
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
							<s:message code="global.submenu.user.insert" />
						</h4>
						<p class="text-muted m-b-15 f-s-12">
							<s:message code="global.insert.warning" />
							<c:if test="${not empty mes}">
								<code>
									<s:message code="global.title_warning.insert" />
								</code>
							</c:if>
						<div class="basic-form">
							<form:form method="post" commandName="user"
								action="user/danhSachTaiKhoan.html">
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.user.username" /></label>
									<form:input path="username" class="form-control input-flat" />
									<c:set var="checkUsername">
										<form:errors path="username" />
									</c:set>
									<c:if test="${not empty checkUsername}">
										<div class="loi">
											<s:message code="global.field.user.username" />
										</div>
									</c:if>
								</div>
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.user.password" /></label>
									<form:password path="password" class="form-control input-flat" />
									<c:set var="checkPassword">
										<form:errors path="password" />
									</c:set>
									<c:if test="${not empty checkPassword}">
										<div class="loi">
											<s:message code="global.field.user.password" />
										</div>
									</c:if>

								</div>
								<div class="form-group">
									<label class="col-form-label"><s:message
											code="global.user.fullname" /></label>
									<form:input path="fullname" class="form-control input-flat" />
									<c:set var="checkFullname">
										<form:errors path="fullname" />
									</c:set>
									<c:if test="${not empty checkFullname}">
										<div class="loi">
											<s:message code="global.field.user.fullname" />
										</div>
									</c:if>
								</div>
								<button class="btn btn-dark mb-2">
									<s:message code="global.insert.user.add" />
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

</body>

</html>
