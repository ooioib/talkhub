<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 25. 3. 4.
  Time: 오후 2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>TalkHub</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>

    <title>TalkHub</title>
</head>
<body>
<h1>TalkHub</h1>
<div>
    <h2>토크허브에 글남기기</h2>
    <form action="${pageContext.request.contextPath}/post/write-proceed" method="post">
        <div>
            <label>말머리(*)</label>
            <div>
                <select name="category">
                    <option value="자유">자유</option>
                    <option value="질문">질문</option>
                    <option value="정보">정보</option>
                    <option value="뉴스">뉴스</option>
                </select>
            </div>
        </div>
        <div>
            <label>제목(*)</label>
            <div>
                <input type="text" name="title"/>
            </div>
        </div>
        <div>
            <label>내용(*)</label>
            <div>
                <textarea name="content"></textarea>
            </div>
        </div>

        <div>
            <button type="submit">게시하기</button>
            <a href="${pageContext.request.contextPath}/index">
                <button type="button">돌아가기</button>
            </a>

        </div>
    </form>
</div>
</body>
</html>
