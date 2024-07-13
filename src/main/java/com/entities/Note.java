package com.entities;

import java.util.Date;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Note {

	public Note() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Note( String tittle, String content, Date addedDate) {
		super();
		this.id = new Random().nextInt(100000);
		this.tittle = tittle;
		this.content = content;
		this.addedDate = addedDate;
	}
	@Override
	public String toString() {
		return "Note [id=" + id + ", tittle=" + tittle + ", content=" + content + ", addedDate=" + addedDate + "]";
	}
	
	@Id
	private int id;
	private String tittle;
	@Column(length = 1500)
	private String content;
	@Temporal(TemporalType.DATE)
	private Date addedDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTittle() {
		return tittle;
	}
	public void setTittle(String tittle) {
		this.tittle = tittle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getAddedDate() {
		return addedDate;
	}
	public void setAddedDate(Date addedDate) {
		this.addedDate = addedDate;
	}
}
