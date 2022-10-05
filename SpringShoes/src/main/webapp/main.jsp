<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<title>Karma Shop</title>
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
</head>

<body id="category">

	<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="index.html"><img src="img/logo.png" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
					 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
							<li class="nav-item submenu dropdown active">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Shop</a>
								<ul class="dropdown-menu">
									<li class="nav-item active"><a class="nav-link" href="category.html">Shop Category</a></li>
									<li class="nav-item"><a class="nav-link" href="single-product.html">Product Details</a></li>
									<li class="nav-item"><a class="nav-link" href="checkout.html">Product Checkout</a></li>
									<li class="nav-item"><a class="nav-link" href="cart.html">Shopping Cart</a></li>
									<li class="nav-item"><a class="nav-link" href="confirmation.html">Confirmation</a></li>
								</ul>
							</li>
							<li class="nav-item submenu dropdown">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Blog</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
									<li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li>
								</ul>
							</li>
							<li class="nav-item submenu dropdown">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Pages</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
									<li class="nav-item"><a class="nav-link" href="tracking.html">Tracking</a></li>
									<li class="nav-item"><a class="nav-link" href="elements.html">Elements</a></li>
								</ul>
							</li>
							<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="nav-item"><a href="#" class="cart"><span class="ti-bag"></span></a></li>
							<li class="nav-item">
								<button class="search"><span class="lnr lnr-magnifier" id="search"></span></button>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container">
				<form class="d-flex justify-content-between">
					<input type="text" class="form-control" id="search_input" placeholder="Search Here">
					<button type="submit" class="btn"></button>
					<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Shop Category page</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="#">Shop<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">Fashon Category</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
				<div class="head" style="background-color:black;">필터목록</div>
				</div>
				<div class="sidebar-filter mt-50" style="margin-top:20px;">
					<div class="common-filter">
						<div class="head" style="position: relative;">
							<form action="selectAllS.do">
							검색하기 <span class="lnr lnr-magnifier" id="search"></span>
							<input type="text" class="form-control" name="searchContent">
							<input type="submit" style="display:none;">
							</form>
						</div>
					</div>
					<div>
					<form action="filterSearch.do" method="post" id="filter">
					<div class="common-filter">
					<input type="hidden" id="filterHighPrice" name="filterHighPrice">
					<input type="hidden" id="filterLowPrice" name="filterLowPrice">
						<div class="head">Brands</div>
							<ul>
								<li class="filter-list"><input class="pixel-radio" value="nike" type="radio" name="filterBrand" id="brandBax1" checked="checked">
									<label for="brandBax1">나이키</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" value="adidas"type="radio" name="filterBrand" id="brandBax2">
									<label for="brandBax2">아디다스</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" value="new balance"type="radio" name="filterBrand" id="brandBax3">
									<label for="brandBax3">뉴발란스</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" value="vans"type="radio" name="filterBrand" id="brandBax4">
									<label for="brandBax4">반스</label>
								</li>
							</ul>
					</div>
					<div class="common-filter">
						<div class="head">Color</div>
							<ul>
								<li class="filter-list"><input class="pixel-radio" id="" value="grey" type="radio" name="filterColor" id="colorBax1" checked="checked">
									<label for="colorBax1">GREY</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" value="black" type="radio" name="filterColor" id="colorBax2">
									<label for="colorBax2">BLACK</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" value="white" type="radio" name="filterColor" id="colorBax3">
									<label for="colorBax3">WHITE</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" value="brown" type="radio" name="filterColor" id="colorBax4">
									<label for="colorBax4">BROWN</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" value="navy" type="radio" name="filterColor" id="colorBax5">
									<label for="colorBax5">NAVY</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" value="red" type="radio" name="filterColor" id="colorBax6">
									<label for="colorBax6">RED</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" value="green" type="radio" name="filterColor" id="colorBax7">
									<label for="colorBax7">GREEN</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" value="yellow" type="radio" name="filterColor" id="colorBax8">
									<label for="colorBax8">YELLOW</label>
								</li>
							</ul>
					</div>
					<div class="common-filter">
						<div class="head">Size</div>
							<ul>
								<li class="filter-list"><input class="pixel-radio" type="checkbox" name="size" value="220" id="default-checkbox1" checked="checked">
									<label for="default-checkbox1">220</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" type="checkbox" name="size" value="230" id="default-checkbox2">
									<label for="default-checkbox2">230</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" type="checkbox" name="size" value="240" id="default-checkbox3">
									<label for="default-checkbox3">240</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" type="checkbox" name="size" value="250" id="default-checkbox4">
									<label for="default-checkbox4">250</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" type="checkbox" name="size" value="260" id="default-checkbox5">
									<label for="default-checkbox5">260</label>
								</li>
								<li class="filter-list"><input class="pixel-radio" type="checkbox" name="size" value="270" id="default-checkbox6">
									<label for="default-checkbox6">270</label>
								</li>
							</ul>
					</div>
					<div class="common-filter">
						<div class="head">Price</div>
						<div class="price-range-area">
							<div id="price-range"></div>
							<div class="value-wrapper d-flex">
								<div class="price"></div>
								<div id="lower-value" style="color:black;"></div>
								<span style="color:black;">원</span>
								<div class="to" style="color:black;"> ~ </div>
								<div id="upper-value" style="color:black;"></div>
								<span style="color:black;">원</span>
							</div>	
							<br>
							<input type="submit" class="genric-btn e-large" value="필터검색" style="background-color:black; color:white;">
						</div>
					</div>
						</form>
					</div>
				</div>
			</div>
			
			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
					<div class="sidebar-categories">
						<div class="head" style="background-color:black;">전체 신발목록</div>
					</div>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">
						<!-- single product -->
						<c:forEach var="s" items="${sDatas}">
						<div class="col-lg-4 col-md-6">
							<div class="single-product blog_right_sidebar">
								<img class="img-fluid blog_right_sidebar" src="${s.shoesImg}" alt="" style="background-color:white; padding:0;">
								<div class="product-details">
									<h6>${s.shoesName }</h6>
									<div class="price">
										<h6>브랜드 : ${s.brand }</h6>
										<br>
										<h6>색상 : ${s.shoesColor }</h6>
										<br>
										<h6>가격 : ${s.price }원</h6>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
				</section>
				<!-- End Best Seller -->
				<!-- Start Filter Bar -->
