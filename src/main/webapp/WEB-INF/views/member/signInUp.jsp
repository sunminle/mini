<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
		 <title>signin&signup</title>
  <link href="/resources/css/bloom.css" rel="stylesheet" type="text/css">
  <!-- jQuery 라이브러리 로드 -->
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <script language="javascript" src="/resources/js/member.js"></script>
</head>
	
<body>
<div class="container">
  <div class="welcome">
    <div class="pinkbox">
      <div class="signup nodisplay">
        <h1>sign up</h1>
        <form method="post" action="/mem/inputPro" name="userinput" onSubmit="return checkIt()" autocomplete="off">
          <input type="text" name="id" placeholder="id">
          <input type="button" name="confirm_id" value="ID중복확인" 
        			        OnClick="openConfirmid(this.form)">
          <input type="password" name="passwd" placeholder="password">
          <input type="password" name="passwd2" placeholder="password check">
          <input type="text" name="name" placeholder="name">
          <input type="text" name="nickname" placeholder="nickname">
           <input type="text" name="introduce" placeholder="introduce">
          <input type="submit" name="confirm" value="등   록" >
          <input type="button" value="가입안함" onclick="javascript:window.location='/mem/signInUp'">
        </form>
      </div>
      
      <div class="signin">
        <h1>sign in</h1>
        <form id="myform" name="myform" class="more-padding" method="post" action="/mem/loginPro" onSubmit="return beginCheckIt()" autocomplete="off">
          <input type="text" placeholder="id" name="id">
          <input type="password" placeholder="password" name="passwd">
          <div class="checkbox">
            <input type="checkbox" id="remember" /><label for="remember">remember me</label>
          </div>

          <input type="submit"  value="login">
        </form>
      </div>
    </div>
    <div class="leftbox">
      <h2 class="title"><span>BLOG</span>&<br>login</h2>
      <p class="desc"> Have a nice <span>day</span></p>
      <img class="flower smaller" src="https://image.ibb.co/d5X6pn/1357d638624297b.jpg" alt="1357d638624297b" border="0">
      <p class="account">have an account?</p>
      <button class="button" id="signin">login</button>
    </div>
    <div class="rightbox">
      <h2 class="title"><span>BLOG</span>&<br>sign up</h2>
      <p class="desc"> Wellcome To The <span>Family</span></p>
      <img class="flower" src="https://preview.ibb.co/jvu2Un/0057c1c1bab51a0.jpg"/>
      <p class="account">don't have an account?</p>
      <button class="button" id="signup">sign up</button>
    </div>
  </div>
 </div>

</div>

</body>