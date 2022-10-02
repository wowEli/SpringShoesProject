package com.ss.biz.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.biz.pay.PayVO;
import com.ss.biz.pay.impl.PayDAO;
import com.ss.biz.shoes.ShoesSizeVO;
import com.ss.biz.shoes.ShoesVO;
import com.ss.biz.shoes.impl.ShoesDAO;

@Controller
public class PayController {
	
	@RequestMapping(value="/�����ϱ�.do", method=RequestMethod.POST)		//�����ϱ�-> ���-1
	public String insertS(ShoesVO sVO, ShoesSizeVO ssVO ,ShoesDAO sDAO, PayVO pVO, PayDAO pDAO, Model model) {
		pDAO.insertPay(pVO);	//���� ��Ͽ� �߰�
		sDAO.updateShoes(sVO, ssVO.getSize()); // ��� -1
		List<PayVO> pDatas = pDAO.selectAllPay(pVO);
		model.addAttribute("pDatas", pDatas);
		return "cart.do"; //������ �� ���� �����ΰ�? ������ ����� �� �� �ְ� �ٷ� īƮ�� �̵�
	}
	
	@RequestMapping(value="/selectAllPay.do", method=RequestMethod.POST) //��� ���Ÿ�� ����
	public String selectAllPay(PayVO pVO, PayDAO pDAO, Model model) {
		List<PayVO> pDatas = pDAO.selectAllPay(pVO);
		model.addAttribute("pDatas", pDatas);
		return "cart.do";
	}
	
}
