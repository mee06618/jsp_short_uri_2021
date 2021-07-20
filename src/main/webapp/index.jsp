<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import ="java.util.*"%>
   <%@ page import ="com.jhs.exam.exam2.dto.Site"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String user=(String)request.getSession().getAttribute("user");

	if(user==null || user=="")
		user="none";
	System.out.println(user);
%>
<%

List<Site> list = (ArrayList<Site>)session.getAttribute("list");


 %>
<style>
body {
    padding : 0;
    margin : 0;
}
header {
    background-color: #867AE9;
}
.layout {
    width: 68%;
    margin : 0 auto;
}
.layout > a {
    display: inline-block;
    padding : 18px;
    color: white;
    text-decoration: none;
}
.topmenu {
    
}
</style>

<body>
	<header>
        <div class="topmenu layout">
            <span>줄일 주소를 입력해주세요</span>
            <form action="go/<%=user %>/a"method="GET">
            	<input type="text" name="originUri"></input>
            	<input type="submit" value="변환"></input>
            	
            </form>

             <%
    if(request.getParameter("shortCode")!="" && request.getParameter("shortCode")!=null){
    %>
            <h1>변환된 주소 : <%=request.getParameter("shortCode") %></h1>
            <%} %>
        
        </div>
    </header>
    	<%if(user=="none") {%>
     	 <form action="usr/login"method="POST">
            	<input type="text" name="id"></input>
            	<input type="text" name="password"></input>
            	<input type="submit" value="로그인"></input>
            </form>
    <%}else{ %>
   	<h2>로그아웃</h2>
   	<%} %>
   	<section>
   	
   			<form action="go/master/t" method="GET">
            	<input name="tag" type="text" />
            	<input type="submit" value="찾기"/>
            </form>
               <%if(list!=null){%>
            		<ul>
 
           			 <%for(Site site :list){%>
            	  	<li>이름 : <%=site.getOriginUri()%> 설명 : <%=site.getText() %> 코드 : <%=site.getShortCode() %></li>
            		 <%}%>
            		</ul>
            		 <%}else{%>
            	<h2>일치하는 정보가 없습니다</h2>
            	 <%}%>
   	</section>
</body>
</html>