package com.ss.biz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ss.biz.member.MemberService;
import com.ss.biz.member.MemberVO;
import com.ss.biz.pay.PayService;
import com.ss.biz.pay.PayVO;
import com.ss.biz.review.ReviewService;
import com.ss.biz.review.ReviewVO;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private PayService payService;
	

	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginpage() {
		return "login.jsp";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(MemberVO mVO,HttpSession session) {
		
		System.out.println("로그인 로그 mVO ["+mVO+"]");
		
		mVO = memberService.login(mVO);
		
		
		if(mVO==null) {		// 로그인 실패시
			return "login.jsp"; // 다시 로그인 화면으로 이동
		}
		else { // 로그인 성공시
			
			// 세션에 mid만 저장
			session.setAttribute("mid", mVO.getMid());
			return "redirect:selectAllS.do";	// 메인페이지 이동
		}
	}
	
	@RequestMapping("/logout.do") // 로그아웃
	public String logout(HttpSession session) {
		session.invalidate();
		return "login.do";
	}
	
	@RequestMapping("/insertM.do") // 회원 가입
	public String insertMember(@RequestParam(value="detailAddress",defaultValue="",required=false)String detailAddress,MemberVO mVO) {
		mVO.setMaddress(mVO.getMaddress()+" "+detailAddress);
		
		memberService.insertMember(mVO);
		return "redirect:login.do";	// 회원가입 후 로그인 페이지로 이동
	}
	
	@RequestMapping("/updateM.do") // 회원정보 수정
	public String updateMember(HttpSession session, MemberVO mVO) {
		mVO.setMid((String)session.getAttribute("mid"));
		memberService.updateMember(mVO);					
		return "redirect:selectAllS.do"; //수정 후 메인페이지 이동 (세션정보를 지우면 장바구니가 초기화되서 수정)
	}
	
	@RequestMapping("/deleteM.do") // 회원 탈퇴 
	public String deleteMember(HttpSession session, MemberVO mVO) {
		memberService.deleteMember(mVO);
		session.invalidate();
		return "redirect:login.do"; // 회원 탈퇴를 누르면 다시 로그인 페이지로 이동
	}
	
	@RequestMapping("/selectOneM.do") // 마이페이지
	public String selectOneMember(MemberVO mVO, ReviewVO rVO, PayVO pVO, Model model) {
		
		System.out.println("selectOneM.do 로그1: ["+mVO+"]");
		// 내 정보 출력
		// view에서 mid 값이 넘어옴
		
		System.out.println("selectOneM.do 로그2: ["+memberService.selectOneMember(mVO)+"]");
		model.addAttribute("mData", memberService.selectOneMember(mVO)); // 회원정보 1개를 저장 (내 정보 보기)
		
		// 구매목록 출력
		// =============== 1회 후기 로직 시작 ===============
		List<PayVO> pDatas = payService.selectAllPay(pVO); // 한명의 구매목록이 다 출력됨
		
		for(int i=0; i < pDatas.size(); i++) { // 구매목록의 개수만큼 반복
			
			rVO.setSizepk(pDatas.get(i).getSizepk()); // 이 제품에
			ReviewVO rVO2 = reviewService.selectOneReviewMS(rVO); // 리뷰를 썻는가?
			
			if(rVO2 == null) { // 리뷰를 안썼다면 후기 작성이 가능(null이라면)
				pDatas.get(i).setFlag(true);
			}
			else { // 리뷰를 이미 썼다면 후기 작성이 불가능(데이터가 있다면)
				pDatas.get(i).setFlag(false);
			}
		}
		
		// 로그
		for(PayVO p: pDatas) {
			System.out.println("pDatas 로그: ["+p+"]");
		}
		
		model.addAttribute("pDatas", pDatas); // 회원의 구매목록 저장(마이페이지 구매목록 출력)
		// =============== 1회 후기 로직 종료 ===============
		
		// 후기목록 출력
		model.addAttribute("rDatas", reviewService.selectAllReviewM(rVO));
		
		
		return "myPage.jsp"; // 메인페이지 > 마이페이지 이동이므로 redirect
	}
	

	@ResponseBody
	@RequestMapping("/idCheck.do")
	public String idCheck(MemberVO mVO, @RequestParam(value="check")String mid) {
		System.out.println("ajax 컨트롤러 들오옴");
		mVO.setMid(mid);
		MemberVO check = memberService.selectOneMember(mVO);
		System.out.println("로그 : "+ mid);
		String result = "0";	             //중복o
		if(check==null) {
			result= "1";	//중복x
		}		
		return result;		
	}
	
	@RequestMapping("/pwCheck.do")
	@ResponseBody
	public String pwCheck(@RequestParam(value="check1")String check1, @RequestParam(value="check2")String check2) {
		System.out.println("ajax 컨트롤러 들오옴2");
		String result="0";
		if(check1.equals(check2)) {
			result ="1";
		}
		return result;
		
	}	
	
}
