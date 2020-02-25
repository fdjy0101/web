package com.jun.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.jun.dao.MemberDAO;
import com.jun.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject MemberDAO dao;
	
	//회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		dao.join(vo);
	}

	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	//회원정보 수정
	//Controller에서 보내는 파라미터를 memberUpdate(MemberVO vo)로 받음
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		dao.memberUpdate(vo);
	}

	//회원탈퇴
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
	}
	
	//비밀번호 체크
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = dao.passChk(vo);
		return result;
	}
	
	//아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}
	
	//닉네임 중복 체크
	@Override
	public int nickChk(MemberVO vo) throws Exception {
		int result = dao.nickChk(vo);
		return result;
	}
	
	//이메일 중복 체크
	@Override
	public int emailChk(MemberVO vo) throws Exception {
		int result = dao.emailChk(vo);
		return result;
	}

	//휴대폰 중복 체크
	@Override
	public int phoneChk(MemberVO vo) throws Exception {
		int result = dao.phoneChk(vo);
		return result;
	}
}
