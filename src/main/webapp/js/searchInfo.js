function searchId_check() {
		if(!form.si_name.value){
			alert("이름을 입력하세요.");
			form.si_name.focus();
			return false;
		}else if(!form.si_phonenum.value){
			alert("휴대폰 번호를 입력하세요.");
			form.si_phonenum.focus();
			return false;
		}
		return true;
	}
	
function searchPw_check() {
		if(!form.sp_id.value){
			alert("아이디를 입력하세요.");
			form.sp_id.focus();
			return false;
		}else if(!form.sp_name.value){
			alert("이름을 입력하세요.");
			form.sp_name.focus();
			return false;
		}else if(!form.sp_phonenum.value){
			alert("휴대폰 번호를 입력하세요.");
			form.sp_phonenum.focus();
			return false;
		}
		return true;
	}