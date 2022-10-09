<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %><%-- JSTL --%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
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
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/nouislider.min.css">
    <link rel="stylesheet" href="css/ion.rangeSlider.css" />
    <link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css" />
    <link rel="stylesheet" href="css/main.css">
    
    <style>
    .form-control{
    height:50px;
    }
    .textAlignLeft{
    text-align:left;
    font-size:20px;
    }
    
    </style>
</head>

<body>

	<t:header/>
	<t:banner/>
    <!--================Blog Area =================-->
    <section class="blog_area single-post-area section_gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 posts-list">
                	<div class="comment-form">
                        <h2>내 정보</h2>
                        <form action="updateM.do" method="post" ><!-- 회원 정보 변경 -->
                        	<p class="textAlignLeft">아이디</p><hr>
                            <div class="form-group">
                                <input type="text" class="form-control" name="mid" value="${mData.mid }" readonly>
                            </div><br>
                            <p class="textAlignLeft">비밀번호 (변경가능)</p><hr>
                            <div class="form-group">
                                <input type="text" class="form-control" name="mpw" value="${mData.mpw }">
                            </div><br>
                            <p class="textAlignLeft">이름</p><hr>
                            <div class="form-group">
                                <input type="text" class="form-control" name="mname" value="${mData.mname }" readonly>
                            </div><br>
                            <p class="textAlignLeft">전화번호</p><hr>
                            <div class="form-group">
                                <input type="text" class="form-control" name="mphone" value="${mData.mphone }" readonly>
                            </div><br>
                            <p class="textAlignLeft">발 사이즈</p><hr>
                            <div class="form-group">
                                <input type="text" class="form-control" name="shoesSize" value="${mData.shoesSize }" readonly>
                            </div><br>
                            <p class="textAlignLeft">주소</p><hr>
                            <div class="form-group">
                                <input type="text" class="form-control" name="maddress" value="${mData.maddress }" readonly>
                            </div><br>
                            
                            <input type="submit" class="genric-btn primary e-large" value="비밀번호 수정" style="font-size:20px; background:black">
                        </form>
                         <br>
                         <a href="deleteM.do?mid=${mData.mid }" class="genric-btn primary small" style="font-size:15px; background:black">회원탈퇴</a>
                    </div>
                    
                    <div class="comments-area">
                        <h2 style="text-align:center;">구매 목록</h2>
                        <br>
                        <div class="comment-list">
                        	  <c:forEach var="p" items="${pDatas}">
                            <div class="single-comment justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                
                                    <div class="thumb">
                                        <img src="${p.shoesImg}" alt="신발 이미지" style="width:200px">
                                    </div>
                                    <div class="desc">
                                        <h3><a href="selectOneS.do?colorpk=${p.colorpk }">${p.shoesName}</a></h3>
                                        <p style="font-size:20px">구매일: ${p.payday}<br><br>
                                        브랜드: ${p.shoesBrand}<br>
                                        색상: ${p.shoesColor}<br>
                                        사이즈: ${p.shoesSize}<br>
                                        배송지: ${p.address }</p>
                                        
                                    </div>
                                
                               <c:if test="${p.flag == true }">
                                    <a href="selectOneS.do?sizepk=${p.sizepk }" class="btn-reply text-uppercase">후기작성</a>
                                </c:if>
                                
                                <c:if test="${p.flag == false }">
                                    <p>후기 작성 완료</p>
                                </c:if>
                                
                                </div>
                            </div>
                      		 </c:forEach>
                        </div>
                    </div>
                    
                    <div class="comments-area">
                        <h2 style="text-align:center;">후기 목록</h2>
                        <br>
                        <div class="comment-list">
                            <div class="single-comment justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                
                                <c:forEach var="r" items="${rDatas }">
                                    <div class="thumb">
                                        <img src="img/shoes1.png" alt="" style="width:150px">
                                    </div>
                                    <div class="desc">
                                        <h5><a href="#">로그: 후기를 작성한 신발이름</a></h5>
                                        <p class="date">로그: 후기 작성일</p>
                                        <p class="comment">
                                            로그: 후기 내용
                                        </p>
                                    </div>
                                </div>
                                <div class="reply-btn">
                                    <a href="updateR.do" class="btn-reply text-uppercase">후기수정</a>
                                    <a href="deleteR.do" class="btn-reply text-uppercase">후기삭제</a>
                                </div>
                                </c:forEach>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <br>
                    <br>
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget author_widget">
                            <c:if test="${mData.tier < 200000 }">
                            <img class="author_img rounded-circle" src="img/3rd.png" alt="" style="width:200px">
                            <h3>회원 등급: 브론즈</h3>
                            </c:if>
                            <c:if test="${200000 < mData.tier && mData.tier < 400000 }">
                            <img class="author_img rounded-circle" src="img/2nd.png" alt="" style="width:200px">
                            <h3>회원 등급: 실버</h3>
                            </c:if>
                            <c:if test="${400000 < mData.tier }">
                            <img class="author_img rounded-circle" src="img/1st.png" alt="" style="width:200px">
                            <h3>회원 등급: 골드</h3>
                            </c:if>
                            <p>[등급 혜택]</p>
                            <p>골드: 전 상품 20% 할인</p>
                            <p>브론즈: 전 상품 5% 할인</p>
                            <p>실버: 전 상품 10% 할인</p>
                          
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
