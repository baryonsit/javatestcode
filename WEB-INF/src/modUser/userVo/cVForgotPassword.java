package modUser.userVo;

import org.apache.struts.validator.ValidatorForm;


@SuppressWarnings("serial")
public class cVForgotPassword extends ValidatorForm {
	
	private String passemail;

	public String getPassemail() {
		return passemail;
	}

	public void setPassemail(String passemail) {
		this.passemail = passemail;
	}
	
		
}