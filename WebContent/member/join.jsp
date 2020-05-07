<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 
 
 <script type="text/javascript">
 	function winopen(){ //아래의 아이디중복체크 버튼 눌렀을때 호출되는 함수
 		//1. 아이디를 입력했는지 검사
 		//아이디를 입력하지 않았다면
 		if(document.f.id.value == ""){
 			alert("아이디를 입력하세요.");
			//아이디 입력 <input>태그에 포커스 깜빡
			document.f.id.focus();
			
			return;
 		}
 		//아이디를 입력 했다면
 		//입력한 아이디를 얻는다.
 		var fid = document.f.id.value;
 	
 		// 새창을 join_IDCheck.jsp로 띄우며 전달값으로 바로위에 입력한 아이디를 전달함.
 		//새창의 width와 height를 크기를 지정 
 		window.open("join_IDCheck.jsp?userid=" + fid , "","width=400,height=200");
 		
 	}
</script> 
 
 
 
 
 
 
 
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action="joinPro.jsp" id="join" method="post" name="f">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id">
<input type="button" value="아이디중복체크" class="dup" onclick="winopen()"><br>
<label>Password</label>
<input type="password" name="passwd"><br>
<label>Retype Password</label>
<input type="password" name="passwd2"><br>
<label>Name</label>
<input type="text" name="name"><br>
<label>E-Mail</label>
<input type="email" name="email"><br>
<label>Retype E-Mail</label>
<input type="email" name="email2"><br>
</fieldset>







<fieldset>
<legend>Optional</legend>
<label>Address</label>
<input type="text" name="address"><br>
<label>Phone Number</label>
<input type="text" name="tel"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mtel"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="가입" class="submit">
<input type="reset" value="취소" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>