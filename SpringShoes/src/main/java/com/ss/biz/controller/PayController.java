package com.ss.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.ss.biz.pay.PayService;
import com.ss.biz.pay.PayVO;
import com.ss.biz.pay.impl.PayDAO;
import com.ss.biz.shoes.ShoesService;
import com.ss.biz.shoes.ShoesSizeVO;
import com.ss.biz.shoes.ShoesVO;


@Controller
public class PayController {
	
	@Autowired
	private PayService payService;
	@Autowired
	private ShoesService shoesService;
	
	@RequestMapping(value="/구매하기.do", method=RequestMethod.POST)		//구매하기-> 재고-1
	public String insertS(ShoesVO sVO, ShoesSizeVO ssVO , PayVO pVO, Model model) {
		payService.insertPay(pVO);	//구매 목록에 추가
		shoesService.updateShoes(sVO, ssVO.getSize()); // 재고 -1
		List<PayVO> pDatas = payService.selectAllPay(pVO);
		model.addAttribute("pDatas", pDatas);
		return "cart.do"; //구매한 뒤 어디로 갈것인가? 구매한 목록을 볼 수 있게 바로 카트로 이동
	}
	
	@RequestMapping(value="/selectAllPay.do", method=RequestMethod.POST) //모든 구매목록 보기
	public String selectAllPay(PayVO pVO, Model model) {
		List<PayVO> pDatas = payService.selectAllPay(pVO);
		model.addAttribute("pDatas", pDatas);
		return "cart.do";
	}
	
}
