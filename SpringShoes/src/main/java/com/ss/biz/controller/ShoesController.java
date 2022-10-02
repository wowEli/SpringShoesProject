package com.ss.biz.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.biz.review.ReviewVO;
import com.ss.biz.review.impl.ReviewDAO;
import com.ss.biz.shoes.ShoesVO;
import com.ss.biz.shoes.impl.ShoesDAO;



@Controller
public class ShoesController {
		
	
	
	@RequestMapping(value="/selectAllShoes.do", method=RequestMethod.POST)  //��� �Ź� ���
	public String selectAllColorShoes(ShoesVO sVO, ShoesDAO sDAO, Model model) {
		List<ShoesVO> sDatas = sDAO.selectAllShoes(sVO);
		model.addAttribute("sDatas", sDatas);
		return "main.do";		//�⺻ �˻����� �� searchContent(�Ź��̸�)�� VO�� �ʿ���
	}
		
	
	@RequestMapping(value="/selectOneShoes.do", method=RequestMethod.POST)  //�Ź� �ϳ� ����
	public String selectOneSHoes(ShoesVO sVO, ShoesDAO sDAO, Model model, ReviewVO rVO, ReviewDAO rDAO) {
		sVO = sDAO.selectOneShoes(sVO);
		//�� �������� �̵����� �� ������� ������ �ִ� �ֵ��� Ȱ��ȭ�� �Ǿ��־���ϰ� �ƴ� �ֵ��� ��Ȱ��ȭ �Ǿ��־�� ��
		// �׷��� size�� ����� �� �� �ִ� boardSelectAll�� �ʿ���!
		model.addAttribute("sData", sVO);
		
		List<ReviewVO> rDatas = rDAO.selectAllReview(rVO);  //����� ���� ���
		model.addAttribute("rDatas", rDatas);
		return "shoesOne.do";
	}
	
	@RequestMapping(value="/filterSearch.do", method=RequestMethod.POST)		//���Ͱ˻�
	public String filterSearch(ShoesVO sVO, ShoesDAO sDAO, Model model) {
		int[] size = {220, 230, 240, 250, 260, 270};  //VO�� ������ָ� ������ ������? ��������� ���ڿ� �ְ�
		sDAO.filterSearch(sVO, size);
		return "shoesOne.do";
	}
	
	
	
}
