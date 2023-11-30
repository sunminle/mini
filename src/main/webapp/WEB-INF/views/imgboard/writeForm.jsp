<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" enctype = "multipart/form-data" name="writeform" action="/imgboard/writePro">
<input type = "hidden" name = "writer" value = "writer">
<input type = "text" name = "title"><br/>
<input type = "text" name = "content"><br/>
<input type = "submit" value = "작성완료">
</form>