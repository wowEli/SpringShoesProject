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

<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>


   <!--    <t:header /> -->

   <!-- Start Banner Area -->
   <section class="banner-area organic-breadcrumb">
      <div class="container">
         <div
            class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
            <div class="col-first">
               <h1>Shopping Cart</h1>
               <nav class="d-flex align-items-center">
                  <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                  <a href="category.html">Cart</a>
               </nav>
            </div>
         </div>
      </div>
   </section>
   <!-- End Banner Area -->

   <!--================Cart Area =================-->
   
   
   
   
   
   <section class="cart_area">
         <div class="container">
            <form>
                  <div class="sidebar-categories">
                       <div class="head" style="background-color:black;">배송지 입력란</div>
                       </div>
               <table style ="width:1100px; height:100px; text-align:center;">
                  <tr class = "tr01">
                     <td class="td01">배송지 선택</td>
                     <td class ="td02"> <input type="radio" class="arrive-select" name="arriveSelect" value="old" checked/>기본 배송지&nbsp;&nbsp;
                      <input type="radio" class="arrive-select" name="arriveSelect" value="new" />신규 배송지&nbsp;&nbsp;
                      <input type="radio" class="arrive-select" name="arriveSelect" value="other"/>다른 배송지
                      
                      </td>
                  </tr>
                
                  <tr class="tr01">
                  <td class="td01">배송지 입력</td>
                  
                  <td class ="td02"><input type="text" id="sample2_address" name="inputarrive" class="radio-value-detail" placeholder="신규 배송지를 입력해주세요." value=""/>
                  <input type="button" name="inputarrivebutton"onclick="sample2_execDaumPostcode()" value="우편번호 찾기" >
                	<div id="checkbox">
                   <input type="radio" name="address" value="" checked> 서울특별시 관악구 어쩌구 저쩌구
                   <br>
                   <input type="radio" name="address" value=""> 서울특별시 강남구 어쩌구 저쩌구 IT아카데미
                   <br>
                   <input type="radio" name="address" value=""> 미국특별시 워싱턴구 어쩌구 저쩌구
                   </div>
                     </td>
                  </tr>
                  
                  
                  <tr class="tr01">
                  <td class="td01">배송 메모</td>
                  <td class ="td02"> 
                     <select id="requestArrive" name='requestArrive'>
                          <option value='' selected>-- 배송시 요청사항을 선택해주세요 --</option>
                          <option value='1'>부재시 경비실에 맡겨주세요</option>
                          <option value='2'>부재시 택배함에 넣어주세요</option>
                          <option value='3'>부재시 집앞에 놔주세요</option>
                          <option value='4'>배송전 연락 바랍니다</option>
                          <option value='5'>&nbsp;&nbsp;&nbsp;&nbsp;직접 입력&nbsp;&nbsp;&nbsp;&nbsp;</option>
                          <input type="text" id="selboxDirect" name="selboxDirect"/>
                     </select></td>
                  </tr>
                  
               </table>
            </form>
         </div>
         <br>
         

      <div class="container">
         <div class="cart_inner">
            <div class="table-responsive">
               <table class="table">
                  <thead>
                     <tr>
                        <th scope="col" style="width: 194px;">체크박스</th>
                        <th scope="col" style="width: 204px;">상품이미지</th>
                        <th scope="col">이름</th>
                        <th scope="col">가격</th>
                        <th scope="col">갯수</th>
                     </tr>
                  </thead>
                  <tbody>

                     <tr>

                        <td><input type="checkbox" name="colorpk" value="">1
                        </td>

                        <td style="padding-top: 15px; padding-bottom: 15px;">
                           <div class="d-flex">
                              <img class="img-fluid blog_right_sidebar" src="img/abc.PNG"
                                 alt="" style="background-color: white; padding: 0;">
                           </div>
                        </td>

                        <td>
                           <p>조던 1</p>
                        </td>

                        <td>
                           <h5>129000</h5>

                        </td>

                        <td>
                           <p>1</p>
                        </td>
                 

                  </tbody>
               </table>
            </div>
         </div>
      </div>
      
       <div class="container">
         <div class="sidebar-categories">
                       <div class="head" style="background-color:black;">내 등급 할인</div>
                       </div>
         <table style ="width:1100px; height:100px; border:1px solid gray; text-align:center;">
         <tr class="tr01">
            <td class="td01">내 등급</td>
            <td class="td02">골드</td>
         </tr>
         <tr class="tr01">
            <td class="td01">할인율</td>
            <td class="td02">15%</td>
         </tr>
         <tr class="tr01">
            <td class="td01">총금액</td>
            <td class="td02">100000</td>
         </tr>
      </table>
      </div>
      
      <div class="container">
      <a class="primary-btn" href="#">결제하기</a></div>
      
      
      <script type="text/javascript">

      $(document).ready(function(){      //기존 배송지 선택시 입력 비활성화
    	     $("#checkbox").hide();
    	      $("input:button[name=inputarrivebutton]").hide(); // 주소버튼 가리기
    	      $("input:text[name=inputarrive]").attr("disabled",true);  //기존이면 비활성화
    	      
    	       $("input:radio[name=arriveSelect]").click(function(){
    	    
    	           if($("input[name=arriveSelect]:checked").val() == "old"){
    	              $("#checkbox").hide();
    	              $("input:text[name=inputarrive]").show();
    	              $("input:text[name=inputarrive]").attr("disabled",true);  //기존이면 비활성화
    	               $("input:button[name=inputarrivebutton]").hide();
    	           }else if($("input[name=arriveSelect]:checked").val() == "new"){
    	              $("#checkbox").hide();
    	              $("input:text[name=inputarrive]").show();
    	                 $("input:button[name=inputarrivebutton]").show();
    	                 $("input:text[name=inputarrive]").attr("disabled",false); //새로운 배송지면 활성화
    	           }else if($("input[name=arriveSelect]:checked").val() == "other"){
    	              $("input:button[name=inputarrivebutton]").hide();
    	              $("input:text[name=inputarrive]").hide();
    	              $("#checkbox").show();

    	           }
    	       });
    	   });
   $(function(){      //직접 입력 숨기기
   $("#selboxDirect").hide();
   $("#requestArrive").change(function() {
                   //직접입력을 누를 때 나타남
         if($("#requestArrive").val() == "5") {
            $("#selboxDirect").show();
         }  else {
            $("#selboxDirect").hide();
         }
      }) 
   });
   </script>
      

      
   </section>
   <!--================End Cart Area =================-->

   <!-- start footer Area -->
   <footer class="footer-area section_gap">
      <div class="container">
         <div class="row">
            <div class="col-lg-3  col-md-6 col-sm-6">
               <div class="single-footer-widget">
                  <h6>About Us</h6>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                     sed do eiusmod tempor incididunt ut labore dolore magna aliqua.</p>
               </div>
            </div>
            <div class="col-lg-4  col-md-6 col-sm-6">
               <div class="single-footer-widget">
                  <h6>Newsletter</h6>
                  <p>Stay update with our latest</p>
                  <div class="" id="mc_embed_signup">

                     <form target="_blank" novalidate="true"
                        action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                        method="get" class="form-inline">

                        <div class="d-flex flex-row">

                           <input class="form-control" name="EMAIL"
                              placeholder="Enter Email" onfocus="this.placeholder = ''"
                              onblur="this.placeholder = 'Enter Email '" required=""
                              type="email">


                           <button class="click-btn btn btn-default">
                              <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                           </button>
                           <div style="position: absolute; left: -5000px;">
                              <input name="b_36c4fd991d266f23781ded980_aefe40901a"
                                 tabindex="-1" value="" type="text">
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
                     <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                        class="fa fa-twitter"></i></a> <a href="#"><i
                        class="fa fa-dribbble"></i></a> <a href="#"><i
                        class="fa fa-behance"></i></a>
                  </div>
               </div>
            </div>
         </div>
         <div
            class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
            <p class="footer-text m-0">
               <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
               Copyright ©
               <script>
                  document.write(new Date().getFullYear());
               </script>
               2022 All rights reserved | This template is made with <i
                  class="fa fa-heart-o" aria-hidden="true"></i> by <a
                  href="https://colorlib.com" target="_blank">Colorlib</a>
               <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
         </div>
      </div>
   </footer>
   <!-- End footer Area -->

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
                document.getElementById("sample2_address").value = addr;
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