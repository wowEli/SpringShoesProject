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
		if(mVO==null) {		// �α��� ���н�
			return "redirect:login.jsp"; // �ٽ� �α��� ȭ������ �̵�
		}
		else {
			model.addAttribute("member", mVO); //�α��� ������
			return "";	//����ȭ������ �̵�  main?
		}
	}
	
	@RequestMapping(value="/insertMember.do", method=RequestMethod.POST) // ȸ�� ����
	public String InsertMember(MemberVO mVO,MemberDAO mDAO) {
		mDAO.insertMember(mVO);
		return "redirect:login.do";	// ȸ������ �� �α��� �������� �̵�
	}
	
	@RequestMapping(value="/updateM.do", method=RequestMethod.POST) // ȸ������ ����
	public String UpdateMember(HttpSession session, MemberVO mVO,MemberDAO mDAO) {
		mDAO.updateMember(mVO);					
		session.invalidate();
		return "redirect:login.do"; //������ �ٽ� �α����� �ϰ� �α��� ��������
	}
	
	@RequestMapping(value="/deleteM.do") // ȸ�� Ż�� 
	public String DeleteMember(HttpSession session, MemberVO mVO,MemberDAO mDAO) {
		mDAO.deleteMember(mVO);
		session.invalidate();
		return "redirect:login.do"; // ȸ�� Ż�� ������ �ٽ� �α��� �������� �̵�
	}
		
}
