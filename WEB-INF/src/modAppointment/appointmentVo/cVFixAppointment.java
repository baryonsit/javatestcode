package modAppointment.appointmentVo;

import org.apache.struts.action.*;

public class cVFixAppointment extends ActionForm {
	
	
	
	private String appfromdate;
	private String apptodate;
	private String apptimefrom;
	private String apptimeto,facid,uid;
	private int appid_hidden;
	private String flag;
	private String appointment_review;
	private String appointment_Name;

	
	public String getFacid() {
		return facid;
	}
	public void setFacid(String facid) {
		this.facid = facid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public int getAppid_hidden() {
		return appid_hidden;
	}
	public void setAppid_hidden(int appid_hidden) {
		this.appid_hidden = appid_hidden;
	}
	public String getAppfromdate() {
		return appfromdate;
	}
	public void setAppfromdate(String appfromdate) {
		this.appfromdate = appfromdate;
	}
	public String getApptodate() {
		return apptodate;
	}
	public void setApptodate(String apptodate) {
		this.apptodate = apptodate;
	}
	public String getApptimefrom() {
		return apptimefrom;
	}
	public void setApptimefrom(String apptimefrom) {
		this.apptimefrom = apptimefrom;
	}
	public String getApptimeto() {
		return apptimeto;
	}
	public void setApptimeto(String apptimeto) {
		this.apptimeto = apptimeto;
	}
	
	public String getAppointment_review() {
		return appointment_review;
	}
	public void setAppointment_review(String appointment_review) {
		this.appointment_review = appointment_review;
	}

	public String getAppointment_Name() {
		return appointment_Name;
	}
	public void setAppointment_Name(String appointment_Name) {
		this.appointment_Name = appointment_Name;
	}

	private final static long serialVersionUID = 42L;
	


}
