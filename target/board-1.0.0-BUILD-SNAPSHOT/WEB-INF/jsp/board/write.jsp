<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
    <title>board main page</title>
    <script  src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.5.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
</head>

<style>
    a {
        margin: 0.5em;
    }
</style>

<body>
<div class="container">
<h3>글 작성</h3>
    <form role="form" id="frm" name="frm" action="${pageContext.request.contextPath}/board/register" method="post">
        <div class="form-group mx-md-5">
            <label for="title">제목</label>
            <input class="form-control" id="title" name="title">
        </div>
        <div class="form-group mx-sm-5">
            <label for="contents">내용</label>
            <textarea class="form-control" id="contents" name="contents" rows="3" placeholder="내용을 입력하세요."></textarea>
        </div>
        <button class="btn btn-primary" type="submit" id="btnSubmit">제출</button>
    </form>

    <div class="text-center" id="links">
        <a href="${pageContext.request.contextPath}/board/list">이전으로</a>
        <a href="${pageContext.request.contextPath}/board/write">초기화</a>
    </div>
</div>
</body>
</html>