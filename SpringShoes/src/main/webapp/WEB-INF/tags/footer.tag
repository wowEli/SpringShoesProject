<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.fontWhite{
	color:white;
	}
	.sizeUp{
    display: inline-block;
    -webkit-transition: 0.5s;
    -moz-transition: 0.5s;
    -o-transition: 0.5s;
    -ms-transition: 0.5s;
    transition: 0.5s;
}

.sizeUp:hover {
    -webkit-transform: scale(2,2);
    -moz-transform: scale(2,2);
    -o-transform: scale(2,2);
    -ms-transform: scale(2,2);
    transform: scale(2,2);
}
a:hover{
color:white;
}
</style>

 <footer class="footer-area section_gap">
        <div class="container">
            <div class="row">
                <div class="col-lg-3  col-md-6 col-sm-6">
                    <div class="single-footer-widget">
                        <h6>메뉴</h6>
                        <a href="selectAllS.do" class="fontWhite sizeUp">HOME</a><br>
                        
                        <c:if test="${mid == null}">
                        <a href="login.jsp" class="fontWhite sizeUp">로그인</a><br>
                        <a href="signup.jsp" class="fontWhite sizeUp">회원가입</a><br>
                        </c:if>
                        
                        <c:if test="${mid != null }">
                        <a href="logout.do" class="fontWhite sizeUp">로그아웃</a><br>
                        <a href="selectOneM.do" class="fontWhite sizeUp">마이페이지</a><br>
                        </c:if>
                        
                        <a href="bucket.do?mid=${mid}" class="fontWhite sizeUp">장바구니</a><br>
                        
                    </div>
                </div>
                <div class="col-lg-4  col-md-6 col-sm-6">
                    <div class="single-footer-widget">
                        <h6>신발 검색</h6>

                           <form action="selectAllS.do">
							<input type="text" class="form-control" name="searchContent">
							<input type="submit" value="검색하기" style="background-color:gray;color:white">
							</form>
							
                    </div>
                </div>
                <div class="col-lg-3  col-md-6 col-sm-6">
                    <div class="single-footer-widget mail-chimp" >
                        <h6 class="mb-20">협업 브랜드</h6>
                        <ul class="instafeed d-flex flex-wrap">
                            <li><img src="img/brand1.png" alt=""></li>
                            <li><img src="img/brand2.png" alt=""></li>
                            <li><img src="img/brand3.png" alt=""></li>
                            <li><img src="img/brand4.png" alt=""></li>
                            <li><img src="img/brand5.png" alt=""></li>
                            <li><img src="img/brand6.png" alt=""></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 col-sm-6">
                    <div class="single-footer-widget" style="width:300px">
                        <h6>고객센터</h6>
                        <p>(주)개발의 민족</p>
                        <p>[ tel ] 010-1234-5678</p>
                        <p>[ e-mail ] developer@naver.com</p>
                        <p>[ Address ] 서울시 강남구 테헤란로 1004번길 82</p>
                        
                    </div>
                </div>
            </div>
        </div>
    </footer>
