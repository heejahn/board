<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
    <title>board main page</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<h3>새 글 작성</h3>
    <form role="form" id="frm" name="frm" action="${pageContext.request.contextPath}/board/register" method="post">
        <div class="form-group mx-md-5">
            <label for="title">제목</label>
            <input class="form-control" id="title" name="title">
        </div>
        <div class="form-group mx-sm-5">
            <label for="contents">내용</label>
            <textarea class="form-control" id="contents" name="contents" rows="3"></textarea>
        </div>
        <button type="submit" id="btnSubmit">제출</button>
    </form>

    <div>
        <a href="/board/list">이전으로</a>
        <a href="/board/write">초기화</a>
    </div>
</body>
</html>