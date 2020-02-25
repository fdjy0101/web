package com.jun.dao;

import java.util.List;
import java.util.Map;

import com.jun.vo.SearchCriteria;
import com.jun.vo.TestBoardVO;

public interface BoardDAO {
	
	//테스트 게시판 작성
	public void write(TestBoardVO boardVO) throws Exception;
	
	//테스트 게시판 목록 조회
	public List<TestBoardVO> list(SearchCriteria scri) throws Exception;
	
	//게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	//테스트 게시물 조회
	public TestBoardVO read(int bno) throws Exception;
	
	//테스트 게시물 수정
	public void update(TestBoardVO boardVO) throws Exception;

	//테스트 게시물 삭제
	public void delete(int bno) throws Exception;
	
	//첨부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	
	//첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	//첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	//첨부파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
	
	//게시판 조회수
	public void boardReadcount(int bno) throws Exception;
}
