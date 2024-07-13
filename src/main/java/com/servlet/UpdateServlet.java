package com.servlet;

import java.io.IOException;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
    	int noteId = Integer.parseInt(request.getParameter("note_id"));
    	String tittle = request.getParameter("tittle");
    	String content = request.getParameter("content");
    	Session s = FactoryProvider.getFactory().openSession();
    	Transaction tx = s.beginTransaction();
    	Note note =s.get(Note.class,noteId);
    	note.setTittle(tittle);
    	note.setContent(content);
    	note.setAddedDate(new Date());
    	tx.commit();
    	s.close();
    	response.sendRedirect("all_notes.jsp");
    }
    catch(Exception e) {
    	e.printStackTrace();
    }
	}

}
