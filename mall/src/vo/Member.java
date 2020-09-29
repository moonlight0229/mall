package vo;

public class Member {
	private String memberEmail;	// 회원 이메일
	private String memberPw;		// 회원 비밀번호
	private String memberName;	// 회원 이름
	private String memberDate;	// 회원 가입일
	
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(String memberDate) {
		this.memberDate = memberDate;
	}
}
