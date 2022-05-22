package com.fred.proj.vo;

public class EmailVO {
	
	private String senderName;		// 발신자 이름
	private String senderMail;		// 발신자 이메일
	private String receiveMail; 	// 수신자 이메일
	private String subject;			// 제목
	private String message;			// 본문
	private String callNumber;		// 연락처
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSenderMail() {
		return senderMail;
	}
	public void setSenderMail(String senderMail) {
		this.senderMail = senderMail;
	}
	public String getReceiveMail() {
		return receiveMail;
	}
	public void setReceiveMail(String receiveMail) {
		this.receiveMail = receiveMail;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getCallNumber() {
		return callNumber;
	}
	public void setCallNumber(String callNumber) {
		this.callNumber = callNumber;
	}
	
	@Override
	public String toString() {
		return "EmailVO [senderName=" + senderName + ", senderMail=" + senderMail + ", receiveMail=" + receiveMail
				+ ", subject=" + subject + ", message=" + message + ", callNumber=" + callNumber + "]";
	}
	
	
}
