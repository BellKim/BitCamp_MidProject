<%@page import="Dto.ManagerMemberDto"%>
<%@page import="Dto.InstallDto"%>
<%@page import="java.util.Calendar"%>

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
		
		//2020/02/10 형식으로 servlet에 넘기기위한 변수
		String date = year + "/" + two("" + month) + "/" + two("" + day);
		String str = "";
		
		//여기 servlet으로 어떻게 보내고 받을것인지 확인 
		str += String.format("&nbsp;<span sdate='" + date + "'>");
		
		str += String.format("%2d", day);  // <a href="">날짜</a>
		
		str += "</span>";
		
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

<%@ include file="./../include/header.jsp" %>

<%
	ManagerMemberDto loginDto = null;
	if(request.getSession().getAttribute("managerLogin") != null){
		loginDto = (ManagerMemberDto)request.getSession().getAttribute("managerLogin");
		System.out.println(loginDto.getMgr_auth());
	}
	
%>    
		<%
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.DATE, 1);		
			
			String syear = request.getParameter("year")==null?"":request.getParameter("year");
			String smonth = request.getParameter("month")==null?"":request.getParameter("month");
			
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
			
			// <<	year-- left
			String pp = String.format("<a href='%s?year=%d&month=%d&command=%s'>"
										+ "<img src='"+ request.getContextPath()+"/admin_view/InstallList/image/left.gif'></a>",
										request.getContextPath() + "/InstallController", year-1, month , "carlender");
			// <	month-- prec
			String p = String.format("<a href='%s?year=%d&month=%d&command=%s'>"
									+ "<img src='"+ request.getContextPath()+"/admin_view/InstallList/image/prec.gif'></a>",
										request.getContextPath() + "/InstallController", year, month-1, "carlender");
			// >	month++ next
			String n = String.format("<a href='%s?year=%d&month=%d&command=%s'>"
										+ "<img src='"+ request.getContextPath()+"/admin_view/InstallList/image/next.gif'></a>",
										request.getContextPath() + "/InstallController", year, month+1, "carlender");
			
			// >>	year++ last
			String nn = String.format("<a href='%s?year=%d&month=%d&command=%s'>"
										+ "<img src='"+ request.getContextPath()+"/admin_view/InstallList/image/last.gif'></a>",
										request.getContextPath() + "/InstallController", year+1, month, "carlender");
			
		%>
		
		<div class="content">
			<div class="back1" align="center">
				<br>
				<div class="calender">
					<table border="1" id="cal" style="width: 100%">
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
							<th align="center" style="color: red">일</th>
							<th align="center">월</th>
							<th align="center">화</th>
							<th align="center">수</th>
							<th align="center">목</th>
							<th align="center">금</th>
							<th align="center" style="color: blue">토</th>
						</tr>
						<tr height="30" align="left" valign="top">
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
								//요일 판단 
								Calendar cal2 = Calendar.getInstance();
								cal2.set(year, month - 1, i);
								int dayOfWeek2 = cal2.get(Calendar.DAY_OF_WEEK);
								
								if(dayOfWeek2 == 1){
									//일요일
									%>
									<td style="color: red">
										<%=cal_list(year, month, i) %>&nbsp;&nbsp;
									</td>
									<%
								}else if(dayOfWeek2 == 7){
									//토요일
									%>
									<td style="color: blue">
										<%=cal_list(year, month, i) %>&nbsp;&nbsp;
									</td>
									<%
								}else{
									%>
									<td>
										<%=cal_list(year, month, i) %>&nbsp;&nbsp;
									</td>
									<%
								}
								if(( i + dayOfWeek -1)%7 == 0 && i != lastday){
									%>
									</tr><tr height="30" align="left" valign="top">
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
			</div>
			<div class="back2" >
				<br>
				<div style="float: left; width: 50%; background-color: yellow;">
					<br>
					<h3>신청가능 목록</h3>
					<table style="width: 100%" id="InstallTable" class="table table-hover">
						<col width="15"><col width="15"><col width="20"><col width="15"><col width="17">
						<col width="10"><col width="8">
						<tr>
							<th><span class="IS_list_head">관리번호</span></th>
							<th><span class="IS_list_head">모델명</span></th><th><span class="IS_list_head">회원아이디</span></th>
							<th><span class="IS_list_head">구매일자</span></th><th><span class="IS_list_head">설치희망일</span></th>
							<th><span class="IS_list_head">주소</span></th><th><span class="IS_list_head">추가</span></th>
						</tr>
					</table>
				</div>
				<div style="float: left; width: 50%; background-color: gray;">
					<font>예약 신청 목록</font>
					<table style="width: 100%;" id="basketList" class="table table-hover">
						<col width="15"><col width="15"><col width="20"><col width="16"><col width="16">
						<col width="10"><col width="8">
					</table>	
				</div>
				<div style=" background-color: darkgray; clear: both;">
					<button type="button" id="save">예약 저장하기</button>
				</div>
			</div>
		</div>
		<div id="popup" style="	width: 300px;
								height: 400px;
								background-color: gray;
								position: absolute;
								top: 200px;
								left: 500px;
								text-align: center;
								border: 2px solid #000;	
								display: none">
			<div id="detail" style="width: 300px; height: 370px;">
				<span>선택한 신청리스트의 상세정보</span>
				<ul id="detail_List">
				</ul>
			</div>
			<div id="declose" style="width: 100px; margin: auto;">close</div>
		</div>
		
		
		<script type="text/javascript">
			
		
			$(document).ready(function () {
				
				
				//장바구니에 뿌려주기 위한 변수 
				var list = null;
				//장바구니로 사용되는 변수 
				var basketList = new Array(6);
				//장바구니 주소값을 설정하려고 사용하는 변수 
				var listCount = 0;
				//servlet에 보내기 위해  seq를 저장하기 위한 배열 생성 
				var insArr = [];
				
				$(document.body).delegate('.getList', 'click', function() {
					//alert("크크크크클릭");
					//디테일로 넘어가기 
					var index = $(".plus").val();
					alert(list[0].ins_index);
					$("#popup").css("display","block");
					
				});
				
				
				
				$("#cal span").click(function name() {
					//alert("날짜 클릭");
					alert($(this).attr("sdate"));
					var sdate = $(this).attr("sdate");
					
					$.ajax({
						
						url: "<%=request.getContextPath() %>/InstallController",
						type: "post",
						data: { "command": "getDayList",
								"date": sdate,
						},
						datatype: "json",
						success: function (data) {
							//alert("통신성공");
							alert(data);
							alert("data length = " + data.length);
							
							list = data;
							
							if(data == "") {
								//list가 null일때 처리
								$("#InstallTable").empty();
								var str = "<tr><th><span class='IS_list_head'>관리번호</span></th>" 
										 + "<th><span class='IS_list_head'>모델명</span></th><th><span class='IS_list_head'>회원아이디</span></th>"
										 + "<th><span class='IS_list_head'>구매일자</span></th><th><span class='IS_list_head'>설치희망일</span></th>"
										 +"<th><span class='IS_list_head'>주소</span></th><th><span class='IS_list_head'>추가</span></th></tr>";
								
								str += "<tr><td colspan='7'>해당 날짜의 데이터가 없습니다</td></tr>";
								
								$("#InstallTable").append(str);
							}else{
								//alert(data.length);
								if(data.length > 0){
									
									$("#InstallTable").empty();
									var str = "<tr><th><span class='IS_list_head'>관리번호</span></th>" 
										 + "<th><span class='IS_list_head'>모델명</span></th><th><span class='IS_list_head'>회원아이디</span></th>"
										 + "<th><span class='IS_list_head'>구매일자</span></th><th><span class='IS_list_head'>설치희망일</span></th>"
										 +"<th><span class='IS_list_head'>주소</span></th><th><span class='IS_list_head'>추가</span></th></tr>";
										 
										 $("#InstallTable").append(str); 
									for(i = 0; i < data.length; i++){
			 
										var str = "<tr id='intr" + i + "'>" ;				//list.get(0).getIns_index()
											str += "<td class='getList' align='center' >" + data[i].ins_index  + "</td>";
											str += "<td class='getList' align='center' style='font-size: 10px;'>" + data[i].prd_model_name + "</td>";
											str += "<td class='getList' align='center' style='font-size: 10px;'>" + data[i].mem_id + "</td>";
											str += "<td class='getList' align='center'>" + data[i].pur_date.substr(0,10) + "</td>";
											str += "<td class='getList' align='center'>" + data[i].ins_date.substr(0,10) + "</td>";
											str += "<td class='getList' align='center'>" + data[i].mem_addr1 + "</td>";
											str += "<td align='center'>" + "<button class='plus' type='button' value='" + i + "'>+</button>" + "</td></tr>";
											$("#InstallTable").append(str);
									}
								}
								
							}
						},
						error: function () {
							alert("통신실패");
						}
						
					});
				});
				
				/* 예약 장바구니에 옮기는 처리를 하는 함수 */
				$(document).on("click","td .plus",function () {
					//alert("버튼 클릭");
					//alert($(this).val());
					var addr = $(this).val();
					basket = addr; 
					listCount++;
					
					//alert(list[parseInt(addr)].ins_date);
					var str = "<tr id='bastr" + (listCount - 1) + "'>" ;
					str += "<td class='getList' align='center' style='font-size: 14px;'>" + list[parseInt(addr)].ins_index  + "</td>";
					str += "<td class='getList' align='center' style='font-size: 14px;'>" + list[parseInt(addr)].prd_model_name + "</td>";
					str += "<td class='getList' align='center' style='font-size: 14px;'>" + list[parseInt(addr)].mem_id + "</td>";
					str += "<td class='getList' align='center' style='font-size: 14px;'>" + list[parseInt(addr)].pur_date.substr(0,10) + "</td>";
					str += "<td class='getList' align='center' style='font-size: 14px;'>" + list[parseInt(addr)].ins_date.substr(0,10) + "</td>";
					str += "<td class='getList' align='center' style='font-size: 14px;'>" + list[parseInt(addr)].mem_addr1 + "</td>";
					str += "<td align='center' style='font-size: 14px;'>" + "<button class='minus' type='button' value='" + (listCount - 1) + "'  intr='"+ addr + "'>-</button>" + "</td></tr>";
					$("#basketList").append(str);
					
					$("#intr"+addr).hide();
					
				});
				
				
				//장바구니 버튼 동작 시키는 함수
				$(document).on("click","td .minus",function (){
					//alert("마이너스 클릭");
					
					//alert($(this).attr("intr"));
					var iaddr = $(this).attr("intr")
					$("#intr" + iaddr).show();
					$("#bastr"+ $(this).val()).remove();
					
				});
				
				//저장하기 버튼 클릭시 이벤트 
				$("#save").click(function () {
					
					//alert("저장하기 클릭");
					//담아져 있는 list안의 seq를 모두 가진 배열형태로 servlet에 보내기 
					
					//배열에 seq 담기
					//장바구니 List table 안의 모든 tr을 가져온다
					var tr = $("#basketList").children();			
					
					for(i = 1; i < tr.length; i++){
						// 0번지는  <col>태그 이기 때문에 값이 없어서 1번지부터 시작
						//가져온 첫번째 tr의 모든 td를 담는다
						var td = tr.eq(i).children();
						
						//그 중 seq를 담은 td의 값만 빼온다
						var seq = td.eq(0).text();
						//alert(seq);
						
						//0번지부터 값을 넣기  위함
						insArr.push(seq);
					}
					
					
					$.ajax({
						url:'<%=request.getContextPath() %>/InstallController',
						type:"post",
						traditional : true,
						data:{	command: "save",
								seqArr: insArr,
								/* 로그인 회원 index 추가  <-- 안해도 됨 controller 가서 session으로 뺴면 됨  */
						},
						datatype:"text",
						success: function ( result ) {
							alert("통신성공");
							//배열 초기화 
							insArr = [];
							alert(result);
							if(result=="True"){
								//alert("저장성공");
								location.href="<%=request.getContextPath() %>/InstallController?command=savet";
							}else{
								alert("저장실패");
							}
						},
						error: function () {
							alert("통신 실패");
						}
					});
				});
				
			});//ready
			
		</script>
		
<%@ include file="./../include/footer.jsp" %>