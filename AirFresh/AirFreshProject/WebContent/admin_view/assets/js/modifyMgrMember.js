

	$(document).ready(function(){
		//$('input[id="loc"]')[0].value	//벨류 셀렉트
		//$('input[id="loc"]').attr("value");	//요소값 (강남구)
		//var inputdata = $('input[id="mgr_del"]').attr("value");	//요소값 받아오기.
		//$('input[id="mgr_del"]').attr("value", inputdata);	//요소값 적용하기
		//var selected = $("#mgr_del").children();
		

		
		//매니저 지역구 selectBox 자동선택 로직
		var option_size1 = $("#loc_loc").children().length;
		var compaire_value1 = $("#loc_locRead").attr("value");
		
		for(i=0; i<option_size1; i++){
			if(compaire_value1 == $("#loc_loc").children()[i].text){
			    console.log("내용이 같다");
			    $("#loc_loc").val(i+1).prop("selected", true);
			}else{
			    console.log("내용이 다르다");
			}
		}
		
		//매니저 권한 selectBox 자동선택 로직
		var option_size2 = $("#mgr_auth").children().length;
		var default_value2 = $("#mgr_authRead").attr("value");
		
		for(j=0; j<option_size2; j++){
			if(default_value2 == $("#mgr_auth").children()[j].text){
				$("#mgr_auth").val(j).prop("selected", true);
			}
		}
		
		//탈퇴여부 체크 selectBox 자동선택 로직
		var option_size3 = $("#mgr_del").children().length;
		var default_value3 = $("#mgr_delRead").attr("value");
		
		for(k=0; k<option_size3; k++){
			if(default_value3 == $("#mgr_del").children()[k].text){
				$("#mgr_del").val(k).prop("selected", true);
			}
		}
		
		


		


		

		
		//delete버튼과 modify버튼을 눌렀을때의 동작 설정.   
		$(".delete_btn").click(function(){
			$("#Status_Selector").attr("value","delete");
			$("#mgr_indxe_dto").attr("value", "<%=managerSelectOneDTO.getMgr_index() %>");
			//console.log($("#Status_Selector").attr("value"));
			//console.log($("#mgr_indxe_dto").attr("value"));
			$("#SelectForm").submit();
		});	
		$(".modify_btn").click(function(){
			$("#Status_Selector").attr("value","modify");
			$("#mgr_indxe_dto").attr("value", "<%=managerSelectOneDTO.getMgr_index() %>");
			//console.log($("#Status_Selector").attr("value"));
			//console.log($("#mgr_indxe_dto").attr("value"));
			$("#mgr_index").removeAttr("readonly");
			//$("#SelectForm").submit();
		});	
		$(".mgr_pw").click(function(){
		    alert("hello");
		});
		
		
		
	});

	
	//비밀번호 확인 로직.
	/*
		1. 비밀번호 입력칸 두곳에 같은 비밀번호가 입력되어야 한다.
		2. 두곳 모두 입력되지 않았을 경우에는 파라미터생성이 되면 안된다.    */


	$('#mgr_pw, #mgr_pw_confirm').on("keyup", function () {
		if($("#mgr_pw").val()  == $("#mgr_pw_confirm").val()){
			
				$('#message').html('Matching').css('color', 'green');
				$("#mgr_pw").attr("name","mgr_pw");
				
			} else{
				
				$('#message').html('Not Matching').css('color', 'red');
				$("#mgr_pw").removeAttr("name");
			}
	});
  
	
	

	
    $(function(){
        $('#userPw').keyup(function(){
        $('#chkNotice').html('');
        });

        $('#userPwChk').keyup(function(){

            if($('#userPw').val() != $('#userPwChk').val()){
            $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
            $('#chkNotice').attr('color', '#f82a2aa3');
            } else{
            $('#chkNotice').html('비밀번호 일치함<br><br>');
            $('#chkNotice').attr('color', '#199894b3');
            }
        });
    });

	