package modUser.userVo;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

@SuppressWarnings("serial")
public class cVBusinessOwner extends ValidatorForm {
	private String username, pass1,pass2,fname,mname,lname,email,contact,add1,add2,city,zipcode,state,country,memberid,bissname,bissowner,bissstart,bissend,bisssubscription,bisscategory,bissadd1,bissadd2,bisscity,bisszipcode,bissstate,bisscountry,bissdesc,urole;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPass1() {
		return pass1;
	}

	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}

	public String getPass2() {
		return pass2;
	}

	public void setPass2(String pass2) {
		this.pass2 = pass2;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAdd1() {
		return add1;
	}

	public void setAdd1(String add1) {
		this.add1 = add1;
	}

	public String getAdd2() {
		return add2;
	}

	public void setAdd2(String add2) {
		this.add2 = add2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getBissname() {
		return bissname;
	}

	public void setBissname(String bissname) {
		this.bissname = bissname;
	}

	public String getBissowner() {
		return bissowner;
	}

	public void setBissowner(String bissowner) {
		this.bissowner = bissowner;
	}

	public String getBissstart() {
		return bissstart;
	}

	public void setBissstart(String bissstart) {
		this.bissstart = bissstart;
	}

	public String getBissend() {
		return bissend;
	}

	public void setBissend(String bissend) {
		this.bissend = bissend;
	}

	public String getBisssubscription() {
		return bisssubscription;
	}

	public void setBisssubscription(String bisssubscription) {
		this.bisssubscription = bisssubscription;
	}

	public String getBisscategory() {
		return bisscategory;
	}

	public void setBisscategory(String bisscategory) {
		this.bisscategory = bisscategory;
	}

	public String getBissadd1() {
		return bissadd1;
	}

	public void setBissadd1(String bissadd1) {
		this.bissadd1 = bissadd1;
	}

	public String getBissadd2() {
		return bissadd2;
	}

	public void setBissadd2(String bissadd2) {
		this.bissadd2 = bissadd2;
	}

	public String getBisscity() {
		return bisscity;
	}

	public void setBisscity(String bisscity) {
		this.bisscity = bisscity;
	}

	public String getBisszipcode() {
		return bisszipcode;
	}

	public void setBisszipcode(String bisszipcode) {
		this.bisszipcode = bisszipcode;
	}

	public String getBissstate() {
		return bissstate;
	}

	public void setBissstate(String bissstate) {
		this.bissstate = bissstate;
	}

	public String getBisscountry() {
		return bisscountry;
	}

	public void setBisscountry(String bisscountry) {
		this.bisscountry = bisscountry;
	}
	
	public String getBissdesc() {
		return bissdesc;
	}

	public void setBissdesc(String bissdesc) {
		this.bissdesc = bissdesc;
	}

	public String getUrole() {
		return urole;
	}

	public void setUrole(String urole) {
		this.urole = urole;
	}
	
	
	/* User defined validation for date validations*/
	public ActionErrors validate(ActionMapping mapping,HttpServletRequest request)
	{
		ActionErrors errors = super.validate(mapping, request);
		
		/* Checks Business Start date is less than or grater than Business End date */ 
		if(StringUtils.isNotEmpty(bissstart) || StringUtils.isNotEmpty(bissend))
		{
			try
			{
				Date businessstartDate=new Date();
				Date businessendDate=new Date();
				
				SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
				businessstartDate = SDF.parse(bissstart);
				businessendDate = SDF.parse(bissend);
				
				if(businessstartDate.after(businessendDate) || businessendDate.before(businessstartDate))
				{
					errors.add("bissstart",new ActionError("errors.bissstart.graterThanEndDate"));
				}
				
			}
			catch (Exception e)
			{
				// TODO: handle exception
			}
			
		}
		
		if(!(pass1.equals(pass2)))
		{
			errors.add("pass1",new ActionError("errors.pass1.notEqual"));
		}
	
		return errors;
	}

	

}
