package study.j0806;

public class T15VO {
	private String name;
	private String hakbun;
	private int kor;
	private int eng;
	private int mat;
	private int sci;
	private int soc;
	private int tot;
	private double avg;
	private String hostIp;
	private String geade;
	
	public T15VO() {}
	
	public T15VO(String name, String hakbun, int kor, int eng, int mat, int sci, int soc, int tot, double avg,
			String hostIp, String geade) {
		super();
		this.name = name;
		this.hakbun = hakbun;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		this.sci = sci;
		this.soc = soc;
		this.tot = tot;
		this.avg = avg;
		this.hostIp = hostIp;
		this.geade = geade;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHakbun() {
		return hakbun;
	}
	public void setHakbun(String hakbun) {
		this.hakbun = hakbun;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	public int getSci() {
		return sci;
	}
	public void setSci(int sci) {
		this.sci = sci;
	}
	public int getSoc() {
		return soc;
	}
	public void setSoc(int soc) {
		this.soc = soc;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	public int getTot() {
		return tot;
	}

	public void setTot(int tot) {
		this.tot = tot;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public String getGeade() {
		return geade;
	}

	public void setGeade(String geade) {
		this.geade = geade;
	}

	@Override
	public String toString() {
		return "T15VO [name=" + name + ", hakbun=" + hakbun + ", kor=" + kor + ", eng=" + eng + ", mat=" + mat + ", sci="
				+ sci + ", soc=" + soc + ", tot=" + tot + ", avg=" + avg + ", hostIp=" + hostIp + ", geade=" + geade + "]";
	}

	
	
}
