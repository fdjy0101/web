<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패커|로그인</title>
<%@ include file="include/header.jsp" %>
<link href="${path}/resources/css/login.css" rel="stylesheet" />
</head>
<body class="my-login-page">
<section class="h-100">
  <div class="container h-100">
    <div class="row justify-content-md-center h-100">
      <div class="card-wrapper">
        <div class="brand">
          <a href="${path}"><img src="${path}/resources/images/logo.png"></a>
        </div>
        <div class="card fat">
          <div class="card-body">
            <h4 class="card-title text-center text-dark">Welcome to 패커</h4>
			<form method="post" id="loginForm" action="login">
			<div class="form-group">
			  <label for="user_id" class="control-label">아이디</label>
			  <input type="text" class="form-control" id="user_id" name="user_id" placeholder="ID">
			</div>
			<div class="form-group">
			  <label for="user_pw" class="control-label">비밀번호</label>
			  <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="PASSWORD">
			</div>
			<c:if test="${msg == false}">
			  <div><p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p></div>
			</c:if>
			<div class="form-group no-margin">
			  <button type="submit" class="btn btn-info btn-block">로그인</button>
			</div>
		    </form>
		  </div>
		</div>
		<div class="footer">
		  Copyright © <a href="${path}" class="badge badge-info">패커</a>
		  <p>배너를 누르면 홈으로 이동합니다.</p>
		</div>
	  </div>
    </div>
  </div>
</section>

<!--<form name='homeForm' method="post" action="/login">
    <c:if test="${member == null}">
      <div>
        <label for="user_id"></label>
        <input type="text" id="user_id" name="user_id">
      </div>
      <div>
        <label for="user_pw"></label>
        <input type="password" id="user_pw" name="user_pw">
      </div>
      <div>
        <button type="submit">로그인</button>
        <button id="registerBtn" type="button">회원가입</button>
      </div>
    </c:if>
    <c:if test="${member != null }">
      <div>
        <p>${member.user_id}님 환영 합니다.</p>
        <button id="memberUpdateBtn" type="button">회원정보수정</button>
        <button id="logoutBtn" type="button">로그아웃</button>
        <button id="memberDeleteBtn" type="button">회원탈퇴</button>
      </div>
    </c:if>
    <c:if test="${msg == false}">
      <p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
    </c:if>
  </form>
  
  -->
  
</body>
</html>