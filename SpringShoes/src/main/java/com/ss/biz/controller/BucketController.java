package com.ss.biz.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

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
   @RequestMapping("bucket.do")
   public String bucket(HttpSession session,Model model,ShoesSizeVO sVO, MemberVO mVO) {
      //세션에 저장되어있는 장바구니 불러오기
	  model.addAttribute("mData", memberService.selectOneMember(mVO)); // 회원정보 1개를 저장
      
	  // String 타입으로 sizepk 들이 저장되어 있음
      ArrayList<String> bDatas = (ArrayList<String>) session.getAttribute("bDatas");
      
      // 결과값을 저장할 신발 배열 생성
      ArrayList<ShoesVO> sDatas = new ArrayList<ShoesVO>();
      
      for(String b: bDatas) {
    	  sVO.setSizepk(Integer.parseInt(b)); // String 타입의 sizepk를 int로 변환하여 ShoesSizeVO에 setter
    	  ShoesVO vo = new ShoesVO();
    	  vo = shoesService.selectOneShoesBucket(sVO); // sizepk를 이용해서 selectOne
    	  System.out.println("장바구니 로그: ["+vo+"]");
    	  sDatas.add(vo); // 결과 값을 신발배열에 저장
      }
      
      model.addAttribute("sDatas", sDatas);
      
      return "bucket.jsp";
   }


   @SuppressWarnings("unchecked")
   @RequestMapping("deleteBucket.do")
   public String deleteBucket(HttpSession session,HttpServletRequest request) {
	ArrayList<ShoesVO> bucket = (ArrayList<ShoesVO>) session.getAttribute("bucket");
	String[] sColorpk = request.getParameterValues("colorpk"); //values를 사용하면 값 여러개 받아옴
	
	 for(int i=0; i<sColorpk.length; i++) {
         System.out.println(sColorpk[i]);
      } //사용자가 선택한 신발의 pk값들을 확인하는 로그
	 
	 Integer[] Colorpk=Stream.of(sColorpk).mapToInt(Integer::parseInt).boxed().toArray(Integer[]::new);
	 for(int i=0; i<bucket.size(); i++) {
		 for(int j=0; j<Colorpk.length; j++) {
			 if(bucket.get(i).getColorpk()==Colorpk[j]) {
				 bucket.remove(i);
			 }
		 }
	 }
	session.setAttribute("bucket", bucket);
	return "장바구니 출력 페이지 경로";
   }
 
   
   @ResponseBody
   @SuppressWarnings("unchecked")
   @RequestMapping("/insertBucket.do")
   public String insertBucket(@RequestParam(value="sizes[]") List<String> sizepkArray, HttpSession session) {
	   System.out.println("ajax들어옴");
	   
	   for(String s: sizepkArray) {
		   System.out.println("sizeArray로그: ["+s+"]");
	   }
	   
	   ArrayList<String> sizepkArray2 = (ArrayList<String>) session.getAttribute("bDatas");
	   sizepkArray2.addAll(sizepkArray);
	   session.setAttribute("bDatas", sizepkArray2);
	   
	   for(String s : sizepkArray2) {
		   System.out.println("세션에 저장된 sizeArray로그:["+s+"]");		   
	   }
	   
	   return "1";
   }
   
} 
