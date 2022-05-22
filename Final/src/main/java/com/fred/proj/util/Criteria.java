package com.fred.proj.util;

public class Criteria {
	//page 현재 페이지 번호
	
	private int page;
	private int perPageNum;
	private String searchType;
	private String keyword;
	private String sort;
	private int userno;
	
	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	//perPageNum 한 페이지당 보여줄 게시글의 갯수
	private int num;
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	//	getPageStart() 특정 페이지의 게시글 시작번호, 시작 행 번호
	public int getPageStart() {
		//현재 페이지의 게시글 시작 번호 = (현재 페이지 번호 - 1) * 페이지당 보여줄 게시글 갯수
		return (this.page-1)*perPageNum;
	}
	
	// 기본 생성자함수
	public Criteria() {
		this.page = 1;
		this.perPageNum = 5;
	}
	
	
	public int getPage() {
        return page;
    }
	
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }

	public int getPerPageNum() {
		return perPageNum;
		
	}
	
	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		
		if(pageCount != cnt) {
			this.perPageNum = cnt;
			
		}else {
			this.perPageNum = pageCount;
		}
			
	}
	
	
	
}
