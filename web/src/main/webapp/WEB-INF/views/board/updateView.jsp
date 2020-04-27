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
	$(document).on("click","#fileDel", function(){
		$(this).parent().remove();
	})

	fn_addFile();
	
	$(".cancel_btn").on("click", function(){
		event.preventDefault();
		location.href = "${path}/board/readView?bno=${update.bno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}";
	})
	
	$(".update_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "${path}/board/update");
		formObj.attr("method", "post");
		formObj.submit();
	})
})

function fn_valiChk(){
	var updateForm = $("form[name='updateForm'] .chk").length;
	for(var i = 0; i<updateForm; i++){
		if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			alert($(".chk").eq(i).attr("title"));
			return true;
		}
	}
}

function fn_addFile(){
	var fileIndex = 1;
	$(".fileAdd_btn").on("click", function(){
		$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
	});
	$(document).on("click","#fileDelBtn", function(){
		$(this).parent().remove();
	});
}

var fileNoArry = new Array();
var fileNameArry = new Array();

function fn_del(value, name){
	fileNoArry.push(value);
	fileNameArry.push(name);
	$("#fileNoDel").attr("value", fileNoArry);
	$("#fileNameDel").attr("value", fileNameArry);
}
</script>
</head>
<body>
<div id="root">
  <header>
    <h1> 게시판</h1>
  </header>

  <nav>홈 - 글 작성</nav>

  <section id="container">
    <form name="updateForm" role="form" method="post" action="${path}/board/update" enctype="multipart/form-data">
      <input type="hidden" name="bno" value="${update.bno}" readonly="readonly">
      <input type="hidden" id="page" name="page" value="${scri.page}">
      <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
      <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
      <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
      <input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
      <input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
        <table>
          <tbody>
            <tr>
              <td>
                <label for="title">제목</label><input type="text" id="title" name="title" value="${update.title}" class="chk" title="제목을 입력하세요." />
              </td>
            </tr>
            <tr>
              <td>
                <label for="content">내용</label><textarea id="content" name="content" class="chk" title="내용을 입력하세요."><c:out value="${update.content}" /></textarea>
              </td>
            </tr>
            <tr>
              <td>
                <label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${update.writer}" readonly="readonly"/>
              </td>
            </tr>
            <tr>
              <td>
                <label for="regdate">작성날짜</label>
                <fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
              </td>
            </tr>
            <tr>
              <td id="fileIndex">
                <c:forEach var="file" items="${file}" varStatus="var">
                <div>
                  <input type="hidden" id="FNO" name="FNO_${var.index}" value="${file.FNO}">
                  <input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FNO_${var.index}">
                  <a href="#" id="fileName" onclick="return false;">${file.ORG_FILENAME}</a>(${file.FILE_SIZE}kb)
                  <button id="fileDel" onclick="fn_del('${file.FNO}','FNO_${var.index}');" type="button">삭제</button><br>
                </div>
                </c:forEach>
              </td>
            </tr>
          </tbody>
        </table>
      <div>
        <button type="submit" class="update_btn">저장</button>
        <button type="submit" class="cancel_btn">취소</button>
        <button type="button" class="fileAdd_btn">파일추가</button>
      </div>
    </form>
  </section>
  <hr>
</div>
</body>
</html>