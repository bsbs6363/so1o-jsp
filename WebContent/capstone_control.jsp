<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,beans.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="beans.userDto" />
<jsp:useBean id="dao" class="beans.userDao" />
<jsp:setProperty name="dto" property="*" />
<jsp:useBean id="article" scope="page" class="beans.userDto">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>
<%
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	//파라미터에 따른 요청처리
	//회원 목록 요청인 경우
	if (action.equals("logout")) {
		session.invalidate();
%>
<script>
	alert("로그 아웃 되었습니다.")
</script>
<%
	pageContext.forward("Solo_Main.jsp");

	} else if (action.equals("login")) {

		String id = request.getParameter("mem_id");
		String passwd = request.getParameter("mem_passwd");

		userDao dbpro = userDao.getInstance();
		int cheeck = dbpro.cheeck(article);
		if (cheeck == 1) {
			userDto member = dbpro.getMember(id);
			session.setAttribute("member", member);
			response.sendRedirect("Solo_Main.jsp");

		} else if (cheeck == 0) {
%>
<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>

<%
	} else {
%>
<script>
	alert("존재 하지 않는 회원입니다.");
	history.go(-1);
</script>

<%
	}
	} else if (action.equals("insert")) {

		if (dao.insertDB(dto)) {
			response.sendRedirect("capstone_control.jsp?action=list");
		} else
			throw new Exception("DB 입력 오류");
	}
%>