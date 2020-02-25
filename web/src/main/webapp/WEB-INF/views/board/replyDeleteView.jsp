<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패커|자유게시판</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	$(".cancel_btn").on("click", function(){
		location.href = "/board/readView?bno=${replyDelete.bno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}";
	})
})
</script>
</head>
<body>
<div id="root">
  <header>
    <h1>게시판</h1>
  </header>
			 
  <div>
    <%@include file="nav.jsp" %>
  </div>
  
  <section id="container">
    <form name="updateForm" role="form" method="post" action="/board/replyDelete">
      <input type="hidden" name="bno" value="${replyDelete.bno}" readonly="readonly"/>
      <input type="hidden" id="rno" name="rno" value="${replyDelete.rno}" />
      <input type="hidden" id="page" name="page" value="${scri.page}"> 
      <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
      <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
      <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
      <div>
        <p>삭제 하시겠습니까?</p>
        <button type="submit" class="delete_btn">예</button>
        <button type="button" class="cancel_btn">아니오</button>
      </div>
    </form>
  </section>
</div>
</body>
</html>