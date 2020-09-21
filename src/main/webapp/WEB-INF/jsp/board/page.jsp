<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
    <title>게시판 세부 페이지</title>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
    <script  src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
</head>

<style>
    .pageTitle {
        color: #797A7A;
        padding-bottom: 5px;
    }

    .page, .comments {
        background-color: white;
        padding : 20px;
        border-radius: 10px;
    }

    .comments {
        margin-bottom: 150px;
    }

    .pageLabel {
        color: #95999c;
    }

    #pageContent {
        resize: none;
        width: 100%;
        outline: none;
    }

    span {
        margin-right: 10px;
    }

    .threeButtons {
        padding : 15px 0;
    }

    .threeButtons button {
        margin-left: 1px;
    }

    .writeComment {
        padding-bottom: 10px;
    }
</style>

<body>
<jsp:include page="/WEB-INF/jsp/common_include/common_header.jsp" />
<div class="nav-scroller flex-column p-3 mb-3 bg-white border-bottom shadow-sm">
    <div class="container-sm d-flex">
        <h4 class="navbar-brand mr-auto mr-lg-0">게시판 세부 페이지</h4>
    </div>
</div>
<main role="main">
    <div class="container">
        <div class="page border-bottom shadow-sm">
            <h3 class="pageTitle">${boardPage.title}</h3>
            <div class="pageLabel">
                    <span>
                        <label>작성일</label>
                        <label class="label"><fmt:formatDate value="${boardPage.regDt}" pattern="yyyy.MM.dd" /></label>
                    </span>
                <span>
                        <label>조회수</label>
                        <label class="label">${boardPage.readCount}</label>
                    </span>
            </div>
            <hr class="mb-1"/>
            <div class="textarea">
                <label for="pageContent"></label>
                <textarea id="pageContent" name="pageContent" rows="5" readonly="readonly">${boardPage.contents}</textarea>
            </div>
            <div class="threeButtons text-center">
                <button type="button" class="btn btn-outline-primary" id="btnUpdate">수정</button>
                <button type="button" class="btn btn-outline-primary" id="btnDelete">삭제</button>
                <button type="button" class="btn btn-outline-primary" id="btnPrevious">이전으로</button>
            </div>
        </div>
        <hr class="mb-4"/>
        <div class="comments border-bottom shadow-sm">
            <form role="form" id="frm" name="frm" action="${pageContext.request.contextPath}/board/addComment" method="post">
                <input type="hidden" name="bid" id="bid" value="${boardPage.bid}" />
                <div class="writeComment">
                    <label for="contents"></label>
                    <input type="text" id="contents" name="contents" size="80" placeholder="댓글을 작성하세요." />
                    <button type="submit" class="btn btn btn-light btn-sm" id="addComment" name="addComment">댓글 추가</button>
                </div>
            </form>
            <hr class="mb-4"/>
            <div id="showCommentList"></div>
        </div>
    </div>
</main>
<jsp:include page="/WEB-INF/jsp/common_include/common_footer.jsp" />

<script type="text/javascript">
    const bid = ${boardPage.bid}

        document.getElementById('btnPrevious').onclick = function() {
            history.back();
        };

    document.getElementById('btnUpdate').onclick = function() {
        location.href = "/board/updatePage?bid=" + bid;
    };

    document.getElementById('btnDelete').onclick = function() {
        let path = "/board/delete?bid=" + bid;
        if(confirm("삭제하시겠습니까?")){
            location.href = path;
        }
        return false;
    };

    $(function() {
        showCommentList();
    })

    function showCommentList(){
        let appendList = $('#showCommentList');

        $.ajax({
            url : '/board/showCommentList',
            type : "GET",
            data : {"bid" : "${boardPage.bid}"},
            contentType : "application/json;",
            dataType : "json",
            success : function(result){
                appendList.append('<table class="table table-sm table-borderless" id="commentTable"><tbody>');

                if(result.length > 0) {
                    $(result).each(function() {
                        let html =
                            '<tr>' +
                                '<td>'+ this.contents +'</td>' +
                                '<td style="color: #95999c">' + this.commentRegDt.year + "/" + this.commentRegDt.monthValue + "/" + this.commentRegDt.dayOfMonth + '</td>' +
                                '<td><a href=# id="deleteComment" onclick="deleteComment('+ this.cid +')">삭제</a></td>' +
                            '</tr>';
                        appendList.append(html);
                    });
                } else {
                    appendList.append('<td style="color: #95999c">등록된 댓글이 없습니다.</td>');
                }
                appendList.append("</tbody></table>");
                console.log(appendList);
            }
        });
    }

    function deleteComment(cid) {
        let msg = confirm("댓글을 삭제합니다.");
        if(msg === true){
            $.ajax({
                url : "/board/deleteComment?cid=" + cid,
                type : "GET",
                success : function() {
                    showCommentList();
                },
                error : function() {
                    alert("댓글 삭제 실패");
                }
            });
        }
        return false;
    }

    <%--function addComment() {--%>
    <%--    let url = "${pageContext.request.contextPath}/board/addComment";--%>
    <%--    $.ajax({--%>
    <%--        url : url,--%>
    <%--        type : "POST",--%>
    <%--        data : $('#frm').serialize(),--%>
    <%--        success : function() {--%>
    <%--                showCommentList();--%>
    <%--                // location.href = "/board/list";--%>
    <%--        },--%>
    <%--        error : function() {--%>
    <%--            alert("댓글 추가 실패");--%>
    <%--        }--%>
    <%--    })--%>
    <%--}--%>


</script>
</body>
</html>
