<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>

<title>qna new jsp</title>
</head>
<body>
<h3>신규 QNA</h3>


<form method="post" enctype = "multipart/form-data" name="writeform" action="/qnaboard/writePro">
	<table>
		<tr>
			<th class="w-px160">제목</th>
			<td><input type="text" name="title" class="need" /></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${login_info.name }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" class="need"></textarea></td>
		</tr>
		<tr>
			<th>파일 첨부</th>
			<td class="left">
				<label>
					<input type="file" name="file" id="attach-file" />
				
				</label>
				<span id="file-name"></span>
				<span id="delete-file" style="color: red; margin-lefT: 20px;"><i class="fas fa-times font-img" ></i></span>
 			</td>
		</tr>
	</table>
</form>
		<tr>      
	 			<td colspan=2 bgcolor="${value_c}" align="center"> 
					<input type="submit" value="글쓰기" >  
			
				<td colspan=2 bgcolor="${value_c}" align="center"> 
					<button type="button" onclick="location.href='list.jsp' ">목록</button>

						
				</td>
		</tr>

<script type="text/javascript" src="js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
</body>
</html>