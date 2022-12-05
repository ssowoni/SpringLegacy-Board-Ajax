package com.board.dao;

import java.util.List;
import java.util.Map;

import com.board.domain.BoardVO;

/*@Mapper*/
public interface BoardDao {
	
	public List<BoardVO> getList(Map<String, Object> map) throws Exception;
	
	public BoardVO readPost(int no) throws Exception;
	
	public void insertPost(BoardVO board) throws Exception; 
	public void deletePost(int no);
	public void updatePost(BoardVO board);
	

}
