package vo;

public class NtcVo {

	private int NOTICENUM;
	private String NOTICENAME;
	private String NOTICETITLE;
	private String NOTICECONTENT;
	private int NOTICEVIEWS;
	private String NOTICEDATE;

	public int getNOTICENUM() {
		return NOTICENUM;
	}

	public void setNOTICENUM(int nOTICENUM) {
		NOTICENUM = nOTICENUM;
	}

	public String getNOTICENAME() {
		return NOTICENAME;
	}

	public void setNOTICENAME(String nOTICENAME) {
		NOTICENAME = nOTICENAME;
	}

	public String getNOTICETITLE() {
		return NOTICETITLE;
	}

	public void setNOTICETITLE(String nOTICETITLE) {
		NOTICETITLE = nOTICETITLE;
	}

	public String getNOTICECONTENT() {
		return NOTICECONTENT;
	}

	public void setNOTICECONTENT(String nOTICECONTENT) {
		NOTICECONTENT = nOTICECONTENT;
	}

	public int getNOTICEVIEWS() {
		return NOTICEVIEWS;
	}

	public void setNOTICEVIEWS(int nOTICEVIEWS) {
		NOTICEVIEWS = nOTICEVIEWS;
	}

	public String getNOTICEDATE() {
		return NOTICEDATE;
	}

	public void setNOTICEDATE(String nOTICEDATE) {
		NOTICEDATE = nOTICEDATE;
	}

	@Override
	public String toString() {
		return "NtcVo [NOTICENUM=" + NOTICENUM + ", NOTICENAME=" + NOTICENAME + ", NOTICETITLE=" + NOTICETITLE
				+ ", NOTICECONTENT=" + NOTICECONTENT + ", NOTICEVIEWS=" + NOTICEVIEWS + ", NOTICEDATE=" + NOTICEDATE
				+ "]";
	}

}
