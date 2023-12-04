<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<center><b>글수정</b>
<form method="post" enctype = "multipart/form-data" name="updateform" action="/imgboard/updatePro?num=${num}&pageNum=${pageNum}">
<table width = "800" border = "1" align = "center">
	<tr>
		<td width = "140" align = "center"> 제목 </td>
		<td width = "660"> <input type = "text" size="90" maxlength="100" value = "${dto.title}" name = "title"> </td>
	</tr>
	<tr>
		<td width = "140" align = "center"> 내용 </td>
		<td width = "660"> <textarea rows="26" cols="92" name = "content">${dto.content}</textarea> </td>
	</tr>
	<tr>
		<td width = "140" align = "center"> 첨부된 이미지 </td>
		<td width = "660"> 
			<c:if test="${empty fileNameList}"> 첨부된 이미지가 없습니다. </c:if>
			<c:if test="${!empty fileNameList}">
				<c:forEach var = "fileName" items = "${fileNameList}">
					<img src="/resources/file/imgBoard/${fileName}">	
					<input type ="button" value = "이미지삭제" onclick = "window.location='/imgboard/deleteFile?pageNum=${pageNum}&imgboardnum=${num}&filename=${fileName}'" >
				</c:forEach>
			</c:if>
		</td>
	</tr>
</table>
<input type = "submit" value = "수정하기">
</form>
</center>
