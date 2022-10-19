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
    <style>
	#preview{
		width:100px;
		height:100px;
	}
	</style>
    <title>후기 수정</title>

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

<body>

  <t:header/>
	<t:banner/>

    <!--================Tracking Box Area =================-->
    <section class="tracking_box_area section_gap">
        <div class="container">
            <div class="tracking_box_inner">
               <h1>후기 수정</h1>
                <form  action="updateR.do" method="post" enctype="multipart/form-data">
                <input type="hidden" name="rpk" value="${rData.rpk }">
                <input type="hidden" name="reviewImg" value="${rData.reviewImg}">
 <textarea  name="content" class="form-control" style="width:100%; height:300px">${rData.content }
</textarea>
                        
                    <img id="preview" alt="" src="img/${rData.reviewImg}"> 
                    
                    <input type="file" id="preview" name="uploadFile" onchange="loadFile(this)">
                    
                    <br><br>
                    
                    
                    <br>
                    <div class="col-md-12 form-group">
                        <input type="submit" value="후기 수정" class="genric-btn primary e-large" style="background:black; font-size:20px">
                    </div>
                    
                </form>
            </div>
        </div>
    </section>
    <!--================End Tracking Box Area =================-->

   <t:footer/>
<script type="text/javascript">
   function loadFile(input){
      // 여러개의 이미지를 읽을수도 있기 때문에 
      if(input.files && input.files[0]){
         var fr = new FileReader();
         //파일리더로 일고 읽는게 완료되면  만들어준 아이디에 속성값을 지정하여 사용하겠다.
         fr.onload=function(event){
            document.getElementById('preview').src=event.target.result;
         };
         fr.readAsDataURL(input.files[0]);
         // 이미지파일을 읽어 온다.
      }
      else{
         document.getElementById('preview').src="";
      }
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