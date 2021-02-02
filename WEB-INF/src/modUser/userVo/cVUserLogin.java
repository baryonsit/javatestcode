package modUser.userVo;

import org.apache.struts.validator.ValidatorForm;

public class cVUserLogin extends ValidatorForm {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String loginun,loginpwd;

	public String getLoginun() {
		return loginun;
	}

	public void setLoginun(String loginun) {
		this.loginun = loginun;
	}

	public String getLoginpwd() {
		return loginpwd;
	}

	public void setLoginpwd(String loginpwd) {
		this.loginpwd = loginpwd;
	}
	
	
}