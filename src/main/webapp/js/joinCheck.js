function checkValue() {
		var form = document.join;
		
		if (!form.user_id.value) {
			alert("아이디를 입력하세요.");
			form.user_id.focus();
			return false;
		}
		else if (form.idDup.value != "idCheck") {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		else if (!form.user_pw.value) {
			alert("비밀번호를 입력하세요.");
			form.user_pw.focus();
			return false;
		}
		
		// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
		else if(form.user_pw.value != form.user_cpw.value) {
			alert("비밀번호가 일치하지 않습니다.");
			form.user_cpw.focus();
			return false;
		}
		else if(!form.user_name.value){
			alert("이름을 입력하세요.");
			form.user_name.focus();
			return false;
		}
		else if((!form.user_ppn2.value)&&(!form.user_ppn3.value)){
			alert("휴대폰 번호를 입력하세요.");
			form.user_ppn2.focus();
			return false;
		}
		return true;
	}
	
function check_pw() {      // 비밀번호 확인
		var pw = document.getElementById('user_pw').value;
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
			document.getElementById('user_pw').focus();
			document.getElementById('user_pw').select();
		} else {
			if(check_SC == 0){
				document.getElementById('Input_check_pw').innerHTML='작성하신 비밀번호에 특수문자가 포함되어 있지 않습니다.';
				document.getElementById('Input_check_pw').style.color='red';
				document.getElementById('user_pw').focus();
				document.getElementById('user_pw').select();
			}
			else {
				document.getElementById('Input_check_pw').innerHTML='조건에 일치하는 비밀번호입니다.';
				document.getElementById('Input_check_pw').style.color='blue';
			}
		}
		if(document.getElementById('user_pw').value !='' && document.getElementById('user_cpw').value!=''){
			if(document.getElementById('user_pw').value==document.getElementById('user_cpw').value){
				document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
				document.getElementById('check').style.color='blue';
			}
			else{
				document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
				document.getElementById('check').style.color='red';
				document.getElementById('user_cpw').focus();
				document.getElementById('user_cpw').select();
			}
		}
	}