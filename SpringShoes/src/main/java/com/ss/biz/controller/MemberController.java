package com.ss.biz.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.biz.member.MemberVO;
import com.ss.biz.member.impl.MemberDAO;

@Controller
public class MemberController {

	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String SelectOneMember(MemberVO mVO, MemberDAO mDAO, Model model) {
		
		mVO = mDAO.selectOneMember(mVO);	
		if(mVO==null) {		// 로그인 실패시
			return "redirect:login.jsp"; // 다시 로그인 화면으로 이동
		}
		else {
			model.addAttribute("member", mVO); //로그인 성공시
			return "";	//메인화면으로 이동  main?
		}
	}
	
	@RequestMapping(value="/insertMember.do", method=RequestMethod.POST) // 회원 가입
	public String InsertMember(MemberVO mVO,MemberDAO mDAO) {
		mDAO.insertMember(mVO);
		return "redirect:login.do";	// 회원가입 후 로그인 페이지로 이동
	}
	
	@RequestMapping(value="/updateM.do", method=RequestMethod.POST) // 회원정보 수정
	public String UpdateMember(HttpSession session, MemberVO mVO,MemberDAO mDAO) {
		mDAO.updateMember(mVO);					
		session.invalidate();
		return "redirect:login.do"; //수정후 다시 로그인을 하게 로그인 페이지로
	}
	
	@RequestMapping(value="/deleteM.do") // 회원 탈퇴 
	public String DeleteMember(HttpSession session, MemberVO mVO,MemberDAO mDAO) {
		mDAO.deleteMember(mVO);
		session.invalidate();
		return "redirect:login.do"; // 회원 탈퇴를 누르면 다시 로그인 페이지로 이동
	}
		
}
