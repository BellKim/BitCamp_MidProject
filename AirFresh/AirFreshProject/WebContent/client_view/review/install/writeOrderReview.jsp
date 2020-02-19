<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

<%@ include file="./../../include/header.jsp"%>

<%
	String index = request.getAttribute("index")==null?"":(String)request.getAttribute("index");
	out.println(index);
%>

<div class="container" style="margin-bottom: 100px;">
	 <h1 class="mt-4 mb-3">설치리뷰작성<small>----</small></h1>
	
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="#">HOME</a>
      </li>
      <li class="breadcrumb-item active">마이페이지</li>
    </ol>
    
    	<hr>
		<form action="<%=request.getContextPath() %>/OrderReviewController?command=write" id="frm" method="post" >
				<input type="hidden" name="pur_index" value="<%=index%>">
				<div class="form-group">
					<label class="col-form-label" for="inputDefault">제목</label>
					<label class="col-form-label" for="inputDefault" style="margin-left: 70%;">별점</label>
					<div>
						<div style="width: 100px; float: left; margin-right: 5px;">
						</div>
						<div style="width: 70%; float: left;">
							<input type="text" class="form-control" id="inputDefault"
								name="title">
						</div>
						<div  id="star_rating" style="margin-left: 50px; width: 20%;  float: left">
							<select id="_rating" name="rating" style="width: 150px; height: 40px;">
								<option value="0" selected>별점선택</option>
								<option value="1">1점</option>
								<option value="2">2점</option>
								<option value="3">3점</option>
								<option value="4">4점</option>
								<option value="5">5점</option>
							</select>
							<!-- <a href="#">★</a>
							<a href="#">★</a>
							<a href="#">★</a>
							<a href="#">★</a>
							<a href="#">★</a> -->
						</div>
					</div>
				</div>
				<div class="form-group" style="clear: both;">
					<label for="exampleTextarea">후기내용</label>
					<textarea class="form-control" id="exampleTextarea" rows="10"
						cols="50" name="content"></textarea>
				</div>
				<div class="form-group">
					<input type="file" class="form-control-file" id="exampleInputFile"
						aria-describedby="fileHelp" name="filePath">
				</div>
				<div align="center">
					<button type="button" id="btn" class="btn btn-primary">글쓰기</button>
				</div>
			<br><br>
		</form>
		
		<script type="text/javascript">
			$(document).ready(function () {
				
				$("#btn").click(function () {
				
					if($("#inputDefault").val() == "" || $("#inputDefault").val() == null){
						
						alert("제목을 입력하세요");
						
					}else if($("#exampleTextarea").val() == "" || $("#exampleTextarea").val() == null){
						
						alert("내용을 입력해주세요");
						
					}else if($("#_rating option:selected").val() == 0){
						
						alert("별점을 선택해주세요");
					
					}else{
						$("#frm").submit();	
					}
				});
			});
		
		</script>
		
<%@ include file="./../../include/footer.jsp"%>


