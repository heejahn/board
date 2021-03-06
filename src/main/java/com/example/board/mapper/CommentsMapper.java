package com.example.board.mapper;

import com.example.board.domain.dto.CommentsDto;

import java.util.List;

public interface CommentsMapper {

    List<CommentsDto> selectAllComments(Long bid);

    void addNewComment(CommentsDto commentsDto);

    void deleteCurrentPageComments(Long bid);

    void deleteCurrentComment(Long cid);

}
