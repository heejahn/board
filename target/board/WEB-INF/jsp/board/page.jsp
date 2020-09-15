<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
    <title>게시판 세부 페이지</title>
    <script  src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.5.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
</head>
<body>
    <h3>게시글 #${boardPage.bid} 보기</h3>
        <form class="">
            <div class="">
                <label>작성일 : <fmt:formatDate value="${boardPage.regDt}" pattern="yyyy.MM.dd" /></label>
            </div>
            <div class="">
                <label>읽은 횟수 : ${boardPage.readCount}</label>
            </div>
        </form>
        <form>
            <div class="form-group row">
                <label for="title" class="col-sm-2 col-form-label">제목</label>
                <div class="col-sm-10">
                    <input type="text" readonly="readonly" id="title" name="title" value="${boardPage.title}">
                </div>
            </div>
            <div class="form-group row">
                <label for="boardContents" class="col-sm-2 col-form-label">내용</label>
                <div class="col-sm-10">
                    <textarea id='boardContents' name="boardContents" rows="3" cols="50" readonly="readonly">${boardPage.contents}</textarea>
                </div>
            </div>
        </form>
        <button type="button" id="btnUpdate">수정</button>
        <button type="button" id="btnDelete">삭제</button>
        <button type="button" id="btnPrevious">이전으로</button>
    <table class="table table-sm table-borderless">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">댓글</th>
            <th scope="col">작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="page" items="${commentPage}">
            <tr>
                <th scope="row">${page.cid}</th>
                <td>${page.contents}</td>
                <td><fmt:formatDate value="${page.commentRegDt}" pattern="yyyy.MM.dd" /></td>
                <td><a href=# onclick="deleteComment(${page.cid})">삭제</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div>
        <form role="form" action="${pageContext.request.contextPath}/board/addComment" method="post">
            <input type="hidden" name="bid" id="bid" value="${boardPage.bid}">
            <div>
                <label for="contents">Comments</label>
            </div>
            <div>
                <input type="text" id="contents" name="contents" size="30" />
            </div>
            <button type="submit" id="addComment" name="addComment">댓글 추가</button>
        </form>
    </div>

    <script type="text/javascript">
        document.getElementById('btnPrevious').onclick = function() {
            location.href = "/board/list"
        };

        document.getElementById('btnUpdate').onclick = function() {
            location.href = "/board/updatePage?title=" + "${boardPage.title}";
        };

        document.getElementById('btnDelete').onclick = function() {
            let path = "/board/delete?bid=" + ${boardPage.bid};
            if(confirm("삭제하시겠습니까?")){
                location.href = path;
            }
            return false;
        };

        function deleteComment(cid) {
            let msg = confirm("댓글을 삭제합니다.");
            if(msg === true){
                location.href = "/board/deleteComment?cid=" + cid;
            }
            return false;
        }

        <%--$(document).ready(function() {--%>
        <%--    $("#btnPrevious").on("click", function() {--%>
        <%--        self.location = "/board/list"--%>
        <%--    });--%>

        <%--    $('#btnUpdate').on('click', function() {--%>
        <%--        location.href = "/board/updatePage?title=" + '${boardPage.title}';--%>
        <%--    });--%>

        <%--    $("#btnDelete").on("click", function() {--%>
        <%--        let path = "/board/delete?bid=" + '${boardPage.bid}';--%>
        <%--        if(confirm('삭제하시겠습니까?')) {--%>
        <%--            document.location.href = path;--%>
        <%--        }--%>
        <%--    });--%>
        <%--})--%>
    </script>
</body>
</html>
