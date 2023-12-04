<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>회원정보수정</title>
<link href="/resources/css/bloom.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="/resources/js/member.js"></script>
<body>
<form method="post" action="/mem/modifyPro" name="userinput" onsubmit="return modifyCheckIt()">

  <table width="600" border="1" cellspacing="0" cellpadding="3"  align="center">
    <tr > 
      <td  colspan="2" height="39" bgcolor="${title_c}" align="center">
	     <font size="+1" ><b>회원 정보수정</b></font></td>
    </tr>
    <tr>
      <td colspan="2" class="normal" align="center">회원의 정보 수정</td>
    </tr>
     <tr> 
      <td width="200"><b>id 입력</b></td>
      <td width="400">&nbsp;</td>
    <tr>  

    <tr> 
      <td  width="200"> 사용자 ID</td>
      <td  width="400">${dto.id}</td>
    </tr>
    
     <tr> 
      <td width="200"> 비밀번호</td>
      <td width="400"> 
        <input type="password" name="passwd" size="10" maxlength="10" value="${dto.passwd}">
      </td>
    <tr>  
    <tr> 
      <td  width="200" ><b>개인정보 입력</b></td>
      <td width="400" >&nbsp;</td>
    <tr>  
    <tr> 
      <td   width="200">이름</td>
      <td  width="400"> 
        <input type="text" name="name" size="15" maxlength="20" value="${dto.name}">
      </td>
    </tr>
    <tr> 
      <td   width="200">이름</td>
      <td  width="400"> 
        <input type="text" name="nickname" size="15" maxlength="20" value="${dto.nickname}">
      </td>
    <tr> 
      <td   width="200">이름</td>
      <td  width="400"> 
        <input type="text" name="introduce" size="15" maxlength="20" value="${dto.introduce}">
      </td>
   	
      </td>
    </tr>
         
    <tr> 
      <td colspan="2" align="center" bgcolor="${value_c}"> 
       <input type="submit" name="modify" value="수   정" >
       <input type="button" value="취  소" onclick="javascript:window.location='/mem/main'">      
      </td>
    </tr>
  </table>
</form>
</body>

</html>