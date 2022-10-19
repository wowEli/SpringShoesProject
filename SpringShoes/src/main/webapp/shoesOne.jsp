<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/nouislider.min.css">
<link rel="stylesheet" href="css/ion.rangeSlider.css" />
<link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css" />
<link rel="stylesheet" href="css/main.css">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
   integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
   crossorigin="anonymous"></script>
<style type="text/css">
.modal {
   position: absolute;
   width: 40%;
   height: 260px;
   overflow: auto;
   background: rgba(0, 0, 0, 0.8);
   top: 370px;
   left: 0;
   display: none;
   padding: 10px;
}

#modalButton:hover {
   color: red;
   cursor: pointer;
}

h6 {
   padding: 10px;
}

#sst {
   padding: 5px;
}

.close {position:relative;float:left;display:inline-block;*display:inline;padding-top:5px;padding-left:10px;width:50px;height:50px;margin-right:20px;}
.close1:after {content: "\00d7"; font-size:15pt;}
}

	.billing_details .contact_form .form-group a{
    	border-radius: 8px;
    	color: black;
    }
    .billing_details .contact_form .form-group a.ss:hover{
    	color:white;
    }
    .genric-btn.primary-border{
    	border:1px solid black;
    	font-size:20px;
    	margin: 7px;
    }
    .genric-btn.primary-border:hover{
    	background: black;
    	color: white;
    }
    span{
    	color: black;
    	font-size: 15px;
    }
</style>
</head>

