package com.ss.biz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.biz.member.MemberVO;
import com.ss.biz.review.ReviewVO;
import com.ss.biz.review.impl.ReviewDAO;


@Controller
public class ReviewController {  
	
	@RequestMapping(value="/insertR.do",method=RequestMethod.POST) //�ı� �ۼ�
	public String InsertR(MemberVO mVO, ReviewVO rVO, ReviewDAO rDAO ) {
		rDAO.insertReview(rVO);
		return "review.do"; //�ۼ��� ������ review �������� �̵�
	}
	
	@RequestMapping("/updateR.do") //�ı� ����
	public String UpdateR(MemberVO mVO, ReviewVO rVO, ReviewDAO rDAO ) {
		rDAO.updateReview(rVO);
		return "review.do"; //������ ������ review �������� �̵�
	}
	
	@RequestMapping("/deleteR.do") //�ı� ����
	public String DeleteR(MemberVO mVO, ReviewVO rVO, ReviewDAO rDAO ) {
		rDAO.deleteReview(rVO);
		return "review.do"; //������ ������ review �������� �̵�
	}
	
}
