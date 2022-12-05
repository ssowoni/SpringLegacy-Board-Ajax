package com.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.BoardDao;
import com.board.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao boardDao;

	@Override
	public List<BoardVO> getBoard(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.getList(map);
	}

	@Override
	public BoardVO getPost(int no) throws Exception {
		return boardDao.readPost(no);
	}

	@Override
	public void registerPost(BoardVO board) throws Exception {
		boardDao.insertPost(board);
		
	}

	@Override
	public void removePost(int no) throws Exception {
		boardDao.deletePost(no);
		
	}

	@Override
	public void modifyPost(BoardVO board) throws Exception {
		boardDao.updatePost(board);
		
	}

	

	
}
