package com.example.board.domain.dto;

import java.util.Date;

public class CommentsDto {

    private Long bid;
    private Long cid;
    private String contents;
    private Date commentRegDt;

    public CommentsDto(Long bid, Long cid, String contents, Date commentRegDt) {
        this.bid = bid;
        this.cid = cid;
        this.contents = contents;
        this.commentRegDt = commentRegDt;
    }

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

    public Date getCommentRegDt() {
        return commentRegDt;
    }

    public void setCommentRegDt(Date commentRegDt) {
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
