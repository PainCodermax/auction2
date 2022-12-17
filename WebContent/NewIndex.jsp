<%@page import="java.sql.Timestamp"%>
<%@page import="impl.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page 
 import="impl.BookDaoImpl"
 import="java.util.*"
 import="dao.BookDaoFactory"
 import="dao.BookDao"
 import="entity.Book"
 import="java.text.SimpleDateFormat"
 import="entity.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.sql.Timestamp"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<User> users = (List<User>)request.getAttribute("users");
List<Book> goodss = (List<Book>)request.getAttribute("goodss");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auction Web</title>
<link rel="stylesheet" href="css/HomePage.css" />
<link rel="stylesheet" href="css/SerchBox.css" />
<link rel="stylesheet" href="css/Carousel.css" />

<script type="text/javascript" src="js/jquery-2.1.0.js" ></script>
<script type="text/javascript" src="js/index.js" ></script>
</head>
<body>
	<div class="HomePageTitle">
		<nav>
			<%
				if (session.getAttribute("user") == null) {
			%>  
			<a href="<%=path%>/login.jsp"><font color="#A6686A">Login</font></a>
			<%
				} else {
			%>  
			        <a href="<%=path %>/UserServlet?user_id=<%=((User)session.getAttribute("user")).getId() %>"><font color="#A6686A">User,${user.name} </font></a> 
					<a href="<%=path%>/IndexServlet?login=no"><font color="#A6686A"><font color="#D6686A">Log out</font> </font></a>
			<%
				}
			%>

			<a href="<%=path%>/index.jsp">Welcome!</a>
		</nav>
	</div>
	<div class="HomePageTitle2">
	    <div class="serchBox">
		<form action="SerchServlet" name="search" class="search" method="post" ><br>
			<input type="text" id="serchInput" name="serchInput" placeholder="Search"/>
			<input type="submit" id="serchBtn" value="Search" onclick=" return SumbitJudge()"/>
		</form>
		</div>
	</div>
<script type="text/javascript">
function SumbitJudge() {
    var input=document.getElementById("serchInput").value;
	if (!input) {
		alert("Nhập nội dung tìm kiếm !");
		return false;
	}
	return true;
}
</script>
	<div class="Navigation1" >
	<nav>
	        <a href="<%=path%>/index.jsp">Trang Chủ</a>
			<a href="<%=path%>/watch.jsp">Công Nghệ</a>
			<a href="<%=path%>/stamp.jsp">Thời trang</a>
			<a href="<%=path%>/book.jsp">Sách</a>
			<a href="<%=path%>/wine.jsp">Gia dụng</a>
	</nav>
	</div>
	<div class="test">
	<div id="Carousel">
			<ul id="List">
				<li class="FillSquare"></li>
				<li></li>
				<li></li>
				
				<li></li>
			</ul>
			<div id="ImgBox">
				<img class="FirstImage" src="img/S1.jpg" />
				<img src="img/S2.jpg" />
				
				<img src="img/S3.jpg" />
				<img src="img/S4.jpg" />				
			</div>
		</div>
	</div>
	<div class="popular">
		<p class="PopularP1">Phổ biến</p>
		<div class="CategoryBox">
		    <a href="watch.jsp">
			<div class="Category1">
			<img alt="" src="img/watch.PNG">
			</div>
			</a>
			<a href="book.jsp">
			<div class="Category2">
			<img alt="" src="img/typeForBook.PNG">
			</div>
			</a>
			 <a href="stamp.jsp">
			<div class="Category3">
			<img alt="" src="img/typeForStamp.PNG">
			</div>	
			</a>
			<a href="wine.jsp">
			<div class="Category4">
			<img alt="" src="img/wine.PNG">
			</div>
			</a>
		</div>
	</div>
	<div class="bookBox" id="bookBox">
		<p class="title">Sách</p>

	</div>
	<div class="stampBox" id="stampBox">
		<p class="title">Công nghệ</p>
	</div>

	<script type="text/javascript" src="js/Carousel.js" ></script>
	<script type="text/javascript" src="js/CreateIndex.js" ></script>
</body>
</html>