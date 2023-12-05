<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<link rel="stylesheet" href="resources/css/common.css">

<title>QnA 게시판</title>
</head>

<body>

<c:if test="${id == null}">
	<script>
		alert("로그인후 사용가능합니다.")
		history.go(-1);
	</script>
</c:if>
<c:if test="${id != null}">

<h3>신규 QNA</h3>


<form method="post" enctype = "multipart/form-data" name="writeform" action="writePro" >
	<table bgcolor="#fff0f0">
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" name="title" class="need" /></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${list.writer}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" class="need"></textarea></td>
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td width = "960"> <input type = "file" size = "90" name = "files" ></td>
	
		</tr>
	</table>
</form>
		<tr>      
	 			<td colspan=2  align="center"> 
					<input type="submit" value="글쓰기" >  
			
				<td colspan=2  align="center"> 
					<button type="button" onclick = "window:location='list'">목록</button>

						
				</td>
		</tr>


</body>
</c:if>