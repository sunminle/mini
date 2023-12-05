<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="resources/css/common.css">

<body>
	<h3>글 내용보기</h3>

	<div>
		<input type="button" value="글쓰기" align="right"
			onclick="window:location='writeForm'">
	</div>


	<table border="1" width="700" cellpadding="0" cellspacing="0"
		align="center">
		<tr height="30" bgcolor="#fff0f0">
			<td align="center" width="30">번 호</td>
			<td align="center" width="350">제 목</td>
			<td align="center" width="100">작성자</td>
			<td align="center" width="500">내 용</td>
			<td align="center" width="150">작성일</td>
		</tr>


		<tr height="70" bgcolor="#fff0f0">
			<td align="center" width="200">${dto.num}</td>
			<td align="center" width="200">${dto.title}</td>
			<td align="center" width="200">${dto.writer}</td>
			<td align="center" width="200">${dto.content}</td>
			<td align="center" width="200">${dto.reg_date}</td>
		</tr>
	</table>
	<div>
		<input type="button" value="수정" align="center"
			onclick="window:location=''">
	</div>
	<div>
		<input type="button" value="삭제" align="center"
			onclick="window:location=''">
	</div>


	<!-- 댓글 -->

	<!-- 관리자로 로그인 해야 댓글달기 폼 보이게 -->
	<c:if test="${status == 100}">

		<h3>답글 쓰기</h3>

		<form method="post" enctype="multipart/form-data" name="writeform"
			action="replyPro">
			<table bgcolor="#fff0f0">

				<tr>
					<th class="w-px160">제목</th>
					<td><input type="text" name="title" class="need" /></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>관리자</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" class="need"></textarea></td>
				</tr>

			</table>
		</form>

		<tr>
			<td colspan=2 align="center"><input type="submit" value="저장">
			<td colspan=2 align="center">
				<button type="button" onclick="window:location='list'">취소</button>

			</td>
		</tr>
	</c:if>
</body>













