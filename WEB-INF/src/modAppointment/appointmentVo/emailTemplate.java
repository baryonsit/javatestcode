package modAppointment.appointmentVo;

import org.apache.struts.action.ActionForm;

public class emailTemplate extends ActionForm {

	private Integer emailTemplateId;
	private String emailTemplateName;
	private String emailTemplateSubject;
	private String emailTemplateBody;
	private String emailSignature1;
	private String emailSignature2;
	public Integer getEmailTemplateId() {
		return emailTemplateId;
	}
	public void setEmailTemplateId(Integer emailTemplateId) {
		this.emailTemplateId = emailTemplateId;
	}
	public String getEmailTemplateName() {
		return emailTemplateName;
	}
	public void setEmailTemplateName(String emailTemplateName) {
		this.emailTemplateName = emailTemplateName;
	}
	public String getEmailTemplateSubject() {
		return emailTemplateSubject;
	}
	public void setEmailTemplateSubject(String emailTemplateSubject) {
		this.emailTemplateSubject = emailTemplateSubject;
	}
	public String getEmailTemplateBody() {
		return emailTemplateBody;
	}
	public void setEmailTemplateBody(String emailTemplateBody) {
		this.emailTemplateBody = emailTemplateBody;
	}
	public String getEmailSignature1() {
		return emailSignature1;
	}
	public void setEmailSignature1(String emailSignature1) {
		this.emailSignature1 = emailSignature1;
	}
	public String getEmailSignature2() {
		return emailSignature2;
	}
	public void setEmailSignature2(String emailSignature2) {
		this.emailSignature2 = emailSignature2;
	}
}
