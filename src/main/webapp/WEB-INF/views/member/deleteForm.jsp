<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>회원탈퇴</title>
<link href="/resources/css/bloom.css" rel="stylesheet" type="text/css">
   <script language="javascript" src="/resources/js/member.js"></script>
</head>

<BODY onload="begin()">
<form name="myform" action="/mem/deletePro" method="post" onSubmit="return deleteCheckIt()">
<TABLE cellSpacing=1 cellPadding=1 width="260" border=1 align="center" >
  
  <TR height="30">
    <TD colspan="2" align="middle">
	  <font size="+1" ><b>회원 탈퇴</b></font></TD></TR>
  
  <TR height="30">
    <TD width="110" align=center>비밀번호</TD>
    <TD width="150" align=center>
      <INPUT type=password name="passwd"  size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD colspan="2" align="middle" >
      <INPUT type=submit value="회원탈퇴"> 
      <input type="button" value="취  소" onclick="javascript:window.location='/mem/main'"></TD></TR>
</TABLE>
</form>
</BODY>
</HTML>
