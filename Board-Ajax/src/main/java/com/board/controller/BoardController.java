package com.board.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.domain.BoardVO;
import com.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
   
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   @Autowired
   BoardService boardService;
   
   //게시글 목록
   @GetMapping("")
   //@RequestMapping(value="/list", method=RequestMethod.GET)
   public String list(Model model, Map<String,Object> map) throws Exception {
      
      logger.info("게시글 목록");
      model.addAttribute("list", boardService.getBoard(map));
      //System.out.println("boardService.selectList ** : "+boardService.selectList(map));
      
      return "/board/list";
   }
   
   //게시글 등록 화면
   @GetMapping("/register")
   public String register() throws Exception{
      logger.info("게시글 등록 화면");
      return "/board/register";
   }
   
   //게시글 등록
   @ResponseBody
   @PostMapping("/register")
   public boolean register(@RequestBody BoardVO vo) throws Exception{
      logger.info("게시글 등록 동작");
       boardService.registerPost(vo);
      
      return true;
   }
   
   
   //게시글 상세보기 화면
   @GetMapping("/{no}")
   public String get(@PathVariable int no, Model model) throws Exception{
      logger.info("게시글 상세보기 화면");
      BoardVO boardVO= boardService.getPost(no);
      System.out.println("boardVO: " + boardVO);
      model.addAttribute("board",boardVO);
      return "/board/get";
      
   }
   
   //게시글 수정
   @ResponseBody
   @PatchMapping("/{no}")
   public boolean modify(@PathVariable("no") int no, 
                  @RequestBody BoardVO vo) throws Exception{
      logger.info("게시글 등록 수정");
      boardService.modifyPost(vo);
      System.out.println("수정한 boardVO: " + vo);
      return true;
   }
   
   
   //게시글 삭제
   @ResponseBody
   @DeleteMapping("/{no}")
   public boolean delete(@PathVariable("no") int no) throws Exception {
      logger.info("게시글 삭제");
      boardService.removePost(no);
      return true;
      
   }
   
   
   
   

}