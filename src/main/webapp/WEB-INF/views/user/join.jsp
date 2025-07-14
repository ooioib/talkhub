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

        /* 입력 필드와 버튼 간격 조정 */
        form > div {
            margin-bottom: 10px;
        }

        /* 성별과 출생년도 한 줄에 정렬 */
        .inline-group {
            display: flex;
            gap: 10px;
            justify-content: center;
        }
    </style>
</head>
<body>
<h1>TalkHub</h1>
<div>
    <h2>토크허브에 회원가입하기</h2>
    <p><b>TalkHub</b>에 가입하고 자유롭게 이야기하세요!</p>
        <p>다양한 주제에 대해 토론하고, 새로운 사람들과 소통할 수 있습니다.</p>
    <form action="${pageContext.request.contextPath}/user/join-proceed" method="post">
        <div>
            <label>아이디(*)</label>
            <div>
                <input type="text" name="id"/>
            </div>
        </div>
        <div>
            <label>비밀번호(*)</label>
            <div>
                <input type="password" name="password"/>
            </div>
        </div>
        <div>
            <label>활동명(*)</label>
            <div>
                <input type="text" name="nickname"/>
            </div>
        </div>
        <div class="inline-group">
            <div>
                <label>성별(*)</label>
                <select name="gender">
                    <option value="남">남</option>
                    <option value="여">여</option>
                    <option value="비공개">비공개</option>
                </select>
            </div>
            <div>
                <label>출생년도(*)</label>
                <select name="birth">
                    <c:forEach var="i" begin="1970" end="2025">
                        <option value="${i}">${i}년</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div>
            <button type="submit">가입하기</button>
        </div>
    </form>
</div>
</body>
</html>