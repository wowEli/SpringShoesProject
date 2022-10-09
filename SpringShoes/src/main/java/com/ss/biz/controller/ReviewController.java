package com.ss.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.biz.member.MemberVO;
import com.ss.biz.pay.PayService;
import com.ss.biz.review.ReviewService;
import com.ss.biz.review.ReviewVO;
import com.ss.biz.review.impl.ReviewDAO;


@Controller
public class ReviewController {  
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/insertR.do",method=RequestMethod.POST) //후기 작성
	public String InsertR(MemberVO mVO, ReviewVO rVO ) {
		reviewService.insertReview(rVO);
		return "review.do"; //작성을 누르면 review 페이지로 이동
	}
	
	@RequestMapping("/updateR.do") //후기 수정
	public String UpdateR(MemberVO mVO, ReviewVO rVO ) {
		reviewService.updateReview(rVO);
		return "review.do"; 
	}
	
	@RequestMapping("/deleteR.do") //후기 삭제
	public String DeleteR(MemberVO mVO, ReviewVO rVO ) {
		reviewService.deleteReview(rVO);
		return "review.do";
	}
	
	@RequestMapping("/selectOneR.do")  //리뷰 하나 보기
	public String SelectOneR(ReviewVO rVO, Model model) {
		rVO = reviewService.selectOneReview(rVO);
		model.addAttribute("rData", rVO);
		return ""; //리뷰 하나 보는 페이지
	}
	
	@RequestMapping("/selectAllR.do") //다른 사람 포함 모든 리뷰 확인
	public String SelectAllR(ReviewVO rVO, Model model) {
		List<ReviewVO> rDatas= reviewService.selectAllReview(rVO);
		model.addAttribute("rDatas", rDatas);
		return "review.do";
	}
	
	@RequestMapping("/selectAllMR.do") //내 리뷰들만 확인
	public String SelectAllMR(ReviewVO rVO, MemberVO mVO, Model model) {
		List<ReviewVO> rmDatas= reviewService.selectAllReviewM(rVO);
		model.addAttribute("rmDatas", rmDatas);
		return "review.do";
	}
	
	
	
}
