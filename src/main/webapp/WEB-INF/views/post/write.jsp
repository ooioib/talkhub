<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 25. 3. 6.
  Time: 오후 4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TalkHub</title>
</head>
<body>

<div>
    <h1>TalkHub</h1>
    <h2>글 작성하기</h2>

    <form action="${pageContext.request.contextPath}/post/write-proceed" method="post">
        <div>
            <label>카테고리</label>
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
            <label>제목</label>
            <div>
                <input type="text" name="title"/>
            </div>
        </div>
        <div>
            <label>내용</label>
            <div>
                <textarea name="content"></textarea>
            </div>
        </div>
        <div >
            <button type="submit">등록하기</button>
        </div>
    </form>
</div>

</body>
</html>
