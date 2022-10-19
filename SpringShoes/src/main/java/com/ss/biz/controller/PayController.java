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
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/insertP.do") // 구매하기 (구매목록에 추가)
	public String insertPay(HttpSession session, HttpServletRequest request,MemberVO mVO, Model model) {
		
		model.addAttribute("resultPrice", session.getAttribute("resultPrice")); // 총 금액
	    model.addAttribute("finalPrice", session.getAttribute("finalPrice")); // 최종 금액
	    mVO.setTier(Integer.valueOf((String)session.getAttribute("finalPrice"))); // 결제 금액을 티어에 저장
	    session.removeAttribute("resultPrice"); // 위에서 모델에 저장해주고 세션에선 삭제
	    session.removeAttribute("finalPrice"); // 위에서 모델에 저장해주고 세션에선 삭제
		
	    mVO.setMid((String)session.getAttribute("mid"));
		model.addAttribute("mData", memberService.selectOneMember(mVO)); // 회원정보 1개를 저장
		
		memberService.updateTierMember(mVO); // 티어 정보 업데이트
		
		ArrayList<ShoesVO> sDatas = new ArrayList<ShoesVO>(); // 영수증페이지에서 보여줄 신발 데이터를 저장할 배열
		ShoesSizeVO sVO = new ShoesSizeVO();
		
		ArrayList<String> bDatas = (ArrayList<String>) session.getAttribute("bDatas"); // 현재 장바구니

		for(String p: (String [])session.getAttribute("payList")) { // 구매할 상품 개수 만큼 반복
			// 구매한 신발 정보를 영수증 페이지에 보여주기 위해 하나씩 배열에 저장
			sVO.setSizepk(Integer.parseInt(p)); // 세션에 저장되어 있는 sizepk들을 하나씩 꺼내서 set
			ShoesVO vo = new ShoesVO();
			vo = shoesService.selectOneShoesBucket(sVO); // sizepk에 해당하는 신발정보를 저장
			sDatas.add(vo); // 배열에 저장
			
			// 구매한 신발 정보를 구매목록에 하나씩 저장
			PayVO pVO = new PayVO();
			pVO.setMid((String)session.getAttribute("mid")); // 구매한 사용자 저장
			pVO.setAddress(request.getParameter("address")); // 배송지 저장
			pVO.setSizepk(Integer.parseInt(p)); // 구매할 신발의 sizepk를 저장
			payService.insertPay(pVO);	// 구매 목록에 추가
			shoesService.updateShoes(sVO); // 재고 -1
			
			// 구매한 신발은 장바구니에서 하나씩 제거
			for(int i=0;i<bDatas.size();i++) {
				if(bDatas.get(i).equals(p)) {
					bDatas.remove(i);
				}
			}
		}
		
		session.setAttribute("bDatas", bDatas); // 구매한 상품들은 삭제된 장바구니 목록을 다시 저장
		
		model.addAttribute("sDatas", sDatas);
		
		session.removeAttribute("resultPrice");
		session.removeAttribute("finalPrice");
		//구매하기가 성공하면 총금액,최종금액은 세션에 담을 필요가 없음으로 불필요한 데이터 삭제
		
		
		return "receipt.jsp"; 
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
	      
	      // 총 합계 금액 , 최종 금액 저장 로직
	      //새롭게 장바구니를 통해 결제페이지로 넘어올때 가격을 최신화해준다.
	      if(request.getParameter("resultPrice")!=null &&request.getParameter("finalPrice")!=null) {
	    	  session.setAttribute("resultPrice", request.getParameter("resultPrice"));
	    	  session.setAttribute("finalPrice", request.getParameter("finalPrice"));
	    	  // session에 저장한 이유는 배송지 추가, 삭제를 할 때 위 두 값을 유지시키기 위함
		      // 처음 요청을 받았을 떄 금액을 저장하면 이후에 다시 요청을 받아도 덮어씌어지지 않아 null값 방지
	      }
		 
		return "pay.jsp";
	}
	
}