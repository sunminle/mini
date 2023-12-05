<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
		 <title>signin&signup</title>
		 <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
form {
  display: flex;
  align-items: center;
  flex-direction: column;
  padding-top: 7px;
}
.flower {
  width: 180px;
  height: 180px;
  
}

</style>
  <script language="javascript" src="/resources/js/member.js"></script>
</head>

<td width="300"  height="20"><h1>메인입니다</h1></td>
<center>
<img class="flower" src="https://preview.ibb.co/jvu2Un/0057c1c1bab51a0.jpg"/>  
</center>
           <c:if test="${sessionScope.memId == null }">
           <h3>로그인 해주세요</h3>
           <div style="display:block">
           <input  style="text-align:center; display:block; margin: 0 auto;  color: #ce7d88; background: #EAC7CC; border: none;" type = "button" value = "로그인" onclick = "window.location='/mem/signInUp'">
           </div>
          </c:if>
<c:if test="${sessionScope.memId != null }">
			
            
<form  method="post" action="/mem/logout">
 <h3>${sessionScope.memId}님이 
             방문하셨습니다  </h3>
             <br />
             <input type="submit"  value="로그아웃" style="color: #ce7d88; background: #EAC7CC; border: none; border-bottom: 1px solid rgba(246, 246, 246, 0.5); padding: 5px;" >
             
</form>
<div style="display:block">
<input style="text-align:center; display:block; margin: 0 auto; color: #ce7d88; background: #EAC7CC; border: none; border-bottom: 1px solid rgba(246, 246, 246, 0.5); padding: 5px;" type="button" value="회원정보변경" onclick="javascript:window.location='/mem/modifyForm'" > <br />
             <input style="text-align:center; display:block; margin: 0 auto; color: #ce7d88; background: #EAC7CC; border: none; border-bottom: 1px solid rgba(246, 246, 246, 0.5); padding: 5px;" type = "button" value = "탈퇴" onclick = "window.location='/mem/deleteForm'"> <br />
             <input style="text-align:center; display:block; margin: 0 auto; color: #ce7d88; background: #EAC7CC; border: none; border-bottom: 1px solid rgba(246, 246, 246, 0.5); padding: 5px;" type = "button" value = "이미지게시판" onclick = "window.location='/imgboard/list'"> <br />
<input style="text-align:center; display:block; margin: 0 auto; color: #ce7d88; background: #EAC7CC; border: none; border-bottom: 1px solid rgba(246, 246, 246, 0.5); padding: 5px;" type = "button" value = "방명록" onclick = "window.location='/gu/guest'"> <br />
<input style="text-align:center; display:block; margin: 0 auto; color: #ce7d88; background: #EAC7CC; border: none; border-bottom: 1px solid rgba(246, 246, 246, 0.5); padding: 5px;" type = "button" value = "Q&A게시판" onclick = "window.location='/list'"> <br />
<input style="text-align:center; display:block; margin: 0 auto; color: #ce7d88; background: #EAC7CC; border: none; border-bottom: 1px solid rgba(246, 246, 246, 0.5); padding: 5px;" type = "button" value = "공지게시판" onclick = "window.location='/notice/board'"> <br />
</div>

</c:if>
