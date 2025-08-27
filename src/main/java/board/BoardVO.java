package board;

public class BoardVO {
	private int idx;
	private String mid;
	private String nickName;
	private String title;
	private String content;
	private String hostIp;
	private String openSw;
	private int readNum;
	private String wDate;
	private int good;
	private String complaint;
	
	private int hour_diff;	// new.gif를 출력하기위한 변수(24시간 내에)
	private int date_diff;	// 글쓴날짜를 오늘이후는 '날짜표시', 오늘 이전은 '시간/날짜-시간' 표시 하기위한 변후
	
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
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	public String getOpenSw() {
		return openSw;
	}
	public void setOpenSw(String openSw) {
		this.openSw = openSw;
	}
	public int getReadNum() {
		return readNum;
	}
	public void setReadNum(int readNum) {
		this.readNum = readNum;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public String getComplaint() {
		return complaint;
	}
	public void setComplaint(String complaint) {
		this.complaint = complaint;
	}
	public int getHour_diff() {
		return hour_diff;
	}
	public void setHour_diff(int hour_diff) {
		this.hour_diff = hour_diff;
	}
	public int getDate_diff() {
		return date_diff;
	}
	public void setDate_diff(int date_diff) {
		this.date_diff = date_diff;
	}
	
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", mid=" + mid + ", nickName=" + nickName + ", title=" + title + ", content="
				+ content + ", hostIp=" + hostIp + ", openSw=" + openSw + ", readNum=" + readNum + ", wDate=" + wDate
				+ ", good=" + good + ", complaint=" + complaint + ", hour_diff=" + hour_diff + ", date_diff=" + date_diff + "]";
	}
}
