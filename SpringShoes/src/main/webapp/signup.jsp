<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<!DOCTYPE html>
<html>

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
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/nouislider.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/main.css">
    <style type="text/css">
    .billing_details .contact_form .form-group input{
    	border-radius: 8px;
    	color: black;
    }
    .billing_details .contact_form .form-group input.ss:hover{
    	color:white;
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
    span{
    	color: black;
    	font-size: 15px;
    }
    label{
    	display : block;
    }
    </style>
</head>

<body>
	
    <t:header/>
    <t:banner/>

    <!--================Checkout Area =================-->   
    
    <section class="checkout_area section_gap">
    	<form class="row contact_form" action="insertM.do" id="signup" method="post">
    	<div class="container">
    		<div class="billing_details">
    			 <div class="row">
    				<div class="col-lg-8" style="background-color:#E6E6E6;">
    					<div class="sidebar-categories">
    					<div class="head" style="background-color:black;">이용약관 동의</div>
    					<br>
    					</div>
    						<label for="agree_all">
  								<input type="checkbox" name="agree_all" id="agree_all">
  									<span>모두 동의합니다</span>
							</label>
							<label for="agree">
 								 <input type="checkbox" name="agree" id="newCheck1">
 									 <span>이용약관 동의<strong>(필수)</strong></span>
							</label>
							<label for="agree">
  								<input type="checkbox" name="agree" id="newCheck2">
  									<span>개인정보 수집, 이용 동의<strong>(필수)</strong></span>
							</label>
							<label for="agree">
  								<input type="checkbox" name="agree" id="newCheck3">
  									<span>개인정보 이용 동의<strong>(필수)</strong></span>
							</label>
							<label for="agree">
 								<input type="checkbox" name="agree" value="4">
  									<span>이벤트, 혜택정보 수신동의<strong class="select_disable">(선택)</strong></span>
							</label>	
							<br>
							
    				</div>
    			</div>
    		</div>
    	</div>
    	
    	<br>
    	<br>
    	<br>
    	<br>
    
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-8" style="background-color:#E6E6E6;">
                    	<div class="sidebar-categories">
                    	<div class="head" style="background-color:black;">계정정보 입력</div>
                    	</div>
                        
                            <div class="col-md-7 form-group p_star">
							<br><br>
                            	<span>아이디</span>
                                <input type="email" class="form-control" id="mid" name="mid" onchange="idCheck()" placeholder="사용하실 아이디를 입력해 주세요">
                           	<br>
                           	<div id="result"></div>
                            </div>
                            <div class="col-md-7 form-group p_star">
                            	<span>비밀번호</span>
                                <input type="password" class="form-control" id="mpw" name="mpw" placeholder="사용하실 비밀번호를 입력해 주세요">
                            </div>
                            <div class="col-md-7 form-group p_star">
                            	<br>
                            	<span>비밀번호 재입력</span>
                                <input type="password" class="form-control" id="mpw2" onchange="pwCheck()" placeholder="비밀번호를 재 입력해 주세요">
                               <div id="result2"></div>
                         	<br><br>
                            </div>
                            <div class="col-lg-12">
                        	<div class="sidebar-categories">
                    		<div class="head" style="background-color:black;">개인정보 입력</div>
                    		</div>
                            </div>
                            <div class="col-md-4 form-group p_star">
                            <br><br>
                            	<span>이름</span>
                                <input type="text" class="form-control" id="mname" name="mname" placeholder="이름을 입력해 주세요">
                            </div>
                            <br>
                            <div class="col-md-2 form-group p_star">
                            <br>
                            	<span>전화번호</span>
                                <input type="text" class="form-control" value="  010" readonly>
                            </div>
                            <div class="col-md-4 form-group p_star">
                            	<br><br>
                                <input type="text" class="form-control" id="mphone" name="mphone" placeholder="ex)12345678">
                            </div>
                            <br><br>
                            <div class="col-md-4 form-group p_star">
                            	<span>신발 사이즈</span>
                            <br>
                                <select class="country_select" name="shoesSize">
                                    <option value="220">220</option>
                                    <option value="230">230</option>
                                    <option value="240">240</option>
                                    <option value="250">250</option>
                                    <option value="260">260</option>
                                    <option value="270">270</option>
                                    <option value="280">280</option>
                                </select>
                            </div>
                            <div class="col-md-8 form-group p_star"></div>
                            <div class="col-md-7 form-group p_star">
                            <br>
                            	<span>주소</span>
                                <input type="text" class="form-control" id="sample2_address" name="maddress">
                            </div>
                            <div class="col-md-4 form-group p_star">
                                <br><br>
                                <input type="button" onclick="sample2_execDaumPostcode()" class="genric-btn primary-border radius ss" value="주소 찾기">
                            </div>
                            <div class="col-md-7 form-group p_star">
                            	<span>상세주소</span>
                                <input type="text" class="form-control" id="sample2_detailAddress" name="detailAddress">
                            </div>
                            <div class="col-md-7 form-group p_star">
                            <br>
                            	<input type="submit" class="genric-btn primary-border e-large ss" value="회원가입">
                            </div>
                        
                    </div>
                </div>
            </div>
        </div>
        </form>
    </section>
    
    <!-- 주소찾기 레이어 -->
    <div id="layer"
		style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
		
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
			id="btnCloseLayer"
			style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
			onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
    <!--================End Checkout Area =================-->

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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


//이용 약관
const agreeChkAll = document.querySelector('input[name=agree_all]');
agreeChkAll.addEventListener('change', (event) => { let agreeChk = document.querySelectorAll('input[name=agree]');
//모두동의 체크박스(agree_all)를 체크하면 change 이벤트가 발생 => name값이 agree인 모든 데이터를 찾아 속성값을 전체 선택된 true값으로 변경
for(let i = 0; i < agreeChk.length; i++){
  agreeChk[i].checked = event.target.checked; 
	}
});


//아이디 중복검사
function idCheck(){
	var check = $("#mid").val();
	console.log("ajax들어옴" +check);
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/idCheck.do',
		data:{check:check},
		success: function(result){
			console.log("로그: ["+result+"]")
			if(result == 1){
				$("#result").text("중복되지 않은 아이디 입니다!");
				$("#result").css("color","blue");						
			}
			else{
				$("#result").text("중복된 아이디가 존재합니다...");
				$("#result").css("color","red");
			}
			
		},
		
		error: function(request, status, error){
			console.log("code: "+request.status);
			console.log("message: "+request.responseText);
			console.log("error: "+error);
		}
	});
}
</script>

