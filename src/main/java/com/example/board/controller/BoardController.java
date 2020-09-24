package com.example.board.controller;

import com.example.board.domain.dto.BoardDto;
import com.example.board.domain.dto.CommentsDto;
import com.example.board.domain.dto.PagingDto;
import com.example.board.domain.service.BoardService;
import com.example.board.domain.service.CommentsService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    // Board
    @GetMapping("list")
    public String list(Model model,
            @RequestParam(value = "currentPage", required = false) String currentPage,
            @RequestParam(value = "numPerPage", required = false) String numPerPage) {

        // 페이징
        if(currentPage == null && numPerPage == null) {
            currentPage = "1";
            numPerPage = "5";

        } else if(currentPage == null) {
            currentPage = "1";

        } else if(numPerPage == null) {
            numPerPage = "5";
        }

        int totalNum = boardService.countNumOfBoard();

        PagingDto pagingDto = new PagingDto(totalNum, Integer.parseInt(currentPage), Integer.parseInt(numPerPage));

        List<BoardDto> boardDtoList = boardService.selectAllBoardList(pagingDto);

        model.addAttribute("boardList", boardDtoList);
        model.addAttribute("paging", pagingDto);

        return "board/list";
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

    // Comment
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

    // Paging

}
