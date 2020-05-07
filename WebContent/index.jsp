<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/front.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]--> 


</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->

<header>

<%
	//세션영역에 저장되어 있는 값을 판단해서 저장되어 있으면? 로그인이 된 화면으로 처리함.
	//세션영역에 저장되어 있는 값을 판단해서 저장되어 있지 않으면? 로그아웃된 화면으로 처리함.
	String id = (String)session.getAttribute("id");	

	if(id == null){	//세션값이 저장되어 있지 않는 경우
%>
		<div id="login">
			<a href="member/login.jsp">login</a>
			| <a href="member/join.jsp">join</a>
		</div>

<% 
	}else{//세션영역에 값이 저장되어 있다면 로그인된 화면으로 logout링크디자인이 나오도록 
%>
		<div id="login">
			<%=id %>님 로그인중...
			<a href="member/logout.jsp">logout</a>
		</div>
<% 
	}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="index.jsp">HOME</a></li>
	<li><a href="company/welcome.jsp">COMPANY</a></li>
	<li><a href="#">SOLUTIONS</a></li>
	<li><a href="center/notice.jsp">CUSTOMER CENTER</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>




<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>	
<div id="main_img">
  <img src="images/main_img.jpg" width="971" height="282">
 </div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>Web Hosting Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
<div id="security">
<h3>Web Security Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
<div id="payment">
<h3>Web Payment Solution</h3>
<p>Lorem impsun Lorem impsunLorem impsunLorem
 impsunLorem impsunLorem impsunLorem impsunLorem
  impsunLorem impsunLorem impsun....</p>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">Security</span> News</h3>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
</div>
<div id="news_notice">
<h3 class="brown">News &amp; Notice</h3>
<table>
<tr><td class="contxt"><a href="#">Vivans....</a></td>
    <td>2012.11.02</td></tr>
<tr><td class="contxt"><a href="#">Vivans....</a></td>
    <td>2012.11.02</td></tr>
<tr><td class="contxt"><a href="#">Vivans....</a></td>
    <td>2012.11.02</td></tr>
<tr><td class="contxt"><a href="#">Vivans....</a></td>
    <td>2012.11.02</td></tr>
<tr><td class="contxt"><a href="#">Vivans....</a></td>
    <td>2012.11.02</td></tr>
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="./bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>