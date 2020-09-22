package com.example.board.domain.dto;

public class PagingDto {

    private Long bid;
    private int pageNum;
    private int boardNum;
    private int allPageNum;
    private int allBoardNum;

    public Long getBid() {
        return bid;
    }

    public void setBid(Long bid) {
        this.bid = bid;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getBoardNum() {
        return boardNum;
    }

    public void setBoardNum(int boardNum) {
        this.boardNum = boardNum;
    }

    public int getAllPageNum() {
        return allPageNum;
    }

    public void setAllPageNum(int allPageNum) {
        this.allPageNum = allPageNum;
    }

    public int getAllBoardNum() {
        return allBoardNum;
    }

    public void setAllBoardNum(int allBoardNum) {
        this.allBoardNum = allBoardNum;
    }

    @Override
    public String toString() {
        return "PagingDto{" +
                "bid=" + bid +
                ", pageNum=" + pageNum +
                ", boardNum=" + boardNum +
                ", allPageNum=" + allPageNum +
                ", allBoardNum=" + allBoardNum +
                '}';
    }
}
