/**
 * TABLE `board_reply` (
  `reno` int(11) NOT NULL AUTO_INCREMENT,
  `rewriter` varchar(100) NOT NULL,
  `rememo` varchar(100) NOT NULL,
  `redate` datetime NOT NULL,
  `bno` int(11) NOT NULL,
 * 
 * 롬북 쓰면 getter,setter,tostring 안써도됌
 */

package kr.co.four.board;

public class BoardReply {
  
	private int reno;
	private String rewriter;
	private String rememo;
	private String redate;
	private int bno;
	public int getReno() {
		return reno;
	}
	public void setReno(int reno) {
		this.reno = reno;
	}
	public String getRewriter() {
		return rewriter;
	}
	public void setRewriter(String rewriter) {
		this.rewriter = rewriter;
	}
	public String getRememo() {
		return rememo;
	}
	public void setRememo(String rememo) {
		this.rememo = rememo;
	}
	public String getRedate() {
		return redate;
	}
	public void setRedate(String redate) {
		this.redate = redate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	@Override
	public String toString() {
		return "BoardReply [reno=" + reno + ", rewriter=" + rewriter + ", rememo=" + rememo + ", redate=" + redate
				+ ", bno=" + bno + "]";
	}
  	
	
	
	
}
