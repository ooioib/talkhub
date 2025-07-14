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
    <style>
        /* 제목과 내용 입력 칸의 가로 길이 맞추기 */
        input[type="text"], textarea {
            width: 100%;
            max-width: 500px;
        }

        textarea {
            height: 150px; /* 내용 입력란 높이 설정 */
        }

        /* 말머리 선택창과 버튼 간격 조정 */
        form > div {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<h1>TalkHub</h1>
<div>
    <h2>토크허브에 글 남기기</h2>
    <form action="${pageContext.request.contextPath}/post/write-proceed" method="post">

        <div>
            <label for="category">말머리(*)</label>
            <select id="category" name="category">
                <option value="자유">자유</option>
                <option value="질문">질문</option>
                <option value="정보">정보</option>
                <option value="뉴스">뉴스</option>
            </select>
        </div>

        <div>
            <label for="title">제목(*)</label>
            <input type="text" id="title" name="title"/>
        </div>
        <div>
            <label for="content">내용(*)</label>
            <textarea id="content" name="content"></textarea>
        </div>
        <div>
            <button type="submit">게시하기</button>
            <button type="button" onclick="location.href='${pageContext.request.contextPath}/index'">돌아가기</button>
        </div>
    </form>
</div>
</body>
</html>
