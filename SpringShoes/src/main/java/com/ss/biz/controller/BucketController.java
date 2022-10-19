package com.ss.biz.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ss.biz.member.MemberService;
import com.ss.biz.member.MemberVO;
import com.ss.biz.shoes.ShoesService;
import com.ss.biz.shoes.ShoesSizeVO;
import com.ss.biz.shoes.ShoesVO;

@Controller
public class BucketController {
	
	@Autowired
	ShoesService shoesService;
	
	@Autowired
	MemberService memberService;
	

   @SuppressWarnings("unchecked")
   @RequestMapping("/bucket.do")
   public String bucket(HttpSession session,Model model, MemberVO mVO) {
	   model.addAttribute("mData", memberService.selectOneMember(mVO)); // 회원정보 1개를 저장
      
	   //세션에 장바구니가 있는지 확인하는 배열 생성
	   ArrayList<String> sessionTestArr = (ArrayList<String>) session.getAttribute("bDatas");
	   
	   // 만약 세션에서 불러온 장바구니가 Null이면 새로 세션에 저장
	   if(sessionTestArr==null) {
		   sessionTestArr = new ArrayList<String>();
		   session.setAttribute("bDatas", sessionTestArr);
	   }
	   
	  // String 타입으로 sizepk 들이 저장되어 있음
      ArrayList<String> bDatas = (ArrayList<String>) session.getAttribute("bDatas");
      
      // 결과 값을 저장할 신발 배열 생성
      ArrayList<ShoesVO> sDatas = new ArrayList<ShoesVO>();
      
      ShoesSizeVO sVO = new ShoesSizeVO();
      for(String b: bDatas) {
    	  sVO.setSizepk(Integer.parseInt(b)); // String 타입의 sizepk를 int로 변환하여 pk를 저장
    	  ShoesVO vo = new ShoesVO();
    	  vo = shoesService.selectOneShoesBucket(sVO); // sizepk를 이용해서 출력할 신발 정보를 저장
    	  sDatas.add(vo); // 결과 값을 신발배열에 저장
      }
      
      model.addAttribute("sDatas", sDatas);
      
      return "bucket.jsp";
   }


   @SuppressWarnings("unchecked")
   @RequestMapping("/deleteB.do")
   public String deleteBucket(HttpSession session,HttpServletRequest request) {
	   System.out.println("deleteB.do 요청을 받음");
	   
	ArrayList<String> bDatas = (ArrayList<String>) session.getAttribute("bDatas");
	
	String[] sizepkArr = request.getParameterValues("sizepk"); //values를 사용하면 값 여러개 받아옴
	
//	for(int i=0; i < sizepkArr.length;i++) {
//		System.out.println("장바구니삭제 로그: ["+sizepkArr[i]+"]");
//	}
	
	 for(int i=0; i<sizepkArr.length; i++) { // 장바구니 길이 만큼 반복
//		 System.out.println("for문 1 들어옴");
		 for(int j=0; j<bDatas.size(); j++) { // 사용자가 선택한 sizepk 수 만큼 반복
//			 System.out.println("for문 2 들어옴");
			 if(bDatas.get(j).equals(sizepkArr[j])) { // 장바구니의 sizepk가 사용자가 선택한 sizepk와 같다면
//				 System.out.println("if 삭제로직 들어옴 ["+bDatas.get(i)+"]");
				 bDatas.remove(j); // 장바구니에서 그 sizepk를 제거
				break;
			 }
		 }
	 }
	 
	session.setAttribute("bDatas", bDatas); // 제거가 완료된 장바구니를 다시 저장
	return "bucket.do?mid="+session.getAttribute("mid"); 
	
	// forword를 할 때 왜 400오류가 나오는지?
	// bucket.do로 forword 방식 이용시 뷰에서 보내준 sizepk값들이 가는데 이 값이 하나일 경우에는 자동매핑이 성공적이여서 수행되지만
	// 두개 이상일 경우 자동매핑이 안되서 400에러가 발생
   }
 
   
   @ResponseBody
   @SuppressWarnings("unchecked")
   @RequestMapping("/insertB.do")
   public String insertBucket(@RequestParam(value="sizes[]") List<String> sizepkArray, HttpSession session) {
	   System.out.println("ajax들어옴");
	   
	   //세션에 장바구니가 있는지 확인하는 배열 생성
	   ArrayList<String> sessionTestArr = (ArrayList<String>) session.getAttribute("bDatas");
	   
	   //만약 세션에서 불러온 장바구니가 Null이면 새로 세션에 저장하고 insert 진행
	   if(sessionTestArr==null) {
		   sessionTestArr = new ArrayList<String>();
		   session.setAttribute("bDatas", sessionTestArr);
	   }
//	   로그
	   for(String s: sizepkArray) {
		   System.out.println("sizeArray로그: ["+s+"]");
	   }
	   
	   ArrayList<String> sizepkArray2 = (ArrayList<String>) session.getAttribute("bDatas");
	   sizepkArray2.addAll(sizepkArray);
	   session.setAttribute("bDatas", sizepkArray2);
	   
//	   로그
	   for(String s : sizepkArray2) {
		   System.out.println("세션에 저장된 sizeArray로그:["+s+"]");		   
	   }
	   
	   return "1";
   }
   
} 
