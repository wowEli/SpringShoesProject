package com.ss.biz.member;

import java.util.List;

import com.ss.biz.member.MemberVO;

public interface MemberService {
	void insertMember(MemberVO vo);		//회원가입
	void deleteMember(MemberVO vo);		//회원탈퇴
	void updateMember(MemberVO vo);		//정보 변경
	void updateTierMember(MemberVO vo); // 티어 변경
	MemberVO login(MemberVO vo);	//로그인
	MemberVO selectOneMember(MemberVO vo);	// 내 정보
}
