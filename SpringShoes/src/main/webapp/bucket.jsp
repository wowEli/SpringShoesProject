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
            
            
               <form action="deleteB.do?mid=${mid }">
               <table class="table">
                  <thead>
                  <label><input type='checkbox' name='selectall' value='selectall' onclick="selectAll(this); checkSelectAll();"/>Select All</label>
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
                           <td><input type="checkbox" name="sizepk" id="my_checkbox" onclick="is_checked(event); checkSelectAll();"
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
                  
                  <c:if test="${mData !=null}">
                  
                  <tr class="out_button_area">
                        <td>
                           <h5>내 등급</h5>
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
                        	<h1 id="finalPrice">0</h1>
                        </td>
                        <td></td>
                        <td></td>
                  </tr>
                  </c:if>
                  
                  <tr class="out_button_area">
                        <td>
                           
                           		<c:if test="${mData !=null }">
                           			<input type="submit"  class="genric-btn primary-border login" value="선택 삭제 ">
                           		</c:if>
                           		<c:if test="${mData ==null }">
                           			<a class="genric-btn primary-border login" href="login.do">로그인 후 구매하기</a>
                           		</c:if>
                           
                          
                        </td>
                        <td>
                        	<c:if test="${mData !=null }">
                          	 	<input type="button" class="genric-btn primary-border login"  value="구매하기" onclick="return payLocation(this.form)">
                       		</c:if>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                  </tr>
                     
                  </tbody>
               </table>
            </form>
            </div>
         </div>
      </div>



   <script type="text/javascript">
         var sum =0;
         var discount=0;
         function payLocation(frm){
            frm.action="pay.do";
            frm.submit();
            return true;
            
         }
         function checkSelectAll()  {
              // 전체 체크박스
              const checkboxes = document.querySelectorAll('input[name="sizepk"]');
              // 선택된 체크박스
              const checked  = document.querySelectorAll('input[name="sizepk"]:checked');
              // select all 체크박스
              const selectAll  = document.querySelector('input[name="selectall"]');
              
              if(checkboxes.length == checked.length)  {
                selectAll.checked = true;
              }else {
                selectAll.checked = false;
              }

            }

           function selectAll(selectAll)  {
              const checkboxes = document.getElementsByName('sizepk');
              
              checkboxes.forEach((checkbox) => {
                   
                 if(selectAll.checked==true){
                      if(checkbox.checked==false){
                      var parent=checkbox.parentNode;
                      
                      var grandparent=parent.parentNode;

                      var lastch=grandparent.childNodes;

                      var price=lastch[11].childNodes;

                      var pt=price[1];

                      sum+=parseInt(pt.innerText);


                      checkbox.checked = selectAll.checked;
                   }
                 }
                   else if(selectAll.checked==false){

                      if(checkbox.checked==true){
                         checkbox.checked = selectAll.checked;
                      }

                      sum=0;
                      
                   }
                      
                
                 })
              
             document.getElementById("resultPrice").innerHTML=sum;
             
              discount = document.getElementsByName("discount");
              
              
              discount = parseFloat(discount[0].value);
              
//               console.log(sum * discount);
              
              document.getElementById("finalPrice").innerHTML=sum * discount;
              
            }
            
      
         
         
         function is_checked(event){
            
            if(event.target.checked){
               
               var parent=event.target.parentNode;
//                console.log(parent);
               
               var grandparent=parent.parentNode;
//                console.log(grandparent);
               
               var lastch=grandparent.childNodes;
               
//                console.log(lastch);
//                console.log(lastch[11]);

               var price=lastch[11].childNodes;
               
//                console.log(price); 

               var pt=price[1];
               console.log(parseInt(pt.innerText)); 
               sum+=parseInt(pt.innerText)
               
               document.getElementById("resultPrice").innerHTML=sum;
               
               discount = document.getElementsByName("discount");
               
               
               discount = parseFloat(discount[0].value);
               console.log(sum * discount);
               document.getElementById("finalPrice").innerHTML=sum * discount;
                

            }
            if(event.target.checked==false){
               var parent=event.target.parentNode;
//                console.log(parent);
               
               var grandparent=parent.parentNode;
//                console.log(grandparent);
               
               var lastch=grandparent.childNodes;
//                console.log(lastch);
               console.log(lastch[11]);
               var price=lastch[11].childNodes;
               console.log(price); 
               var pt=price[1];
               console.log(parseInt(pt.innerText)); 
               sum-=parseInt(pt.innerText)
               
 			   document.getElementById("resultPrice").innerHTML=sum;
               
               discount = document.getElementsByName("discount");
               
               
               discount = parseFloat(discount[0].value);
               console.log(sum * discount);
               document.getElementById("finalPrice").innerHTML=sum * discount;
                
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