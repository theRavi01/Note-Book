<%@page import="org.hibernate.Transaction"%>
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
<title>addNotes</title>
<%@ include file="all_js_css_file.jsp" %>
</head>
<body>
<div class="container">
<%@ include file="navbar.jsp" %>
<% int noteId =Integer.parseInt(request.getParameter("note_id").trim());
   Session s= FactoryProvider.getFactory().openSession();
   Transaction tx = s.beginTransaction();
   Note note = s.get(Note.class, noteId);
   System.out.println("My note id "+noteId);
   s.close();
%>
<h1 style=" text-align:center; color:green;"><u> Update Note</u></h1>
<!-- This is addnotes form -->
<form action="UpdateServlet" method="post">
  <div class="form-group">
  <input type="hidden" value="<%=note.getId() %>" name="note_id">
    <label for="tittle">Note Tittle</label>
    <input type="text" class="form-control" name="tittle" id="tittle" aria-describedby="emailHelp" 
    value="<%=note.getTittle() %>">
  </div>
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea class="form-control" id="content" name="content" placeholder="enter your content" 
    style="height:300px;"><%=note.getContent() %></textarea>
  </div>
  <div class="container text-center">
  <button type="submit" class="btn btn-success">Update Note</button>
  </div>
</form>
</div>
</body>
</html>