<script type="text/javascript">
//비밀번호, 비밀번호 확인 검사
function pwCheck(){
	var check1 = $("#mpw").val();
	var check2 = $("#mpw2").val();
	console.log("ajax들어옴" +check1+","+check2);
	$.ajax({
		type: 'POST',
		url: '${pageContext.request.contextPath}/pwCheck.do',
		data:{check1:check1,check2:check2},
		success: function(result2){
			console.log("로그: ["+result2+"]")
			if(result2 == 1){
				$("#result2").text("비밀번호 일치!");
				$("#result2").css("color","blue");						
			}
			else{
				$("#result2").text("입력하신 비밀번호와 일치하지 않습니다. 확인 후 다시 입력해주세요");
				$("#result2").css("color","red");
			}
			
		},
		
		error: function(request, status, error){
			console.log("code: "+request.status);
			console.log("message: "+request.responseText);
			console.log("error: "+error);
		}
	});
}
</script>

<script type="text/javascript">

var form=document.forms['signup'];

form.onsubmit=function(){
	
	var pwd = document.getElementById("mpw");
	var check = document.getElementById("mpw2");
	const is_newCheck1 = document.getElementById("newCheck1").checked;
	const is_newCheck2 = document.getElementById("newCheck2").checked;
	const is_newCheck3 = document.getElementById("newCheck3").checked;

	
	if(is_newCheck1==false||is_newCheck2==false||is_newCheck3==false){
		alert("이용약관(필수)에 모두 동의해주세요")
		return false;
	}
	
	if (document.getElementById("mid").value == "") {
		alert("아이디를 입력하세요.");
		return false;
	}
	
	if (pwd.value== "" ) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if(pwd.value.length<8){
		alert("비밀번호를 8자리 이상 입력하세요")
		return false;
	}
	
	if (pwd.value != check.value) {
		alert("비밀번호 불일치");
		return false;
	}
	if (document.getElementById("mname").value == "") {
		alert("이름을 입력하세요.");
		return false;
	}
	if (document.getElementById("mphone").value == "") {
		alert("휴대폰 번호를 입력하세요.");
		return false;
	}
	if(document.getElementById("sample2_address").value == ""){
		alert("주소를 입력해 주세요");
		return false;
	}

	if(pwd.value != check.value){
		alert("비밀번호와 재입력이 다릅니다")
		return false;
	}
}



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
                document.getElementById("sample2_detailAddress").focus();

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
    
    function initLayerPosition(){ // 홍준 : 레이어를 화면가운데에 보여주기위한 메서드
    	
    	// 홍준 : 레이어드의 크기설정
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 홍준 : 레이어드를 가운데에 고정하여 보여주기위한 width, height, left, top 설정
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