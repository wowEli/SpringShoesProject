package com.ss.biz.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.biz.address.AddressService;
import com.ss.biz.address.AddressVO;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService addressService;
	
	@RequestMapping("/insertA.do")  //배송지 추가
	public String insertAddress(AddressVO aVO,HttpServletRequest request,HttpSession session) {
		
		aVO.setMid((String)session.getAttribute("mid"));
		aVO.setAddress(aVO.getAddress()+" "+request.getParameter("detailAddress"));
		addressService.insertAddress(aVO);
		return "pay.do"; // 배송지를 추가하고 결제페이지로 다시 이동
	}
	
	@RequestMapping("/deleteA.do") //배송지 삭제
	public String deleteAddress(AddressVO aVO,HttpServletRequest request) {
		addressService.deleteAddress(aVO);
		return "pay.do"; // 배송지를 삭제하고 결제페이지로 다시 이동
	}
}
