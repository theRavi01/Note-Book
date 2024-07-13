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
<h1 style=" text-align:center; color:green;"><u> Add Note</u></h1>
<!-- This is addnotes form -->
<form action="SaveNotesServelet" method="post">
  <div class="form-group">
    <label for="tittle">Note Tittle</label>
    <input type="text" class="form-control" name="tittle" id="tittle" aria-describedby="emailHelp" required>
  </div>
  <div class="form-group">
    <label for="content">Note Content</label>
    <textarea class="form-control" id="content" name="content" placeholder="enter your content" required
    style="height:300px;"></textarea>
  </div>
  <div class="container text-center">
  <button type="submit" class="btn btn-success">Add Note</button>
  </div>
</form>
</div>
</body>
</html>