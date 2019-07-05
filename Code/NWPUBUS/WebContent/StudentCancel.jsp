<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>学生取消预约界面</title>
   <link href="css/bootstrap.min.css" rel="stylesheet">
   <script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
      
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
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
					<div class="col-md-5 column">
					<ul class="breadcrumb">
						<li>
							 <a href="Student.jsp">预约</a>
						</li>
						<li>
							 <a href="StudentCancel.jsp">已预约</a>
						</li>
						<li>
							 <a href="#">用户反馈</a>
						</li>
					</ul>					
				</div>
				<div class="col-md-3 column">
				<P>欢迎&nbsp&nbsp<a>LYF</a>&nbsp&nbsp&nbsp&nbsp<a>退出登陆<a></P>
				
				</div>
				<div class="col-md-4 column">
				<iframe scrolling="no" src="https://tianqiapi.com/api.php?style=tu&skin=pitaya" frameborder="0" width="300" height="25" allowtransparency="true"></iframe>
				<body onload="startTime()">
				<div id="txt"></div>
				</body>
				</div>
				
			</div>
		</div>
		
		<!-- 这是一个列表 -->
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<table class="table table-hover table-striped">
						<thead>
								<tr>
														<th>
														发车时间
														</th>
														<th>
														已预约人数
														</th>
														<th>
														状态（能否乘坐？）
														</th>
														<th>
														操作
														</th>
													</tr>
												</thead>
												<c:forEach items="" var="npubus" varStatus="nb">
													<tbody>
													<tr class="success">
														<td>
														data
														</td>
														<td>
														number
														</td>
														<td>
														Approved
														</td>
								<td>
						<!-- 这是一个模态框 ，用来确认操作 -->
							<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModal">取消预约</button><!-- 模态框（Modal） --> 								
   						<script>
  			 			$(function () { $('#myModal').modal2('hide')});</script>					
  							</td>
						</tr>
					</tbody>
					</c:forEach>
				</table>
				<!-- 模态框 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  									 <div class="modal-dialog">
      									<div class="modal-content">
         									<div class="modal-header">
            									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×            </button>
            										<h4 class="modal-title" id="myModalLabel">操作确认 </h4>
        			 						</div>
         									<div class="modal-body"> 请确认您要取消预约的校车信息：<br>发车时间：<br>已预约人数：        </div>
         									<div class="modal-footer">
            									<button type="button" class="btn btn-default" data-dismiss="modal" >关闭 </button>
            									<button type="button" class="btn btn-primary" > 确认</button>
        				 					</div>
     									</div><!-- /.modal-content -->
   									</div>
   						
			<!-- 这是一个提示信息 -->
				<div class="alert alert-success alert-dismissable">
				 	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				 		<strong>提示!<br></strong> 如果取消预约可能会导致无法坐到此次校车，需重新预约排队。 <a href="TeacherCancel.jsp" class="alert-link">返回</a>
				</div>
				<!-- /.modal-dialog --></div><!-- /.modal -->
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>