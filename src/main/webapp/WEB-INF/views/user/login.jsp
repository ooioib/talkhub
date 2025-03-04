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
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/user/login-proceed">
    <div>
        <label>아이디</label>
        <p>
            <input type="text" name="id"/>
        </p>
    </div>
    <div>
        <label>비밀번호</label>
        <p>
            <input type="password" name="password"/>
        </p>
    </div>
    <div>
        <button type="submit">사용자인증</button>
    </div>
</form>
</body>
</html>

