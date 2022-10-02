package com.ss.biz.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.biz.pay.PayVO;
import com.ss.biz.pay.impl.PayDAO;

@Controller
public class PayController {

	@RequestMapping(value="/insertP.do", method=RequestMethod.POST) //���� ��� �߰�
	public String insertPay(PayVO pVO, PayDAO pDAO) {
		pDAO.insertPay(pVO);
		return "cart.do"; 
	}
		
	@RequestMapping(value="/selectAllPay.do", method=RequestMethod.POST) //��� ���Ÿ�� ����
	public String selectAllPay(PayVO pVO, PayDAO pDAO, Model model) {
		List<PayVO> pDatas = pDAO.selectAllPay(pVO);
		model.addAttribute("pDatas", pDatas);
		return "cart.do";
	}
	
}
