package com.example.board.domain.service;

import com.example.board.domain.dto.BoardDto;
import com.example.board.domain.dto.PagingDto;
import com.example.board.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    private final BoardMapper boardMapper;

    @Autowired
    public BoardService(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    } // 생성자로 BoardMapper 주입

    public List<BoardDto> selectAllBoardList() {
        return boardMapper.selectAllBoardList();
    }

    public BoardDto selectChosenPage(Long bid) { return boardMapper.selectChosenPage(bid); }

    public void registerNewPage(BoardDto boardDto) { boardMapper.registerNewPage(boardDto); }

    public void updateCurrentPage(BoardDto boardDto) { boardMapper.updateCurrentPage(boardDto);}

    public void updateNumberOfHits(Long bid) { boardMapper.updateNumberOfHits(bid); }

    public void deleteCurrentPage(Long bid) { boardMapper.deleteCurrentPage(bid); }

    // Paging
    public int countNumOfBoard() { return boardMapper.countNumOfBoard(); }

}
