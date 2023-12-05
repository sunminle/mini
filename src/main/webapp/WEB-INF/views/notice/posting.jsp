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
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
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
				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="">BOARD</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="">Q&A</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger" href="">VISITORS</a></li>
			</ul>
		</div>
	</nav>


	<section class="resume-section d-flex justify-content-center" id="notice">
		
		<div class="w-100">
			<h1>글쓰기</h1>

			<input type="text" id="title" class="form-control" placeholder="제목을 입력해주세요">
			<textarea class="form-control" rows="15" id="content" placeholder="내용을 입력해주세요"></textarea>
			<div class="d-flex justify-content-end my-3">
				<input type="file" id="file" accept=".jpg,.jpeg,.png,.gif">
			</div>

			<div class="d-flex justify-content-between">
				<button type="button" id="postListBtn" class="btn btn-dark">목록</button>
				<div>
					<button type="button" id="clearBtn" class="btn btn-secondary">모두 지우기</button>
					<button type="button" id="postCreateBtn" class="btn btn-primary">저장하기</button>
				</div>
			</div>
		</div>

		<!-- script -->
		<script>
			$(document).ready(function() {

				// 목록버튼 클릭
				$('#postListBtn').on('click', function() {
					location.href = "/notice/board"
				});

				// 모두 지우기 버튼 클릭
				$('#clearBtn').on('click', function() {
					$('#title').val("");
					$('#content').val("");
				});

				// 글 저장 버튼 클릭
				$('#postCreateBtn').on('click', function() {
					let title = $('#title').val().trim();
					let content = $('#content').val();

					if (title == '') {
						alert("제목을 입력하세요");
						return;
					}

					console.log(content);

					let file = $('#file').val();

					// 파일이 업로드 된 경우에만 확장자 체크
					if (file != '') {
						//alert(file.split(".").pop().toLowerCase());
						let ext = file.split(".").pop().toLowerCase();
						if ($.inArray(ext, [ 'jpg', 'jpeg', 'png', 'gif' ]) == -1) { //포함되지 않았다
							alert("이미지 파일만 업로드 가능합니다");
							$('#file').val(""); //파일을 비운다
							return;
						}
					}

					// 서버 - AJAX

					// 이미지를 업로드 할 때는 form태그가 있어야 한다(자바스크립트에서 만듬)
					// append로 넣는 값은 폼태그의 name으로 넣는 것과 같다
					let formData = new FormData();
					formData.append("title", title);
					formData.append("content", content);
					formData.append("file", $('#file')[0].files[0]);//여러개를 올리는거면 배열로 ex)file[1]

					// ajax 통신으로 formData에 있는 데이터 전송
					$.ajax({
						//request
						type : "POST"
						,url : "/notice/board/create"
						,data : formData //form객체를 통째로
						,enctype : "multipart/form-data" //file업로드를 위한 필수설정
						,processData : false //file업로드를 위한 필수설정
						,contentType : false //file업로드를 위한 필수설정

						//response
						,success : function(data) {
							if (data.code == 1) {
								//성공
								alert("메모가 저장되었습니다.");
								location.href = "/notice/board";
							} else {
								//실패
								alert(data.errorMessage);
							}
						},
						error : function(e) {
							console.log("메모 저장에 실패했습니다.")
						}
					});

				});

			});
		</script>
	</section>


	<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
    </body>
</html>
