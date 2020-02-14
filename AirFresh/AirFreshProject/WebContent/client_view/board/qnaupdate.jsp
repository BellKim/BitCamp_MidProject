<%@page import="Dto.QnaBbsDto"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   		QnaBbsDto qna = (QnaBbsDto) request.getAttribute("qnadto");
		MemberDto mem = (MemberDto)session.getAttribute("memLogin");
    
    %>
<%@ include file="./../include/header.jsp"%>
<div class="container">
	<h1 class="mt-4 mb-3">QnA</h1>
	<hr>
	 <div class="row"  style = "width:90%; margin: 0 auto;">
      <div class="col mb-4">
        <form id="qnaform" method="post">
        	<input type="hidden" name="mem_id" value="<%=mem.getMem_id() %>">
          <div class="control-group form-group">
			<div class = "controls" align = "right">
                 <p>비밀글 <input type="checkbox"  id="secret" name="secret" <%=qna.getQna_secret() == 0? "checked":"" %> ></p>
            </div>
           </div>
          <div class="control-group form-group">
            <div class="controls" >
              <label>제목</label>
              <input type="tel" class="form-control" id="qna_title" name="qna_title" value ="<%=qna.getQna_title() %>">
            </div>
            
          </div>

          <div class="control-group form-group">
            <div class="controls">
              <label>내용</label>
              <textarea rows="10" cols="100" class="form-control" id="qna_content" name ="qna_content" style="resize:none"><%=qna.getQna_content() %></textarea>
            </div>
          </div>
        <div align="center">
          	<button type="button" class="btn btn-primary" id="btn_add">문의하기</button>
          	<button type="button" class="btn btn-primary" onclick = "location.href='<%=request.getContextPath()%>/qnalist?command=user'">취소</button>
        </div>
        </form>
      </div>
    </div>
	</div>
<%@ include file="./../include/footer.jsp"%>