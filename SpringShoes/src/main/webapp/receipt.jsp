<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

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
	   color: black;
       border:1px solid black;
       font-size:20px;
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

	<!--================Order Details Area =================-->
	<section class="order_details section_gap">
		<div class="container">
			<h3 class="title_confirmation" style="color:black; font-size:35px;">Spring Shoes를 이용해주셔서 감사합니다. 
			<a href="selectOneM.do?mid=${mid }" class="genric-btn primary-border e-large ss">구매목록보기</a></h3>
			<div class="row order_d_inner">
			
			<c:forEach var="s" items="${sDatas }">
				<div class="col-lg-4">
					<div class="details_item">
						<h4>상품 정보</h4>
						<ul class="list">
							<li><img src="${s.shoesImg }" style="width:300px"></li>
							<li><a><span>상품 명</span><br>${s.shoesName}</a></li>
							<li><a><span>사이즈</span>: ${s.shoesSize}</a></li>
							<li><a><span>수량</span>: 1</a></li>
							<li><a><span>가격</span>: <fmt:formatNumber type="number" value="${s.price }"/>원</a></li>
						</ul>
					</div>
				</div>
			</c:forEach>

				
			</div>
			<div class="order_details_table">
				<h2>결제 정보</h2>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">상품</th>
								<th scope="col">수량</th>
								<th scope="col">금액</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="s" items="${sDatas }">
							<tr>
								<td>
									<h5>${s.shoesName}</h5>
								</td>
								<td>
									<h5>1</h5>
								</td>
								<td>
									<p><fmt:formatNumber type="number" value="${s.price }"/>원</p>
								</td>
							</tr>
						</c:forEach>
							
							<tr>
								<td>
									<h5>합계 금액</h5>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<h4><fmt:formatNumber type="number" value="${resultPrice}"/>원</h4>
								</td>
							</tr>
							<tr>
								<td>
									<h5>할인률</h5>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
								<c:if test="${mData.tier < 200000 }">
									<h4>5%</h4>
								</c:if> 
								<c:if test="${200000 < mData.tier && mData.tier < 400000 }">
									<h4>10%</h4>
								</c:if> 
								<c:if test="${400000 < mData.tier }">
									<h4>20%</h4>
								</c:if>
								</td>
							</tr>
							<tr>
								<td>
									<h5>결제 금액</h5>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<h5><fmt:formatNumber type="number" value="${finalPrice}"/>원</h5>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!--================End Order Details Area =================-->

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