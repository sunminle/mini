<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
  body {
    font-family: Arial, sans-serif;
  }

  .board-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
  }

  .card {
    width: 300px;
    margin: 10px;
    padding: 15px;
    border: 1px solid #ccc;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  .card img {
    max-width: 100%;
    height: auto;
    border-radius: 4px;
  }
  
  .write-button {
    margin-bottom: 20px;
    padding: 10px;
    font-size: 16px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }
  
  .pagination a {
    display: inline-block;
    padding: 8px 16px;
    text-decoration: none;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin: 0 4px;
  }
  
</style>

<div class="board-container">
  <c:if test="${count == 0}">
    <center>
      <h2>등록된 게시글이 없습니다.</h2>
      <h2>첫 게시글의 작성자가 되어주세요!</h2>
      <h2><input type="button" value="글쓰기" onclick="window:location='/imgboard/writeForm'" class="write-button"></h2>
    </center>
  </c:if>

  <c:if test="${count > 0}">
    <center>
      <h2>${count}개의 게시글이 있습니다.</h2>
      <input type="button" value="글쓰기" onclick="window:location='/imgboard/writeForm'" class="write-button">
    </center>
    <div class="board-container">
      <c:forEach var="list" items="${list}">
        <div class="card">
          <p>작성자: ${list.writer}</p>
          <p>작성일: <fmt:formatDate value="${list.reg_date}" pattern="yyyy-MM-dd HH:mm"/></p>
          <p>조회수: ${list.readcount}</p>
          <center>
            <a href="/imgboard/content?num=${list.num}&pageNum=${pageNum}">
              <img  src="/resources/file/imgBoard/${list.firstimg}" alt="X" style="max-width: 300px; max-height: 200px;">
              <p>${list.title}</p>
            </a>
          </center>
        </div>
      </c:forEach>
    </div>
  </c:if>

  
  
<div class="pagination">  

    <c:if test="${startPage > 10 }">
      <a href="/imgboard/list?pageNum=${startPage - 10}">[이전]</a>
    </c:if>
    <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
      <a href="/imgboard/list?pageNum=${i}">[${i}]</a>
    </c:forEach>
    <c:if test="${endPage < pageCount}">
      <a href="/imgboard/list?pageNum=${startPage + 10}">[다음]</a>
    </c:if>

</div>
</div>