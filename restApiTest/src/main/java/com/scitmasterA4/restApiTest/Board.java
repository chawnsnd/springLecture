package com.scitmasterA4.restApiTest;

public class Board {

	int boardno;
	String title;
	String content;
	String writer;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(int boardno, String title, String content, String writer) {
		super();
		this.boardno = boardno;
		this.title = title;
		this.content = content;
		this.writer = writer;
	}

	public int getBoardno() {
		return boardno;
	}

	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "Board [boardno=" + boardno + ", title=" + title + ", content=" + content + ", writer=" + writer + "]";
	}
	
	
	
}
