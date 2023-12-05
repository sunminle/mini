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
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <span class="d-block d-lg-none">Clarence Taylor</span>
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="/resources/file/profile/profile.png" alt="..." /></span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#notice">NOTICE</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#board">BOARD</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#qna">Q&A</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#visitors">VISITORS</a></li>
                </ul>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container-fluid p-0">
            <!-- About-->
            <section class="resume-section" id="notice">
                <div class="resume-section-content">
                    <h1 class="mb-0 ">
                        <span class="text-primary">NOTICE</span>
                    </h1>
            <div class="d-flex subheading mb-5 justify-content-between">
               <div>This is notice board, if you have any question, here's <a href="#Q&A">Q&A BOARD</a></div>
               
               <!-- 로그인/로그아웃 상태일때 -->
               <c:choose>
                  <c:when test="${empty sessionScope.memId}">
                     <span class="text-end"><small><a href="/mem/signInUp" target="_blank">LOGIN</a></small></span>
                  </c:when>
                  <c:when test="${not empty sessionScope.memId}">
                     <span class="text-end"><small>Hi, ${memId }!</small></span>
                  </c:when>
               </c:choose>
            </div>

            <div id="noticeBoard" class="d-flex justify-content-center">
               <div class="w-100">
                  <table class="table text-center">
                     <thead>
                        <tr>
                           <th>No.</th>
                           <th>Title</th>
                           <th>Reg date</th>
                           <th>Count</th>
                           <!-- 관리자일때만 보이게 -->
                           <c:if test="${sessionScope.memId == 'admin' }">
                              <th>mng</th>
                           </c:if>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach items="${nList}" var="notice" varStatus="status">
                           <tr>
                              <td>${notice.num}</td>
                              <td><a href="/notice/notice_view?noticeId=${notice.num}">${notice.title}</a></td>
                              <td><fmt:formatDate value="${notice.reg_date}" pattern="yy-MM-dd a hh시" /></td>
                              <td>${notice.readcount}</td>
                              <!-- 관리자일때만 보이게 -->
                              <c:if test="${sessionScope.memId == 'admin' }">
                                 <td><button class="btn btn-danger deleteBtn" data-notice-num="${notice.num}">Delete</button></td>
                              </c:if>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>

                  <%-- ------------페이징-------------- --%>
                  <div class="d-flex justify-content-center">
                     <c:if test="${prevId ne 0}">
                        <a href="/post/post_list_view?prevId=${prevId}" class="mr-5">&lt;&lt;prev</a>
                     </c:if>
                     <c:if test="${nextId ne 0}">
                        <a href="/post/post_list_view?nextId=${nextId}">next&gt;&gt;</a>
                     </c:if>

                  </div>
                  
                  <!-- 관리자일시 글쓰기 버튼이 보이게 -->
                  <c:if test="${sessionScope.memId == 'admin' }">
                  <div class="d-flex justify-content-end">
                     <a href="/notice/posting" class="btn btn-info">post</a>
                  </div>
                  </c:if>
               </div>
            </div>

            <div class="social-icons">
                        <a class="social-icon" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        <a class="social-icon" href="#!"><i class="fab fa-github"></i></a>
                        <a class="social-icon" href="#!"><i class="fab fa-twitter"></i></a>
                        <a class="social-icon" href="#!"><i class="fab fa-facebook-f"></i></a>
                    </div>
                </div>
            </section>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
    </body>
    
    <script>
    $(document).ready(function(){
       
      ////////////////글삭제///////////////
       $('.deleteBtn').on('click',function(){
          let noticeNum = $(this).data('notice-num');
          console.log('삭제포스트 :',noticeNum);
          
          if (window.confirm("정말 삭제 하시겠습니까?")) {
              $.ajax({
                //rq
                dataType:"JSON",
                type:"DELETE"
                ,url:"/notice/board/delete?noticeNum="+noticeNum
                //rs
                ,success:function(data){
                   if(data.result == '성공'){
                      alert('삭제되었습니다.');
                      location.href="/notice/board";
                   }else{
                      alert(data.errorMessage);
                   }
                },error:function(e){
                   console.log('공지삭제실패');
                }
             });
           } else {
            console.log("취소");
           }
       });
       ////////////////글삭제////////////////
    });
    </script>
</html>