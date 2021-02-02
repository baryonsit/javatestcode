package modAdmin.adminVo;

import org.apache.struts.action.ActionForm;

@SuppressWarnings("serial")
public class cVViewAppointments extends ActionForm{
	private String filterfac,filterstatus,fromdate,todate,search,statusval,businessuserid,userName,facilityname;

	public String getFilterfac() {
		return filterfac;
	}

	public void setFilterfac(String filterfac) {
		this.filterfac = filterfac;
	}

	public String getFromdate() {
		return fromdate;
	}

	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}

	public String getTodate() {
		return todate;
	}

	public void setTodate(String todate) {
		this.todate = todate;
	}

	public String getFilterstatus() {
		return filterstatus;
	}

	public void setFilterstatus(String filterstatus) {
		this.filterstatus = filterstatus;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getStatusval() {
		return statusval;
	}

	public void setStatusval(String statusval) {
		this.statusval = statusval;
	}

	public String getBusinessuserid() {
		return businessuserid;
	}

	public void setBusinessuserid(String businessuserid) {
		this.businessuserid = businessuserid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFacilityname() {
		return facilityname;
	}

	public void setFacilityname(String facilityname) {
		this.facilityname = facilityname;
	}
	

	
	
		
}