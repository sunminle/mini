<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Notice</title>
        <link rel="icon" type="image/x-icon" href="/resources/file/profile/favicon.ico" />
        
        <!-- bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
		<a class="navbar-brand js-scroll-trigger" href="#page-top"> <span class="d-block d-lg-none">Clarence Taylor</span> <span class="d-none d-lg-block"><img
				class="img-fluid img-profile rounded-circle mx-auto mb-2" src="/resources/file/profile/profile.png" alt="..."
			/></span>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="/notice/board">NOTICE</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#experience">BOARD</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#education">Q&A</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#skills">VISITORS</a></li>
			</ul>
		</div>
	</nav>


	<section class="resume-section" id="notice">
		<div class="resume-section-content">
			<h2 class="mb-5">NOTICE</h2>
			<div class="d-flex flex-column flex-md-row justify-content-between mb-5">
				<div class="flex-grow-1">
					<h3 class="mb-0">${notice.title} </h3>
					<div class="subheading mb-3">${notice.writer }</div>
					<hr>
					<c:if test="${not empty notice.img}">
						<div class="mb-3">
							<img src="/resources/file/notice/${notice.img}" alt="업로드 이미지" width="1000px">
						</div>
					</c:if>
					<p>${notice.content }</p>
				</div>
				<div class="flex-shrink-0">
					<span class="text-primary">${notice.reg_date }</span>
				</div>
			</div>
		</div>
	</section>


	<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
    </body>
</html>
