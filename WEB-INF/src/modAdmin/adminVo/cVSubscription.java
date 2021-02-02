package modAdmin.adminVo;

import org.apache.struts.validator.ValidatorForm;


@SuppressWarnings("serial")
public class cVSubscription extends ValidatorForm{
	private String subname,subdesc,subid_hidden,selected_ids,defaultcurrency;
	private int duration,defaultcountry;
	private float subamount;

	public String getSubname() {
		return subname;
	}

	public void setSubname(String subname) {
		this.subname = subname;
	}

	public String getSubdesc() {
		return subdesc;
	}

	public void setSubdesc(String subdesc) {
		this.subdesc = subdesc;
	}

	public float getSubamount() {
		return subamount;
	}

	public void setSubamount(float subamount) {
		this.subamount = subamount;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getSubid_hidden() {
		return subid_hidden;
	}

	public void setSubid_hidden(String subid_hidden) {
		this.subid_hidden = subid_hidden;
	}
	public String getSelected_ids() {
		return selected_ids;
	}

	public void setSelected_ids(String selected_ids) {
		this.selected_ids = selected_ids;
	}

	public String getDefaultcurrency() {
		return defaultcurrency;
	}

	public void setDefaultcurrency(String defaultcurrency) {
		this.defaultcurrency = defaultcurrency;
	}

	public int getDefaultcountry() {
		return defaultcountry;
	}

	public void setDefaultcountry(int defaultcountry) {
		this.defaultcountry = defaultcountry;
	}
	
}

