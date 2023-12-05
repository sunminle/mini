<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<input type = "button" value = "글쓰기" onclick = "window:location='/qnaboard/writeForm'">

<c:forEach var = "list" items = "${list}">
	<h2>${list.num}</h2>
	<h2>${list.writer}</h2>
	<h2>${list.title}</h2>
	<h2>${list.content}</h2>
	<hr/>
</c:forEach>