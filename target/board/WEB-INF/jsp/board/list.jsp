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
<body>
    <h3>게시판</h3>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">제목</th>
            <th scope="col">작성일</th>
            <th scope="col">조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="board" items="${boardList}" >
            <tr>
                <th scope="row">${board.bid}</th>
                <c:url value="/board/page" var="url" >
                    <c:param name="title" value="${board.title}" />
                </c:url>
                <td><a href="${url}">${board.title}</a></td>
                <td><fmt:formatDate value="${board.regDt}" pattern="yyyy.MM.dd" /></td>
                <td>${board.readCount}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
<div>
    <button type="button" id="btnWrite">작성하기</button>
</div>

<script type="text/javascript">
    document.getElementById('btnWrite').onclick = function() {
        location.href = "/board/write";
    };
</script>
</body>
</html>