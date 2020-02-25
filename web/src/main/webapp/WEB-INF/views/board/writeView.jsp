<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- icon -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<title>패커|자유게시판</title>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='writeForm']");
	$(".write_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "/board/write");
		formObj.attr("method", "post");
		formObj.submit();
	});
	fn_addFile();
})
function fn_valiChk(){
	var regForm = $("form[name='writeForm'] .chk").length;
	for(var i = 0; i<regForm; i++){
		if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			alert($(".chk").eq(i).attr("title"));
			return true;
		}
	}
}
function fn_addFile(){
	var fileIndex = 1;
	$(".fileAdd_btn").on("click", function(){
		$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' id='fileDelBtn'>"+"삭제"+"</button></div>");
	});
	$(document).on("click","#fileDelBtn", function(){
		$(this).parent().remove();
	});
}
</script>
</head>
<body>

<div id="root">
  <header>
    <h1> 게시판</h1>
  </header>
			 
  <div>
    <%@include file="nav.jsp" %>
  </div>
			
  <section id="container">
    <form name="writeForm" method="post" action="/board/write" enctype="multipart/form-data">
      <table class="table table-borderless">
      <c:if test="${member.user_id != null}">
      <tr>
        <td>
          <label for="title">제목</label>
          <input type="text" class="form-control" id="title" name="title" class="chk" placeholder="제목을 입력하세요.">
        </td>
      </tr>
      <tr>
        <td>
          <label for="writer">작성자</label>
          <input type="text" class="form-control" id="writer" name="writer" class="chk" value="${member.user_id}">
        </td>
      </tr>
      <tr>
        <td>
          <label for="content">내용</label>
          <textarea class="form-control" rows="5" id="content" name="content" class="chk" placeholder="내용을 입력하세요."></textarea>
        </td>
      </tr>
      <tr>
        <td id="fileIndex"></td>
      </tr>
      <tr>
        <td>
          <button class="write_btn btn btn-sm btn-primary" type="submit">작성</button>
          <button class="fileAdd_btn btn btn-sm btn-primary" type="button">파일추가</button>
        </td>
      </tr>
      </c:if>
      <c:if test="${member.user_id == null}">
        <p>로그인 후에 작성하실 수 있습니다.</p>
        <a href="/board/list">게시판으로 돌아가기</a>
      </c:if>
      </table>
    </form>
  </section>
  <hr>
</div>
</body>
</html>