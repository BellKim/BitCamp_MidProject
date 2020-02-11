<%@page import="java.util.Calendar"%>
<%@page import="Dto.InstallDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//nvl 함수 
	public boolean nvl(String msg){
		return msg == null || msg.trim().equals("")?true:false;
	}
	
	//날짜를 클릭하면 그 날짜에 해당되는 일정이 모두 모이게 하는 callist.jsp로 이동하는 함수
	public String cal_list(int year, int month, int day){
		
		String str = "";
		
		//여기 servlet으로 어떻게 보내고 받을것인지 확인 
		str += String.format("&nbsp;<a href='#' onclick='atagClick(%d,%d,%d,'list')'>", 
							year, month, day);
		
		str += String.format("%2d", day);  // <a href="">날짜</a>
		
		str += "</a>";
		
		return str;
	}
	

	
	//한자리 숫자를 두자리로   변환시켜주는 함수 1 -> 01
	public String two(String msg){
		return msg.trim().length()<2?"0"+msg.trim() : msg.trim();
	}
	
	public String makeTable(int year, int month, int day){
		
		String str = "";
		
		// 2020/02/05 --->>>변환 20200205 
		String dates = (year + "") + two(month + "") + two(day + "");
		
		
		return str;
	}
	
	
	public String dot3(String msg){
		String str="";
		
		if(msg.length() >= 6){
			
			str = msg.substring(0, 6);
			str += "...";
			
		}else	str = msg.trim();				
		
		return str;
	}
	
%>

<%
	
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<style type="text/css">
			.content{
				width: 80%;
				height: 450px;
				background-color: gray;
			}
			.back1{
				width: 50%;
				height: 450px;
				float: left;
				background-color: yellow;
			}
			.back2{
				width: 50%;
				height: 450px;
				float: left;
				background-color: green;
			}
			.calender{
				width: 80%;
				height: 225px;
				background-color: gray;
			}
			.list{
				
			}
			.list th{
				font-size: 10px;
			}
			a{
				text-decoration:none;
			}
			
			

		</style>
	</head>
	
	<body>
		
		<%
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.DATE, 1);		
			
			String syear = request.getParameter("year");
			String smonth = request.getParameter("month");
			
			int year = cal.get(Calendar.YEAR);
			if(nvl(syear) == false){
				//파라메터가 넘어오면 
				year = Integer.parseInt(syear);					
			}
			
			int month = cal.get(Calendar.MONTH) + 1;
			if(nvl(smonth)== false){
				month = Integer.parseInt(smonth);
			}
			
			if(month < 1){
				month = 12;
				year--;
			}
			if(month > 12){
				month = 1;
				year++;
			}
			
			cal.set(year, month -1, 1);	//년월일
			
			//요일 
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
			
			// <<	year--
			String pp = String.format("<a href='%s?year=%d&month=%d'>"
										+"<img src='../image/left.gif'></a>",
										"addInstall.jsp", year-1, month);
			// <	month--
			String p = String.format("<a href='%s?year=%d&month=%d'>"
										+"<img src='../image/prec.gif'></a>",
										"addInstall.jsp", year, month-1);
			// >	month++ 
			String n = String.format("<a href='%s?year=%d&month=%d'>"
										+"<img src='../image/next.gif'></a>",
										"addInstall.jsp", year, month+1);
			
			// >>	year++
			String nn = String.format("<a href='%s?year=%d&month=%d'>"
										+"<img src='../image/last.gif'></a>",
										"addInstall.jsp", year+1, month);
			
		%>
		<div class="content" align="center">
			<div class="back1">
				<div class="calender">
					<table border="1">
						<col width="7"><col width="7"><col width="7"><col width="7"><col width="7">
						<col width="7"><col width="8">
						<tr height="15">
							<td colspan="7" align="center" style="padding-top: 10px;">
								<%=pp %>&nbsp;&nbsp;<%=p %>&nbsp;
								<font color="black" style="font-size: 15px;"><%=String.format("%d년&nbsp;&nbsp;%2d월", year, month) %></font>
								<%=n %>&nbsp;&nbsp;<%=nn %>
							</td>
						</tr>
						<tr height="30">
							<th align="center">일</th>
							<th align="center">월</th>
							<th align="center">화</th>
							<th align="center">수</th>
							<th align="center">목</th>
							<th align="center">금</th>
							<th align="center">토</th>
						</tr>
						<tr height="20" align="left" valign="top">
						<%
							//위쪽 빈칸 
							for(int i = 1; i < dayOfWeek; i++){
								%>
								<td style="background-color: #cecece">&nbsp;</td>
								<%
							}
						%>
						<%-- 날짜 --%>
						<%
							int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
							for(int i = 1; i <= lastday; i++){
								%>
								<td>
									<%=cal_list(year, month, i) %>&nbsp;&nbsp;
								</td>
								<%
								if(( i + dayOfWeek -1)%7 == 0 && i != lastday){
									%>
									</tr><tr height="20" align="left" valign="top">
									<%
								}
							}
						%>	
						<!-- 밑칸 -->
						<%
							cal.set(Calendar.DATE, lastday);	// 그 달의 마지막 날짜 
							int weekday = cal.get(Calendar.DAY_OF_WEEK);
							for(int i = 0; i < 7 - weekday; i++){
								%>
								<td style="background-color: #cecece">&nbsp;</td>
								<%
							}
						%>
						</tr>
					</table>
				</div>
				<div align="center" class="list">
					<form action="<%=request.getContextPath() %>/getInstallList_Null">
						<button type="button">이동!</button>
					</form>
					<table style="width: 100%" id="InstallTable" border="1">
						<col width="20"><col width="20"><col width="15"><col width="15">
						<col width="20"><col width="10">
						<tr>
							<th>모델명</th><th>회원아이디</th><th>구매일자</th><th>설치희망일</th><th>주소</th><th>추가</th>
						</tr>
					</table>
				</div>
			</div>
			<div class="back2">
				<font>예약 신청 목록</font>
				<table></table>
			</div>
		</div>
		<script type="text/javascript">
			$("document").ready(function name() {
				
				$("button").click(function () {

					$.ajax({
						url:'<%=request.getContextPath() %>/getInstallList_Null',
						type:"post",
						data:"",
						datatype:"json",
						
						success: function ( data ) {
							//alert(data[0].mem_name);
							alert(data);
							
							
							if(data == "") {
								//list가 null일때 처리 
								var str = "<tr><td colspan='5'>데이터가 없습니다</td><tr>"
							}else{
								//alert(data.length);
								
								if(data.length > 0){
									for(i = 0; i < data.length; i++){
										var str = "<tr>" ;
										str += "<td align='center'>"+ data[i].prd_model_name + "</td>";
										str += "<td align='center'>"+ data[i].mem_id + "</td>";
										str += "<td align='center'>"+ data[i].pur_date.substr(0,10) + "</td>";
										str += "<td align='center'>"+ data[i].ins_date.substr(0,10) + "</td>";
										str += "<td align='center'>"+ data[i].mem_addr1 + "</td>";
										str += "<td align='center'><button type='button'>+</button></td></tr>";
										$("#InstallTable").append(str);
									}
								}
							}
						},
						error: function () {
							alert("통신 실패");
						}
						
					});
					
					
				});
			});
		</script>
	</body>
</html>