<body>

   <t:header />
   <t:banner />

   <!--================Single Product Area =================-->
   <div class="product_image_area">
      <div class="container">
         <div class="row s_product_inner">
            <div class="col-lg-6">
               <div class="single-prd-item">
                  <img class="img-fluid" src="${sData.shoesImg }" alt="메인신발">
               </div>
            </div>
            <div class="col-lg-5 offset-lg-1">
               <div class="s_product_text">
                  <h3>${sData.shoesName }</h3>
                  <h2>${sData.price }원</h2>
                  <ul class="list">
                     <li><span>브랜드</span> : ${sData.brand }</li>
                     <li><br> <span>색상종류</span> <br> <c:forEach
                           var="color" items="${colorDatas}">
                           <a href="selectOneS.do?colorpk=${color.colorpk}"> <img
                              src="${color.shoesImg}" alt="다른색"
                              style="width: 58px; height: 58px; border: 1px solid #d2d2d2">
                           </a>
                        </c:forEach></li>
                     <li><br> <br> <a id="modalButton">사이즈 선택</a></li>
                  </ul>
                  <br> <br>
                  <div>
                     <span>담김 목록</span>
                     <div class="table-responsive">
                        <form id="payform" action="bucket.do?mid=${mid }" method="post">
                           <table class="table">
                              <thead>
                                 <tr>
                                    <th scope="col" style="text-align: center;">제품명</th>
                                    <th scope="col">사이즈</th>
                                    <th scope="col">삭제</th>
                                 </tr>
                              </thead>
                              <tbody class="slist"></tbody>
                              <tr>
                                 <td colspan="3" id="slistTextbox" style="text-align: center;"><span id="slistText">사이즈를 선택하여 제품을 담아주세요</span></td>
                              </tr>
                           </table>
                        </form>
                     </div>
                  </div>
                  <div class="modal">
                     <div class="modal_content" title="클릭하면 창이 닫힙니다.">
                        <c:forEach var="size" items="${sizeDatas}">
                           <c:if test="${size.cnt != 0 }">
                              <button class="sizeButton" value="${size.sizepk}" style="margin: 5px;">${size.size}</button>
                              남은 갯수:<span style="color: grey;">${size.cnt }</span>
                              <br>
                           </c:if>
                        </c:forEach>
                     </div>
                  </div>
                  <div class="card_area d-flex align-items-center">
                     <a class="genric-btn primary-border e-large ss" onclick="payform()">구매하기</a>
                     <a class="genric-btn primary-border e-large ss" onclick="result()">장바구니 담기</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <script type="text/javascript">
   
     var shoesIndex = 0;
     
     // 상세페이지에서 목록에 보여줄 태그생성
      $(function() {

         $("#modalButton").click(function() {
            $(".modal").fadeIn();
         });

         $(".sizeButton").click(function() {
        	 			
                        $(".modal").fadeOut(); // 모달창 닫기
                        
                      	var sizeCnt = $(this).next().html(); // 남은재고 숫자부분 span 태그를 가져옴
                      	console.log(sizeCnt);
                      	
                      	var sizeDown = sizeCnt - 1; // 자동형변환이 되어 숫자로 인식하기때문에 -1 하여도 상관없음
                      	console.log(sizeDown);
                      	
                      	$(this).next().html(sizeDown); // 남은재고 숫자부분 span 태그에 -1한 결과값을 다시 넣어줌
                      	
                      	if($(this).next().html() == 0){ // -1 하고 난뒤 0이 됐을경우 버튼 비활성화
                      		$(this).next().html("0");
                      		$(this).attr('disabled','disabled');
                      	}
                        
                        
                        // 제품이 있을경우에만
                        $('#slistText').hide();

                        var $tr = $("<tr id="+"shoesIndex"+shoesIndex+">", {});
                        var $td1 = $("<td style='text-align: center;'><h6>${sData.shoesName }</h6></td>");
                        var $td2 = $("<td><h6>" + $(this).html() + "</h6></td>");
                        var $td3 = $("<input class='sizepk' type='hidden' value='"+ $(this).val() + "' name='sizepk'>)");
                        var $td4 = $("<td><a class='close close1' data-value="+shoesIndex+" id="+"shoesDelete"+shoesIndex+" onclick='shoesDelete(this)'></a></td>")

                        $tr.append($td1);
                        $tr.append($td2);
                        $tr.append($td3);
                        $tr.append($td4);
                  
                        shoesIndex++;
                        
                        $('.slist').append($tr);
                     });

      });
      
      // 삭제버튼 기능
      function shoesDelete(e){
      var index = document.getElementById(e.getAttribute('id')).getAttribute('data-value');
      console.log(document.getElementById(e.getAttribute('id')).getAttribute('data-value'));
      
      
//    document.getElementById(e.getAttribute('id')).parentNode.parentNode
//	  -> 여기까지가 모달창 버튼을 만들었을경우 만들어지는 <tr> </tr> 태그 안의 모든 태그들이다
//	  .getElementsByTagName('td')[1]
//	  -> <tr> 태그 안의 태그중 이름이 'td'인 태그를 모두 불러오는데 그중 인덱스 [1]값이 사이즈를 표현하고 있는 태그이다
	  console.log("삭제한 sizepk = "+document.getElementById(e.getAttribute('id')).parentNode.parentNode.getElementsByTagName('input')[0].value);
      console.log("삭제한 size = "+document.getElementById(e.getAttribute('id')).parentNode.parentNode.getElementsByTagName('td')[1].innerText);
      
//	  X 버튼으로 삭제한 신발의 사이즈를 가지고있는 변수 220을 X했다면 220값을 가지고 있음
	  var deleteSizePk = document.getElementById(e.getAttribute('id')).parentNode.parentNode.getElementsByTagName('input')[0].value;
      console.log("sizepk["+deleteSizePk+"]");
      
//	  삭제한 SizePk를 가지고있는 버튼태그의 다음인 남은갯수를 나타내는 span태그 타겟
      var sizeButtonSpan = $('.sizeButton[value='+deleteSizePk+']').next();
//    console.log(sizeButtonSpan);

//	  sizeButtonSpan의 내용이 자동형변환 되지않고 String 타입 그대로 넘어와서 Int로 형변환 하여 +1함
	  var sizeButtonSpanUp = parseInt(sizeButtonSpan.html()) + 1;
	  console.log(parseInt(sizeButtonSpanUp)); 
	  
//	  +1 해준값을 다시 버튼의 남은갯수를 표시하는 Span태그 바디안의 내용에 대입
	  sizeButtonSpan.html(sizeButtonSpanUp);
	  
//	  +1 을 해준시점에서 Span태그의 바디 내용이 남은개수 : 1로 바뀌었다면 다시 버튼을 활성화 해주어야함
	  if(sizeButtonSpan.html() == 1){
		  // 버튼을 다시 활성화
		  $('.sizeButton[value='+deleteSizePk+']').prop('disabled', false);
	  }
      
//	  X버튼을 누른 구매목록을 삭제
      $("#shoesIndex"+index+"").remove();
//       console.log("콘솔로그"+$(".slist").html());
       
       
       // 제품목록을 삭제하여 모두 없앴을 경우 다시 텍스트 생성하여 출력
       if($(".slist").html() == ""){
         $('#slistText').show;
       }
      }
      
      // a태그를 payform으로 보내기
      function payform(){
        document.getElementById("payform").submit();
       };
   </script>

   <script type="text/javascript">
      function payform() {
         
    	 if($(".slist").html() == ""){
    		 alert("사이즈를 선택해주세요");
    		 return;
    	 }
    	 
         //값들의 갯수 -> 배열 길이를 지정
         var size = $("input[name=sizepk]").length;
         console.log(size);

         var sizes = new Array(size);
         console.log(sizes);

         for (var i = 0; i < size; i++) {
            sizes[i] = $("input[name=sizepk]").eq(i).val();
            console.log(sizes[i]);
         }         
                  
       $.ajax({
         type: 'POST',
         url: '${pageContext.request.contextPath}/insertB.do',
         data: {sizes:sizes},
         success: function(result){
            console.log("로그: ["+result+"]");
            if(result == 1){
               console.log("로그: 성공");
               document.getElementById("payform").submit();
            }
            else{
               console.log("로그: 실패");
            }
            
         },
         
         error: function(request, status, error){ // 요청 보낸 곳(서블릿)에서 에러가 발생할 시 실행
            console.log("code: "+request.status);
            console.log("message: "+request.responseText);
            console.log("error: "+error);
            console.log("ajax오류")
         }
         
      });

      }
   </script>
   
   <script type="text/javascript">
      function result() {
         
    	 // 유효성 검사
    	 if($(".slist").html() == ""){
     		 alert("사이즈를 선택해주세요");
     		 return;
     	 }
    	 
         //값들의 갯수 -> 배열 길이를 지정
         var size = $("input[name=sizepk]").length;
         console.log(size);

         var sizes = new Array(size);
         console.log(sizes);

         for (var i = 0; i < size; i++) {
            sizes[i] = $("input[name=sizepk]").eq(i).val();
            console.log(sizes[i]);
         }         
                  
       $.ajax({
         type: 'POST',
         url: '${pageContext.request.contextPath}/insertB.do',
         data: {sizes:sizes},
         success: function(result){
            console.log("로그: ["+result+"]");
            if(result == 1){
               console.log("로그: 성공");
               alert("장바구니에 저장되었습니다");
            }
            else{
               console.log("로그: 실패");
            }
            
         },
         
         error: function(request, status, error){ // 요청 보낸 곳(서블릿)에서 에러가 발생할 시 실행
            console.log("code: "+request.status);
            console.log("message: "+request.responseText);
            console.log("error: "+error);
            console.log("ajax오류")
         }
         
      });

      }
   </script>





   <!--================End Single Product Area =================-->

  <!--================Product Description Area =================-->
   <section class="product_description_area">
      <div class="container">
         <div class="tab-content" id="myTabContent">
         
           <c:forEach var="r" items="${rDatas }">
            <div class="tab-pane fade show active" id="review" role="tabpanel"
               aria-labelledby="review-tab">
               <div class="row">
                  <div class="col-lg-6">
                     <div class="review_list">
                        <div class="review_item">
                           <div class="media">
                              <div class="media-body">
                                 <h4>${r.mid }</h4>
                              </div>
                           </div>
                           <textarea name="content" class="form-control" readonly="readonly" style="width:100%; height:150px;background-color:white;border:none;resize: none;">${r.content }</textarea>
                           <br><br><hr>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-6">
                     <div class="review_box">
                     <img src="img/${r.reviewImg }" alt="${r.reviewImg }" style="width:200px">
                  </div>
               </div>
            </div>
         </div>
       </c:forEach>
         </div>
      </div>
   </section>
   <!--================End Product Description Area =================-->
   <br><br><br>

   <t:footer />

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