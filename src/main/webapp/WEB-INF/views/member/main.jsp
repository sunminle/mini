<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
		 <title>signin&signup</title>
  <link href="/resources/css/bloom.css" rel="stylesheet" type="text/css">

  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script language="javascript" src="/resources/js/member.js"></script>
</head>

			<tr>
           <td width="300"  height="20"><h1>메인입니다</h1></td>
           <td rowspan="3"  align="center">
             ${sessionScope.memId}님이 <br>
             방문하셨습니다
             </tr>
<form  method="post" action="/mem/logout">  
             <input type="submit"  value="로그아웃" size="8" maxlength="12">
             <a href="/mem/deleteForm">탈퇴</a>
             <input type="button" value="회원정보변경" onclick="javascript:window.location='/mem/modifyForm'" size="8" maxlength="12">
             
</form>
