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

    <button type="button" id="btnWrite">작성하기</button>

    <script type="text/javascript">
        $(document).ready(function() {
           $("#btnWrite").on("click", function(){
               self.location = "/board/write"
           })
        })
    </script>
</body>
</html>