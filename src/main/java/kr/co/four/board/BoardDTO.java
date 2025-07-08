/* bno
   title
   content
   id
   reddate
   readcnt
   etc
   
 * lombok 라이브러리 사용 가능 
 */


package kr.co.four.board;

public class BoardDTO {
	// 게시글 번호
	private int bno;
	private String title;
	private String content;
	private String id;
	private String reddate;
	private int readcnt;
	private String etc;
	
	
	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", title=" + title + ", content=" + content + ", id=" + id + ", reddate="
				+ reddate + ", readcnt=" + readcnt + ", etc=" + etc + "]";
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReddate() {
		return reddate;
	}
	public void setReddate(String reddate) {
		this.reddate = reddate;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	

}
