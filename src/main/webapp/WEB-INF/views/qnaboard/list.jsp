<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="resources/css/common.css">


<body>
		<center>
			<b>글 목록</b>
			
			<ul>
			<tr height="30">
			<input type = "button" value = "글쓰기"  align="right" onclick = "window:location='writeForm'">
			</tr>
			
			<table width="700">
			
				<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
				    <tr height="30" bgcolor="#fff0f0"> 
						<td align="center"  width="30"  >번 호</td> 
						<td align="center"  width="150" >작성일</td> 
						<td align="center"  width="100" >작성자</td>
						<td align="center"  width="350" >제 목</td> 
						
				    </tr>
				    
				   <c:forEach var = "list" items = "${list}">
					 <tr height="70" bgcolor="#fff0f0">
						    <td align="center"  width="200"><a href="view?num=${list.num}">${list.num}</td>
						    <td align="center"  width="200">${list.reg_date}</td>
						    <td align="center"  width="200">${list.writer}</td>
						    <td align="center" width="200"><a href="view?num=${list.num}">${list.title}</td>
						   
						</tr>
					</c:forEach>
				</table>
			</ul>
	
	</body>
</html>














