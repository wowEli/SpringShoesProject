package com.ss.biz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.biz.member.MemberVO;
import com.ss.biz.review.ReviewVO;
import com.ss.biz.review.impl.ReviewDAO;


@Controller
public class ReviewController {  
	
	@RequestMapping(value="/insertR.do",method=RequestMethod.POST) // 후기 작성
	public String InsertR(MemberVO mVO, ReviewVO rVO, ReviewDAO rDAO ) {
		rDAO.insertReview(rVO);
		return "review.do"; // 작성을 누르면 review 페이지로 이동
	}
	
	@RequestMapping("/updateR.do") // 후기 수정
	public String UpdateR(MemberVO mVO, ReviewVO rVO, ReviewDAO rDAO ) {
		rDAO.updateReview(rVO);
		return "review.do"; // 수정을 누르면 review 페이지로 이동
	}
	
	@RequestMapping("/deleteR.do") // 후기 삭제
	public String DeleteR(MemberVO mVO, ReviewVO rVO, ReviewDAO rDAO ) {
		rDAO.deleteReview(rVO);
		return "review.do"; // 삭제를 누르면 review 페이지로 이동
	}
	
}
