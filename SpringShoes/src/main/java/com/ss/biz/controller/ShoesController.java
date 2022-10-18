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
import com.ss.biz.shoes.ShoesSizeVO;
import com.ss.biz.shoes.ShoesVO;

@Controller
public class ShoesController {

	@Autowired
	private ShoesService shoesService;
	@Autowired
	private ReviewService reviewService;



	@RequestMapping("/selectAllS.do") // 모든 신발 출력
	public String selectAllColorShoes(ShoesVO sVO, Model model) {
		//		System.out.println("검색로직 들어옴"+sVO.getSearchContent());


		if(sVO.getPageCondition() == null) { // 검색을 이용하지 않고 들어올경우 null임
			sVO.setPageCondition("normal"); // 기본 값으로 일반검색(nomal) 사용
		}

		// 페이징처리시 nomal인지 filter인지 알려주는 데이터 저장
//		System.out.println("pageCondition :"+sVO.getPageCondition());
		model.addAttribute("pageCondition", sVO.getPageCondition());
		// page번호를 누를때 현재 무슨 검색을 사용하는지 데이터를 유지하기 위해 뷰로 데이터 전송
		// 이 normal 값을 이용하여 페이지 단에 JS함수에 사용되므로 뷰에 보내줘야함

		// 검색을 하지 않고 들어왔을 경우
		if(sVO.getSearchContent() == null) {
			sVO.setSearchContent("");
		}		

//		System.out.println("검색어로그 ["+sVO.getSearchContent()+"]");
		model.addAttribute("searchContent", sVO.getSearchContent());
		// page번호를 누를때 현재 무슨 검색 내용을 사용하는지 데이터를 유지하기 위해 뷰로 데이터 전송

		// 검색을 이용하지 않고 들어올 경우 PageButton은 0으로 시작하기 때문에(0이면 1~5page번호를 보여줄 수 없음)
		// 1을 넣어줌으로써 1~5page번호 배열을 보여줌
		if(sVO.getPageButton() == 0) { 
			sVO.setPageButton(1); // 클래스화 하면 생성자로 초기값 설정 1로 하면 됨
		} 

		// 페이지버튼변수
//		System.out.println("pageButton 값 ="+sVO.getPageButton());
		model.addAttribute("pageButton", sVO.getPageButton());
		// page번호를 누를때 현재 무슨 배열을 보고있는지 배열데이터를 유지하기 위해 뷰로 데이터 전송
		// ex) 1: 1~5 , 2: 6~10, 3: 11~15
		// ex)사용자가 6번페이지 보다가 7번페이지 눌러도 2인 값이 유지됨으로 6~10을 계속해서 보여줌


		// page버튼을 안 눌렀을 경우
		// 1~5 나 6~10 page를 누르지않고 그냥 들어오거나 ( 1이 색칠되어있어야함 ) / ▶버튼으로 왔을 경우 ( 6이 색칠되어있어야함 )
		if(sVO.getPage() == 0) { // 사용자가 page버튼을 눌러서 온 것이 아니니 0값
			System.out.println("일반 selectAll 및 page를 이용안하고 온 것");
			sVO.setPage(sVO.getPageButton()*5-4); // pageButton이 1일경우 1에 색칠이 되야 함으로 page에 1을 저장
			// ex) pageButton이 2일경우 6~10중 6을 선택한 것처럼 page에 6을 저장
		}

		// 현재페이지 넘버
//		System.out.println("page변수 로그:"+sVO.getPage());
		model.addAttribute("pageNow", sVO.getPage()); // 현재 누른 페이지가 몇번인지 알려주는 값 저장
		// 혹시라도 사용자가 페이지를 안눌렀을경우 위 if문을 통해 특정 값이 저장됨


		// 현제페이지 넘버에서 *9 하여 Limit에 들어갈 숫자
//		System.out.println("page변수에 x9 로그"+(sVO.getPage()-1)*9);
		sVO.setPage((sVO.getPage()-1)*9); // sql문 limit은 ? 부터 9개를 보여줌 ?는 0부터 시작되니 현재페이지 넘버에 -1을 해줘야함

		// 출력물의 갯수를 담아주는 코드
		int count = shoesService.selectAllShoesPageSize(sVO); // 리턴값으로 출력할 데이터의 개수가 int로 반환
		//		System.out.println("SQL문 결과 COUNT결과"+count);

		// 출력물의 갯수를 9로 나눠서 마지막페이지가 숫자 몇인지 찾는 코드
		// 한 page당 출력할 데이터의 개수(9)만큼 나눠서 page번호를 몇번까지 보여줘야 할지 찾는 로직
		int endPageNum = 0;
		if(count % 9 == 0) { // 한 page당 출력할 데이터의 개수(9)만큼 딱 떨어지면
			// 마지막 페이지 번호저장
			endPageNum = (count / 9); // 몫 값 만큼 page번호를 출력
		}else {
			// 보여줄 게시물이 더 있기때문에 +1 추가
			endPageNum = (count / 9)+1; // 나머지가 있을경우 +1해서 page하나 더 보여주기				
		}

//		System.out.println("Count를 이용하여 마지막 페이지 번호로그"+endPageNum);
		model.addAttribute("endPageNum", endPageNum);

		// 보여줄 페이지번호를 배열로 만드는 코드
		int start = sVO.getPageButton()*5-4; // page 시작번호
		int end = sVO.getPageButton()*5; // page 끝 번호

		// 보여줄 페이지의 마지막 번호보다 end값이 클 경우 endPageNum까지만 적용할 수 있도록
		if(end > endPageNum) { // page 끝 번호 보다 마지막 데이터를 출력해주는 page번호가 더 작을 경우
			end = endPageNum; // page끝 번호를 마지막 페이지로 저장
		}


//		System.out.println("start["+start+"] end["+end+"]");
		int[] pages = new int[(end-start)+1]; // page시작 번호 ~ page끝 번호 만큼의 크기를 가진 배열이 생성

		int j = 0; // 배열의 인덱스 번호를 표현하기 위한 변수
		for(int i = start; i <= end; i++) { // 위에서 정한 start , end 값을 이용해 배열에 page번호를 저장
			pages[j] = i;
			j++;
		}

		// page번호 배열을 뷰에 전송
		model.addAttribute("pageNum", pages);

		// 일반 검색 메서드
		List<ShoesVO> sDatas = shoesService.selectAllShoes(sVO);

		model.addAttribute("sDatas", sDatas);
		return "main.jsp";
	}

