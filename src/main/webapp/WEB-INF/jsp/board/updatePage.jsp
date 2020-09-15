<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
    <title>board main page</title>
    <script  src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.5.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<h3>글 수정</h3>
    <form role="form" action="${pageContext.request.contextPath}/board/update" method="post" id="frm" name="frm">
            <div class="form-group">
                <label for="title">제목</label>
                <input type="" class="form-control" id="title" name="title" readonly="readonly" value="${updatePage.title}">
            </div>
        <div class="form-group">
            <label for="contents">내용</label>
            <textarea class="form-control" id="contents" name="contents" rows="3">${updatePage.contents}</textarea>
        </div>
        <button type="submit" id="submit">제출</button>
    </form>
        <button type="button" id="btnReset">리셋</button>

    <script type="text/javascript">
        document.getElementById('btnReset').onclick = function() {
            location.reload();
        }
    </script>

</body>
</html>