/*Value object class */

package modFacility.facilityVo;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

import modAppointment.appointmentBo.cBCommonAppoint;


@SuppressWarnings("serial")
public class cVFacilityManage extends ValidatorForm{
	private String function,facccdate,facccdesc,regaddress,facilityname,facilitytype,facstartdate,facenddate,facopentime,facclosetime,
	timeslot,membersslot,description,facadd1,facadd2,city,faczip,faccontactno,appointment_remark,
	facid_hidden,selected_ids,userid_hidden,facid_buis_hidden,userName,appointment_status;
	private int state,country,facholiday,facilitycategory,facility_status,appointment_id,checkvalue;
	private String status;
	
    public String getFunction() {
		return function;
	}

	public void setFunction(String function) {
		this.function = function;
	}
	
	public String getFacccdesc() {
		return facccdesc;
	}
	public void setFacccdesc(String facccdesc) {
		this.facccdesc = facccdesc;
	}

	public String getFacccdate() {
		return facccdate;
	}

	public void setFacccdate(String facccdate) {
		this.facccdate = facccdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	/*Setting set(),get() methods for the form field values */ 
	public String getRegaddress() {
		return regaddress;
	}

	public void setRegaddress(String regaddress) {
		this.regaddress = regaddress;
	}
	
	public String getFacilityname() {
		return facilityname;
	}

	public void setFacilityname(String facilityname) {
		this.facilityname = facilityname;
	}
	
	public String getFacilitytype() {
		return facilitytype;
	}

	public void setFacilitytype(String facilitytype) {
		this.facilitytype = facilitytype;
	}

	
	public String getFacstartdate() {
		return facstartdate;
	}

	public void setFacstartdate(String facstartdate) {
		this.facstartdate= facstartdate;
	}
	
	
	public String getFacenddate() {
		return facenddate;
	}

	public void setFacenddate(String facenddate) {
		this.facenddate = facenddate;
	}
	
	public String getFacopentime() {
		return facopentime;
	}

	public void setFacopentime(String facopentime) {
		this.facopentime = facopentime;
	}
	
	public String getFacclosetime() {
		return facclosetime;
	}

	public void setFacclosetime(String facclosetime) {
		this.facclosetime = facclosetime;
	}
	
	
	public String getTimeslot() {
		return timeslot;
	}

	public void setTimeslot(String timeslot) {
		this.timeslot = timeslot;
	}
	
	public String getMembersslot() {
		return membersslot;
	}

	public void setMembersslot(String membersslot) {
		this.membersslot = membersslot;
	}
	
	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description= description;
	}
	
	
	public String getFacadd1() {
		return facadd1;
	}

	public void setFacadd1(String facadd1) {
		this.facadd1= facadd1;
	}
	
	
	public String getFacadd2() {
		return facadd2;
	}

	public void setFacadd2(String facadd2) {
		this.facadd2= facadd2;
	}
	
/*	public String getFaccity() {
		return faccity;
	}

	public void setFaccity(String faccity) {
		this.faccity = faccity;
	}*/
	
	public String getFaczip() {
		return faczip;
	}

	public void setFaczip(String faczip) {
		this.faczip = faczip;
	}
	
	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getCountry() {
		return country;
	}

	public void setCountry(int country) {
		this.country = country;
	}

	/*public int getFacstate() {
		return facstate;
	}

	public void setFacstate(int facstate) {
		this.facstate = facstate;
	}
	
	
	public int getFaccountry() {
		return faccountry;
	}

	public void setFaccountry(int faccountry) {
		this.faccountry = faccountry;
	}
	*/
	public String getFaccontactno() {
		return faccontactno;
	}

	public void setFaccontactno(String faccontactno) {
		this.faccontactno= faccontactno;
	}
	public String getFacid_hidden() {
		return facid_hidden;
	}

	public void setFacid_hidden(String facid_hidden) {
		this.facid_hidden= facid_hidden;
	}

	
	public String getSelected_ids() {
		return selected_ids;
	}

	public void setSelected_ids(String selected_ids) {
		this.selected_ids = selected_ids;
	}

	public String getUserid_hidden() {
		return userid_hidden;
	}

