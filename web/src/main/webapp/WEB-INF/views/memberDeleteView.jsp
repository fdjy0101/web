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
<link rel="stylesheet" href="css/template.css">
<!-- icon -->
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<title>패커|회원탈퇴</title>
<script type="text/javascript">
$(document).ready(function(){
	// 취소
	$(".cancel").on("click", function(){
		location.href = "/";
	})

	$("#submit").on("click", function(){
		if($("#user_pw").val() == ""){
			alert("비밀번호를 입력해주세요.");
			$("#user_pw").focus();
			return false;
		}
		$.ajax({
			url : "/passChk",
			type : "POST",
			dataType : "json",
			data : $("#delForm").serializeArray(),
			success: function(data){
				if(data==true){
					if(confirm("회원 탈퇴하시겠습니까?")){
						$("#delForm").submit();
					}
				}else{
					alert("비밀번호가 틀렸습니다.");
					return;
				}
			}
		})
	});
})
</script>
</head>
<body>
<section id="container">
  <form action="/memberDelete" method="post" id="delForm">
    <div class="form-group">
      <label class="control-label" for="user_id">아이디</label>
      <input class="form-control" type="text" id="user_id" name="user_id" value="${member.user_id}" readonly="readonly">
    </div>
    <div class="form-group">
      <label class="control-label" for="user_pw">비밀번호</label>
      <input class="form-control" type="password" id="user_pw" name="user_pw" />
    </div>
    <div class="form-group">
      <label class="control-label" for="user_name">이름</label>
      <input class="form-control" type="text" id="user_name" name="user_name" value="${member.user_name}" readonly="readonly">
    </div>
  </form>
  <div class="form-group">
    <button class="btn btn-success" type="button" id="submit">회원탈퇴</button>
    <button class="cancel btn btn-danger" type="button">취소</button>
  </div>
  <div>
    <c:if test="${msg == false}">
    	비밀번호가 맞지 않습니다.
    </c:if>
  </div>
</section>
</body>
</html>