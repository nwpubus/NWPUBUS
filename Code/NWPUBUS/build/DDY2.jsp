<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="utils.*" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Connection"%>
    <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
   <title>调度员页面</title>
   <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
   <script src="//cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 这是一个导航栏 -->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-5 column">
					<ul class="breadcrumb">
						<li>
							 <a href="DDY.jsp">预约信息</a>
						</li>
						<li>
							 <a href="UserFeedback3.jsp">用户反馈</a>
						</li>
					</ul>
					
				

				</div>
				<div class="col-md-3 column">
					<P>欢迎&nbsp&nbsp<a><%=request.getSession().getAttribute("id")%></a>&nbsp&nbsp&nbsp&nbsp<a href="Login.jsp">退出登陆</a></P>
				</div>
				<div class="col-md-4 column">
					<iframe scrolling="no" src="https://tianqiapi.com/api.php?style=tu&skin=pitaya" frameborder="0" width="300" height="25" allowtransparency="true"></iframe>
				<body onload="startTime()">
	
				<div id="txt"></div>
	
				</body>
				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="tabbable col-md-12 column" id="tabs-207109">
			<div class="row clearfix">
				<div class="col-md-8 column">
					<h3>
						预约信息
					</h3>
				</div>
				<div class="col-md-4 column">
					 
				</div>
			</div>
			<div class="col-md-12 column">
				<ul class="nav nav-tabs">
					<li>
						 <a href="#panel-1" data-toggle="tab" >
						  <span>
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write("今日：" + (date.getMonth() + 1) + "月" + date.getDate() + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt(date.getDay()));
			                   </script>
			             </span>
			             </a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-1">
							<!-- 这是一个列表 -->
								<div class="container">
									<div class="row clearfix">
										<div class="col-md-12 column">
											<form action="AddLineServlet" method="post">
											<table class="table table-hover table-striped">
												<thead>
													<tr>
														<th>
															时间
														</th>
														<th>
															班次
														</th>
														<th>
															已预约/上限
														</th>
														<th>
															剩余座位
														</th>
													</tr>
												</thead>
												<%
												DBHelper db = DBHelper.getInstance();
												Connection c = db.getInstance().getConnection();
												SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
												String t = (String)df.format(new Date());
												String sql = "select license, time, remain from dwork where day = ? and time > ? and start='友谊'";
												PreparedStatement ps = c.prepareStatement(sql);
												Date date = new Date();
												String xingqi ="星期"+"日一二三四五六日一二三四五六".charAt(date.getDay());
												ps.setString(1, xingqi);
												ps.setString(2, t);
												ResultSet rs = ps.executeQuery();
												%>
													<tbody>
													<%
													int i = 0;
													while(rs.next()) {
														String time = rs.getString("time");
														String no = rs.getString("license");
														int remain = rs.getInt("remain");
														if(i==0) {
															session.setAttribute("Time", time);
															session.setAttribute("no", no);
															session.setAttribute("start", "友谊");
													%>
														<tr class="success">
															<td>
																<%=time %>
															</td>
															<td>
																<%=no %>
															</td>
															<td>
																<%=45-remain %>/45
															</td>
															<td>
															增加
															<input type="text" id="addp" name="addp" value="1" size="1"/>
															<button type="submit">确定</button>
															</td>
														</tr>
														<%
														i = 1;
														} else {
														%>
														<tr class="success">
															<td>
																<%=time %>
															</td>
															<td>
																<%=no %>
															</td>
															<td>
																<%=45-remain %>/45
															</td>
															<td>
															
															</td>
														</tr>
														<%
														}}
														c.close();
														%>
													</tbody>
											</table>
											</form>
										</div>
									</div>
								</div>							
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 显示当前时间 -->
<script>
function startTime(){
	var today=new Date();
	var h=today.getHours();
	var m=today.getMinutes();
	var s=today.getSeconds();// 在小于10的数字钱前加一个‘0’
	m=checkTime(m);
	s=checkTime(s);
	document.getElementById('txt').innerHTML=h+":"+m+":"+s;
	t=setTimeout(function(){startTime()},500);
}
function checkTime(i){
	if (i<10){
		i="0" + i;
	}
	return i;
}
</script>

</body>
</html>