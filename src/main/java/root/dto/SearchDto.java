package root.dto;

public class SearchDto {

	private String eq_grp;					//분류
	private String eq_use;					//용도
	private String eq_tech;					//기술
	private String eq_loc;					//지역
	private String keyword;					//검색어
	
	private int startNo;	//게시물리스트 첫 번호
	private int endNo;	//게시물리스트 마지막 번호
	
	
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public String getEq_grp() {
		return eq_grp;
	}
	public void setEq_grp(String eq_grp) {
		this.eq_grp = eq_grp;
	}
	public String getEq_use() {
		return eq_use;
	}
	public void setEq_use(String eq_use) {
		this.eq_use = eq_use;
	}
	public String getEq_tech() {
		return eq_tech;
	}
	public void setEq_tech(String eq_tech) {
		this.eq_tech = eq_tech;
	}
	public String getEq_loc() {
		return eq_loc;
	}
	public void setEq_loc(String eq_loc) {
		this.eq_loc = eq_loc;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	@Override
	public String toString() {
		return "SearchDto [eq_grp=" + eq_grp + ", eq_use=" + eq_use + ", eq_tech=" + eq_tech + ", eq_loc=" + eq_loc
				+ ", keyword=" + keyword + ", startNo=" + startNo + ", endNo=" + endNo + "]";
	}
	
	

	
	
	
}
