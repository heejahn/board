package com.example.board.domain.dto;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

public class CommentsDto {

    private Long bid;
    private Long cid;
    private String contents;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime commentRegDt;

    public Long getBid() {
        return bid;
    }

    public void setBid(Long bid) {
        this.bid = bid;
    }

    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public LocalDateTime getCommentRegDt() {
        return commentRegDt;
    }

    public void setCommentRegDt(LocalDateTime commentRegDt) {
        this.commentRegDt = commentRegDt;
    }

    @Override
    public String toString() {
        return "CommentsDto{" +
                "bid=" + bid +
                ", cid=" + cid +
                ", contents='" + contents + '\'' +
                ", commentRegDt=" + commentRegDt +
                '}';
    }
}
