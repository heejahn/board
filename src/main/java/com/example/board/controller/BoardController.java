package com.example.board.controller;

import com.example.board.domain.dto.BoardDto;
import com.example.board.domain.dto.CommentsDto;
import com.example.board.domain.service.BoardService;
import com.example.board.domain.service.CommentsService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;
    private final CommentsService commentsService;

    public BoardController(BoardService boardService, CommentsService commentsService) {
        this.boardService = boardService;
        this.commentsService = commentsService;
    }

    // Board-related
    @GetMapping("list")
    public ModelAndView list() {
        ModelAndView modelAndView = new ModelAndView("board/list");

        List<BoardDto> boardDtoList = boardService.selectAllBoardList();

        modelAndView.addObject("boardList", boardDtoList);

        return modelAndView;
    }

    @GetMapping("page")
    public String page(@RequestParam("bid") Long bid, Model model) {

        boardService.updateNumberOfHits(bid);

        model.addAttribute("boardPage", boardService.selectChosenPage(bid));
        model.addAttribute("commentsDto", new CommentsDto());

       return "/board/page";
    }

    @GetMapping("write")
    public void write() {

    }

    @PostMapping("register")
    public String register(BoardDto boardDto) {

        boardService.registerNewPage(boardDto);

        return "redirect:/board/list";
    }

    @GetMapping("updatePage")
    public String updatePage(@RequestParam("bid") Long bid, Model model) {

        model.addAttribute("updatePage", boardService.selectChosenPage(bid));

        return "/board/updatePage";
    }

    @PostMapping("update")
    public String update(BoardDto boardDto) {

        boardService.updateCurrentPage(boardDto);

        return "redirect:/board/list";
    }

    @Transactional
    @GetMapping("delete")
    public String delete(@RequestParam("bid") Long bid) {

        commentsService.deleteCurrentPageComments(bid);
        boardService.deleteCurrentPage(bid);

        return "redirect:/board/list";
    }

    // Comment-related
    @ResponseBody
    @GetMapping("showCommentList")
    public List<CommentsDto> showCommentList(@RequestParam("bid") Long bid) {

        return commentsService.selectAllComments(bid);
    }

    @PostMapping("addComment")
    public String addComment(CommentsDto commentsDto) {

        commentsService.addNewComment(commentsDto);

        return "redirect:/board/list";
    }

    @ResponseBody
    @GetMapping("deleteComment")
    public String deleteComment(@RequestParam("cid") Long cid) {

        commentsService.deleteCurrentComment(cid);

        return "success";
    }

}
