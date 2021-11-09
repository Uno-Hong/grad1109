function check_pw() {      // 비밀번호 확인
	var pw = document.getElementById('check_change_pw').value;
	var SC = ["!","@","#","$","%"];
	var check_SC = 0;

	for(var i=0;i<SC.length;i++){
		if(pw.indexOf(SC[i]) != -1){
			check_SC = 1;
		}
	}
	if(pw.length < 6 || pw.length>16){
		document.getElementById('Input_check_pw').innerHTML='비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.';
		document.getElementById('Input_check_pw').style.color='red';
		document.getElementById('check_change_pw').focus();
		document.getElementById('check_change_pw').select();
	} else {
		if(check_SC == 0){
			document.getElementById('Input_check_pw').innerHTML='작성하신 비밀번호에 특수문자가 포함되어 있지 않습니다.';
			document.getElementById('Input_check_pw').style.color='red';
			document.getElementById('check_change_pw').focus();
			document.getElementById('check_change_pw').select();
		}
		else {
			document.getElementById('Input_check_pw').innerHTML='조건에 일치하는 비밀번호입니다.';
			document.getElementById('Input_check_pw').style.color='blue';
		}
	}
	if(document.getElementById('check_change_pw').value !='' && document.getElementById('check_retry_pw').value!=''){
		if(document.getElementById('check_change_pw').value==document.getElementById('check_retry_pw').value){
			document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
			document.getElementById('check').style.color='blue';
		}
		else{
			document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
			document.getElementById('check').style.color='red';
			document.getElementById('check_retry_pw').focus();
			document.getElementById('check_retry_pw').select();
		}
	}
	if(document.getElementById('check_current_pw').value == document.getElementById('check_change_pw').value){
		document.getElementById('Input_check_pw').innerHTML='현재 비밀번호로는 변경할 수 없습니다.';
		document.getElementById('Input_check_pw').style.color='red';
		document.getElementById('Input_check_pw').focus();
		
	}
}

function checkValue() {
		var form = document.mypageform;
		
		if (!form.check_current_pw.value) {
			alert("현재 비밀번호를 입력하세요.");
			form.check_current_pw.focus();
			return false;
		}
		else if (!form.check_change_pw.value) {
			alert("새 비밀번호를 입력하세요.");
			form.check_change_pw.focus();
			return false;
		}
		else if (!form.check_retry_pw.value) {
			alert("새 비밀번호 확인을 입력하세요.");
			form.check_retry_pw.focus();
			return false;
		}
		
		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		else if(form.check_current_pw.value != login_pw) {
			alert("현재 비밀번호가 일치하지 않습니다.");
			form.check_current_pw.focus();
			return false;
		}
		return true;
	}