<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Bean.LoginDBBean" %>
<%@page import="Bean.LoginDataBean" %>
<%@ page import="Bean.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
    
<%
	String mem_id = request.getParameter("mem_id");
	String mem_passwd = request.getParameter("mem_passwd");
	
	
	LoginDBBean manager = LoginDBBean.getinstance();
	int cheeck = manager.cheeck(mem_id, mem_passwd);
	
	if(cheeck == 1 ){
		LoginDataBean member = manager.getMember(mem_id);
		session.setAttribute("mem_id",mem_id);
		session.setAttribute("MEMBER","yes");
		response.sendRedirect("Solo_Main.jsp");	
	
	}else if(cheeck == 0){	
		
%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<% }else{ %>
	<script>
	
		alert("존재 하지 않는 회원입니다.");
		history.go(-1);
	</script>

<%	} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>