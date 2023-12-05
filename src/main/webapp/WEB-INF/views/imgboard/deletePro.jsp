<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:if test="${check == 1}">
<script>
	alert("삭제되었습니다.");
	window.location="/imgboard/list"
</script>
</c:if>

<c:if test="${check == 0}">
	<script>
		alert("작성자만 삭제할수있습니다.");
		history.go(-1);
	</script>
</c:if>