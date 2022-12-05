package com.board.service;

import java.util.List;
import java.util.Map;

import com.board.domain.BoardVO;

public interface BoardService {
	
	public List<BoardVO> getBoard(Map<String,Object> map) throws Exception;
	
	public BoardVO getPost(int no) throws Exception;
	
	public void registerPost(BoardVO board) throws Exception;
	public void removePost(int no) throws Exception;
	public void modifyPost(BoardVO board) throws Exception;
	

}
