<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style type="text/css">
li {list-style: none; display:inline; padding: 6px;}
</style>

<ul>
  <li><a href="${path}">홈</a></li>
  <li><a href="${path}/board/list">목록</a></li>
  <li><a href="${path}/board/writeView">글 작성</a></li>
  <li>
    <c:if test="${member != null}"><a href="${path}/logout">로그아웃</a></c:if>
    <c:if test="${member == null}"><a href="${path}/loginView">로그인</a></c:if>
  </li>
  <li>
    <c:if test="${member != null}">
      <p>${member.user_id}님 안녕하세요.</p>
    </c:if>
  </li>
</ul>
