package pds;

public class PdsVO {
	private int idx;
	private String mid;
	private String nickName;
	private String fName;
	private String fSName;
	private int fSize;
	private String part;
	private String title;
	private String content;
	private String openSw;
	private String pwd;
	private String hospIp;
	private String fDate;
	private int downNum;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getfSName() {
		return fSName;
	}
	public void setfSName(String fSName) {
		this.fSName = fSName;
	}
	public int getfSize() {
		return fSize;
	}
	public void setfSize(int fSize) {
		this.fSize = fSize;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
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
	public String getOpenSw() {
		return openSw;
	}
	public void setOpenSw(String openSw) {
		this.openSw = openSw;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getHospIp() {
		return hospIp;
	}
	public void setHospIp(String hospIp) {
		this.hospIp = hospIp;
	}
	public String getfDate() {
		return fDate;
	}
	public void setfDate(String fDate) {
		this.fDate = fDate;
	}
	public int getDownNum() {
		return downNum;
	}
	public void setDownNum(int downNum) {
		this.downNum = downNum;
	}
	@Override
	public String toString() {
		return "pdsVO [idx=" + idx + ", mid=" + mid + ", nickName=" + nickName + ", fName=" + fName + ", fSName=" + fSName
				+ ", fSize=" + fSize + ", part=" + part + ", title=" + title + ", content=" + content + ", openSw=" + openSw
				+ ", pwd=" + pwd + ", hospIp=" + hospIp + ", fDate=" + fDate + ", downNum=" + downNum + "]";
	}
	
	
}
