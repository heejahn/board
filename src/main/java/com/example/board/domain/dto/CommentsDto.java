package com.example.board.domain.dto;

import java.util.Date;

public class CommentsDto {

    private Long cid;
    private String commentContents;
    private Date commentRegDt;

    public CommentsDto(Long cid, String commentContents, Date commentRegDt) {
        this.cid = cid;
        this.commentContents = commentContents;
        this.commentRegDt = commentRegDt;
    }

    public Long getCid() {
        return cid;
    }

    public void setCid(Long cid) {
        this.cid = cid;
    }

    public String getCommentContents() {
        return commentContents;
    }

    public void setCommentContents(String commentContents) {
        this.commentContents = commentContents;
    }

    public Date getCommentRegDt() {
        return commentRegDt;
    }

    public void setCommentRegDt(Date commentRegDt) {
        this.commentRegDt = commentRegDt;
    }

    @Override
    public String toString() {
        return "CommentsDto{" +
                "cid=" + cid +
                ", commentContents='" + commentContents + '\'' +
                ", commentRegDt=" + commentRegDt +
                '}';
    }
}
