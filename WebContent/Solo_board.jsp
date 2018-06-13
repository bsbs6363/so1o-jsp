<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board_00.BoardDBBean" %>
<%@ page import = "board_00.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%!
	int pageSize=10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
	
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum="1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage -1) * pageSize+1;
	int endRow = currentPage * pageSize;
	int count =0;
	int number = 0;
	
	List articleList = null;
	
	BoardDBBean dbPro = BoardDBBean.getInstance();
	count = dbPro.getArticleCount();
	
	if(count > 0){
		articleList = dbPro.getArticles(startRow, pageSize);
	}
	
	number = count-(currentPage-1)*pageSize;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Sunflower:300" rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트, 모달관련 -->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>SOLO</title>
<style>
	#mission {
		margin: 2px 0;
		padding: 90px 100px;
		border-width: 100px;
		border-color: #aaa;
		border:1px solid black;
		height;
		background: #000000;
	}
</style>

<style>
.navbar-default { 
	background-color: #FFFFFF;
	border : 0;
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
a {color:black;
	font-family: 'Sunflower', sans-serif;
	font-family: 'Do Hyeon', sans-serif;
	}
.btn {
	background: #FFFFFF;
}
</style>

<!--  타이머 -->
	<script language="JavaScript">
	
		var SetTime = 43200;		// 최초 설정 시간(기본 : 초)

		function msg_time() {	// 1초씩 카운트
			
			m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";	//남은 시간 계산
			
			var msg = "<font id='dd' size='25'' color='white'>현재 남은 시간은</font> <font id='ee' color='red' size='30'>" + m + "</font> <font id='dd' size='25'' color='white'>입니다.</font>";
			
			document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 
					
			SetTime--;					// 1초씩 감소
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				
				clearInterval(tid);		// 타이머 해제
				alert("종료");
			}
			
		}

		window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
		
	</script>

</head>
<body>
<div class="container">
<div class="col-sm-12" align="center">
<a href="#"><img src="./img/banner.jpg" ></a>
</div>
</div>
<div class="container">
<nav class="navbar navbar-default" role="navigation">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
		<span class="sr-only"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#"><h3>나혼자 산다</h3></a>
	    </div>
	    <div class="navbar-collapse collapse" id="navbar-collapse-1">
	      <ul class="nav navbar-nav">
		<li><a href="#"><h3>도전 혼밥</h3></a></li>
		<li><a href="#"><h3>사이트 소개</h3></a></li>
		<li class="dropdown">
		  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><h3>게시판</h3><span class="caret"></span></a>
		  <ul class="dropdown-menu" role="menu">
		    <li><a href="#">자유게시판</a></li>
		    <li><a href="#">팁게시판</a></li>
		    <li><a href="#">질문게시판</a></li>
		    <li class="divider"></li>
		    <li><a href="#">-중고 장터-</a></li>
		  </ul>
		</li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
		<li><a href="#"><span class="glyphicon glyphicon-zoom-in"></span></a></li>
		<li><button type="button" class="btn glyphicon glyphicon-user" data-toggle="modal" data-target="#myModal" align="right"></button>
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
			
			<!-- Modal content -->
			<div class="modal-content">
				<div class="modal-header" style="padding:35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-lock"></span>로그인</h4>
				</div>
				<div class="modal-body" style="padding:40px 50px">
					<form role="form">
						<div class="form-group">
							<label for="usrname"><span class="glyphicon glyphicon-user"></span>아이디</label>
							<input type="text" class="form-control" id="usrname" placeholder= "email">
						</div>
						<div class="form-group">
							<label for="psw"><span class="glyphicon glyphicon-open"></span>비밀번호</label>
							<input type="text" class="form-control" id="psw" placeholder= "password">
						</div>
						<div class="Checkbox">
							<label><input type="checkbox" value="" checked>아이디 기억</label>
						</div>
						<button type="submit" class="btn btn btn-block">
							<span class="glyphicon glyphicon-off"></span> 로그인
						</button>
					</form>
				</div>
				<div class="modal-footer">
					<p>회원이 아니세요? <a href="./register.jsp" >회원 가입</a></p>
					<p>비밀번호를 잊어버리셨나요?<a href ="#">비밀번호 찾기</a></p>
					<!--  modal -->
				</div>
			</div>
		</div>
	</div></li>
	      </ul>
	    </div>
	  </div>
	</nav>
</div>
<div class="col-sm-2">
</div>
<div class="col-sm-10">
<div>
<div class="row">
<div class="col-sm-8">
<br>
<pre><a href="#">Home /</a> <a href="#">전체글</a></pre>
<h2>전체글 <small> 딱 랩의 모든글을 모아놨다!</small></h2>
<table class="table table-striped">
<tbody>
<tr>
<td>165</td>
<td>이제 곧 부트스틃이나와?</td>
<td>2016.12.02</td>
<td>2</td>
</tr>
<tr>
<td>165</td>
<td>이제 곧 부트스틃이나와?</td>
<td>2016.12.02</td>
<td>2</td>
</tr>
<tr>
<td>165</td>
<td>이제 곧 부트스틃이나와?</td>
<td>2016.12.02</td>
<td>2</td>
</tr>
<tr>
<td>165</td>
<td>이제 곧 부트스틃이나와?</td>
<td>2016.12.02</td>
<td>2</td>
</tr>
<tr>
<td>165</td>
<td>이제 곧 부트스틃이나와?</td>
<td>2016.12.02</td>
<td>2</td>
</tr>
</tbody>
</table>

<a class="btn btn-default">글쓰기</a>
<div class="text-center">
<ul class="pagination">
<li><a href="#">1</a></li>
<li><a href="#">2</a></li>
<li><a href="#">3</a></li>
<li><a href="#">4</a></li>
<li><a href="#">5</a></li>

</ul>
</div>
</div>

<div class="col-sm-4" >
<h2><span class="glyphicon glyphicon-folder-open"></span> CATEGORY</h2>
<hr class="one">
<span class="glyphicon glyphicon-bell"> <a href="#" style="color:black;">메인</a></span>
<hr class="one">
<span class="glyphicon glyphicon-bell"> <a href="#" style="color:black;">전체글</a></span>
<hr class="one">
<span class="glyphicon glyphicon-bell"> <a href="#" style="color:black;">일상</a></span>
<hr class="one">
<span class="glyphicon glyphicon-bell"> <a href="#" style="color:black;">사진</a></span>
<hr class="one">
<span class="glyphicon glyphicon-bell"> <a href="#" style="color:black;">자료실</a></span>
<hr class="one">
<span class="glyphicon glyphicon-bell"> <a href="#" style="color:black;">메인</a></span>
<h2><span class="glyphicon glyphicon-comment"></span> COMMENTS</h2>
<hr class="one">
</div>
</div>
</div>
</div>
</body>
</html>