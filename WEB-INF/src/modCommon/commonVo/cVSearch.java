package modCommon.commonVo;

import org.apache.struts.action.ActionForm;

@SuppressWarnings("serial")
public class cVSearch extends ActionForm {
	private String mainsearch,searchkey,stateid,countryid,categoryname;
	
	public String getCountryid() {
		return countryid;
	}

	public void setCountryid(String countryid) {
		this.countryid = countryid;
	}

	public String getMainsearch() {
		return mainsearch;
	}

	public void setMainsearch(String mainsearch) {
		this.mainsearch = mainsearch;
	}

	public String getStateid() {
		return stateid;
	}

	public void setStateid(String stateid) {
		this.stateid = stateid;
	}

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	public String getSearchkey() {
		return searchkey;
	}

	public void setSearchkey(String searchkey) {
		this.searchkey = searchkey;
	}
	
}