package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.entities.Note;
import com.helper.FactoryProvider;


/**
 * Servlet implementation class SaveNotesServelet
 */
//@WebServlet("SaveNotesServlet")
public class SaveNotesServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			String tittle = request.getParameter("tittle");
			String content =  request.getParameter("content");
			
			Note note = new Note(tittle,content,new Date());
			System.out.println(note.getId()+" "+note.getTittle());
			
//			hibernate save()
//			Configuration cfg =new Configuration();
//			cfg.configure("hibernate.cfg.xml");
//			
			
//			SessionFactory f = cfg.buildSessionFactory();
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx =  s.beginTransaction();

	        s.save(note);
			tx.commit();
			s.close();
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.println("<h2 style=\"text-align:center;\">note added successfully<br><a href=\"all_notes.jsp\">All notes</a></h2>");
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}

}
