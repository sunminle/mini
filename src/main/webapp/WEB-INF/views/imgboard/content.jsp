<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
	<script>
        function confirmDelete() {
            var result = confirm("글을 삭제하시겠습니까?");
            if (result) {
                window.location="/imgboard/deletePro?num=${num}"
            } else {
                alert("삭제가 취소되었습니다.");
            }
        }
    </script>


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

        h2 input[type="button"] {
            margin-top: 20px;
            padding: 10px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        h2 input[type="button"]:hover {
            background-color: #0056b3;
        }

        h2 a {
            color: #007bff;
            text-decoration: none;
        }

        h2 a:hover {
            text-decoration: underline;
        }

        form {
            margin-top: 20px;
        }

        textarea {
            width: 100%;
            height: 100px;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            padding: 10px;
            font-size: 16px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        hr {
            border: 1px solid #ddd;
            margin-bottom: 10px;
        }

        .review-list {
            margin-top: 20px;
        }

        .review-item {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .nickname, .comment, .date {
            margin: 0;
        }

        hr {
            border: 1px solid #ddd;
            margin-top: 10px;
            margin-bottom: 10px;
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
        <h2><input type="button" value="뒤로가기" onclick="window:location='/imgboard/list?pageNum=${pageNum}'"></h2>
        <h2><input type="button" value="글 삭제" onclick="confirmDelete()"></h2>
        <h2>Review</h2>
        <c:if test="${dto.review > 0}">
            <a>${dto.review}개의 리뷰가 있습니다.</a>
        </c:if>
        <c:if test="${dto.review == 0}">
            <a>등록된 댓글이 없습니다.</a> <br/> <br/>
            <a>가장 먼저 댓글을 등록해보세요!!</a>
        </c:if>
        <form method="post" name="reviewform" action="/imgboard/reviewPro">
            <textarea  name="content"></textarea>
            <input type="hidden" value="${num}" name="imgboardnum">
            <input type="hidden" value="${pageNum}" name="pageNum">
            <input type="hidden" value="testID" name="id">
            <input type="submit" value="댓글 등록">
        </form>
        <br/>
      <c:if test="${!empty reviewList}">
    <div class="review-list">
        <h2>리뷰 목록</h2>
        <table>
            <thead>
                <tr>
                    <th>닉네임</th>
                    <th>댓글내용</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="review" items="${reviewList}">
                    <tr class="review-item">
                        <td class="nickname" style="width: 80px;">${review.id}</td>
                        <td class="comment" style="white-space: pre-line;">${review.content}</td>
                        <td class="date" style="width: 100px;"><fmt:formatDate value="${review.reg_date}" pattern="yyyy-MM-dd HH:mm"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</c:if>

    </div>

</body>
</html>