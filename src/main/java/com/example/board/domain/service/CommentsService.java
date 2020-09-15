package com.example.board.domain.service;

import com.example.board.domain.dto.CommentsDto;
import com.example.board.mapper.CommentsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentsService {

    private final CommentsMapper commentsMapper;

    @Autowired
    public CommentsService(CommentsMapper commentsMapper) { this.commentsMapper = commentsMapper; }

    public List<CommentsDto> selectAllComments(String title) { return commentsMapper.selectAllComments(title); }

    public void addNewComment(CommentsDto commentsDto) { commentsMapper.addNewComment(commentsDto); }

    public void deleteCurrentPageComments(Long bid) { commentsMapper.deleteCurrentPageComments(bid); }

    public void deleteCurrentComment(Long cid) { commentsMapper.deleteCurrentComment(cid); }
}
