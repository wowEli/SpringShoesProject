package com.ss.biz.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.biz.member.impl.MemberDAO;
import com.ss.biz.member.MemberService;
import com.ss.biz.member.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired // MemberDAO 타입의 객체가 메모리에 있어야지만 DI(의존성 주입) 가능함!
	private MemberDAO memberDAO; // 핵심로직을 수행할 객체
	
	@Override
	public void insertMember(MemberVO vo) {
		memberDAO.insertMember(vo);
	}

	@Override
	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);
	}

	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}

	@Override
	public MemberVO selectOneMember(MemberVO vo) {
		memberDAO.selectOneMember(vo);
		return null;
	}

	@Override
	public List<MemberVO> selectAllMember(MemberVO vo) {
		return memberDAO.selectAllMember(vo);
	}

}
