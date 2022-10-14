<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.sizeUp{
    display: inline-block;
    -webkit-transition: 0.5s;
    -moz-transition: 0.5s;
    -o-transition: 0.5s;
    -ms-transition: 0.5s;
    transition: 0.5s;
}

.sizeUp:hover {
    -webkit-transform: scale(2,2);
    -moz-transform: scale(2,2);
    -o-transform: scale(2,2);
    -ms-transform: scale(2,2);
    transform: scale(2,2);
}
.header_area .navbar .nav .nav-item:hover .nav-link, .header_area .navbar .nav .nav-item.active .nav-link{
	color:black;
}
</style>

<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					
					<a class="navbar-brand logo_h" href="selectAllS.do"><img src="img/logo.png" alt="logo이미지"/></a>
					
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item"><a class="nav-link sizeUp" href="selectAllS.do">Home</a></li>
						
							<c:if test="${mid == null }">
							<li class="nav-item submenu dropdown">
								<a href="login.do" class="nav-link dropdown-toggle sizeUp"  >로그인</a>
							</li>
							
							<li class="nav-item submenu dropdown">
								<a href="signup.jsp" class="nav-link dropdown-toggle sizeUp">회원가입</a>
							</li>
							</c:if>
							
							<c:if test="${mid != null }">
							<li class="nav-item submenu dropdown active">
								<a href="logout.do" class="nav-link dropdown-toggle sizeUp" >로그아웃</a>
							</li>
							
							<li class="nav-item submenu dropdown">
								<a href="selectOneM.do?mid=${mid}" class="nav-link dropdown-toggle sizeUp">마이페이지</a>
							</li>
							</c:if>
							
							<li class="nav-item submenu dropdown">
								<a href="bucket.do?mid=${mid}" class="nav-link dropdown-toggle sizeUp">장바구니</a>
							</li>
						
						</ul>
						
					</div>
					
				</div>
			</nav>
		</div>
	</header>