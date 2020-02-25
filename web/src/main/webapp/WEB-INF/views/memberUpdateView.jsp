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
<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<title>패커|회원정보수정</title>
<script type="text/javascript">
//닉네임 정규식
var nickJ = /^[가-힣a-zA-Z0-9]{2,16}$/;
//비밀번호 정규식
var pwJ = /^(?=.*[a-zA-Z0-9])(?=.*[a-zA-Z!@#$%^&*])(?=.*[0-9!@#$%^&*]).{8,15}$/;
//이름 정규식
var nameJ = /^[가-힣]{2,10}$|[a-zA-Z]{1,10}\s[a-zA-Z]{1,10}$/;
//이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
var birthJ = false;
$(document).ready(function(){
	//취소
	$(".cancel").on("click", function(){
		location.href = "/";
	})
	//셀렉트 박스
	$("#user_pwdq option").each(function(){
		if($(this).val()=="${member.user_pwdq}"){
			$(this).attr("selected","selected");//attr적용안될경우 prop으로 
		}
	});
	//라디오
	$('#updateForm input:radio[name=user_gender]:input[value=${member.user_gender}]').attr('checked',true);
	
	//이름에 특수문자 들어가지 않도록 설정
	$('#user_name').blur(function() {
		if(nameJ.test($(this).val())) {
			console.log(nameJ.test($(this).val()));
			$("#name_check").text('');
		}else {
			$('#name_check').text('한글 2~10자 이내(특수기호, 공백 사용 불가), 영문 20자 이내로 입력해주세요.(공백 포함)');
			$('#name_check').css('color', 'red');
		}
	});
	
	//닉네임 중복확인
	$("#user_nick").blur(function(){
		if($('#user_nick').val() == ''){
			$('#nick_check').text('닉네임을 입력하세요.');
			$('#nick_check').css('color', 'red');
		}else if(nickJ.test($('#user_nick').val()) != true){
			$('#nick_check').text('2~16자의 한글, 영문, 숫자 사용 가능합니다.');
			$('#nick_check').css('color', 'red');
		}else if($('#user_nick').val() != ''){
			var user_nick = $('#user_nick').val();
			$.ajax({
				type : 'post',
				url : '/nickChk',
				dataType : "json",
				data : {"user_nick" : $("#user_nick").val()},
				success : function(data) {
					if(data == 1){
						$('#nick_check').text('사용 중인 닉네임 입니다.');
						$('#nick_check').css('color', 'red');
					}else {
						if(nickJ.test(user_nick)){
							$('#nick_check').text('사용 가능한 닉네임 입니다.');
							$('#nick_check').css('color', 'blue');
						}
					}
				}
			});
		}
	});
	
	//이메일 중복확인
	$("#user_email").blur(function(){
		if($('#user_email').val() == ''){
			$('#email_check').text('이메일을 입력하세요.');
			$('#email_check').css('color', 'red');
		}else if(mailJ.test($('#user_email').val()) != true){
			$('#email_check').text('잘못된 이메일 형식입니다.');
			$('#email_check').css('color', 'red');
		}else if($('#user_email').val() != ''){
			var user_email = $('#user_email').val();
			$.ajax({
				type : 'post',
				url : '/emailChk',
				dataType : "json",
				data : {"user_email" : $("#user_email").val()},
				success : function(data) {
					if(data == 1){
						$('#email_check').text('이미 가입된 이메일입니다.');
						$('#email_check').css('color', 'red');
					}else {
						if(mailJ.test(user_email)){
							$('#email_check').text('사용 가능한 이메일입니다.');
							$('#email_check').css('color', 'blue');
						}
					}
				}
			});
		}
	});
	
	//휴대폰 중복확인
	$("#user_phone").blur(function(){
		if($('#user_phone').val() == ''){
			$('#phone_check').text('휴대폰 번호를 입력하세요.');
			$('#phone_check').css('color', 'red');
		}else if(phoneJ.test($('#user_phone').val()) != true){
			$('#phone_check').text('잘못된 휴대폰 번호 형식입니다.');
			$('#phone_check').css('color', 'red');
		}else if($('#user_phone').val() != ''){
			var user_phone = $('#user_phone').val();
			$.ajax({
				type : 'post',
				url : '/phoneChk',
				dataType : "json",
				data : {"user_phone" : $("#user_phone").val()},
				success : function(data) {
					if(data == 1){
						$('#phone_check').text('이미 가입된 번호입니다.');
						$('#phone_check').css('color', 'red');
					}else {
						if(phoneJ.test(user_phone)){
							$('#phone_check').text('사용 가능한 번호입니다.');
							$('#phone_check').css('color', 'blue');
						}
					}
				}
			});
		}
	});
	
	// 생년월일 birthJ 유효성 검사
	$('#user_birth').blur(function(){
		var dateStr = $(this).val();
		var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
		var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
		var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
		var today = new Date(); // 날짜 변수 선언
		var yearNow = today.getFullYear(); // 올해 연도 가져옴
		if (dateStr.length <= 8) {
			// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
			if (year > yearNow || year < 1900 ){
				$('#birth_check').text('생년월일을 확인해주세요.');
				$('#birth_check').css('color', 'red');
			}else if (month < 1 || month > 12) {
				$('#birth_check').text('생년월일을 확인해주세요.');
				$('#birth_check').css('color', 'red');
			}else if (day < 1 || day > 31) {
				$('#birth_check').text('생년월일을 확인해주세요.');
				$('#birth_check').css('color', 'red');
			}else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
				$('#birth_check').text('생년월일을 확인해주세요.');
				$('#birth_check').css('color', 'red');
			}else if (month == 2) {
				var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
				if (day>29 || (day==29 && !isleap)) {
					$('#birth_check').text('생년월일을 확인해주세요.');
					$('#birth_check').css('color', 'red');
				}else {
					$('#birth_check').text('');
					birthJ = true;
				}
			}else {
				$('#birth_check').text('');
				birthJ = true;
			}//end of if
		}else {
			//1.입력된 생년월일이 8자 초과할때 : auth:false
			$('#birth_check').text('생년월일을 확인해주세요.');
			$('#birth_check').css('color', 'red');
		}
	});
	$("#submit").on("click", function(){
		if($("#user_pw").val()==""){
			alert("비밀번호를 입력하세요.");
			$("#user_pw").focus();
			return false;
		}
		if($("#user_pwda").val()==""){
			alert("비밀번호 찾기 답변을 입력하세요.");
			$("#user_pwda").focus();
			return false;
		}
		if($("#user_name").val()==""){
			alert("이름을 입력하세요.");
			$("#user_name").focus();
			return false;
		}
		if($("#user_birth").val()==""){
			alert("생년월일을 입력하세요.");
			$("#user_birth").focus();
			return false;
		}
		if($("#user_detailaddress").val()==""){
			alert("상세주소를 입력하세요.");
			$("#user_detailaddress").focus();
			return false;
		}
		$.ajax({
			url : "/passChk",
			type : "POST",
			dateType : "json",
			data : $("#updateForm").serializeArray(),
			success: function(data){
				if(data == true){
					if(confirm("회원 수정하시겠습니까?")){
						$("#updateForm").submit();
					}
				}else{
					alert("비밀번호가 틀렸습니다.");
					return;
				}
			}
		})
	});
})

//우편번호 찾기 버튼 클릭시 발생 이벤트
function execPostCode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 도로명 조합형 주소 변수
			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if(fullRoadAddr !== ''){
				fullRoadAddr += extraRoadAddr;
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			console.log(data.zonecode);
			console.log(fullRoadAddr);

			/* var a = console.log(data.zonecode);
			var b = console.log(fullRoadAddr);
			if(a == null || b = null){
				alert("주소를 확인하세요.");
				return false;
			} */
			$("[name=user_oaddress]").val(data.zonecode);
			$("[name=user_address]").val(fullRoadAddr);
			document.getElementById('user_oaddress').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('user_address').value = fullRoadAddr;
		}
	}).open();
}
</script>
</head>
<body>
<section id="container">
  <form id="updateForm" action="/memberUpdate" method="post">
    <div class="form-group">
      <label class="control-label" for="user_id">아이디</label>
      <input class="form-control" type="text" id="user_id" name="user_id" value="${member.user_id}" readonly="readonly">
    </div>
    <div class="form-group">
      <label class="control-label" for="userPass">비밀번호</label>
      <input class="form-control" type="password" id="user_pw" name="user_pw">
      <div id="pw_check"></div>
    </div>
    <div class="form-group">
      <label class="control-label" >비밀번호 찾기 질문/답변</label>
      <select id="user_pwdq" name="user_pwdq" style="display:block;margin:0 0 8px 0">
        <option value="1">다른 이메일 주소는?</option>
        <option value="2">나의 보물 1호는?</option>
        <option value="3">나의 출신 초등학교는?</option>
        <option value="4">나의 출신 고향은?</option>
        <option value="5">나의 이상형은?</option>
        <option value="6">어머니 성함은?</option>
        <option value="7">아버지 성함은?</option>
        <option value="8">가장 좋아하는 색깔은?</option>
        <option value="9">가장 좋아하는 음식은?</option>
      </select>
      <input class="form-control" type="text" id="user_pwda" name="user_pwda" value="${member.user_pwda}">
    </div>
    <div class="form-group">
      <label class="control-label" for="user_name">이름</label>
      <input class="form-control" type="text" id="user_name" name="user_name" value="${member.user_name}">
      <div id="name_check"></div>
    </div>
    <div class="form-group">
      <label class="control-label" for="user_nick">닉네임</label>
      <input class="form-control" type="text" id="user_nick" name="user_nick" value="${member.user_nick}">
      <div id="nick_check"></div>
    </div>
    <div class="form-group">
      <label class="control-label" for="user_birth">생년월일</label>
      <input class="form-control" type="tel" id="user_birth" name="user_birth" value="${member.user_birth}">
      <div id="birth_check"></div>
    </div>
    <div class="form-group">
      <label class="control-label" for="user_email">이메일 주소</label>
      <input class="form-control" type="email" id="user_email" name="user_email" value="${member.user_email}">
      <div id="email_check"></div>
    </div>
    <div class="form-group">
      <label class="control-label" for="user_phone">휴대폰 번호('-'없이 번호만 입력해주세요)</label>
      <input class="form-control" type="tel" id="user_phone" name="user_phone" value="${member.user_phone}">
      <div id="phone_check"></div>
    </div>
    <div class="form-group">
      <label class="control-label" for="user_gender">성별</label>
      <input type="radio" id="user_gender" name="user_gender" value="남">남
      <input type="radio" id="user_gender" name="user_gender" value="여">여
    </div>
    <div class="form-group">
      <label class="control-label" for="address">주소</label><br>
      <input class="form-control" type="text" style="width: 40%; display: inline;" id="user_oaddress" name="user_oaddress" readonly="readonly" value="${member.user_oaddress}">
      <button class="btn btn-default" type="button" id="address" onclick="execPostCode();"><i class="fa fa-search"></i>우편번호 찾기</button>
    </div>
    <div class="form-group">
      <input class="form-control" type="text" id="user_address" name="user_address" style="top: 5px;" readonly="readonly" value="${member.user_address}">
    </div>
    <div class="form-group">
      <input class="form-control" type="text" id="user_detailaddress" name="user_detailaddress" value="${member.user_detailaddress}">
    </div>
  </form>
  <div class="form-group">
    <button class="btn btn-success" type="button" id="submit">회원정보수정</button>
    <button class="cancel btn btn-danger" type="button">취소</button>
  </div>
</section>
</body>
</html>