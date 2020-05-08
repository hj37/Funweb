<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>

<!-- <div id="login"><a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a></div> -->
<%
	//세션영역에 저장되어 있는 값을 판단해서 저장되어 있으면? 로그인이 된 화면으로 처리함.
	//세션영역에 저장되어 있는 값을 판단해서 저장되어 있지 않으면? 로그아웃된 화면으로 처리함.
	String id = (String)session.getAttribute("id");	

	if(id == null){	//세션값이 저장되어 있지 않는 경우
%>
		<div id="login">
			<a href="../member/login.jsp">login</a>
			| <a href="../member/join.jsp">join</a>
		</div>

<% 
	}else{//세션영역에 값이 저장되어 있다면 로그인된 화면으로 logout링크디자인이 나오도록 
%>
		<div id="login">
			<%=id %>님 로그인중...
			<a href="../member/logout.jsp">logout</a>
		</div>
<% 
	}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../index.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">COMPANY</a></li>
	<li><a href="#">SOLUTIONS</a></li>
	<li><a href="../center/notice.jsp">CUSTOMER CENTER</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>