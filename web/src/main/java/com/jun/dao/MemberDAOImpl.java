package com.jun.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jun.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject SqlSession sqlSession;

	//회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		sqlSession.insert("memberMapper.join", vo);
	}

	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sqlSession.selectOne("memberMapper.login", vo);
	}

	//서비스에서 보낸 파라미터를 memberUpdate(MemberVO vo)에 담음
	//회원정보 수정
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		sqlSession.update("memberMapper.memberUpdate", vo); 
	}
	
	//회원탈퇴
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sqlSession.delete("memberMapper.memberDelete", vo);
	}
	
	//비밀번호 체크
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = sqlSession.selectOne("memberMapper.passChk", vo);
		return result;
	}
	
	//아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sqlSession.selectOne("memberMapper.idChk", vo);
		return result;
	}
	
	//닉네임 중복 체크
	@Override
	public int nickChk(MemberVO vo) throws Exception {
		int result = sqlSession.selectOne("memberMapper.nickChk", vo);
		return result;
	}
	
	//이메일 중복 체크
	@Override
	public int emailChk(MemberVO vo) throws Exception {
		int result = sqlSession.selectOne("memberMapper.emailChk", vo);
		return result;
	}
	
	//휴대폰 중복 체크
	@Override
	public int phoneChk(MemberVO vo) throws Exception {
		int result = sqlSession.selectOne("memberMapper.phoneChk", vo);
		return result;
	}

}
