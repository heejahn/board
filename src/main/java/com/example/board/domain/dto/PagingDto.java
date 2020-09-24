package com.example.board.domain.dto;

public class PagingDto {

    private int startPage; // 시작 페이지
    private int currentPage; // 현재 페이지
    private int lastPage; // 끝 페이지
    private int maxPage; // 최대 페이지
    private int totalNum; // 전체 게시글 수
    private int numPerPage; // 페이지 당 게시글 수(변동)
    private int offset; // 쿼리문 limit offset 수치
    private int pageRange = 5; // 한 번에 보여줄 페이지 개수(고정)

    public PagingDto(int totalNum, int currentPage, int numPerPage) {

        this.currentPage = currentPage;
        this.totalNum = totalNum;
        this.numPerPage = numPerPage;

        calcMaxPage(totalNum, numPerPage);
        calcStartLastPage(currentPage, pageRange);
        calcOffset(currentPage, numPerPage);
    }

    public void calcMaxPage(int totalNum, int numPerPage) {

        maxPage = (int) Math.ceil((double)totalNum / (double)numPerPage);
    }

    public void calcStartLastPage(int currentPage, int pageRange) {

        lastPage = ((int)Math.ceil((double) currentPage / (double) pageRange)) * pageRange;

        if(maxPage < lastPage) {
            lastPage = maxPage;
        }

        startPage = (lastPage - pageRange + 1);

        if(startPage < 1) {
            startPage = 1;
        }
    }

    public void calcOffset(int currentPage, int numPerPage) {

        offset = (currentPage - 1) * numPerPage;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public int getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(int maxPage) {
        this.maxPage = maxPage;
    }

    public int getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(int totalNum) {
        this.totalNum = totalNum;
    }

    public int getNumPerPage() {
        return numPerPage;
    }

    public void setNumPerPage(int numPerPage) {
        this.numPerPage = numPerPage;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getPageRange() {
        return pageRange;
    }

    public void setPageRange(int pageRange) {
        this.pageRange = pageRange;
    }

    @Override
    public String toString() {
        return "PagingDto{" +
                "startPage=" + startPage +
                ", currentPage=" + currentPage +
                ", lastPage=" + lastPage +
                ", maxPage=" + maxPage +
                ", totalNum=" + totalNum +
                ", numPerPage=" + numPerPage +
                ", offset=" + offset +
                ", pageRange=" + pageRange +
                '}';
    }
}
