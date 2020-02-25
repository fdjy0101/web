package com.jun.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jun.vo.SearchCriteria;
import com.jun.vo.TestBoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	//테스트 게시판 작성
	@Override
	public void write(TestBoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
	}

	//테스트 게시판 목록 조회
	@Override
	public List<TestBoardVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("boardMapper.listPage", scri);
	}

	//게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("boardMapper.listCount", scri);
	}
	
	//테스트 게시물 조회
	@Override
	public TestBoardVO read(int bno) throws Exception {
		return sqlSession.selectOne("boardMapper.read", bno);
	}

	//테스트 게시물 수정
	@Override
	public void update(TestBoardVO boardVO) throws Exception {
		sqlSession.update("boardMapper.update", boardVO);
	}

	//테스트 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("boardMapper.delete", bno);
	}
	
	//첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("boardMapper.insertFile", map);
	}

	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return sqlSession.selectList("boardMapper.selectFileList", bno);
	}
	
	//첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("boardMapper.selectFileInfo", map);
	}
	
	//첨부파일 수정
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		sqlSession.update("boardMapper.updateFile", map);
	}

	//게시판 조회수
	@Override
	public void boardReadcount(int bno) throws Exception {
		sqlSession.update("boardMapper.boardReadcount", bno);
	}
	
}
