package modCommon.commonVo;

import org.apache.struts.validator.ValidatorForm;

@SuppressWarnings("serial")
public class cVSendMail extends ValidatorForm{
	String username,useremailid,bodymessage,useremailid1,details,appid_hidden,
	invitetype_mail,rec_name,mobile_no,message_to_sms,invitetype_sms,smsdetails;

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getUseremailid1() {
		return useremailid1;
	}

	public void setUseremailid1(String useremailid1) {
		this.useremailid1 = useremailid1;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseremailid() {
		return useremailid;
	}

	public void setUseremailid(String useremailid) {
		this.useremailid = useremailid;
	}

	public String getBodymessage() {
		return bodymessage;
	}

	public void setBodymessage(String bodymessage) {
		this.bodymessage = bodymessage;
	}

	public String getAppid_hidden() {
		return appid_hidden;
	}

	public void setAppid_hidden(String appid_hidden) {
		this.appid_hidden = appid_hidden;
	}

	public String getInvitetype_mail() {
		return invitetype_mail;
	}

	public void setInvitetype_mail(String invitetype_mail) {
		this.invitetype_mail = invitetype_mail;
	}

	public String getRec_name() {
		return rec_name;
	}

	public void setRec_name(String rec_name) {
		this.rec_name = rec_name;
	}

	public String getMobile_no() {
		return mobile_no;
	}

	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}

	public String getMessage_to_sms() {
		return message_to_sms;
	}

	public void setMessage_to_sms(String message_to_sms) {
		this.message_to_sms = message_to_sms;
	}

	

	public String getSmsdetails() {
		return smsdetails;
	}

	public void setSmsdetails(String smsdetails) {
		this.smsdetails = smsdetails;
	}

	public String getInvitetype_sms() {
		return invitetype_sms;
	}

	public void setInvitetype_sms(String invitetype_sms) {
		this.invitetype_sms = invitetype_sms;
	}
	
	
}
