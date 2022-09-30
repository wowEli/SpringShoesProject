package com.ss.biz.member;

import java.util.List;

import com.ss.biz.member.MemberVO;

public interface MemberService {
	void insertMember(MemberVO vo);		//회원가입
	void deleteMember(MemberVO vo);		//회원탈퇴
	void updateMember(MemberVO vo);		//정보 변경
	MemberVO selectOneMember(MemberVO vo);	//로그인
	List<MemberVO> selectAllMember(MemberVO vo);	//관리자 모드 사용시 회원관리용
}
