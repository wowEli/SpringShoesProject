<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %><%-- JSTL --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    .black{
    color:black;
    }
	.shopping:hover{
	color:red;
	}
	.genric-btn.primary-border{
	   color:black;
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
    <!--================Blog Area =================-->
    <section class="blog_area single-post-area section_gap">
        <div class="container">
                
                <!-- 개인정보 배너 시작 -->
                <table class="table">
                   <thead>
                      <tr>
                     	<th scope="col">
                     		<c:if test="${mData.tier < 200000 }">
                            <img class="author_img rounded-circle" src="img/3rd.png" alt="" style="width:150px">
                            </c:if>
                            <c:if test="${200000 < mData.tier && mData.tier < 400000 }">
                            <img class="author_img rounded-circle" src="img/2nd.png" alt="" style="width:150px">
                            </c:if>
                            <c:if test="${400000 < mData.tier }">
                            <img class="author_img rounded-circle" src="img/1st.png" alt="" style="width:150px">
                            </c:if>
                        </th>
                         <th scope="col" style="font-size:70px; color:black;">${mData.mname}
                         <br><br><br><br>
                         </th>
                        <th scope="col" style="font-size:50px; color:gray;">$ 전체 구매 금액:
                        <br><br><br><br>
                        </th>
                        
                        <th scope="col" style="font-size:50px; color:gray;"><fmt:formatNumber type="number" value="${mData.tier}"/>원
                        <br><br><br><br>
                        </th>
                        
                  	  </tr>
                  </thead>
             	</table>
             	<!-- 개인정보 배너 종료 -->
             	<br><br><br><br>
             	
             	<!-- 개인정보 출력 시작 -->
             	<table class="table">
                   <thead>
                      <tr style="background-color:white;">
                         <th scope="col" style="font-size:50px; color:black;"><br>회원 정보
                         <br><br>
                         </th>
                  	  </tr>
                  </thead>
             	</table>
             	
                <table class="table">
                <tHead>
                      <tr>
                     	<th scope="col">
                     		<p>아이디</p>
                     		<input type="text" class="form-control" name="mid" value="${mData.mid }" readonly>
                        </th>
                     	<th scope="col">
                     		<p></p>
                     		<center><input type="button" class="genric-btn primary-border e-large ss" onclick="getShow()" value="비밀번호 변경" ></center>
                        </th>
                        <th style="align-text:center;">
                        <a href="deleteM.do?mid=${mid }" class="genric-btn primary-border e-large ss" style="color:red;">회원 탈퇴</a>
                        </th>
                     </tr>
                      <tr>
                     	<th scope="col">
                     		<p>전화번호</p>
                     		<input type="text" class="form-control" name="mphone" value="010${mData.mphone }" readonly>
                        </th>
                     	<th scope="col">
                     		<p>주소</p>
                     		<input type="text" class="form-control" name="maddress" value="${mData.maddress }" readonly>
                        </th>
                        <th style="width: 200px">
                        	<p>발 사이즈</p>
                     		<input type="text" class="form-control" name="shoesSize" value="${mData.shoesSize }" readonly>
                        </th>
                     </tr>
                     </tHead>
             	</table>
             	<!-- 개인정보 출력 종료 -->
             	
             	<!-- 새로운비밀번호 출력 시작 -->
             	<form action="updateM.do?mid=${mid }">
             	<table class="table" id="updatePassword">
             		<tr>
             			<th scope="col">
                     		<p>새로운 비밀번호</p>
                     		<input type="password" class="form-control" name="mpw">
                        </th>
             			<th scope="col">
                     		<p>비밀번호 확인</p>
                     		<input type="password" class="form-control">
                        </th>
                        <th style="width: 20px">
                        	<p>&nbsp;</p>
                     		<input class="genric-btn primary-border e-large ss" type="submit" value="비밀번호 변경" >
                        </th>
                	</tr>
             	</table>
             	</form>
             	<!-- 새로운비밀번호 출력 종료 -->
             	
             	<br><br><br><br>
             	
             	<!-- 구매목록 출력 시작 -->
             	<table class="table">
                   <thead>
                      <tr style="background-color:white;">
                         <th scope="col" style="font-size:50px; color:black;"><br>구매 목록
                         <br><br>
                         </th>
                  	  </tr>
                  </thead>
             	</table>
             	
             	<table class="table">
                  <thead>
                     <tr style="background-color:black;">
                     
                        <th scope="col" style="width: 204px; color:white;">상품이미지</th>
                        <th scope="col" style="color:white;">상품명</th>
                        <th scope="col" style="color:white;">사이즈</th>
                        <th scope="col" style="color:white;">가격</th>
                        <th scope="col" style="color:white;">배송지</th>
                        <th scope="col" style="color:white;">구매 날짜</th>
                        <th scope="col" style="color:white;">후기 작성</th>
                        
                     </tr>
                  </thead>
                  <tbody>
                        <c:forEach var="p" items="${pDatas}">
 						<tr>
                           <td>
                                <a href="selectOneS.do?colorpk=${p.colorpk }"> <img class="img-fluid blog_right_sidebar"
                                    src="${p.shoesImg}" alt="신발이미지"
                                    style="background-color: white; padding: 0; width:120px;"></a>
                           </td>

                           <td>
                              <p><br><br>${p.shoesName}</p>
                           </td>

							<td>
								<p><br><br>${p.shoesSize}</p>
							</td>
							
                           <td>
                              <p><br><br>${p.shoesPrice}</p>
                           </td>

						   <td style="width:230px">
                              <p><br><br>${p.address}</p>
                           </td>

                           
                           <td>
                              <p><br><br>${p.payday}</p>
                           </td>
                           <td>
                            	<c:if test="${p.flag == true }">
                            		<br><br><a href="review.do?sizepk=${p.sizepk}&colorpk=${p.colorpk}" 
                                    class="genric-btn primary-border">후기작성</a></c:if>
                                <c:if test="${p.flag == false }">
                                    <p><br><br>후기 작성 완료</p></c:if>
                           </td>

                      </tr>
                        </c:forEach>
                  </tbody>
               </table>
              			<c:if test="${pDatas.size() == 0 }">
                  		<div class="head black" style="text-align:center; width:100%; height:250px;">
                  		<br>
                     		<span style="font-size:30px;">구매하신 상품이 없습니다. <a class="genric-btn primary-border e-large ss" href="selectAllS.do">쇼핑하러가기</a></span>
                   		</div>
                  		</c:if>
               <!-- 구매목록 출력 종료 -->
             	
             	<br><br><br><br>
             	
             	<!-- 후기목록 출력 시작 -->
             	<table class="table">
                   <thead>
                      <tr style="background-color:white;">
                         <th scope="col" style="font-size:50px; color:black;"><br>후기 목록
                         <br><br>
                         </th>
                  	  </tr>
                  </thead>
             	</table>
             	
             	<table class="table">
                  <thead>
                     <tr style="background-color:black;">
                     
                        <th scope="col" style="width: 204px; color:white;">후기이미지</th>
                        <th scope="col" style="color:white;">상품명</th>
                        <th scope="col" style="color:white;">사이즈</th>
                        <th scope="col" style="color:white;">내용</th>
                        <th scope="col" style="color:white;">작성 날짜</th>
                        <th scope="col" style="color:white;">수정</th>
                        <th scope="col" style="color:white;">삭제</th>
                        
                     </tr>
                  </thead>
                  <tbody>
                        <c:forEach var="r" items="${rDatas}">
 						<tr>
                           <td>
                            <a href="selectOneS.do?colorpk=${r.colorpk }"> <img class="img-fluid blog_right_sidebar"
                                    src="img/${r.reviewImg}" alt="신발이미지"
                                    style="background-color: white; padding: 0; width:120px;"></a>
                           </td>

                           <td>
                              <p><br><br>${r.shoesName}</p>
                           </td>

							<td>
								<p><br><br>${r.size}</p>
							</td>
							
                           <td style="width:150px">
                              <p><br><br>내용은 상세페이지에서 확인 가능합니다.</p>
                           </td>
                           
                           <td>
                              <p><br><br>${r.writeday}</p>
                           </td>

                           <td>
                           <br><br>
                              <a href="selectOneR.do?rpk=${r.rpk}" class="genric-btn primary-border">후기 수정</a>
                           </td>
                           <td>
                           <br><br>
                              <a href="deleteR.do?rpk=${r.rpk}" class="genric-btn primary-border" style="color:red;">후기 삭제</a>
                           </td>

                      </tr>
                        </c:forEach>
                  </tbody>
               </table>
                  		<c:if test="${rDatas.size() == 0 }">
                  		<div class="head black" style="text-align:center; width:100%; height:250px;">
                  		<br>
                     		<span style="font-size:30px;">작성하신 후기가 없습니다. <a class="genric-btn primary-border e-large ss" href="selectAllS.do">쇼핑하러가기</a></span>
                   		</div>
                  		</c:if>
               <!-- 후기목록 출력 종료 -->
             	
            </div>
    </section>

    <t:footer/>

	<script type="text/javascript">

   
   document.getElementById("updatePassword").style.display = "none";
  
   function getShow(){
		document.getElementById("updatePassword").style.display = "";
		
	}
   
   </script>

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
