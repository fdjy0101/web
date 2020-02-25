package com.jun.vo;

import java.util.Date;

public class BoardVO {
	private int bno;
	private String writer;
	private String title;
	private String passwd;
	private Date regdate;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_level;
	private String content;
	private String ip;
	private int remove;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getRemove() {
		return remove;
	}
	public void setRemove(int remove) {
		this.remove = remove;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", writer=" + writer + ", title=" + title + ", passwd=" + passwd + ", regdate="
				+ regdate + ", readcount=" + readcount + ", ref=" + ref + ", re_step=" + re_step + ", re_level="
				+ re_level + ", content=" + content + ", ip=" + ip + ", remove=" + remove + "]";
	}
}
