package com.board.dao;

import java.util.List;

import com.board.domain.BoardVO;

/*@Mapper*/
public interface BoardDao {
	
	public List<BoardVO> getList(BoardVO vo) throws Exception;
	
	public List<BoardVO> readPost(int no) throws Exception;
	
	public void insertPost(BoardVO board) throws Exception; 
	public void deletePost(int no);
	public void updatePost(BoardVO board);
	
	/*
	 * public void readCount(BoardVO board);
	 * 
	 * public List<BoardVO> sortNo(BoardVO board) throws Exception;
	 */
}
