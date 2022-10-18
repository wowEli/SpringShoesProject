<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<title>Spring Shoes</title>


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
<style>
.tr01{
   border:1px solid black;
   margin:10px;
   }
.td01{
   width:300px;
   border:1px solid black;
   border-right:none;
   text-align: left;
   margin:10px;
   }
.td02{
   text-align: left;
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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                     <tr style="background-color:black;">
                     
                        <th scope="col" style="width: 204px; color:white;">상품이미지</th>
                        <th scope="col" style="color:white;">이름</th>
                        <th scope="col" style="color:white;">사이즈</th>
                        <th scope="col" style="color:white;">갯수</th>
                        <th scope="col" style="color:white;">가격</th>
                     </tr>
                  </thead>
                  <tbody>
                        <c:forEach var="s" items="${sDatas}">
 						<tr>
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
                              <h5><fmt:formatNumber type="number" value="${s.price}"/>원</h5>
                           </td>

                      </tr>
                        </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
         
       <div class="container">
         <div class="cart_inner">
            <div class="table-responsive">
            
               <table class="table">
                  <thead>
                     <tr style="background-color:black;">
                     	<th scope="col" style="width: 194px; color:white;">체크박스</th>
                        <th scope="col" style="color:white;">배송지 이름</th>
                        <th scope="col" style="color:white;">주소</th>
                        <th scope="col"><input type="button" class="genric-btn primary-border" style="font-size:15px;" onclick="getShow()" value="+ 신규 배송지" ></th>
                     </tr>
                  </thead>
                  
                  <tbody>
                  		<!-- 회원의 기본 배송지 출력 시작 -->
                  		<tr>
                  		<td>
                        	  <input type="radio" name="address" id="defaultAddress" onclick="otherAddress(this)" value="${mData.maddress}" checked/>
						   </td>
                           <td>
                              <p>기본 배송지</p>
                           </td>

							<td>
								<p>${mData.maddress}</p>
							</td>
							<td>
								<p>&nbsp;</p>
							</td>
                  		</tr>
                  		<!-- 회원의 기본 배송지 출력 종료 -->
                  		
                  		<!-- 회원의 다른 배송지 목록 출력 시작 -->
                        <c:forEach var="a" items="${aDatas}">
 						<tr>
                       	   <td>
                        	  <input type="radio" name="address" class="otherAddress" onclick="otherAddress(this)" value="${a.address}">
						   </td>
                           <td>
                              <p>${a.aname}</p>
                           </td>

							<td>
								<p>${a.address}</p>
							</td>
							<td>
								<p><a href="deleteA.do?apk=${a.apk }" class="genric-btn primary-border">삭제</a></p>
							</td>
                        </tr>
                        </c:forEach>
                        <!-- 회원의 다른 배송지 목록 출력 종료 -->
                        
                  </tbody>
             </table>
                        
                        <!-- 신규 배송지 시작 -->
             <form action="insertA.do?mid=${mid }" >
             <table class="table" id="newAddress">
                   <thead>
                        <tr style="background-color:black;">
                     	<th scope="col" style="width: 194px;color:white;">수령인</th>
                        <th scope="col" style="color:white;">주소</th>
                        <th scope="col" style="color:white;">상세주소</th>
                        <th scope="col" style="color:white;"> <input type="submit" class="genric-btn primary-border" style="font-size:15px;" value="배송지 등록" ></th>
                  	    </tr>
                  </thead>
                        <tr>
                           <td>
                              <input type="text" name="aname" class="form-control" placeholder="ex) 집, 회사">
                           </td>

							<td>
							  <input type="text" name="address" class="form-control" id="addressAPI" placeholder="신규 주소 등록" readonly/>
							</td>
							<td>
							  <input type="text" name="detailAddress" class="form-control" placeholder="상세주소 입력"/>
							</td>
							<td>
                			  <input type="button" class="genric-btn primary-border" onclick="sample2_execDaumPostcode()" value="주소 찾기" >
							</td>
                      	</tr>
             </table>
             </form>
                      	<!-- 신규 배송지 종료 -->
                      	
                      	<!-- 결제정보 시작 -->
                     
            <table class="table">
                   <thead>
                        <tr style="background-color:black;">
                     	<th scope="col" style="width: 194px;color:white;">회원 등급</th>
                        <th scope="col" style="color:white;">총 금액 - 할인 금액</th>
                        <th scope="col" style="color:white;">결제 금액</th>
                        <th scope="col" style="color:white;">&nbsp;</th>
                  	    </tr>
                  </thead>
						<tr>
							<!-- 티어 이미지 -->
							<td>
							    <c:if test="${mData.tier < 200000 }">
									<img src="img/3rd.png" alt="" style="width: 100px">
								</c:if> 
								<c:if test="${200000 < mData.tier && mData.tier < 400000 }">
									<img src="img/2nd.png" alt="" style="width: 100px">
								</c:if> 
								<c:if test="${400000 < mData.tier }">
									<img src="img/1st.png" alt="" style="width: 100px">
								</c:if>
							</td>


							<td>
								<c:if test="${mData.tier < 200000 }">
									<p style="font-size: 40px; color:black;"><fmt:formatNumber type="number" value="${resultPrice}"/>원 &nbsp;-5%</p>
								</c:if> <c:if test="${200000 < mData.tier && mData.tier < 400000 }">
									<p style="font-size: 40px; color:black;"><fmt:formatNumber type="number" value="${resultPrice}"/>원 &nbsp;-10%</p>
								</c:if> <c:if test="${400000 < mData.tier }">
									<p style="font-size: 40px; color:black;"><fmt:formatNumber type="number" value="${resultPrice}"/>원 &nbsp;-20%</p>
								</c:if>
							</td>

							<td>
								<p style="font-size: 40px; color:black;"><fmt:formatNumber type="number" value="${finalPrice}"/>원</p>
							</td>

							<td>
							<form action="insertP.do" id="payForm">
							<input type="hidden" name="address" id="payAddress" value="">
							<input type="button" class="genric-btn primary-border e-large ss" id="check_module" value="결제하기">
							</form>
							
							</td>
						</tr>
					</table>
             <!-- 결제정보 종료 -->
              	
            </div>
         </div>
      </div>
      
	<script type="text/javascript">
		document.getElementById("newAddress").style.display = "none";
		console.log(document.getElementById("payAddress").value);

		function getShow() {
			document.getElementById("newAddress").style.display = "";
		}
	</script>
	<script type="text/javascript">
		document.getElementById("payAddress").value = document.getElementById("defaultAddress").value;
		
		function otherAddress(tag){
				console.log(document.getElementById("payAddress").value);
				document.getElementById("payAddress").value = tag.value;
				console.log(document.getElementById("payAddress").value);
		}
	
	</script>

	<script>
   $("#check_module").click(function () {
	      var IMP = window.IMP; // 생략가능
	      IMP.init('imp00314251'); 
	      // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	      // ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
	      IMP.request_pay({
	         pg: 'html5_inicis',
	         pay_method: 'card',
	         merchant_uid: 'merchant_' + new Date().getTime(),
	         /* `
	          *  merchant_uid에 경우 
	          *  https://docs.iamport.kr/implementation/payment
	          *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	          */
	         name: 'ㅡ',
	         // 결제창에서 보여질 이름
	         // name: '주문명 : ${auction.a_title}',
	         // 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
	         amount: ${finalPrice},
	         //amount가 결제할 금액입니다.
	         // amount: ${bid.b_bid},
	         // 가격 
	         buyer_name: ' ${mData.mname} ' ,
	         // 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
	         // 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
	         buyer_postcode: '123-456',
	         //예상 
	         
	         }, function (rsp) {
	            console.log(rsp);
	         if (rsp.success) {
	            var msg = '결제가 완료되었습니다.';
	            msg += '결제 금액 : ' + rsp.paid_amount;
	            // success.submit();
	            // 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
	            // 자세한 설명은 구글링으로 보시는게 좋습니다.
	            var payForm=$('#payForm');
	            alert(msg);
	            payForm.submit();
	            
	         } else {
	            var msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	         }
	         alert(msg);
	         
	      });
	   }); 
	</script>
      
   </section>
	
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
   
   <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

</body>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                
                } else {
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("addressAPI").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>


</html>