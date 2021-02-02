package modFacility.facilityVo;

import org.apache.struts.action.ActionForm;

@SuppressWarnings("serial")
public class cVFacilityReg extends ActionForm  {

	private String userid_hidden,facid_buis_hidden;
	
	public String getUserid_hidden() {
		return userid_hidden;
	}

	public void setUserid_hidden(String userid_hidden) {
		this.userid_hidden = userid_hidden;
	}
	
	public String getFacid_buis_hidden() {
		return facid_buis_hidden;
	}

	public void setFacid_buis_hidden(String facid_buis_hidden) {
		this.facid_buis_hidden = facid_buis_hidden;
	}

}
