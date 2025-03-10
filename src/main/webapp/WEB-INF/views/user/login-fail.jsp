
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 25. 3. 4.
  Time: 오후 6:05
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
<h3>TalkHub에 로그인하기</h3>
<p>
    로그인에 실패하셨습니다. 다시 입력해주세요.
</p>
<form action="${pageContext.request.contextPath}/user/login-proceed" method="post">
    <div>
        <label>아이디</label>
        <div>
            <input type="text" name="id" value="${id}"/>
        </div>
    </div>
    <div>
        <label>비밀번호</label>
        <div>
            <input type="password" name="password"/>
        </div>
    </div>
    <p style="color:red; font-size: small">
        ${error}
    </p>
    <div>
        <button type="submit">로그인</button>
    </div>
</form>
</body>
</html>