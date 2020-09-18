<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
    <title>게시판 메인 페이지</title>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
    <script  src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
</head>

<style>
    table {
        background-color: white;
    }

    table a {
        font-weight: bold;
        color: #787B7C;
    }

    .board {
        padding: 3rem 0;
        flex : 1 0 auto;
    }
</style>

<body>
    <jsp:include page="/WEB-INF/jsp/common_include/common_header.jsp" />
    <div class="nav-scroller flex-column p-3 mb-3 bg-white border-bottom shadow-sm">
        <div class="container-sm d-flex">
            <h4 class="navbar-brand mr-auto mr-lg-0">게시판 메인 페이지</h4>
        </div>
    </div>
    <main role="main">
        <div class="container">
            <div class="board">
                <table class="table table-hover">
                    <thead class="thead-light">
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
                                <c:param name="bid" value="${board.bid}" />
                            </c:url>
                            <td><a href="${url}">${board.title}</a></td>
                            <td><fmt:formatDate value="${board.regDt}" pattern="yyyy.MM.dd" /></td>
                            <td>${board.readCount}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="text-center">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#">이전</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
                </ul>
            </div>
        </div>
        <jsp:include page="/WEB-INF/jsp/common_include/common_footer.jsp" />
    </main>

    <script type="text/javascript">
        document.getElementById('btnWrite').onclick = function() {
            location.href = "/board/write";
        };
    </script>
</body>
</html>