package com.ss.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.biz.address.AddressService;
import com.ss.biz.address.AddressVO;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService addressService;
	
	@RequestMapping(value="/insertA.do", method=RequestMethod.POST)  //배송지 추가
	public String insertAddress(AddressVO aVO) { //마이페이지에서 배송지를 추가한다구 가정
		addressService.insertAddress(aVO);
		return "myPage.do";	//배송지를 추가하면 마이페이지로 이동
	}
	
	@RequestMapping(value="/deleteA.do", method=RequestMethod.POST) //배송지 삭제
	public String deleteAddress(AddressVO aVO) {  //마이페이지에서 배송지를 삭제한다구 가정
		addressService.deleteAddress(aVO);
		return "myPage.do";
	}
	
	@RequestMapping(value="/selectAllA.do", method=RequestMethod.POST) //배송지 전체 보기
	public String name(AddressVO aVO, Model model) {	//마이페이지에서 모든 배송지 모여줄 때
		List<AddressVO> aDatas = addressService.selectAllAddress(aVO);
		model.addAttribute("aDatas", aDatas);
		return "myPage.do";
	}
}
