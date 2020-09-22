package com.example.board.mapper;

import com.example.board.domain.dto.BoardDto;

import java.util.List;

public interface BoardMapper {

    List<BoardDto> selectAllBoardList();

    BoardDto selectChosenPage(Long bid);

    void registerNewPage(BoardDto boardDto);

    void updateCurrentPage(BoardDto boardDto);

    void updateNumberOfHits(Long bid);

    void deleteCurrentPage(Long bid);

    int countNumOfBoard();

}
