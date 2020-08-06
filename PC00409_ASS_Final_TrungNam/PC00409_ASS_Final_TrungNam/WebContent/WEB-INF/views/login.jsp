

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html class="h-100" lang="en">

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

<body class="h-100">
	<div class="login-form-bg h-100">
		<div class="container h-100">
			<div class="row justify-content-center h-100">
				<div class="col-xl-6">
					<div class="form-input-content">
						<div class="card login-form mb-0" style="background-color: #CFFB3E;">
							<div class="card-body pt-5">
								<a class="text-center" href="index.html">
									<h4>Đăng nhập</h4>
								</a>

								<form class="mt-5 mb-5 login-input" method="post"
									action="user/login.html">
									<div class="form-group">
										<input type="text" name="username" class="form-control"
											placeholder="Tên đăng nhập" />
									</div>
									<div class="form-group">
										<input type="password" name="password" class="form-control"
											placeholder="Mật khẩu" />
									</div>
									<button class="btn login-form__btn submit w-100" style="background-color: red;">Đăng
										nhập</button>
									<h5>${mes}</h5>
								</form>
								<p class="mt-5 login-form__footer">
									Dont have account? <a href="page-register.html"
										class="text-primary">Sign Up</a> now
								</p>
							</div>
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
</body>
</html>






