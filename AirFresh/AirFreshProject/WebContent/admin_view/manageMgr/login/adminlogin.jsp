<%@page import="Dto.ManagerMemberDto"%>
<%@page import="db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//ManagerMemberDto mem = request.getSession().setAttribute("managerLogin", key);
HttpSession adminlogincheck = request.getSession();
ManagerMemberDto mem = (ManagerMemberDto)session.getAttribute("managerLogin");
System.out.println(mem);

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
</head>
	 <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
            
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Air FRESH 관리자 로그인 페이지</h3></div>
                                    <div class="card-body">
                                        <form id="loginInfo" action="<%=request.getContextPath() %>/managerLogin" method="post">
                                            <div class="form-group"><label class="small mb-1" for="inputId">ID</label>
                                            <input class="form-control py-4" type="email" placeholder="Enter ID" id="manager_id" name="manager_id"/></div>
                                            <div class="form-group"><label class="small mb-1" for="inputPw">Password</label>
                                            <input class="form-control py-4" type="password" placeholder="Enter password" id="manager_pw" name="manager_pw"/></div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox"><input class="custom-control-input" id="chk_save_id" type="checkbox" />
                                                	<label class="custom-control-label" for="rememberIDCheck">ID 저장</label>
                                                </div>
                                            </div>
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0"><a class="small" href="password.html">비밀번호 찾기</a>
                                            	<button type="button" class="btn btn-primary" id="btnlogin">로그인</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="<%=request.getContextPath() %>/addMrgMember?status=enter">회원가입</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; 2020 O-HapZiZol</div>
                            
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
	<%--/body>
		< div align="center">
			<div class="title">
				<h2>로그인</h2>
				<p>Air FRESH 관리자 로그인 페이지에 접속중 입니다.</p>
			</div>	
			<div class="login">
				<form id="loginInfo" action="<%=request.getContextPath() %>/managerLogin" method="post">			
					<div>
					<div>
						<input type="text" placeholder="아이디(이메일)을 입력해주세요." id="manager_id" name="manager_id">
					</div>
					<div>
						<input type="password" placeholder="비밀번호를 입력해주세요." id="manager_pw" name="manager_pw">	
					</div>
					<div class="idcheck">
						<input type="checkbox" id="chk_save_id">
						<label for="saveid">아이디 저장</label>
					</div>
					</div>
					<button type="button" id="btnlogin">로그인</button>
					<div>
						<!-- <a href="searchidpw.jsp">아이디·패스워드 찾기</a>	-->
						 <a href="<%=request.getContextPath() %>/addMrgMember?status=enter">관리자 회원가입</a>
					</div>		
				</form>
			</div>
		</div--%>
	<script type="text/javascript">
			$("#btnlogin").click(function () {
				if( $("#manager_id").val().trim() == "" ){
					alert("id를 입력해 주십시오");
					$("#manager_id").focus();
				}
				else if( $("#manager_pw").val().trim() == "" ){
					alert("password를 입력해 주십시오");
					$("#manager_pw").focus();
				}
				else{
					$("#loginInfo").submit();
				}
			});
			
			var user_id = $.cookie("user_id");
			if(user_id != null){			
				$("#manager_id").val( user_id );
				$("#chk_save_id").attr("checked", "checked");
			}
			$("#chk_save_id").click(function() {
				if( $("#chk_save_id").is(":checked") ){			
					if( $("#manager_id").val().trim() == "" ){
						alert("ID를 입력해 주십시오");
						$("#chk_save_id").prop("checked", false);			
					}else{					
						$.cookie("user_id", $("#manager_id").val().trim(), {expires:7, path:'./'});
					}
				}
				else{			
					$.removeCookie("user_id", {path:'./'});
				}
			});
		</script>
	</body>
</html>