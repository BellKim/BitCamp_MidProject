<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../include/header.jsp" %>



	<div class="container">
	
	
	  	<h2>직원 추가</h2>
		<%-- 메니저 전체 리스트를 열람, 추가/삭제 해줌. --%>
		<h3> input data </h3>
		<%--<%=request.getContextPath()%>/addMrgMember --%>
		<form id="addManagerMem" name="addManagerMem" action="<%=request.getContextPath()%>/addMrgMember"  method="POST">
			<div>
				<span for="manager_id">id</span>
				<input type="text" id="manager_id" name="manager_id" ></div>
			
			<div>
				<span for="manager_pw">pw</span>
				<input type="text" id="manager_pw" name="manager_pw" >
			</div>
			<div>
				<span for="manager_name">이름</span>
				<input type="text" id="manager_name" name="manager_name" >
			</div>
			<div>
			
				<span for="manager_loc">근무지역선택</span>
				<select name="manager_loc">
				  <option value="1">강남구</option>
				  <option value="2">성동구</option>
				  <option value="3" selected="selected">중랑구</option>
				  <option value="4" >기타</option>
				</select>
			</div>
			<div>
			직원구분
				<select name="authLevel">
					<option value="0"> 최고관리자</option>
					<option value="1" selected="selected"> 매니저</option>
					<option value="2"> 설치기사</option>
				</select>
			</div>
			<div>핸드폰번호<input type="text" id="manager_phNum" name="manager_phNum" ></div>
			<input type="submit"  value="전송버튼">
		</form>
		
		
	</div>
	
	
	
<%@ include file="./../include/footer.jsp" %>
