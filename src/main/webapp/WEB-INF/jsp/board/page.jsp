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
        <form class="form-inline">
            <div class="form-group">
                <label for="regDt" class="">작성일</label>
                <input type="text" readonly class="form-control-plaintext" id="regDt" name="regDt" value="<fmt:formatDate value="${boardPage.regDt}" pattern="yyyy.MM.dd" />">
            </div>
            <div class="form-group">
                <label for="readCount" class="">읽은 횟수</label>
                <input type="text" readonly class="form-control-plaintext" id="readCount" name="readCount" value="${boardPage.readCount}">
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
                <label for="contents" class="col-sm-2 col-form-label">내용</label>
                <div class="col-sm-10">
                    <textarea id='contents' name="contents" rows="3" cols="50" readonly="readonly">${boardPage.contents}</textarea>
                </div>
            </div>
        </form>
        <c:url value="/board/updatePage" var="updateUrl">
            <c:param name="title" value="${boardPage.title}" />
        </c:url>
        <button type="button" id="btnUpdate"><a href="${updateUrl}">수정</a></button>
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
                <td>${page.commentContents}</td>
                <td><fmt:formatDate value="${page.commentRegDt}" pattern="yyyy.MM.dd" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <script type="text/javascript">
        $(document).ready(function() {
            $("#btnPrevious").on("click", function(){
                self.location = "/board/list"
            });

            $("#btnDelete").on("click", function() {
                let path = "/board/delete?bid=" + '${boardPage.bid}';
                if(confirm('삭제하시겠습니까?')) {
                    document.location.href = path;
                }
            });
        })
    </script>
</body>
</html>
