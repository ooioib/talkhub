<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 25. 3. 7.
  Time: 오전 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TalkHub</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <style>
        /* 전체 요소를 화면 가운데 정렬 */
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
    <title>TalkHub</title>
</head>
<body>
<h1>TalkHub</h1>
<hr/>
<h3>[${post.category}] ${post.title}</h3>
<div>
    <div>작성자 ${post.writerId} <span style="color:#dddddd">|</span> 작성일 ${post.writedAt}</div>
    <div>조회 ${post.views} <span style="color:#dddddd">|</span> 추천 ${post.likes} </div>
</div>
<hr/>
<p style="white-space: pre-wrap">${post.content}</p>
<hr/>

<c:choose>
    <c:when test ="${alreadyLiked}">
        <button type="submit" disabled> 이미 추천을 하였습니다.</button>
    </c:when>
    <c:otherwise>
        <a href="${pageContext.request.contextPath}/post/like-proceed?id=${post.id}">
            <button type="submit"> 추천하기</button></a>
    </c:otherwise>
</c:choose>

</body>
</html>
