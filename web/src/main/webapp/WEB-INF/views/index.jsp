<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패커</title>
<%@ include file="include/header.jsp" %>
</head>
<body>
<!--banner start here-->
  <div class="jumbotron text-center" style="margin-bottom:0; background: #dbcc00;">
    <h1>패커</h1>
    <p>Fashion Community</p>
  </div>
    
  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="${path}">패커</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarToggler">
      <span class="navbar-toggler-icon"></span>
    </button>
      <div class="collapse navbar-collapse" id="navbarToggler">
        <ul class="navbar-nav">
        <c:if test="${member == null}">
          <li class="nav-item">
            <a class="nav-link" href="loginView">로그인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="member_join">회원가입</a>
          </li>
        </c:if>
        <c:if test="${member != null}">
          <li class="nav-item">
            <a class="nav-link disabled" style="color: #dbcc00;">${member.user_id}님 환영 합니다.</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="memberUpdateView">마이 페이지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout">로그아웃</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="memberDeleteView">회원탈퇴</a>
          </li>
        </c:if>
       <!-- <c:if test="${msg == false}">
          <p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
        </c:if> --> 
          <li class="nav-item">
            <a class="nav-link" href="#">세일정보</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티</a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="${path}/board/list">자유게시판</a>
              <a class="dropdown-item" href="#">질문게시판</a>
              <a class="dropdown-item" href="#">가입인사</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">데일리룩</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">플리마켓</a>
          </li>
        </ul>
      </div>
  </nav>
  
    <!-- modal -->
    <!-- <div class="modal fade" id="myModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">로그인</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            <form name="login" method="post" action="/login">
            <div class="form-group">
              <label for="id">아이디</label>
              <input type="text" class="signUpInput form-control form-control-lg" id=user_id name="user_id" placeholder="ID" autofocus onkeyup="enterKeyCheck()">
            </div>
            <div class="form-group">
              <label for="pwd">비밀번호</label>
              <input type="password" class="signUpInput form-control form-control-lg" id="user_pw" name="user_pw" placeholder="Password" onkeyup="enterKeyCheck()">
            </div>
            <div class="">
              <a href="#">ID/PW 찾기</a>
            </div>
            <div class="">
              <span>아직 회원이 아니신가요?</span>
              <a href="/member_join">회원가입 하기</a>
            </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="submit" id="loginBtn" class="btn btn-primary">로그인</button>
            <button class="btn btn-danger" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div> -->

  <!--slide show-->
  <div class="carousel slide container" data-ride="carousel" id="demo" style="margin-top:30px">
    <div class="carousel-inner">
    <!-- 슬라이드 쇼 -->
      <div class="carousel-item active">
      <!--가로-->
        <a href="#"><img class="d-block w-100" src="${path}/resources/images/index1.jpg" alt="First slide"></a>
        <div class="carousel-caption d-none d-md-block">
          <h2>SEOUL FASHION WEEK</h2>
          <p>패커가 취재한 서울 패션위크</p>
        </div>
      </div>
      <div class="carousel-item">
        <a href="#"><img class="d-block w-100" src="${path}/resources/images/index2.jpg" alt="Second slide"></a>
        <div class="carousel-caption d-none d-md-block">
          <h2>지속 가능한 패션</h2>
          <p>Easy to throw out<br>Better to throw out</p>
        </div>
      </div>
      <div class="carousel-item">
        <a href="#"><img class="d-block w-100" src="${path}/resources/images/index3.jpg" alt="Third slide"></a>
        <div class="carousel-caption d-none d-md-block">
          <h2>패션 사진의 거장, 피터 린드버그와의 재회</h2>
          <p>작년 타계한 사진작가 피터 린드버그의 전시가 독일 쿤스트팔라스트 뮤지엄에서 열린다.</p>
        </div>
      </div>
    <!-- 인디케이터 -->
    <ul class="carousel-indicators">
      <li data-target="#demo" data-slide-to="0" class="active"></li>
      <li data-target="#demo" data-slide-to="1"></li>
      <li data-target="#demo" data-slide-to="2"></li>
    </ul>
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
      <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
      <span class="carousel-control-next-icon"></span>
    </a>
    <script>
      $('.carousel').carousel({ interval: 3000 })
    </script>
    </div>
  </div>
  
</body>
</html>
