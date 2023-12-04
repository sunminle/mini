<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Guest Book</title>
</head>
<body>

<h1>Guest Book</h1>

<form method="post" action="/gu/writePro" name="writeform">
    이름 : <input type="text" name="id"> <br/>
    passwd : <input type="password" name="passwd"><br/>
    content : <input type="text" name="content"><br/>
    <input type="submit" value="글쓰기">
</form>

<hr>

<c:forEach var="guest" items="${guestList}">
    <div>
    	<p>${guest.num}</p>
        <h2>작성자: ${guest.id}</h2>
        <p>내용: ${guest.content}</p>
        <p>${guest.reg_date}</p>
        
        <form method="get" action="/gu/updateForm">
            <input type="hidden" name="num" value="${guest.num}">
            <input type="submit" value="수정">
        </form>

        <form method="post" action="/gu/deleteForm">
            <input type="hidden" name="num" value="${guest.num}">
            <input type="submit" value="삭제">
        </form>
    </div>
    <hr>
</c:forEach>

</body>
</html>
