package com.jun.dao;

import com.jun.vo.MemberVO;

public interface MemberDAO {
	
	//회원가입
	public void join(MemberVO vo) throws Exception;

	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//회원정보 수정
	public void memberUpdate(MemberVO vo)throws Exception;
	
	//회원 탈퇴
	public void memberDelete(MemberVO vo)throws Exception;
	
	//비밀번호 체크
	public int passChk(MemberVO vo) throws Exception;
	
	//아이디 중복 체크
	public int idChk(MemberVO vo) throws Exception;
	
	//닉네임 중복 체크
	public int nickChk(MemberVO vo) throws Exception;
	
	//이메일 중복 체크
	public int emailChk(MemberVO vo) throws Exception;
		
	//휴대폰 중복 체크
	public int phoneChk(MemberVO vo) throws Exception;
		
}