	public void setUserid_hidden(String userid_hidden) {
		this.userid_hidden = userid_hidden;
	}
		
	public String getAppointment_status() {
		return appointment_status;
	}

	public void setAppointment_status(String appointment_status) {
		this.appointment_status = appointment_status;
	}

	public String getFacid_buis_hidden() {
		return facid_buis_hidden;
	}

	public void setFacid_buis_hidden(String facid_buis_hidden) {
		this.facid_buis_hidden = facid_buis_hidden;
	}

	/*public String getOptDate() {
		return OptDate;
	}

	public void setOptDate(String optDate) {
		this.OptDate = optDate;
	}

	public String getOptDesc() {
		return OptDesc;
	}

	public void setOptDesc(String optDesc) {
		this.OptDesc = optDesc;
	}*/

	
	public int getFacilitycategory() {
		return facilitycategory;
	}

	public void setFacilitycategory(int facilitycategory) {
		this.facilitycategory = facilitycategory;
	}
	public int getFacility_status() {
		return facility_status;
	}

	public void setFacility_status(int facility_status) {
		this.facility_status = facility_status;
	}

	

	public String getAppointment_remark() {
		return appointment_remark;
	}

	public void setAppointment_remark(String appointment_remark) {
		this.appointment_remark = appointment_remark;
	}

	public int getAppointment_id() {
		return appointment_id;
	}

	public void setAppointment_id(int appointment_id) {
		this.appointment_id = appointment_id;
	}

	public int getCheckvalue() {
		return checkvalue;
	}

	public void setCheckvalue(int checkvalue) {
		this.checkvalue = checkvalue;
	}

	/*	 User defined validation 
	public ActionErrors validate(ActionMapping mapping,HttpServletRequest request)
	{
		ActionErrors errors = super.validate(mapping, request);
		cBCommonAppoint app = new cBCommonAppoint();
		Checks facility start time is less than or grater than facility end time 
		if(!facid_hidden.equals("99999999"))
		{	
		if(StringUtils.isNotEmpty(facstartdate) && StringUtils.isNotEmpty(facenddate))
		{
			
			try
			{
				Date fDT = app.getDate(facstartdate);
				Date tDT = app.getDate(facenddate);
				if(fDT.after(tDT))
				{
					errors.add("facstartdate",new ActionError("errors.facstartdate.graterThanEndDate"));
				}
				
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			
			
		}
		
		 Checks facility open time is valid time format or not 
		if((facopentime != null && !facopentime.equals("")) )
		{
			try
			{
				boolean result;
				result=app.isValidTimeStr(facopentime); 
				if(result==false)
				{
					errors.add("facopentime",new ActionError("errors.facopentime.invalidTime"));
				}
			}
			catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		 Checks facility close time is valid time format or not 
		if((facclosetime != null && !facclosetime.equals("")) )
		{
			
			try
			{
				boolean result;
				result=app.isValidTimeStr(facclosetime);
				if(result==false)
				{
					errors.add("facclosetime",new ActionError("errors.facclosetime.invalidTime"));
				}
			}
			catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		Checks facility open time is grater than or less than facility close time
		if(StringUtils.isNotEmpty(facclosetime) && StringUtils.isNotEmpty(facopentime))
		{
			try
			{
				Date fTime=app.getTime(facopentime); //Converts string to time format
				Date tTime=app.getTime(facclosetime);
				if(fTime.after(tTime))
				{
					errors.add("facopentime",new ActionError("errors.facopentime.openTmGraterthancloseTM"));
				}
				if(tTime.before(fTime))
				{
					errors.add("facclosetime",new ActionError("errors.facclosetime.closeTmLessthanopenTM"));
				}
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			
		}
		if(timeslot!= null && !(timeslot.equals("")))
		{
			try{
				boolean result;
				result=app.isValidTimeStr(timeslot);
				if(result==false)
				{
					errors.add("timeslot",new ActionError("errors.timeslot.invalidTime"));
				}
			}
			catch (Exception e) {
				// TODO: handle exception
			}
			
		}
	
		}	
		return errors;
		}
*/
	public void setFacholiday(int facholiday) {
		this.facholiday = facholiday;
	}

	public int getFacholiday() {
		return facholiday;
	}
	
	
}