<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="beans.*"%>
     <jsp:useBean id="dto" class="beans.userDto"/>
    <jsp:useBean id="dao" class="beans.userDao"/>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    String id = (String) session.getAttribute("login");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>SOLO</title>
<style>
#mission {
	margin: 2px 0;
	padding: 90px 100px;
	border-width: 100px;
	border-color: #aaa;
	border: 1px solid black; height;
	background: #000000;
}
</style>

<style>
.navbar-default {
	background-color: #FFFFFF;
	border: 0;
}
</style>

<!-- 네비게이션  -->
<style>
.nav {
	font-family: 'Sunflower', sans-serif;
	font-family: 'Do Hyeon', sans-serif;
}

#dd, #ee {
	font-family: 'Sunflower', sans-serif;
	font-family: 'Do Hyeon', sans-serif;
}
</style>


<style>
ban {
	font-size: ''
}
</style>

<style type="text/css">
a {
	color: black;
	font-family: 'Sunflower', sans-serif;
	font-family: 'Do Hyeon', sans-serif;
}

.btn {
	background: #FFFFFF;
}
</style>

<!--  타이머 -->
<script language="JavaScript">
	var SetTime = 43200; // 최초 설정 시간(기본 : 초)

	function msg_time() { // 1초씩 카운트

		m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";

		var msg = "<font id='dd' size='25'' color='white'>현재 남은 시간은</font> <font id='ee' color='red' size='30'>"
				+ m
				+ "</font> <font id='dd' size='25'' color='white'>입니다.</font>";

		document.all.ViewTimer.innerHTML = msg; // div 영역에 보여줌 

		SetTime--; // 1초씩 감소

		if (SetTime < 0) { // 시간이 종료 되었으면..

			clearInterval(tid); // 타이머 해제
			alert("종료");
		}

	}

	window.onload = function TimerStart() {
		tid = setInterval('msg_time()', 1000)
	};
</script>

</head>
<body>
	<div class="container">
		<div class="col-sm-12" align="center">
			<a href="./Solo_Main.jsp"><img src="./img/banner.jpg"></a>
		</div>
	</div>
	<div class="container">
		<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse-1">
					<span class="sr-only"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><h3>나혼자 산다</h3></a>
			</div>
			<div class="navbar-collapse collapse" id="navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#"><h3>도전 혼밥</h3></a></li>
					<li><a href="#"><h3>사이트 소개</h3></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"><h3>게시판</h3>
							<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">자유게시판</a></li>
							<li><a href="#">팁게시판</a></li>
							<li><a href="#">질문게시판</a></li>
							<li class="divider"></li>
							<li><a href="#">-중고 장터-</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-zoom-in"></span></a></li>
					<c:if test="${member.mem_id != null }">
						<li><form method="post" action="capstone_control.jsp?action=logout">
							<P><!-- mb.getUserid()  -->${member.mem_name}님 환영합니다</P>
							<input type="submit" value="로그아웃">
						</form></li>
					</c:if>
					<c:if test="${member.mem_id == null }">
					<li><button type="button" class="btn glyphicon glyphicon-user"
							data-toggle="modal" data-target="#myModal" align="right"></button>
						<!-- Modal -->
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content -->
								<div class="modal-content">
									<div class="modal-header" style="padding: 35px 50px;">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4>
											<span class="glyphicon glyphicon-lock"></span>로그인
										</h4>
									</div>
									<div class="modal-body" style="padding: 40px 50px">
										<form role="form" method="post"
											action="capstone_control.jsp?action=login">
											<div class="form-group">
												<label for="usrname"><span
													class="glyphicon glyphicon-user"></span>아이디</label> <input
													type="text" class="form-control" id="usrname"
													placeholder="email" name="mem_id">
											</div>
											<div class="form-group">
												<label for="psw"><span
													class="glyphicon glyphicon-open"></span>비밀번호</label>a <input
													type="text" class="form-control" id="password"
													placeholder="password" name="mem_passwd">
											</div>
											<div class="Checkbox">
												<label><input type="checkbox" value="" checked>아이디
													기억</label>
											</div>
											<button type="submit" class="btn btn btn-block">
												<span class="glyphicon glyphicon-off"></span> 로그인
											</button>
										</form>
									</div>
									<div class="modal-footer">
										<p>
											회원이 아니세요? <a href="./Solo_register.jsp">회원 가입</a>
										</p>
										<!--  modal -->
									</div>
								</div>
							</div>
						</div></li>
						</c:if>
				</ul>
			</div>
		</div>
		</nav>
	</div>
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
		<div class="col-sm-3">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading ">
						<h3 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse1">공지사항<span class="badge">4</span>
							</a>
						</h3>
					</div>
					<div id="collapse1" class="panel-collapse collapse in">
						<div class="panel-body">ㅁㄴㅇ</div>
						<div class="panel-body">ㅁㄴㅇ</div>
						<div class="panel-body">ㅁㄴㅇ</div>
						<div class="panel-body">ㅁㄴㅇ</div>
					</div>
				</div>
			</div>
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" align="center">
					<div class="item active">
						<img style="height: 225px; width: 100%; display: block;"
							src="./img/1.PNG">
					</div>

					<div class="item">
						<img style="height: 225px; width: 100%; display: block;"
							src="./img/2.PNG">
					</div>
					<div class="item">
						<img style="height: 225px; width: 100%; display: block;"
							src="./img/3.PNG">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
		<div class="col-sm-8" align="center" id="mission"></div>

		<div>
			<div class="col-lg-3 col-md-4 col-xs-6">

				<a href="#" class="d-block mb-4 h-100"> <img
					class="img-fluid img-thumbnail" src="http://placehold.it/400x300"
					alt="">

				</a>

			</div>
			<div class="col-lg-3 col-md-4 col-xs-6">

				<a href="#" class="d-block mb-4 h-100"> <img
					class="img-fluid img-thumbnail" src="http://placehold.it/400x300"
					alt="">

				</a>

			</div>
		</div>
	</div>
	<div class="col-sm-2"></div>
</body>
</html>