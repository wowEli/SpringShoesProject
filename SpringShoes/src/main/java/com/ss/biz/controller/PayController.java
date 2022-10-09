package com.ss.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.biz.pay.PayService;
import com.ss.biz.pay.PayVO;
import com.ss.biz.review.ReviewService;
import com.ss.biz.review.ReviewVO;
import com.ss.biz.shoes.ShoesService;
import com.ss.biz.shoes.ShoesSizeVO;
import com.ss.biz.shoes.ShoesVO;


@Controller
public class PayController {
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private ShoesService shoesService;
	
	@RequestMapping("/insertP.do")		//구매하기-> 재고-1
	public String insertPay(ShoesVO sVO, ShoesSizeVO ssVO , PayVO pVO, Model model) {
		payService.insertPay(pVO);	//구매 목록에 추가
		shoesService.updateShoes(sVO, ssVO.getSize()); // 재고 -1
		
		List<PayVO> pDatas = payService.selectAllPay(pVO);
		model.addAttribute("pDatas", pDatas);
		
		return "영수증 페이지"; 
	}
	
}
