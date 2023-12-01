<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: '맑은 고딕', sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2, h3 {
            color: #343a40;
        }

        .image-card {
            margin: 20px 0;
            padding: 15px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }

        .no-image {
            color: #777;
            font-style: italic;
        }
    </style>
</head>
<body>

    <div class="container">

        <h2>${dto.title}</h2>
        <h3>작성자 : ${dto.writer}</h3>
        <h3>작성일 : <fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd HH:mm"/></h3>

        <c:if test="${fileNameList != null && not empty fileNameList}">
            <c:forEach var="fileName" items="${fileNameList}">
                <div class="image-card">
                    <img src="/resources/file/imgBoard/${fileName}" alt="X">
                </div>
            </c:forEach>
        </c:if>

        <c:if test="${empty fileNameList}">
            <p class="no-image">사진을 첨부하지 않은 게시물입니다.</p>
        </c:if>

        <h2>내용</h2>
        <p>${dto.content}</p>
        <h2>Review</h2>
        <form method="post" name="reviewform" action="/imgboard/reviewPro">
		<textarea  name ="content"></textarea>
		<input type = "hidden" value = "${num}" name = "num">
		<input type = "submit" value = "등록">
		</form>
    </div>

</body>
</html>