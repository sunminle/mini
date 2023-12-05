<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Guest Book</title>
     <style type="text/css">
 body {
  background: #CBC0D3;
}
h1 {
  font-family: "Open Sans", sans-serif;
  text-align: center;
  margin-top: 95px;
  text-transform: uppercase;
  color: #f6f6f6;
  font-size: 2em;
  letter-spacing: 8px;
}
h3 {
  font-family: "Open Sans", sans-serif;
  text-align: center;
  margin-top: 95px;
  text-transform: uppercase;
  color: #f6f6f6;
  font-size: 1em;
  letter-spacing: 8px;
}
h5 {
  font-family: "Open Sans", sans-serif;
  text-align: center;
  margin-top: 10px;
  text-transform: uppercase;
  color: #f6f6f6;
  font-size: 1em;
  letter-spacing: 8px;
}
form {
  display: flex;
  align-items: center;
  flex-direction: column;
  padding-top: 7px;
}
p {
  font-family: "Open Sans", sans-serif;
  font-size: 0.7em;
  letter-spacing: 2px;
  color: #8E9AAF;
  text-align: center;
}

</style>
</head>
<body>

<h1>Guest Book</h1>
<c:if test="${sessionScope.memId != null }">
<form method="post" action="/gu/writePro" name="writeform">
   <h5> id </h5> <input type="text" name="id" value="${sessionScope.memId}" style="border: none" /> <br/>
   <h5> passwd </h5> <input type="password" name="passwd" style="border: none" ><br/>
   <h5> content </h5> <input type="text" name="content" style="border: none; width : 300px; height : 100px;" ><br/>
    <input type="submit" value="글쓰기"  style="color: #ce7d88; background: #EAC7CC; border: none;">
</form>
</c:if>
<br />
    <input style="text-align:center; display:block; margin: 0 auto; color: #ce7d88; background: #EAC7CC; border: none;" type="button" value="메인" onclick="javascript:window.location='/mem/main'" >


<hr>

<c:forEach var="guest" items="${guestList}">
    <div>
    	<p>${guest.num}</p>
        <h3>작성자: ${guest.id}</h3>
        <p> ${guest.content}</p>
        <p>${guest.reg_date}</p>
        
        <form method="get" action="/gu/updateForm">
            <input type="hidden" name="num" value="${guest.num}">
            <input type="submit" value="수정" style="color: #ce7d88; background: #EAC7CC; border: none;">
        </form>

        <form method="post" action="/gu/deleteForm">
            <input type="hidden" name="num" value="${guest.num}">
            <input type="submit" value="삭제" style="color: #ce7d88; background: #EAC7CC; border: none;">
        </form>
    </div>
    <hr>
</c:forEach>

</body>
</html>
