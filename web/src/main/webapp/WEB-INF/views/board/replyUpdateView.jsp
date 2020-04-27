<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패커|자유게시판</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	$(".cancel_btn").on("click", function(){
		location.href = "${path}/board/readView?bno=${replyUpdate.bno}"
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
    <form name="updateForm" role="form" method="post" action="${path}/board/replyUpdate">
      <input type="hidden" name="bno" value="${replyUpdate.bno}" readonly="readonly"/>
      <input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" />
      <input type="hidden" id="page" name="page" value="${scri.page}"> 
      <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
      <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
      <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
      <table>
        <tbody>
          <tr>
            <td>
              <label for="content">댓글 내용</label>
              <input type="text" id="content" name="content" value="${replyUpdate.content}"/>
            </td>
          </tr>
        </tbody>
      </table>
      <div>
        <button type="submit" class="update_btn">저장</button>
        <button type="button" class="cancel_btn">취소</button>
      </div>
    </form>
  </section>
</div>
</body>
</html>