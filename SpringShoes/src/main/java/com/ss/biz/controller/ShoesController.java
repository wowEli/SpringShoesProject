package com.ss.biz.controller;

import java.util.List;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

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

	
	
	@RequestMapping("/selectAllS.do") // 모든 신발 출력
	public String selectAllColorShoes(ShoesVO sVO, Model model) {
		System.out.println("검색로직 들어옴"+sVO.getSearchContent());
		
		// 검색을 하지 않고 들어왔을 경우
		if(sVO.getSearchContent() == null) {
			sVO.setSearchContent("");
		}
		
		List<ShoesVO> sDatas = shoesService.selectAllShoes(sVO);
		
//		for(int i =0; i < sDatas.size(); i++) {
//			System.out.println(sDatas.get(i));
//		}
		
		model.addAttribute("sDatas", sDatas);
		return "main.jsp"; // 기본 검색으로 쓸 searchContent(신발이름)이 VO에 필요함
	}

	@RequestMapping(value = "/selectOneS.do", method = RequestMethod.POST) // 신발 하나 선택
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
	public String filterSearch(ShoesVO sVO, Model model, HttpServletRequest request) {
		System.out.println("필터검색에 들어온 VO 값"+sVO);
		
		// view에서 받아온 여러개의 sizes 값을 배열로 받고, Integer배열로 변경하는 로직
		String[] sizes=request.getParameterValues("size");
		Integer[] size = Stream.of(sizes).mapToInt(Integer::parseInt).boxed().toArray(Integer[]::new);
		
		
		List<ShoesVO> sDatas = shoesService.filterSearch(sVO, size);
		
		// 필터의 결과 로그
		for(ShoesVO v : sDatas) {
			System.out.println(v);
		}
		
		model.addAttribute("sDatas", sDatas);
		
		return "main.jsp";
	}
	

}
