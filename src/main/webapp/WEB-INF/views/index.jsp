<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 25. 3. 4.
  Time: 오전 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>TalkHub</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            margin: 0;
        }
    </style>
</head>
<body>
<h1>TalkHub</h1>
<p>TalkHub에 오신 것을 환영합니다!<br>토크허브를 통해 사람들과 의견을 나누세요.</p>

<c:choose>
    <c:when test="${authentication}">
        <div>
            <a href="${pageContext.request.contextPath}/post/write">글쓰기</a> |
            <a href="${pageContext.request.contextPath}/post/list">글목록</a> |
            <a href="${pageContext.request.contextPath}/user/profile">마이페이지</a> |
            <a href="${pageContext.request.contextPath}/user/logout-proceed">로그아웃</a>
        </div>
    </c:when>
    <c:otherwise>
        <div>
            <br>
            <a href="${pageContext.request.contextPath}/user/login">로그인</a> |
            <a href="${pageContext.request.contextPath}/user/join">회원가입</a>
        </div>
    </c:otherwise>
</c:choose>

</body>
</html>
