package com.ss.biz.controller;

import java.util.ArrayList;
import java.util.List;

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
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/pay.do")
	public String insertAddress(HttpSession session, MemberVO mVO, AddressVO aVO,Model model ) {
		
		//주소 목록을 불러오기 위한 로직
		  aVO.setMid((String)session.getAttribute("mid"));
	      List<AddressVO> aDatas = addressSevice.selectAllAddress(aVO);
	      model.addAttribute("aDatas",aDatas);
	     //아래는 버킷.jsp 상품 불러오기와 동일
		  model.addAttribute("mData", memberService.selectOneMember(mVO)); // 회원정보 1개를 저장
	      
	      ArrayList<String> bDatas = (ArrayList<String>) session.getAttribute("bDatas");
	      ArrayList<ShoesVO> sDatas = new ArrayList<ShoesVO>();
	     
	      ShoesSizeVO sVO = new ShoesSizeVO();
	      
	      for(String b: bDatas) {
	    	  sVO.setSizepk(Integer.parseInt(b));
	    	  ShoesVO vo = new ShoesVO();
	    	  vo = shoesService.selectOneShoesBucket(sVO);
	    	  System.out.println("장바구니 로그: ["+vo+"]");
	    	  sDatas.add(vo);
	      }
	      model.addAttribute("sDatas", sDatas);
		 
		return "pay.jsp";
	}
	
}