package com.ss.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.biz.review.ReviewService;
import com.ss.biz.review.ReviewVO;

import com.ss.biz.shoes.ShoesService;
import com.ss.biz.shoes.ShoesVO;

@Controller
public class ShoesController {

	@Autowired
	private ShoesService shoesService;
	@Autowired
	private ReviewService reviewService;

	@RequestMapping(value = "/selectAllShoes.do", method = RequestMethod.POST) // 모든 신발 출력
	public String selectAllColorShoes(ShoesVO sVO, Model model) {
		List<ShoesVO> sDatas = shoesService.selectAllShoes(sVO);
		model.addAttribute("sDatas", sDatas);
		return "main.do"; // 기본 검색으로 쓸 searchContent(신발이름)이 VO에 필요함
	}

	@RequestMapping(value = "/selectOneShoes.do", method = RequestMethod.POST) // 신발 하나 선택
	public String selectOneSHoes(ShoesVO sVO, Model model, ReviewVO rVO) {
		sVO = shoesService.selectOneShoes(sVO);
		// 상세 페이지로 이동했을 때 사이즈별로 범위에 있는 애들은 활성화가 되어있어야하고 아닌 애들은 비활성화 되어있어야 함
		// 그래서 size를 출력해 줄 수 있는 boardSelectAll이 필요함!
		model.addAttribute("sData", sVO);

		List<ReviewVO> rDatas = reviewService.selectAllReview(rVO); // 리뷰들 전부 출력
		model.addAttribute("rDatas", rDatas);
		return "shoesOne.do";
	}

	@RequestMapping(value = "/filterSearch.do", method = RequestMethod.POST) // 필터검색
	public String filterSearch(ShoesVO sVO, Model model) {
		int[] size = { 220, 230, 240, 250, 260, 270 }; // VO에 만들어주면 좋을꺼 같은데? 멤버변수로 인자에 넣게
		shoesService.filterSearch(sVO, size);
		return "shoesOne.do";
	}

}
