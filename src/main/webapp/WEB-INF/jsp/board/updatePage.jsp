<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
    <title>게시글 수정</title>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
    <script  src="${pageContext.request.contextPath}/resources/js/jquery/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
</head>

<style>
    main {
        padding-top: 20px;
    }

    .updateComment {
        background-color: white;
        padding : 20px;
        border-radius: 10px;
    }

    textarea {
        resize: none;
    }

    #links a {
        padding-top: 30px;
        padding-left: 15px;
    }
</style>

<body>
    <jsp:include page="/WEB-INF/jsp/common_include/common_header.jsp" />
    <div class="nav-scroller flex-column p-3 mb-3 bg-white border-bottom shadow-sm">
        <div class="container-sm d-flex">
            <h4 class="navbar-brand mr-auto mr-lg-0">게시글 수정</h4>
        </div>
    </div>
    <main role="main">
        <div class="container">
            <div class="updateComment border-bottom shadow-sm">
                <form role="form" action="${pageContext.request.contextPath}/board/update" method="post" id="frm" name="frm">
                    <input type="hidden" id="bid" name="bid" value="${updatePage.bid}" />
                        <div class="form-group">
                            <label for="title">제목 (변경 불가)</label>
                            <input type="text" class="form-control" id="title" name="title" readonly="readonly" value="${updatePage.title}">
                        </div>
                    <div class="form-group">
                        <label for="contents">내용</label>
                        <textarea class="form-control" id="contents" name="contents" rows="4" placeholder="변경할 내용으로 적어주세요."></textarea>
                    </div>
                    <button class="btn btn-outline-primary" type="submit" id="submit">제출</button>
                </form>
            </div>
            <div id="links" class="d-flex flex-row justify-content-center">
                <a href="#" onclick="history.back()">이전으로</a>
                <a href="${pageContext.request.contextPath}/board/write">초기화</a>
            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/jsp/common_include/common_footer.jsp" />
</body>
</html>