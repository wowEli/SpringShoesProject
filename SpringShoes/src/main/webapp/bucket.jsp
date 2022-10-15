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
		width: 240px;
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

   <!--================Cart Area =================-->
   <section class="cart_area">
      <div class="container">
         <div class="cart_inner">
            <div class="table-responsive">
            	
            	<!-- 장바구니 목록이 없을 경우 -->
            	<c:if test="${sDatas.size() == 0 }">
            		 <table class="table">
            			 <tr class="out_button_area">
            		 		<th style="text-align:center;"><h1>장바구니에 상품이 없습니다.</h1></th>
            		 	</tr>
            		 </table>
            		   <center>	<a class="genric-btn primary-border login" href="selectAllS.do">쇼핑하러 가기</a>	</center>
            	</c:if>
            	<!-- ===================== -->
            	
            	<!-- 장바구니 목록 출력 시작 -->
            	<c:if test="${sDatas.size() != 0 }">
               <form action="deleteB.do?mid=${mid }">
               <table class="table">
                  <thead>
                  <label class="genric-btn primary-border login"><input type='checkbox' name='selectall' value='selectall' onclick="selectAll(this); checkSelectAll();"/>전체 선택</label>
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
                        
                  <c:forEach var="s" items="${sDatas}">
                     <tr>
                           <td><input type="checkbox" name="sizepk" id="my_checkbox" onclick="selectAll(this); checkSelectAll();"
                              value="${s.sizepk}"></td>

                           <td style="padding-top: 15px; padding-bottom: 15px;">
                              <div class="d-flex">
                                 <img class="img-fluid blog_right_sidebar"
                                    src="${s.shoesImg}" alt=""
                                    style="background-color: white; padding: 0;">
                              </div>
                           </td>

                           <td>
                              <p>${s.shoesName}</p>
                           </td>
                           
                           <td>
                              <p>${s.shoesSize}</p>
                           </td>
                           
                           <td>
                              <p>1</p>
                           </td>
                           
                           <td>
                              <h5>${s.price} 원</h5>

                           </td>

                     </tr>
                  </c:forEach>
                  
                  
                  </table>
                  <!-- 장바구니 목록 출력 종료 -->
                  
                  
                  <!-- 결제 정보 출력 시작 -->
                  <table class="table">
                  
                  <tr class="out_button_area">
                        <td>
                           <h5>내 등급</h5>
                        </td>
                        <td style="width:170px">
                        <h5>&nbsp;</h5>
                        </td>
                        <td>
                          <h5>총 금액</h5>
                        </td>
                        
                        <td>
                        <h5>내 등급 할인률</h5>
                        </td>
                        
                        <td>
                        	<h5>결제 금액</h5>
                        </td>
                        
                        <td></td>
                        <td></td>
                  </tr>
                  </table>
                  <table class="table">
                		
                  <c:if test="${mData !=null}">
                         <tr class="out_button_area">
                         
                        <td>
                            <c:if test="${mData.tier < 200000 }">
                            <img src="img/3rd.png" alt="" style="width:100px">
                            </c:if>
                            <c:if test="${200000 < mData.tier && mData.tier < 400000 }">
                            <img src="img/2nd.png" alt="" style="width:100px">
                            </c:if>
                            <c:if test="${400000 < mData.tier }">
                            <img src="img/1st.png" alt="" style="width:100px">
                            </c:if>
                        </td>
                        <td>
                          <h1 id="resultPrice">0</h1>
                          <input type="hidden" name="resultPrice" value="">
                        </td>
                        <td>
                       		<c:if test="${mData.tier < 200000 }">
                       			<input type="hidden" name="discount" value="0.95">
                     			<h1>5%</h1>
                            </c:if>
                            
                            <c:if test="${200000 < mData.tier && mData.tier < 400000 }">
                           		<input type="hidden" name="discount" value="0.90">
                           		<h1>10%</h1>
                            </c:if>
                            
                            <c:if test="${400000 < mData.tier }">
                            	<input type="hidden" name="discount" value="0.80">
                            	<h1>20%</h1>
                            </c:if>
                        </td>
                        <td>
                        	<h1 id="finalPrice" >0</h1>
                        	<input type="hidden" name="finalPrice" value="">
                        </td>
                        <td></td>
                        <td></td>
                  </tr>
                  </c:if>
                  </table>
                  <!-- 결제 정보 출력 종료 -->
                  
                  <!-- 결제 버튼 출력 시작 -->
                  <table class="table">
                  <tr class="out_button_area">
                        <td>
                        </td>
                        <td>
                        </td>
                        <td></td>
                        <td></td>
                        <td>
                        	<input type="submit"  class="genric-btn primary-border login" value="선택 삭제 ">
                        </td>
                        <td>
                        	<c:if test="${mData !=null }">
                          	 	<input type="button" class="genric-btn primary-border login"  value="구매하기" onclick="return payLocation(this.form)">
                       		</c:if>
                       		<c:if test="${mData ==null }">
                           			<a class="genric-btn primary-border login" href="login.do">로그인 후 구매하기</a>
                           		</c:if>
                        </td>
                  </tr>
                     
                  </tbody>
               </table>
               <!-- 결제 버튼 출력 종료 -->
               
            </form>
            </c:if>
            </div>
         </div>
      </div>



   <script type="text/javascript">
         var sum =0;
         var discount=0;

           // 체크를 클릭했을 경우 실행
           function selectAll(tag)  {
        	   
        	   // 상품을 하나 체크를 하나 했을 경우
        	   if($(tag).attr('name') == "sizepk"){
        		// 가격 태그를 찾는 과정
                   var pt=tag.parentNode.parentNode.childNodes[11].childNodes[1];
                   // 이벤트가 발생한 태그에 부모태그의 부모태그의 자식태드글중 11번째의 자식태그들중 1번째
                   console.log(pt);
                      
                   // console.log(pt.innerText);
                   // console.log(parseInt(pt.innerText));
                      
                   if(tag.checked==true){ // 이벤트가 발생된 태그가 체크가 된 상태라면
                   	
                      // sum에 금액을 저장
                      sum+=parseInt(pt.innerText); // 인트형으로 형변환 하면 "원"은 제외 되고 금액값만 형변환 됨
                      
                   }else{ // 이벤트가 발생된 태그가 체크가 해제된 상태라면
                   	
                   	// sum에 금액 제외
                   	sum-=parseInt(pt.innerText); // 인트형으로 형변환 하면 "원"은 제외 되고 금액값만 형변환 됨
                   }
        	   }
        	   
        	  // 전체체크를 했을 경우
        	  if($(tag).attr('name') == "selectall"){
        	   
              const checkboxes = document.getElementsByName('sizepk');
              
              checkboxes.forEach((checkbox) => {
                   
                 if(tag.checked==true){ // 모두체크박스가 체크된 상태라면
                      if(checkbox.checked==false){ // 체크박스들중 체크가 안된 박스의
                      var pt=checkbox.parentNode.parentNode.childNodes[11].childNodes[1]; // 가격을
                      
                      sum+=parseInt(pt.innerText); // sum에 더하고

                      checkbox.checked = tag.checked; // 체크된 상태로 바꾸기
                   }
                 }
                 else{ // 모두체크박스가 체크가 안된 상태라면
                	 if(checkbox.checked==true){ // 체크박스들중 체크가 된 박스는
                		 
                		 checkbox.checked = tag.checked; // 체크를 해제하고
                		 }
                	 
                	 sum=0; // 합계 금액은 0으로 초기화
                	 }
                 
                 })
        	  }
              
               document.getElementById("resultPrice").innerHTML=sum; // id가 resultPriced인 태그바디 안에 총금액을 출력
               document.getElementsByName("resultPrice").value=sum; // 총금액을 C에게 전달하기 위해 value값 변경
              
               discount = parseFloat(document.getElementsByName("discount")[0].value);
               // name이 discount인 태그들중 0번째 인덱스의 value값을 실수형으로 형변환
               
               // console.log(sum * discount);
               
               document.getElementById("finalPrice").innerHTML=sum * discount; // id가 finalPriced인 태그바디 안에 최종금액을 출력
               document.getElementsByName("finalPrice").value=sum * discount; // 최종금액을 C에게 전달하기 위해 value값 변경
              
            }
           
           
           // 개별 체크에 따른 모두체크 true / false 설정 메서드
           function checkSelectAll()  {
                // 전체 체크박스
                const checkboxes = document.querySelectorAll('input[name="sizepk"]'); // name이 sizepk인 모든태그들을 저장
                
                // 선택된 체크박스
                const checked  = document.querySelectorAll('input[name="sizepk"]:checked'); // name이 sizepk인 태그중 체크된 것만 저장
                
                // select all 체크박스
                const selectAll  = document.querySelector('input[name="selectall"]'); // name이 selectAll인 태그를 저장
                
                
                if(checkboxes.length == checked.length)  { // 모든 sizepk 태그의 개수와 체크된 sizepk태그의 개수가 같다면
                  selectAll.checked = true; // selectAll이란 태그의 체크 값을 true로 설정
                  // ex) 하나하나 상품들을 모두 체크하면 모두체크에도 체크
                }else { // 같지 않다면
                  selectAll.checked = false; // selectAll이란 태그의 체크 값을 false로 설정
                  // ex) 모두 체크된 상태에서 체크를 하나 해제하면 모두체크에도 체크 해제
                }

              }
           
       	 
       	 // 구매하기 버튼을 누를 경우
         function payLocation(frm){
        	 const checked  = document.querySelectorAll('input[name="sizepk"]:checked');
        	 
        	 if(checked.length==0){ // 체크를 하나도 안하고 구매하기 버튼을 누를 경우
        		 alert("구매할 상품을 선택해주세요");
        		 return false;
        	 }
        	 
             frm.action="pay.do";
             frm.submit();
             return true;
             
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