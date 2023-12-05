<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>회원탈퇴</title>
<link href="/resources/css/bloom.css" rel="stylesheet" type="text/css">
</head>


<c:if test="${check == 1}">
<body >
<form method="post" action="/mem/main" name="userinput" >
<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr> 
    <td height="39" align="center">
	  <font size="+1" ><b>회원정보가 삭제되었습니다.</b></font></td>
  </tr>
  <tr>
    <td align="center"> 
      <p>회원 탈퇴가 완료되었습니다.</p>
      <meta http-equiv="Refresh" content="5;url=/mem/main" >
    </td>
  </tr>
  <tr>
    <td align="center"> 
      <input type="submit" value="확인" >
    </td>
  </tr>
</table>
</form>
</c:if>
<c:if test="${check != 1}">
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
</c:if>

</body>
</html>
