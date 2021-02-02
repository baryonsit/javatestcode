package modUser.userVo;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;


public class cVChangePassword extends ValidatorForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String currpass, newpass, confpass, uname;
	private String action = null;

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getCurrpass() {
		return currpass;
	}

	public void setCurrpass(String currpass) {
		this.currpass = currpass;
	}

	public String getNewpass() {
		return newpass;
	}

	public void setNewpass(String newpass) {
		this.newpass = newpass;
	}

	public String getConfpass() {
		return confpass;
	}

	public void setConfpass(String confpass) {
		this.confpass = confpass;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		this.currpass= null;
		this.newpass = null;
		this.confpass = null;
	}
	
	public ActionErrors validate(ActionMapping mapping,HttpServletRequest request)
	{
		ActionErrors errors = super.validate(mapping, request);
		
		if(!(newpass.equals(confpass)))
		{
			errors.add("confpass",new ActionError("errors.confpass.notEqual"));
		}
	
		return errors;
	}
}