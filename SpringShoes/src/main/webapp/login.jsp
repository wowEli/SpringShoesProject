<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/fav.png">
	<!-- Author Meta -->
	<meta name="author" content="CodePixar">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>Spring Shoes</title>

	<!--
		CSS
		============================================= -->
	<link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/themify-icons.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="css/nouislider.min.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/main.css">
	
	<style type="text/css">
	    .genric-btn.primary-border{
    	color:white;
    	font-size:20px;
    	background:transparent;
		border: none;
    }
    .genric-btn.primary-border.login{
    	color:black;
    	font-size:20px;
    	background:transparent;
		border: none;
    }
    .genric-btn.primary-border:hover{
    	background: black;
    	color: white;
    }
	</style>
</head>

<body>
	
	<t:header/>
	<t:banner/>
	
	<!--================Login Box Area =================-->
	<section class="login_box_area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<img class="img-fluid" src="img/exclusive.jpg" alt="">
						<div class="hover">
							<h4>스프링 슈즈가 처음이신가요?</h4>
							<p>회원가입을 통해<br>스프링 슈즈에서 제공하는 혜택 및 서비스를 받아보세요!</p>
							<a class="genric-btn primary-border radius ss" href="signup.jsp">회원가입하기</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<form class="row login_form" action="login.do" method="post">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="mid" name="mid" placeholder="아이디를 입력하세요">
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="mpw" name="mpw" placeholder="비밀번호를 입력하세요">
							</div>
								<div class="col-md-12 form-group">
							</div>
							<div class="col-md-12 form-group">
								<input type="submit" value="로그인" class="genric-btn primary-border login"></input>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->

	<t:footer/>

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="js/gmaps.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>