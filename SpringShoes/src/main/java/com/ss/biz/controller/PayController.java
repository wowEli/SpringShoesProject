package com.ss.biz.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.biz.address.AddressService;
import com.ss.biz.address.AddressVO;
import com.ss.biz.member.MemberService;
import com.ss.biz.member.MemberVO;
import com.ss.biz.pay.PayService;
import com.ss.biz.pay.PayVO;
import com.ss.biz.shoes.ShoesService;
import com.ss.biz.shoes.ShoesSizeVO;
import com.ss.biz.shoes.ShoesVO;


@Controller
public class PayController {
	
	@Autowired
	ShoesService shoesService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	PayService payService;
	
	@Autowired
	AddressService addressSevice;
	
	@RequestMapping("/insertP.do")		//구매하기-> 재고-1
	public String insertPay(ShoesVO sVO, ShoesSizeVO ssVO , PayVO pVO, Model model) {
		payService.insertPay(pVO);	//구매 목록에 추가
		shoesService.updateShoes(ssVO); // 재고 -1
		
		List<PayVO> pDatas = payService.selectAllPay(pVO);
		model.addAttribute("pDatas", pDatas);
		
		return "영수증 페이지"; 
	}
	
	@RequestMapping("/pay.do")
	public String pay(HttpSession session, HttpServletRequest request, MemberVO mVO, AddressVO aVO,Model model ) {
		
		  //주소 목록을 불러오기 위한 로직
		  aVO.setMid((String)session.getAttribute("mid"));
	      List<AddressVO> aDatas = addressSevice.selectAllAddress(aVO);
	      model.addAttribute("aDatas",aDatas);
	      
	      mVO.setMid((String)session.getAttribute("mid"));
		  model.addAttribute("mData", memberService.selectOneMember(mVO)); // 회원정보 1개를 저장
	      
	      ArrayList<ShoesVO> sDatas = new ArrayList<ShoesVO>(); // 결제페이지에서 보열줄 신발 데이터를 저장할 배열
	      
	      if(request.getParameterValues("sizepk") != null) { // sizepk가 null이 아닐 때만 session에 저장하기
	    	  session.setAttribute("payList", request.getParameterValues("sizepk"));// 장바구니에서 구매를 선택한 sizepk들을 session에 저장
	      }
	      // 세션에 저장하는 이유는 배송지를 삭제하거나 추가하고 다시 pay.do로 왔을 때 sizepk가 null이 되서 구매할 신발정보를 못가져옴
	      // 기존에 저장했던 sizepk들을 세션을 통해 유지함으로써 문제해결
	      
	      ShoesSizeVO sVO = new ShoesSizeVO();
	      
	      for(String b: (String [])session.getAttribute("payList")) {
	    	  sVO.setSizepk(Integer.parseInt(b)); // 세션에 저장되어 있는 sizepk들을 하나씩 꺼내서 set
	    	  ShoesVO vo = new ShoesVO();
	    	  vo = shoesService.selectOneShoesBucket(sVO); // sizepk에 해당하는 신발정보를 저장
	    	  System.out.println("장바구니 로그: ["+vo+"]");
	    	  sDatas.add(vo); // 배열에 저장
	      }
	      
	      model.addAttribute("sDatas", sDatas);
		 
		return "pay.jsp";
	}
	
}