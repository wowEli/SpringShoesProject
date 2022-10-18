package com.ss.biz.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.ss.biz.member.MemberVO;
import com.ss.biz.pay.PayVO;
import com.ss.biz.review.ReviewService;
import com.ss.biz.review.ReviewVO;
import com.ss.biz.shoes.ShoesService;
import com.ss.biz.shoes.ShoesSizeVO;
import com.ss.biz.shoes.ShoesVO;
import com.ss.biz.shoes.impl.ShoesDAO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private ShoesService shoesService;
	
	@RequestMapping("/review.do")
	public String review(PayVO pVO,ShoesSizeVO sVO,ShoesVO shoesVO, Model model) {
		model.addAttribute("colorpk", pVO.getColorpk());
		model.addAttribute("sizepk", pVO.getSizepk());
		
		sVO.setSizepk(pVO.getSizepk());
		
		shoesVO=shoesService.selectOneShoesBucket(sVO);
		
		model.addAttribute("sData",shoesVO);
		
		return "review.jsp";
	}

	@RequestMapping(value = "/insertR.do", method = RequestMethod.POST) // 후기 작성
	public String InsertR(MemberVO mVO, ReviewVO rVO) throws IllegalStateException, IOException {
		
		rVO.setReviewImg("default.jpg");
		MultipartFile uploadFile = rVO.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			rVO.setReviewImg(fileName);
			uploadFile.transferTo(new File(
					"/Users/dongwook/git/SpringShoesProject/SpringShoes/src/main/webapp/img/"+ fileName));
		}

		reviewService.insertReview(rVO);
		return "selectOneM.do";
	}

	@RequestMapping("/updateR.do") // 후기 수정
	public String UpdateR(MemberVO mVO, ReviewVO rVO, HttpSession session) throws IllegalStateException, IOException {
		System.out.println("업데이트 사용자 정보 :" + mVO);
		System.out.println("업데이트 리뷰 정보 :" + rVO);
		MultipartFile uploadFile = rVO.getUploadFile();
		if (!uploadFile.isEmpty()) {

			String fileName = uploadFile.getOriginalFilename();
			rVO.setReviewImg(fileName);
			uploadFile.transferTo(new File(
					"/Users/dongwook/git/SpringShoesProject/SpringShoes/src/main/webapp/img/" + fileName));

		}
		
		System.out.println("업데이트 된 rVO : "+rVO);
		reviewService.updateReview(rVO);
		return "redirect:selectOneM.do?mid=" + session.getAttribute("mid");
	}

	@RequestMapping("/deleteR.do") // 후기 삭제
	public String DeleteR(MemberVO mVO, ReviewVO rVO, HttpSession session) {
		reviewService.deleteReview(rVO);
		return "selectOneM.do?mid=" + session.getAttribute("mid");
	}

	@RequestMapping("/selectOneR.do") // 리뷰 하나 보기
	public String SelectOneR(ReviewVO rVO, Model model) {
		rVO = reviewService.selectOneReview(rVO);
		System.out.println("컨트롤러에 들어온 리뷰" + rVO);
		model.addAttribute("rData", rVO);
		return "reviewUpdate.jsp"; // 리뷰 하나 보는 페이지
	}

}