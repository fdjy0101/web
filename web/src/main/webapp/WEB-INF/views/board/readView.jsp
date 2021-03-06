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
	var formObj = $("form[name='readForm']");
	//수정 
	$(".update_btn").on("click", function(){
		formObj.attr("action", "${path}/board/updateView");
		formObj.attr("method", "get");
		formObj.submit();				
	})
	//삭제
	$(".delete_btn").on("click", function(){
		var deleteYN = confirm("게시물을 삭제하시겠습니까?");
		if(deleteYN == true){
			formObj.attr("action", "${path}/board/delete");
			formObj.attr("method", "post");
			formObj.submit();
		}
	})
	//목록
	$(".list_btn").on("click", function(){
		location.href = "${path}/board/list?page=${scri.page}"
				+"&perPageNum=${scri.perPageNum}"
				+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
	})
	//댓글 작성
	$(".replyWriteBtn").on("click", function(){
		var formObj = $("form[name='replyForm']");
		formObj.attr("action", "${path}/board/replyWrite");
		formObj.submit();
	});
	//댓글 수정
	$(".replyUpdateBtn").on("click", function(){
		location.href = "${path}/board/replyUpdateView?bno=${read.bno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}"
				+ "&rno="+$(this).attr("data-rno");
	});
	//댓글 삭제
	$(".replyDeleteBtn").on("click", function(){
		location.href = "${path}/board/replyDeleteView?bno=${read.bno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}"
				+ "&rno="+$(this).attr("data-rno");
	});
})
function fn_fileDown(fileNo){
	var formObj = $("form[name='readForm']");
	$("#fno").attr("value", fileNo);
	formObj.attr("action", "${path}/board/fileDown");
	formObj.submit();
}
</script>
</head>
<body>
<div class="container">
  <header>
    <h1> 게시판</h1>
  </header>
  
  <nav>홈 - 글 작성</nav>
  
  <section id="container">
    <form name="readForm" role="form" method="post">
      <input type="hidden" id="bno" name="bno" value="${read.bno}" />
      <input type="hidden" id="page" name="page" value="${scri.page}">
      <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
      <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
      <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
      <input type="hidden" id="fno" name="fno" value="">
    </form>
    
    <div class="form-group">
      <label for="bno" class="col-sm-2 control-label">글 번호</label>
      <input type="text" id="bno" name="bno" class="form-control" value="${read.bno}" readonly="readonly"/>
    </div>
    <div class="form-group">
      <label for="title" class="col-sm-2 control-label">제목</label>
      <input type="text" id="title" name="title" class="form-control" value="${read.title}" readonly="readonly" />
    </div>
    <div class="form-group">
      <label for="writer" class="col-sm-2 control-label">작성자</label>
      <input type="text" id="writer" name="writer" class="form-control" value="${read.writer}"  readonly="readonly"/>
    </div>
    <div class="form-group">
      <label for="content" class="col-sm-2 control-label">내용</label>
      <textarea id="content" name="content" class="form-control" readonly="readonly"><c:out value="${read.content}" /></textarea>
    </div>
    <div class="form-group">
      <label for="regdate" class="col-sm-2 control-label">작성날짜</label>
      <fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />	
    </div>
    <hr>
    <span>파일 목록</span>
    <div class="form-group" style="border: 1px solid #dbdbdb;">
      <c:forEach var="file" items="${file}">
        <a href="#" onclick="fn_fileDown('${file.FNO}'); return false;">${file.ORG_FILENAME}</a>(${file.FILE_SIZE}kb)<br>
      </c:forEach>
    </div>
    <hr>
    <div>
      <button type="submit" class="update_btn btn btn-warning">수정</button>
      <button type="submit" class="delete_btn btn btn-danger">삭제</button>
      <button type="submit" class="list_btn btn btn-primary">목록</button>	
    </div>
   
    <!-- 댓글 -->
    <div id="reply">
      <ol class="replyList">
        <c:forEach items="${replyList}" var="replyList">
          <li>
            <p>
            	작성자 : ${replyList.writer}<br />
            	작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
            </p>
            <p>${replyList.content}</p>
            <div>
              <button type="button" class="replyUpdateBtn btn btn-warning" data-rno="${replyList.rno}">수정</button>
              <button type="button" class="replyDeleteBtn btn btn-danger" data-rno="${replyList.rno}">삭제</button>
            </div>
          </li>
        </c:forEach>   
      </ol>
    </div>
   
    <form name="replyForm" method="post" class="form-horizontal">
      <input type="hidden" id="bno" name="bno" value="${read.bno}" />
      <input type="hidden" id="page" name="page" value="${scri.page}"> 
      <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
      <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
      <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
      <div class="form-group">
        <label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
        <div class="col-sm-10">
          <input type="text" id="writer" name="writer" class="form-control" />
        </div>
      </div>
      
      <div class="form-group">
        <label for="content" class="col-sm-2 control-label">댓글 내용</label>
        <div class="col-sm-10">
          <input type="text" id="content" name="content" class="form-control" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
          <button type="button" class="replyWriteBtn btn btn-success">작성</button>
        </div>
      </div>
    </form>
  </section>
</div>
</body>
</html>