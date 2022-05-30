package com.project.entities;

import java.sql.Timestamp;
import java.util.Date;

public class post {
	private int pid;
	private String pTitle;
	private String pCode;
	private String pContent;
	private String pPic;
	private Timestamp pDate;
	private int cid;
	private int userId;



	public post(int pid, String pTitle,String pContent, String pCode,String pPic, Timestamp pDate, int cid,int userId) {
		super();
		this.pid = pid;
		this.pTitle = pTitle;
		this.pCode = pCode;
		this.pContent = pContent;
		this.pPic = pPic;
		this.pDate = pDate;
		this.cid = cid;
		this.userId = userId;
	}

	public post() {
		super();
	}

	public post(String pTitle, String pContent,String pCode, String pPic, Timestamp pDate, int cid,int userId) {
		super();
		this.pTitle = pTitle;
		this.pCode = pCode;
		this.pContent = pContent;
		this.pPic = pPic;
		this.pDate = pDate;
		this.cid = cid;
		this.userId = userId;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getpPic() {
		return pPic;
	}

	public void setpPic(String pPic) {
		this.pPic = pPic;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

}
