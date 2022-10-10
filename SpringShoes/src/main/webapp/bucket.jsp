<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<style>
ul {
	list-style: none;
}

li {
	margin-right: 20px;
	float: left;
}
</style>
<title>장바구니</title>

<!--
            CSS
            ============================================= -->
<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/nouislider.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/50/8/intl/ko_ALL/common.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/50/8/intl/ko_ALL/util.js"></script>
</head>

<body>

	<t:header/>
	<t:banner/>

	

	<!--================Cart Area =================-->
	<section class="cart_area">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col" style="width: 194px;">체크박스</th>
								<th scope="col" style="width: 204px;">상품이미지</th>
								<th scope="col">이름</th>
								<th scope="col">사이즈</th>
								<th scope="col">갯수</th>
								<th scope="col">가격</th>
							</tr>
						</thead>
						<tbody>
						<form action="deleteBucket.do">
							<tr>
								
								<c:forEach var="b" items="${bucket}">
									<td><input type="checkbox" name="colorpk" id="my_checkbox"
										value="${b.colorpk}"></td>

									<td style="padding-top: 15px; padding-bottom: 15px;">
										<div class="d-flex">
											<img class="img-fluid blog_right_sidebar"
												src="img/${b.shoesImg}" alt=""
												style="background-color: white; padding: 0;">
										</div>
									</td>

									<td>
										<p>${b.shoesName}</p>
									</td>
									
									<td>
										<p>${b.shoesSize}</p>
									</td>
									
									<td>
										<h5>${b.price}</h5>

									</td>

									<td>
										<p>1</p>
									</td>
								</c:forEach>
								
						<tr class="out_button_area">
								<td>
									<input type="submit"  class="gray_btn" value="선택 삭제 ">
								</td>
								<td>
									<input type="button" class="primary-btn"  value="구매하기" onclick="return payLocation(this.form)">
								</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							
						</form>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>


		<div class="container">

			<p>할인 금액</p>
			<ul>
				<li>내 등급</li>
				<li><c:when test="${mData.tier<=200000}">
						<img alt="Bronze" src="img/3rd.png">
					</c:when> <c:when test="${mData.tier<=400000}">
						<img alt="Silver" src="img/2rd.png">
					</c:when> <c:when test="${mData.tier<=600000}">
						<img alt="Gold" src="img/1rd.png">
					</c:when></li>
			</ul>
		</div>
		<br>

		<div class="container">
			<ul>
				<li>할인률</li>
				<li><c:when test="${mData.tier<=200000}">
						<p>5%</p>
					</c:when> <c:when test="${mData.tier<=400000}">
						<p>10%</p>
					</c:when> <c:when test="${mData.tier<=600000}">
						<p>20%</p>
					</c:when></li>
			</ul>
		</div>
		<br>

		<div class="container">
			<ul style="width: 100px;height: 24px;">
				<li>총 금액</li>
				<li>
					<span id="resultprice">0</span>
				</li>
			</ul>
		</div>

	<script type="text/javascript">
			var sum =0;
			
			function payLocation(frm){
				frm.action="pay.do";
				frm.submit();
				return true;
				
			}
			function is_checked(event){
				
				console.log(checkbox.checked);
				if(event.target.checked){
					
					var parent=event.target.parentNode;
// 					console.log(parent);
					
					var grandparent=parent.parentNode;
// 					console.log(grandparent);
					
					var lastch=grandparent.childNodes;
					
// 					console.log(lastch);
// 					console.log(lastch[11]);

					var price=lastch[11].childNodes;
					
// 					console.log(price); 

					var pt=price[1];
					console.log(parseInt(pt.innerText)); 
					sum+=parseInt(pt.innerText)
					
					document.getElementById("resultprice").innerHTML=sum;
					document.getElementById("resultprice").value=sum;


				}
				if(event.target.checked==false){
					var parent=event.target.parentNode;
// 					console.log(parent);
					
					var grandparent=parent.parentNode;
// 					console.log(grandparent);
					
					var lastch=grandparent.childNodes;
// 					console.log(lastch);
					console.log(lastch[11]);
					var price=lastch[11].childNodes;
					console.log(price); 
					var pt=price[1];
					console.log(parseInt(pt.innerText)); 
					sum-=parseInt(pt.innerText)
					
					document.getElementById("resultprice").innerHTML=sum;
					document.getElementById("resultprice").value=sum;

				}
				
			}
		
		
		
		
		</script>
	</section>
	<!--================End Cart Area =================-->

	<t:footer/>
	

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="js/gmaps.min.js"></script>
	<script src="js/main.js"></script>


</body>
</html>
</html>