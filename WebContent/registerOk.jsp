<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="Bean.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="Bean.LoginDataBean"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mb" class="Bean.LoginDataBean"></jsp:useBean>
	<jsp:setProperty property="*" name="mb"/>
	
<%
	
	
      LoginDBBean dbpro=LoginDBBean.getinstance();
	if(dbpro.confirmID(mb.getMem_id())==1){
%>
	<script language="javascript">
		alert("���̵� �ߺ��˴ϴ�.");
		history.back();
	</script>		
<%	}else{
		int re = dbpro.insert(mb);
		if(re == 1){
			session.setAttribute("Mem_id",mb.getMem_id());
%>
		<script language="javascript">
			alert("ȸ�������� �����մϴ�!!");
			document.location.href='./Solo_Main.jsp';
		</script>
<%			
		}else{
%>
		<script language="javascript">
			alert("ȸ�����Կ� �����߽��ϴ� ��_��");
			document.location.href='./Solo_register.jsp';
		</script>
<%
		}
	}
%>

</body>
</html>