package com.example.board.controller;

import com.example.board.domain.dto.BoardDto;
import com.example.board.domain.dto.CommentsDto;
import com.example.board.domain.service.BoardService;
import com.example.board.domain.service.CommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;
    private final CommentsService commentsService;

    @Autowired
    public BoardController(BoardService boardService, CommentsService commentsService) {
        this.boardService = boardService;
        this.commentsService = commentsService;
    }

    @RequestMapping("list")
    public ModelAndView list() {
        ModelAndView modelAndView = new ModelAndView("board/list");

        List<BoardDto> boardDtoList = boardService.selectAllBoardList();

        modelAndView.addObject("boardList", boardDtoList);

        return modelAndView;
    }

    @GetMapping("page")
    public String page(@RequestParam("bid") Long bid, Model model) {

        boardService.updateNumberOfHits(bid);

        List<CommentsDto> commentsDtoList = commentsService.selectAllComments(bid);

        model.addAttribute("boardPage", boardService.selectChosenPage(bid));
        model.addAttribute("commentPage", commentsDtoList);

       return "/board/page";
    }

    @RequestMapping("addComment")
    public String addComment(CommentsDto commentsDto, RedirectAttributes rttr) {

        commentsService.addNewComment(commentsDto);
        rttr.addFlashAttribute("msg", "added");

        return "redirect:/board/list";
    }

    @GetMapping("deleteComment")
    public String deleteComment(@RequestParam("cid") Long cid) {

        commentsService.deleteCurrentComment(cid);

        return "redirect:/board/list";
    }


    @GetMapping("write")
    public void write() {

    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String register(BoardDto boardDto) {

        boardService.registerNewPage(boardDto);

        return "redirect:/board/list";
    }

    @GetMapping("updatePage")
    public String updatePage(@RequestParam("bid") Long bid, Model model) {

        model.addAttribute("updatePage", boardService.selectChosenPage(bid));

        return "/board/updatePage";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(BoardDto boardDto, RedirectAttributes rttr) {

        boardService.updateCurrentPage(boardDto);
        rttr.addFlashAttribute("msg", "updated");

        return "redirect:/board/list";
    }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(@RequestParam("bid") Long bid) {

        commentsService.deleteCurrentPageComments(bid);
        boardService.deleteCurrentPage(bid);

        return "redirect:/board/list";
    }

}
