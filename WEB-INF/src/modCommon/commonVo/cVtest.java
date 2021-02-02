package modCommon.commonVo;

import org.apache.struts.action.ActionForm;


@SuppressWarnings("serial")
public class cVtest extends ActionForm{
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}