	@RequestMapping("/selectOneS.do") // 신발 하나 선택
	public String selectOneSHoes(ShoesVO sVO, Model model, ReviewVO rVO) {

		sVO = shoesService.selectOneShoes(sVO);
		// 상세 페이지로 이동했을 때 사이즈별로 범위에 있는 애들은 활성화가 되어있어야하고 아닌 애들은 비활성화 되어있어야 함
		// 그래서 size를 출력해 줄 수 있는 boardSelectAll이 필요함!

		// selectOne한 신발정보인 sVO를 이용하여 color와 size 정보를 가져옴
		List<ShoesVO> colorDatas = shoesService.selectShoes_Color(sVO);
		List<ShoesSizeVO> sizeDatas = shoesService.selectShoes_Size(sVO);
		
		List<ReviewVO> rDatas = reviewService.selectAllReview(rVO);

		model.addAttribute("sData", sVO);
		model.addAttribute("rDatas", rDatas);
		model.addAttribute("colorDatas", colorDatas);
		model.addAttribute("sizeDatas", sizeDatas);


		//		List<ReviewVO> rDatas = reviewService.selectAllReview(rVO); // 리뷰들 전부 출력
		//		model.addAttribute("rDatas", rDatas);

		return "shoesOne.jsp";
	}


	@RequestMapping("/filterSearch.do") // 필터검색
	public String filterSearch(ShoesVO sVO, Model model) {
//		System.out.println("필터검색에 들어온 VO 값"+sVO);

		// 페이징처리시 nomal인지 filter인지 알려주는 데이터 저장
//		System.out.println("pageCondition :"+sVO.getPageCondition());

		model.addAttribute("pageCondition", sVO.getPageCondition()); // filter라는 검색종류 값을 유지하기 위해 뷰에 전송

		if(sVO.getFilterBrand() == null) { // 필터에서 브랜드를 선택하지 않을 경우
			sVO.setFilterBrand(""); // 브랜드에 공백 값 저장
		}
		if(sVO.getFilterColor() == null) { // 필터에서 컬러를 선택하지 않을 경우
			sVO.setFilterColor(""); // 컬러에 공백 값 저장
		}

		// 사용자가 page번호를 눌러서 페이지 이동시에도 검색 값들이 유지 될 수 있도록 뷰에 전송
		model.addAttribute("filterSize", sVO.getFilterSize()); // 사용자가 필터에서 선택한 사이즈 배열
		model.addAttribute("filterBrand", sVO.getFilterBrand()); // 사용자가 필터에서 선택한 브랜드
		model.addAttribute("filterColor", sVO.getFilterColor()); // 사용자가 필터에서 선택한 컬러
		model.addAttribute("filterLowPrice", sVO.getFilterLowPrice()); // 사용자가 필터에서 선택한 컬러
		model.addAttribute("filterHighPrice", sVO.getFilterHighPrice()); // 사용자가 필터에서 선택한 컬러

		// 검색을 이용하지 않고 들어올 경우 PageButton은 0으로 시작하기 때문에(0이면 1~5page번호를 보여줄 수 없음)
		// 1을 넣어줌으로써 1~5page번호 배열을 보여줌
		if(sVO.getPageButton() == 0) { 
			sVO.setPageButton(1); // 클래스화 하면 생성자로 초기값 설정 1로 하면 됨
		} 

		// 페이지버튼변수
//		System.out.println("pageButton 값 ="+sVO.getPageButton());
		model.addAttribute("pageButton", sVO.getPageButton());
		// page번호를 누를때 현재 무슨 배열을 보고있는지 배열데이터를 유지하기 위해 뷰로 데이터 전송
		// ex) 1: 1~5 , 2: 6~10, 3: 11~15
		// ex)사용자가 6번페이지 보다가 7번페이지 눌러도 2인 값이 유지됨으로 6~10을 계속해서 보여줌


		// page버튼을 안 눌렀을 경우
		// 1~5 나 6~10 page를 누르지않고 그냥 들어오거나 ( 1이 색칠되어있어야함 ) / ▶버튼으로 왔을 경우 ( 6이 색칠되어있어야함 )
		if(sVO.getPage() == 0) { // 사용자가 page버튼을 눌러서 온 것이 아니니 0값
//			System.out.println("일반 selectAll 및 page를 이용안하고 온 것");
			sVO.setPage(sVO.getPageButton()*5-4); // pageButton이 1일경우 1에 색칠이 되야 함으로 page에 1을 저장
			// ex) pageButton이 2일경우 6~10중 6을 선택한 것처럼 page에 6을 저장
		}

		// 현재페이지 넘버
//		System.out.println("page변수 로그:"+sVO.getPage());
		model.addAttribute("pageNow", sVO.getPage()); // 현재 누른 페이지가 몇번인지 알려주는 값 저장
		// 혹시라도 사용자가 페이지를 안눌렀을경우 위 if문을 통해 특정 값이 저장됨


		// 현제페이지 넘버에서 *9 하여 Limit에 들어갈 숫자
//		System.out.println("page변수에 x9 로그"+(sVO.getPage()-1)*9);
		sVO.setPage((sVO.getPage()-1)*9); // sql문 limit은 ? 부터 9개를 보여줌 ?는 0부터 시작되니 현재페이지 넘버에 -1을 해줘야함

		// 출력물의 갯수를 담아주는 코드
		int count = shoesService.filterSearchPageSize(sVO); // 리턴값으로 출력할 데이터의 개수가 int로 반환
		// System.out.println("SQL문 결과 COUNT결과"+count);

		// 출력물의 갯수를 9로 나눠서 마지막페이지가 숫자 몇인지 찾는 코드
		// 한 page당 출력할 데이터의 개수(9)만큼 나눠서 page번호를 몇번까지 보여줘야 할지 찾는 로직
		int endPageNum = 0;
		if(count % 9 == 0) { // 한 page당 출력할 데이터의 개수(9)만큼 딱 떨어지면
			// 마지막 페이지 번호저장
			endPageNum = (count / 9); // 몫 값 만큼 page번호를 출력
		}else {
			// 보여줄 게시물이 더 있기때문에 +1 추가
			endPageNum = (count / 9)+1; // 나머지가 있을경우 +1해서 page하나 더 보여주기				
		}

//		System.out.println("Count를 이용하여 마지막 페이지 번호로그"+endPageNum);
		model.addAttribute("endPageNum", endPageNum);
		
		// 보여줄 페이지번호를 배열로 만드는 코드
		int start = sVO.getPageButton()*5-4; // page 시작번호
		int end = sVO.getPageButton()*5; // page 끝 번호

		// 보여줄 페이지의 마지막 번호보다 end값이 클 경우 endPageNum까지만 적용할 수 있도록
		if(end > endPageNum) { // page 끝 번호 보다 마지막 데이터를 출력해주는 page번호가 더 작을 경우
			end = endPageNum; // page끝 번호를 마지막 페이지로 저장
		}
		
//		System.out.println("start["+start+"] end["+end+"]");
		int[] pages = new int[(end-start)+1]; // page시작 번호 ~ page끝 번호 만큼의 크기를 가진 배열이 생성

		int j = 0; // 배열의 인덱스 번호를 표현하기 위한 변수
		for(int i = start; i <= end; i++) { // 위에서 정한 start , end 값을 이용해 배열에 page번호를 저장
			pages[j] = i;
			j++;
		}

		// page번호 배열을 뷰에 전송
		model.addAttribute("pageNum", pages);

		// 필터검색 로직
		List<ShoesVO> sDatas = shoesService.filterSearch(sVO);

		model.addAttribute("sDatas", sDatas);

		return "main.jsp";
	}


}
