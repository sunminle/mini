<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${status >= 1}">
<c:set var="memId" value="${memberDTO.id}" scope="session"/>
<c:set var="status" value="${status}" scope="session"/>
<c:redirect url="/mem/main.me" />
</c:if>

<c:if test="${status == 0}">
<script> 
	  alert("아이디/비밀번호를 확인 하세요.");
      history.go(-1);
	</script>
</c:if>




