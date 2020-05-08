<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
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
</head>

<%
	//게시판에 글을 추가했다면 notice.jsp페이지에 추가한 글정보들을 검색해서 
	//현재 화면에 출력!
	
	//전체글개수 검색해서 얻자
	BoardDAO boardDAO = new BoardDAO();

	//전체 글 개수 얻기 
	int count = boardDAO.getBoardCount();

	//하나의 화면(한페이지)마다 보여줄 글 개수 10개로 정함
	int pageSize = 10;
	
	//아래의 페이지 번호 중 선택한 페이지 번호 얻기 
	String pageNum = request.getParameter("pageNum");
	
	//아래의 페이지번호 중 선택한 페이지번호가 없으면? 첫 notice.jsp 화면은 1페이지로 지정 
	if(pageNum == null){
		pageNum = "1";
	}
	
	//위의 pageNum 변수의 값을 정수로 변환해서 저장 
	int currentPage = Integer.parseInt(pageNum); //(현재 선택한 페이지 번호를 정수로 변환해서 저장)

	//각 페이지마다 가장 첫 번째로 보여질 시작 글 번호 구하기 
	//(현재 보여지는 페이지번호 - 1) * 한 페이지당 보여줄 글 개수 10 
	int startRow = (currentPage - 1) * pageSize; 
	
	//board게시판 테이블의 글 정보들을 검색하여 가져와서 저장할 ArrayList객체를 저장할 변수 선언 
	List<BoardBean> list = null;
	
	//만약 게시판에 글이 존재 한다면
	if(count > 0){
		
		//글정보 검색해오기 
		//			    getBoardList(각 페이지마다 첫 번째로 보여지는 시작 글번호, 한페이지당 보여줄 글개수)
		list = boardDAO.getBoardList(startRow, pageSize);
	}
	
%>




<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>Notice[전체 글 개수 : <%=count%>]</h1>
<table id="notice">
	<tr>
		<th class="tno">No.</th>
	    <th class="ttitle">Title</th>
	    <th class="twrite">Writer</th>
	    <th class="tdate">Date</th>
	    <th class="tread">Read</th>
	</tr>
  <%
  	 if(count > 0){ //만약 board게시판테이블에 글이 존재한다면 
 		
  		 for(int i=0; i < list.size(); i++){
  			 BoardBean bean = list.get(i);
  %>
  		<tr>
  			<td><%=bean.getNum()%></td>
   			<td class="left"><%=bean.getSubject() %></td>
   			<td><%=bean.getName() %></td>
   			<td><%=new SimpleDateFormat("yyyy.MM.dd").format(bean.getDate()) %></td>
   			<td><%=bean.getReadcount() %></td>
  		</tr>
  
  <% 			 
  			 
  		 }
  		 
  	 }else{//만약 board게시판테이블에 글이 존재 하지 않다면 
  %>
  	<tr>
  		<td colspan="5">게시판 글없음</td>
  	</tr>
  <% 
  	 }
  %>
  
  
</table>

<%
	//각각페이지에서 이동을 했을떄.. 하나의 웹브라우저가 닫기기전까지 session영역이 유지되므로 
	//session영여겡 값이 저장되어 있다면 로그인이 된 상태로 아래에... 글쓰기 버튼이 보이게 만들자.
	
	String id = (String)session.getAttribute("id");

	if(id != null){	//셰션영역에 id값이 저장되어 있다면
%>
	<div id="table_search">
		<input type="button" value="글쓰기" class="btn" onclick="location.href='write.jsp'">
	</div>
<% 
	}
%>



<div id="table_search">
<input type="text" name="search" class="input_box">
<input type="button" value="search" class="btn">
</div>
<div class="clear"></div>
<div id="page_control">
<%	
	if(count > 0){
		//전체 페이지수 구하기 글 20개 한 페이지에 보여줄 글 수 10개 => 2페이지 
		// 				글 25개 한 페이지에 보여줄 글 수 10개 -> 3페이지 
		//조건 삼항 연산자 조건 ? 참 : 거짓 
		//전체 페이지수 = 전체 글 개수 한 페이지에 보여줄 글 수 + (전체글수를 한페이지에 보여줄 글수로 나눈 나머지 값)
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		//한 블럭에 묶여질 페이지번호수 설정 
		int pageBlock = 1;
		
		//시작페이지 번호 구하기 
		// 1 ~ 10 => 1 , 11~ 20 =>11 , 21 ~ 30 => 21 
		//((선택한 페이지번호/ 한 블럭에 보여지는 페이지번호 수) - 
		//(선택한 페이지번호를 한 화면에 보여줄 페이지수로 나눈 나머지 값)) * 한 블럭에 보여줄 페이지수 + 1;
int startPage = 
((currentPage/pageBlock) - (currentPage % pageBlock == 0 ? 1 : 0 )) * pageBlock + 1; 

		//끝페이지 번호 구하기 1 ~ 10 => 10 , 11 ~ 20 => 20, 21 ~ 30 => 30 
		//시작페이지번호 + 현재블럭에 보여줄 페이지수 - 1	
		int endPage = startPage + pageBlock -1;
		
		//끝페이지 번호가 전체페이지수보다 클때 
		if(endPage > pageCount){
			//끝페이지 번호를 전체페이지수로 저장 
			endPage = pageCount;
		}
		
		//[이전] 시작페이지 번호가 한 화면에 보여줄 페이지수보다 클때...
		if(startPage > pageBlock){
%>
			<a href="notice.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
<% 			
		}
		//[1][2][3]...[10]
		for(int i = startPage; i <=endPage; i++){
%>
		<a href="notice.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<% 
		}
		//[다음] 끝페이지 번호가 전체 페이지수보다 작을때..
		if(endPage < pageCount){
%>
		<a href="notice.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
<%
		}
	
	}

%>
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>

<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>