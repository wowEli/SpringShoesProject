package com.ss.biz.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.biz.member.MemberService;
import com.ss.biz.member.MemberVO;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginpage() {
		return "login.jsp";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String SelectOneMember(MemberVO mVO, Model model,HttpSession session) {
		
		mVO = memberService.selectOneMember(mVO);	
		if(mVO==null) {		// 로그인 실패시
			return "login.jsp"; // 다시 로그인 화면으로 이동 <동욱: 로그인 -> 로그인 로직이니 forword로 수정>
		}
		else {
			// 세션에 mid만 저장
			session.setAttribute("mid", mVO.getMid());
			return "redirect:selectAllS.do";	//메인화면으로 이동  main? <동욱: 메인 == 전체 슈즈 페이지 == selectAllS.do>
		}
	}
	
	@RequestMapping("/insertMember.do") // 회원 가입
	public String InsertMember(@RequestParam(value="detailAddress",defaultValue="",required=false)String detailAddress,MemberVO mVO) {
		mVO.setMaddress(mVO.getMaddress()+" "+detailAddress);
		memberService.insertMember(mVO);
		return "redirect:login.do";	// 회원가입 후 로그인 페이지로 이동
	}
	
	@RequestMapping(value="/updateM.do", method=RequestMethod.POST) // 회원정보 수정
	public String UpdateMember(HttpSession session, MemberVO mVO) {
		memberService.updateMember(mVO);					
		session.invalidate();
		return "redirect:login.do"; //수정후 다시 로그인을 하게 로그인 페이지로
	}
	
	@RequestMapping(value="/deleteM.do") // 회원 탈퇴 
	public String DeleteMember(HttpSession session, MemberVO mVO) {
		memberService.deleteMember(mVO);
		session.invalidate();
		return "redirect:login.do"; // 회원 탈퇴를 누르면 다시 로그인 페이지로 이동
	}
	
	
	
		
}
