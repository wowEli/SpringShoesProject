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
<title>Karma Shop</title>
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
                              <button class="sizeButton" value="${size.sizepk}"
                                 style="margin: 5px;">${size.size}</button>
                              <span style="color: grey;">남은 갯수:${size.cnt }</span>
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
                        $(".modal").fadeOut();
                        
                        // 제품이 있을경우에만
                        $("#slistText").remove();

                        var $tr = $("<tr id="+"shoesIndex"+shoesIndex+">", {});
                        var $td1 = $("<td style='text-align: center;'><h6>${sData.shoesName }</h6></td>");
                        var $td2 = $("<td><h6>" + $(this).html() + "</h6></td>");
                        var $td3 = $("<input type='hidden' value='"+ $(this).val() + "' name='sizepk'>)");
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
      console.log(document.getElementById(e.getAttribute('id')).getAttribute('data-value'));
       var index = document.getElementById(e.getAttribute('id')).getAttribute('data-value');
       
       $("#shoesIndex"+index+"").remove();
       
//        console.log("콘솔로그"+$(".slist").html());
       
       // 제품목록을 삭제하여 모두 없앴을 경우 다시 텍스트 생성하여 출력
       if($(".slist").html() == ""){
          var html = "<span id='slistText'>사이즈를 선택하여 제품을 담아주세요</span>"
         $('#slistTextbox').append(html);
       }
      }
      
      // a태그를 payform으로 보내기
      function payform(){
        document.getElementById("payform").submit();
       };
   </script>

   <script type="text/javascript">
      function payform() {
         
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

  <%--  <!--================Product Description Area =================-->
   <section class="product_description_area">
      <div class="container">
         <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item"><a class="nav-link" id="home-tab"
               data-toggle="tab" href="#home" role="tab" aria-controls="home"
               aria-selected="true">Description</a></li>
            <li class="nav-item"><a class="nav-link" id="profile-tab"
               data-toggle="tab" href="#profile" role="tab"
               aria-controls="profile" aria-selected="false">Specification</a></li>
            <li class="nav-item"><a class="nav-link" id="contact-tab"
               data-toggle="tab" href="#contact" role="tab"
               aria-controls="contact" aria-selected="false">Comments</a></li>
            <li class="nav-item"><a class="nav-link active" id="review-tab"
               data-toggle="tab" href="#review" role="tab" aria-controls="review"
               aria-selected="false">Reviews</a></li>
         </ul>
         <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade" id="home" role="tabpanel"
               aria-labelledby="home-tab">
               <p>Beryl Cook is one of Britain’s most talented and amusing
                  artists .Beryl’s pictures feature women of all shapes and sizes
                  enjoying themselves .Born between the two world wars, Beryl Cook
                  eventually left Kendrick School in Reading at the age of 15, where
                  she went to secretarial school and then into an insurance office.
                  After moving to London and then Hampton, she eventually married
                  her next door neighbour from Reading, John Cook. He was an officer
                  in the Merchant Navy and after he left the sea in 1956, they
                  bought a pub for a year before John took a job in Southern
                  Rhodesia with a motor company. Beryl bought their young son a box
                  of watercolours, and when showing him how to use it, she decided
                  that she herself quite enjoyed painting. John subsequently bought
                  her a child’s painting set for her birthday and it was with this
                  that she produced her first significant work, a half-length
                  portrait of a dark-skinned lady with a vacant expression and large
                  drooping breasts. It was aptly named ‘Hangover’ by Beryl’s husband
                  and</p>
               <p>It is often frustrating to attempt to plan meals that are
                  designed for one. Despite this fact, we are seeing more and more
                  recipe books and Internet websites that are dedicated to the act
                  of cooking for one. Divorce and the death of spouses or grown
                  children leaving for college are all reasons that someone
                  accustomed to cooking for more than one would suddenly need to
                  learn how to adjust all the cooking practices utilized before into
                  a streamlined plan of cooking that is more efficient for one
                  person creating less</p>
            </div>
            <div class="tab-pane fade" id="profile" role="tabpanel"
               aria-labelledby="profile-tab">
               <div class="table-responsive">
                  <table class="table">
                     <tbody>
                        <tr>
                           <td>
                              <h5>Width</h5>
                           </td>
                           <td>
                              <h5>128mm</h5>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <h5>Height</h5>
                           </td>
                           <td>
                              <h5>508mm</h5>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <h5>Depth</h5>
                           </td>
                           <td>
                              <h5>85mm</h5>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <h5>Weight</h5>
                           </td>
                           <td>
                              <h5>52gm</h5>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <h5>Quality checking</h5>
                           </td>
                           <td>
                              <h5>yes</h5>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <h5>Freshness Duration</h5>
                           </td>
                           <td>
                              <h5>03days</h5>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <h5>When packeting</h5>
                           </td>
                           <td>
                              <h5>Without touch of hand</h5>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <h5>Each Box contains</h5>
                           </td>
                           <td>
                              <h5>60pcs</h5>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
            <div class="tab-pane fade" id="contact" role="tabpanel"
               aria-labelledby="contact-tab">
               <div class="row">
                  <div class="col-lg-6">
                     <div class="comment_list">
                        <div class="review_item">
                           <div class="media">
                              <div class="d-flex">
                                 <img src="img/product/review-1.png" alt="">
                              </div>
                              <div class="media-body">
                                 <h4>Blake Ruiz</h4>
                                 <h5>12th Feb, 2018 at 05:56 pm</h5>
                                 <a class="reply_btn" href="#">Reply</a>
                              </div>
                           </div>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                              elit, sed do eiusmod tempor incididunt ut labore et dolore
                              magna aliqua. Ut enim ad minim veniam, quis nostrud
                              exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
                        </div>
                        <div class="review_item reply">
                           <div class="media">
                              <div class="d-flex">
                                 <img src="img/product/review-2.png" alt="">
                              </div>
                              <div class="media-body">
                                 <h4>Blake Ruiz</h4>
                                 <h5>12th Feb, 2018 at 05:56 pm</h5>
                                 <a class="reply_btn" href="#">Reply</a>
                              </div>
                           </div>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                              elit, sed do eiusmod tempor incididunt ut labore et dolore
                              magna aliqua. Ut enim ad minim veniam, quis nostrud
                              exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
                        </div>
                        <div class="review_item">
                           <div class="media">
                              <div class="d-flex">
                                 <img src="img/product/review-3.png" alt="">
                              </div>
                              <div class="media-body">
                                 <h4>Blake Ruiz</h4>
                                 <h5>12th Feb, 2018 at 05:56 pm</h5>
                                 <a class="reply_btn" href="#">Reply</a>
                              </div>
                           </div>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                              elit, sed do eiusmod tempor incididunt ut labore et dolore
                              magna aliqua. Ut enim ad minim veniam, quis nostrud
                              exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-6">
                     <div class="review_box">
                        <h4>Post a comment</h4>
                        <form class="row contact_form" action="contact_process.php"
                           method="post" id="contactForm" novalidate="novalidate">
                           <div class="col-md-12">
                              <div class="form-group">
                                 <input type="text" class="form-control" id="name" name="name"
                                    placeholder="Your Full name">
                              </div>
                           </div>
                           <div class="col-md-12">
                              <div class="form-group">
                                 <input type="email" class="form-control" id="email"
                                    name="email" placeholder="Email Address">
                              </div>
                           </div>
                           <div class="col-md-12">
                              <div class="form-group">
                                 <input type="text" class="form-control" id="number"
                                    name="number" placeholder="Phone Number">
                              </div>
                           </div>
                           <div class="col-md-12">
                              <div class="form-group">
                                 <textarea class="form-control" name="message" id="message"
                                    rows="1" placeholder="Message"></textarea>
                              </div>
                           </div>
                           <div class="col-md-12 text-right">
                              <button type="submit" value="submit" class="btn primary-btn">Submit
                                 Now</button>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
            <div class="tab-pane fade show active" id="review" role="tabpanel"
               aria-labelledby="review-tab">
               <div class="row">
                  <div class="col-lg-6">
                     <div class="row total_rate">
                        <div class="col-6">
                           <div class="box_total">
                              <h5>Overall</h5>
                              <h4>4.0</h4>
                              <h6>(03 Reviews)</h6>
                           </div>
                        </div>
                        <div class="col-6">
                           <div class="rating_list">
                              <h3>Based on 3 Reviews</h3>
                              <ul class="list">
                                 <li><a href="#">5 Star <i class="fa fa-star"></i><i
                                       class="fa fa-star"></i><i class="fa fa-star"></i><i
                                       class="fa fa-star"></i><i class="fa fa-star"></i> 01
                                 </a></li>
                                 <li><a href="#">4 Star <i class="fa fa-star"></i><i
                                       class="fa fa-star"></i><i class="fa fa-star"></i><i
                                       class="fa fa-star"></i><i class="fa fa-star"></i> 01
                                 </a></li>
                                 <li><a href="#">3 Star <i class="fa fa-star"></i><i
                                       class="fa fa-star"></i><i class="fa fa-star"></i><i
                                       class="fa fa-star"></i><i class="fa fa-star"></i> 01
                                 </a></li>
                                 <li><a href="#">2 Star <i class="fa fa-star"></i><i
                                       class="fa fa-star"></i><i class="fa fa-star"></i><i
                                       class="fa fa-star"></i><i class="fa fa-star"></i> 01
                                 </a></li>
                                 <li><a href="#">1 Star <i class="fa fa-star"></i><i
                                       class="fa fa-star"></i><i class="fa fa-star"></i><i
                                       class="fa fa-star"></i><i class="fa fa-star"></i> 01
                                 </a></li>
                              </ul>
                           </div>
                        </div>
                     </div>
                     <div class="review_list">
                        <div class="review_item">
                           <div class="media">
                              <div class="d-flex">
                                 <img src="img/product/review-1.png" alt="">
                              </div>
                              <div class="media-body">
                                 <h4>Blake Ruiz</h4>
                                 <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                    class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                    class="fa fa-star"></i>
                              </div>
                           </div>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                              elit, sed do eiusmod tempor incididunt ut labore et dolore
                              magna aliqua. Ut enim ad minim veniam, quis nostrud
                              exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
                        </div>
                        <div class="review_item">
                           <div class="media">
                              <div class="d-flex">
                                 <img src="img/product/review-2.png" alt="">
                              </div>
                              <div class="media-body">
                                 <h4>Blake Ruiz</h4>
                                 <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                    class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                    class="fa fa-star"></i>
                              </div>
                           </div>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                              elit, sed do eiusmod tempor incididunt ut labore et dolore
                              magna aliqua. Ut enim ad minim veniam, quis nostrud
                              exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
                        </div>
                        <div class="review_item">
                           <div class="media">
                              <div class="d-flex">
                                 <img src="img/product/review-3.png" alt="">
                              </div>
                              <div class="media-body">
                                 <h4>Blake Ruiz</h4>
                                 <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                    class="fa fa-star"></i> <i class="fa fa-star"></i> <i
                                    class="fa fa-star"></i>
                              </div>
                           </div>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing
                              elit, sed do eiusmod tempor incididunt ut labore et dolore
                              magna aliqua. Ut enim ad minim veniam, quis nostrud
                              exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-6">
                     <div class="review_box">
                        <h4>Add a Review</h4>
                        <p>Your Rating:</p>
                        <ul class="list">
                           <li><a href="#"><i class="fa fa-star"></i></a></li>
                           <li><a href="#"><i class="fa fa-star"></i></a></li>
                           <li><a href="#"><i class="fa fa-star"></i></a></li>
                           <li><a href="#"><i class="fa fa-star"></i></a></li>
                           <li><a href="#"><i class="fa fa-star"></i></a></li>
                        </ul>
                        <p>Outstanding</p>
                        <form class="row contact_form" action="contact_process.php"
                           method="post" id="contactForm" novalidate="novalidate">
                           <div class="col-md-12">
                              <div class="form-group">
                                 <input type="text" class="form-control" id="name" name="name"
                                    placeholder="Your Full name" onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = 'Your Full name'">
                              </div>
                           </div>
                           <div class="col-md-12">
                              <div class="form-group">
                                 <input type="email" class="form-control" id="email"
                                    name="email" placeholder="Email Address"
                                    onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = 'Email Address'">
                              </div>
                           </div>
                           <div class="col-md-12">
                              <div class="form-group">
                                 <input type="text" class="form-control" id="number"
                                    name="number" placeholder="Phone Number"
                                    onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = 'Phone Number'">
                              </div>
                           </div>
                           <div class="col-md-12">
                              <div class="form-group">
                                 <textarea class="form-control" name="message" id="message"
                                    rows="1" placeholder="Review"
                                    onfocus="this.placeholder = ''"
                                    onblur="this.placeholder = 'Review'"></textarea>
                                 </textarea>
                              </div>
                           </div>
                           <div class="col-md-12 text-right">
                              <button type="submit" value="submit" class="primary-btn">Submit
                                 Now</button>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--================End Product Description Area =================--> --%>
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