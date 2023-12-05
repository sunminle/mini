<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:if test="${id == null}">
	<script>
		alert("로그인후 사용가능합니다.")
		history.go(-1);
	</script>
</c:if>
<c:if test="${id != null}">
	<center>
		<b>글쓰기</b>
			<form method="post" enctype = "multipart/form-data" name="writeform" action="/imgboard/writePro">
				<input type = "hidden" name = "writer" value = "${id}">
				<table width = "800" border = "1" align = "center">
					<tr>
						<td width = "140" align = "center"> 제목 </td>
						<td width = "660"> <input type = "text" size="90" maxlength="100"name = "title"> </td>
					</tr>
					<tr>
						<td width = "140" align = "center"> 파일첨부 </td>
						<td width = "660"> <input type = "file" size = "90" name = "files" accept="image/*"></td>
					</tr>
					<tr>
						<td width = "140" align = "center"> 파일첨부 </td>
						<td width = "660"> <input type = "file" size = "90" name = "files" accept="image/*"></td>
					</tr>
					<tr>
						<td width = "140" align = "center"> 파일첨부 </td>
						<td width = "660"> <input type = "file" size = "90" name = "files" accept="image/*"></td>
					</tr>
					<tr>
						<td width = "140" align = "center"> 파일첨부 </td>
						<td width = "660"> <input type = "file" size = "90" name = "files" accept="image/*"></td>
					</tr>
					<tr>
						<td width = "140" align = "center"> 파일첨부 </td>
						<td width = "660"> <input type = "file" size = "90" name = "files" accept="image/*"></td>
					</tr>
					<tr>
						<td width = "140" align = "center"> 내용 </td>
						<td width = "660"> <textarea rows="26" cols="92" name = "content"></textarea> </td>
					</tr>
				</table>
			<input type = "submit" value = "작성완료">
		</form>
	</center>
</c:if>