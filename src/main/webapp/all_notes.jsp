<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all notes</title>
<%@ include file="all_js_css_file.jsp" %>
</head>
<body>
  <div class="container">
 <!--   for full navbar
  <div class="container-fluid p-0 m-0">  -->
    <%@include file="navbar.jsp" %>
    <h1 style=" color:green; text-align:center;"><u>All Notes</u></h1>
  <div class="row">
  <div class="col-12">
   <%
  Session s = FactoryProvider.getFactory().openSession();
		 Query q = s.createQuery("from Note");
		 List<Note> list = q.list();
		 for(Note note:list){
			 %>
			 <div class="card" >
  <img class="card-img-top m-4" style="max-width:100px;" src="img/notes.jpg" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title"><%out.println(note.getTittle()); %></h5>
    <p class="card-text"><%out.println(note.getContent()); %></p>
    <p class="card-text">Created Date: <%out.println(note.getAddedDate()); %></p>
    <a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
    <a href="update.jsp?note_id=<%=note.getId()%>" class="btn btn-success">Update</a>
  </div>
</div>
			 <%
		 }
		 s.close();
  %>
  </div>
  </div> 
  </div>
</body>
</html>