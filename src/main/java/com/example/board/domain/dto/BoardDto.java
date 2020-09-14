package com.example.board.domain.dto;

import java.util.Date;

public class BoardDto {

    private Long bid;
    private String title;
    private String contents;
    private Date regDt;
    private Long readCount;

    public BoardDto(Long bid, String title, String contents, Date regDt, Long readCount) {
        this.bid = bid;
        this.title = title;
        this.contents = contents;
        this.regDt = regDt;
        this.readCount = readCount;
    }

    public Long getBid() {
        return bid;
    }

    public void setBid(Long bid) {
        this.bid = bid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public Date getRegDt() {
        return regDt;
    }

    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    public Long getReadCount() {
        return readCount;
    }

    public void setReadCount(Long readCount) {
        this.readCount = readCount;
    }

    @Override
    public String toString() {
        return "BoardDto{" +
                "bid=" + bid +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", regDt=" + regDt +
                ", readCount=" + readCount +
                '}';
    }

}
