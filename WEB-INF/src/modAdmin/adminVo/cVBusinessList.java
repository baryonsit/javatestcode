package modAdmin.adminVo;

import org.apache.struts.action.ActionForm;

@SuppressWarnings("serial")
public class cVBusinessList extends ActionForm{
	private String businessid_hidden,selected_ids,statusname,hidden_emailid,hidden_busname,typeof_hidden,search;

	public String getBusinessid_hidden() {
		return businessid_hidden;
	}

	public void setBusinessid_hidden(String businessid_hidden) {
		this.businessid_hidden = businessid_hidden;
	}

	public String getSelected_ids() {
		return selected_ids;
	}

	public void setSelected_ids(String selected_ids) {
		this.selected_ids = selected_ids;
	}

	public String getStatusname() {
		return statusname;
	}

	public void setStatusname(String statusname) {
		this.statusname = statusname;
	}

	public String getHidden_emailid() {
		return hidden_emailid;
	}

	public void setHidden_emailid(String hidden_emailid) {
		this.hidden_emailid = hidden_emailid;
	}

	public String getHidden_busname() {
		return hidden_busname;
	}

	public void setHidden_busname(String hidden_busname) {
		this.hidden_busname = hidden_busname;
	}

	public String getTypeof_hidden() {
		return typeof_hidden;
	}

	public void setTypeof_hidden(String typeof_hidden) {
		this.typeof_hidden = typeof_hidden;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
}