<!-- 				<div class="filter-bar d-flex flex-wrap align-items-center"> -->
<!-- 					<div class="sorting mr-auto"> -->
<!-- 						<select> -->
<!-- 							<option value="1">Show 12</option> -->
<!-- 							<option value="1">Show 12</option> -->
<!-- 							<option value="1">Show 12</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 					<div class="pagination"> -->
<!-- 						<a href="#" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a> -->
<!-- 						<a href="#" class="active">1</a> -->
<!-- 						<a href="#">2</a> -->
<!-- 						<a href="#">3</a> -->
<!-- 						<a href="#" class="dot-dot"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a> -->
<!-- 						<a href="#">6</a> -->
<!-- 						<a href="#" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- End Filter Bar -->
			</div>
		</div>
	</div>
	<br><br>

	<!-- start footer Area -->
	<footer class="footer-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>About Us</h6>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore
							magna aliqua.
						</p>
					</div>
				</div>
				<div class="col-lg-4  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Newsletter</h6>
						<p>Stay update with our latest</p>
						<div class="" id="mc_embed_signup">

							<form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
							 method="get" class="form-inline">

								<div class="d-flex flex-row">

									<input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '"
									 required="" type="email">


									<button class="click-btn btn btn-default"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
									<div style="position: absolute; left: -5000px;">
										<input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
									</div>

									<!-- <div class="col-lg-4 col-md-4">
													<button class="bb-btn btn"><span class="lnr lnr-arrow-right"></span></button>
												</div>  -->
								</div>
								<div class="info"></div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget mail-chimp">
						<h6 class="mb-20">Instragram Feed</h6>
						<ul class="instafeed d-flex flex-wrap">
							<li><img src="img/i1.jpg" alt=""></li>
							<li><img src="img/i2.jpg" alt=""></li>
							<li><img src="img/i3.jpg" alt=""></li>
							<li><img src="img/i4.jpg" alt=""></li>
							<li><img src="img/i5.jpg" alt=""></li>
							<li><img src="img/i6.jpg" alt=""></li>
							<li><img src="img/i7.jpg" alt=""></li>
							<li><img src="img/i8.jpg" alt=""></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Follow Us</h6>
						<p>Let us be social</p>
						<div class="footer-social d-flex align-items-center">
							<a href="#"><i class="fa fa-facebook"></i></a>
							<a href="#"><i class="fa fa-twitter"></i></a>
							<a href="#"><i class="fa fa-dribbble"></i></a>
							<a href="#"><i class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
				<p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
</p>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

	<!-- Modal Quick Product View -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="container relative">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<div class="product-quick-view">
					<div class="row align-items-center">
						<div class="col-lg-6">
							<div class="quick-view-carousel">
								<div class="item" style="background: url(img/organic-food/q1.jpg);">

								</div>
								<div class="item" style="background: url(img/organic-food/q1.jpg);">

								</div>
								<div class="item" style="background: url(img/organic-food/q1.jpg);">

								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="quick-view-content">
								<div class="top">
									<h3 class="head">Mill Oil 1000W Heater, White</h3>
									<div class="price d-flex align-items-center"><span class="lnr lnr-tag"></span> <span class="ml-10">$149.99</span></div>
									<div class="category">Category: <span>Household</span></div>
									<div class="available">Availibility: <span>In Stock</span></div>
								</div>
								<div class="middle">
									<p class="content">Mill Oil is an innovative oil filled radiator with the most modern technology. If you are
										looking for something that can make your interior look awesome, and at the same time give you the pleasant
										warm feeling during the winter.</p>
									<a href="#" class="view-full">View full Details <span class="lnr lnr-arrow-right"></span></a>
								</div>
								<div class="bottom">
									<div class="color-picker d-flex align-items-center">Color:
										<span class="single-pick"></span>
										<span class="single-pick"></span>
										<span class="single-pick"></span>
										<span class="single-pick"></span>
										<span class="single-pick"></span>
									</div>
									<div class="quantity-container d-flex align-items-center mt-15">
										Quantity:
										<input type="text" class="quantity-amount ml-15" value="1" />
										<div class="arrow-btn d-inline-flex flex-column">
											<button class="increase arrow" type="button" title="Increase Quantity"><span class="lnr lnr-chevron-up"></span></button>
											<button class="decrease arrow" type="button" title="Decrease Quantity"><span class="lnr lnr-chevron-down"></span></button>
										</div>

									</div>
									<div class="d-flex mt-20">
										<a href="#" class="view-btn color-2"><span>Add to Cart</span></a>
										<a href="#" class="like-btn"><span class="lnr lnr-layers"></span></a>
										<a href="#" class="like-btn"><span class="lnr lnr-heart"></span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



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
	<script type="text/javascript">
    $(function(){

        if(document.getElementById("price-range")){
        
        var nonLinearSlider = document.getElementById('price-range');
        noUiSlider.create(nonLinearSlider, {
            connect: true,
            behaviour: 'tap',
            start: [ 100, 5000 ],
            range: {
                // Starting at 500, step the value by 500,
                // until 4000 is reached. From there, step by 1000.
                // 범위 1 = 100원 / 100 = 10000원
                // 200000원 부터 25000원씩 오르도록 설정
                // 500000원 까지
                'min': [ 100, 100 ],
                '50%': [ 2000, 250 ],
                'max': [ 5000 ]
            }
        });


        // 가격 슬라이더에서 보여줄 텍스트 값을 위해 설정
        var nodes = [
            document.getElementById('lower-value'), // 0
            document.getElementById('upper-value')  // 1
        ];

        
        // form으로 보내줄 id 설정
        var nodes2 = [
        	document.getElementById('filterLowPrice'), // 0
            document.getElementById('filterHighPrice') // 1
        ]
        
        // Display the slider value and how far the handle moved
        // from the left edge of the slider.
        
        // [handle] = 배열로 설정한 id 값을 하나하나 확인한다는 것
        // 소수점을 없애기 위해 * 100 설정
        // id에 설정한 곳에 최소값 최대값을 어떤방법으로 보낼지 설정
        nonLinearSlider.noUiSlider.on('update', function ( values, handle, unencoded, isTap, positions ) {
            nodes[handle].innerHTML = values[handle] * 100;
            nodes2[handle].value = values[handle] * 100; 
        });

        }

    });
    
    
    
    // 필터검색 유효성 검사
    
    var form=document.forms['filter'];
    
    form.onsubmit=function(){

    	// Name에 size라는 태그를 타겟 (size이름이 여러개이므로 배열로 받게됨 즉, checkBox들을 모두 타겟하게됨)
        sizes = document.getElementsByName("size");
        
        for (count = i = 0; i < sizes.length; i++){
        	// ture = 1 / false = 0 으로 작동한다
        	// sizes[i] = 체크박스 자체이다
        	// checkbox.checked; 를 한것이나 다름없고 체크가 되어있는지 안되어있는지 boolean을 리턴한다
        	// 그렇기에 count가 0이면 모두 false 인것
        	count += sizes[i].checked;
        }

        if (count == 0){
        	alert("Size 체크박스를 하나이상 필수선택해야 합니다")
        	return false;
        }

    }

	</script>
</body>



</html>