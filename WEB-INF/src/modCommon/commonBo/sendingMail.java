/**
 * Class for sending a email to the user
 * @param email
 * @param userid
 * @param sPass
 * @return
 */

package modCommon.commonBo;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import modAppointment.appointmentDo.cDFixAppointment;
import modAppointment.appointmentVo.cVFixAppointment;
import modAppointment.appointmentVo.emailTemplate;
import modCommon.commonVo.cVSendMail;
import modFacility.facilityVo.cVFacilityManage;
import modLogger.cBLogger;

public class sendingMail {

	// private static final String emailMsgTxt = "Online Order Confirmation
	// Message. Also include the Tracking Number.";
	// private static final String emailSubjectTxt = "Order Confirmation
	// Subject";
	// private static final String emailFromAddress = "ramrameshmail@gmail.com";
	String subject = "Appointment System Information";
	String message = "A Message from appointment system";

	// Add List of Email address to who email needs to be sent to
	// private static final String receptant = "ramrameshmail@gmail.com";

	public boolean mailAck(cVSendMail cvmail, String ToAddress) {
		boolean msgsent = false;
		boolean debug = false;
		message = "Hi"+" "+ cvmail.getUsername()+",\n \n \n \t ";
		message = message + "Invitation From Appointment System,\n";
		message = message + cvmail.getBodymessage()+".\n \n \n";
		String data1="Thanks & Regards,\n"+"Appointment System.";
		message=message+data1;
		// Set the host smtp address
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", initialConfig.SMTP_HOST_NAME);
		props.put("mail.smtp.port", initialConfig.SMTP_PORT);
		props.put("mail.smtp.starttls.enable", "true");
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(initialConfig.SMTP_AUTH_USER, initialConfig.SMTP_AUTH_PWD);
			}
		});

		// Method to send Email notification
		/* Sendemail.sendEmailNotification(sub, msg, user, to, session); */
		try {
			MimeMessage messages = new MimeMessage(session);
			messages.setFrom(new InternetAddress(initialConfig.SMTP_AUTH_USER));
			messages.addRecipient(Message.RecipientType.TO, new InternetAddress(ToAddress));
			messages.setSubject(subject);
			messages.setText(message);

			Transport.send(messages);
			msgsent = true;

		} catch (Exception e) {
			msgsent = false;
			cBLogger.error("Class Name : sendingMail , Function : fireEmail , Error :", e);
		}
		return msgsent;
	}
	/*
	 * public boolean fireEmail(String mailid,String message,String subject)
	 * throws MessagingException { boolean msgsent= false; boolean debug =
	 * false; Properties props = new Properties(); props.put("mail.imap.host",
	 * SMTP_HOST_NAME); props.put("mail.imap.auth", "true");
	 * 
	 * Authenticator auth = new SMTPAuthenticator(); // javax.mail.Session
	 * session = Session.getDefaultInstance(props, auth); javax.mail.Session
	 * session = javax.mail.Session.getInstance(props,auth);
	 * 
	 * session.setDebug(debug);
	 * 
	 * // create a message Message msg = new MimeMessage(session);
	 * 
	 * // set the from and to address // InternetAddress addressFrom = new
	 * InternetAddress("shankargathitha@rediffmail.com");
	 * //msg.setFrom(addressFrom); // msg.setFrom("shankarg82@gmail.com");
	 * InternetAddress addressTo = new InternetAddress(); String
	 * AddressTo=mailid;
	 * 
	 * addressTo = new InternetAddress(AddressTo);
	 * msg.setRecipient(Message.RecipientType.TO, addressTo); // Setting the
	 * Subject and Content Type msg.setSubject(subject); msg.setContent(message,
	 * "text/plain");
	 * 
	 * Transport.send(msg); msgsent=true; return msgsent; }
	 */

	public boolean fireEmail(String mailid, String subject, String message) {
		boolean msgsent = false;
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", initialConfig.SMTP_HOST_NAME);
		props.put("mail.smtp.port", initialConfig.SMTP_PORT);
		props.put("mail.smtp.starttls.enable", "true");
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(initialConfig.SMTP_AUTH_USER, initialConfig.SMTP_AUTH_PWD);
			}
		});

		// Method to send Email notification
		/* Sendemail.sendEmailNotification(sub, msg, user, to, session); */
		try {
			MimeMessage messages = new MimeMessage(session);
			messages.setFrom(new InternetAddress(initialConfig.SMTP_AUTH_USER));
			messages.addRecipient(Message.RecipientType.TO, new InternetAddress(mailid));
			messages.setSubject(subject);
			messages.setText(message);

			Transport.send(messages);
			msgsent = true;

		} catch (Exception e) {
			msgsent = false;
			cBLogger.error("Class Name : sendingMail , Function : fireEmail , Error :"+e.getMessage());
		}
		return msgsent;
	}
	// send Registration Confirmation Mail to User
	public boolean sendAppointmentSuccessfulEmailToStudent(String emialId, String username, cVFixAppointment cvar) {
		String templateBody = "";
		cDFixAppointment cdfa = new cDFixAppointment();
		emailTemplate templateDetails = new emailTemplate();
		templateDetails = cdfa.getEmailTemplateByTemplateId(1);
		templateBody = "Dear " + username + ", "+"<br> <br>"+templateDetails.getEmailTemplateBody()+"<br> <br> ";
		String signature = templateDetails.getEmailSignature1() + "," + "<br>" + templateDetails.getEmailSignature2();
		String sub = templateDetails.getEmailTemplateSubject();
		String data = "<table style='border:1px solid #ff3e1e; text-align:left;'>" + "<tr>"
				+ "<th style='border-bottom:1px solid #ff3e1e; border-right:1px solid #ff3e1e; line-height:2; width: 50%;'>"
				+ "Appointment Name" + "</th>"
				+ "<td style='border-bottom:1px solid #ff3e1e;  line-height:2; width: 50%;'>"
				+ cvar.getAppointment_Name() + "</td>" + "</tr>" + "<tr>"
				+ "<th style='border-bottom:1px solid #ff3e1e; border-right:1px solid #ff3e1e; line-height:2;'>"
				+ "Appointment Start Date " + "</th>" + "<td style='border-bottom:1px solid #ff3e1e;  line-height:2;'>"
				+ cvar.getAppfromdate() + "</td>" + "</tr>" + "<tr>"
				+ "<th style='border-right:1px solid #ff3e1e; line-height:2;'>" + " Appointment Start Time " + "</th>"
				+ "<td>" + cvar.getApptimefrom() + "</td>" + "</tr>" + "</table>" + "<br><br>";

		String messageContent = templateBody + data + signature;
		// sending login creditionals to user
		boolean msgsent = false;
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", initialConfig.SMTP_HOST_NAME);
		props.put("mail.smtp.port", initialConfig.SMTP_PORT);
		props.put("mail.smtp.starttls.enable", "true");
	/*	Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(initialConfig.SMTP_AUTH_USER, initialConfig.SMTP_AUTH_PWD);
			}
		});*/
		Session session = authenticateSmtpMailServer(initialConfig.SMTP_AUTH_USER, initialConfig.SMTP_AUTH_PWD, initialConfig.SMTP_HOST_NAME, initialConfig.SMTP_PORT);

		// Method to send Email notification
				try {
					MimeMessage messages = new MimeMessage(session);
					messages.setFrom(new InternetAddress(initialConfig.SMTP_AUTH_USER));
					messages.addRecipient(Message.RecipientType.TO, new InternetAddress(emialId));
					messages.setSubject(sub);
					messages.setContent(messageContent, "text/html");
					Transport.send(messages);
				} catch (Exception e) {
					msgsent = false;
					cBLogger.error("Class Name : sendingMail , Function : sendAppointmentSuccessfulEmailToStudent , Error :"
							+ e.getMessage());
				}
		/*// Method to send Email notification
		try {
			MimeMessage messages = new MimeMessage(session);
			messages.setFrom(new InternetAddress(initialConfig.SMTP_AUTH_USER));
			messages.addRecipient(Message.RecipientType.TO, new InternetAddress(emialId));
			messages.setSubject(sub);
			messages.setContent(messageContent, "text/html");
			Transport.send(messages);
			msgsent = true;

		} catch (Exception e) {
			msgsent = false;
			cBLogger.error("Class Name : sendingMail , Function : sendAppointmentSuccessfulEmailToStudent , Error :"
					+ e.getMessage());
		}*/
		return msgsent;
	}
	// Authenticate Smtp Mail Server
		private Session authenticateSmtpMailServer(final String smtpAdmin, final String smtpPassword, String smtphost,
				String smtphostport) {
			try {
				Properties props = new Properties();
				props.put("mail.smtp.auth", "true");
				//props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.host", smtphost);
				props.put("mail.smtp.port", smtphostport);
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				
				return Session.getInstance(props, new javax.mail.Authenticator() {
					@Override
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(smtpAdmin, smtpPassword);
					}
				});
			} catch (Exception e) {
				cBLogger.error("Class Name : sendingMail , Function : authenticateSmtpMailServer, Error :"
						+ e.getMessage());
				return null;
			}
		}
	// send Registration Confirmation Mail to User
		public boolean sendCancelAppointmentEmail(String emialId, String username, cVFacilityManage objVoAddFacility) {
			String templateBody = "";
			cDFixAppointment cdfa = new cDFixAppointment();
			emailTemplate templateDetails = new emailTemplate();
			templateDetails = cdfa.getEmailTemplateByTemplateId(2);
			templateBody = "Dear " + username + ","+"<br> <br>"+templateDetails.getEmailTemplateBody()+"<br> <br>";
			String signature = templateDetails.getEmailSignature1() + "," + "<br>" + templateDetails.getEmailSignature2();
			String sub = templateDetails.getEmailTemplateSubject();
			String data = "<table style='border:1px solid #ff3e1e; text-align:left;'>" + "<tr>"
					+ "<th style='border-bottom:1px solid #ff3e1e; border-right:1px solid #ff3e1e; line-height:2; width: 50%;'>"
					+ "Appointment Name" + "</th>"
					+ "<td style='border-bottom:1px solid #ff3e1e;  line-height:2; width: 50%;'>"
					+ objVoAddFacility.getFacilityname() + "</td>" + "</tr>" + "<tr>"
					+ "<th style='border-bottom:1px solid #ff3e1e; border-right:1px solid #ff3e1e; line-height:2;'>"
					+ " Appointment Start Date " + "</th>" + "<td style='border-bottom:1px solid #ff3e1e;  line-height:2;'>"
					+ objVoAddFacility.getFacstartdate() + "</td>" + "</tr>" + "<tr>"
					+ "<th style='border-right:1px solid #ff3e1e; line-height:2;'>" + " Appointment Start Time " + "</th>"
					+ "<td>" + objVoAddFacility.getFacopentime() + "</td>" + "</tr>" + "</table>" + "<br><br>";

			String messageContent = templateBody + data + signature;
			// sending login creditionals to user
			boolean msgsent = false;
			/*Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.host", initialConfig.SMTP_HOST_NAME);
			props.put("mail.smtp.port", initialConfig.SMTP_PORT);
			props.put("mail.smtp.starttls.enable", "true");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(initialConfig.SMTP_AUTH_USER, initialConfig.SMTP_AUTH_PWD);
				}
			});*/
			
			Properties properties = System.getProperties(); 
			
			// Setup mail server 
			properties.setProperty("mail.smtp.host", initialConfig.SMTP_HOST_NAME); 
			
			// SSL Port 
			properties.put("mail.smtp.port", initialConfig.SMTP_PORT); 
			
			// enable authentication 
			properties.put("mail.smtp.auth", "true"); 
			
			// SSL Factory 
			properties.put("mail.smtp.socketFactory.class", 
					"javax.net.ssl.SSLSocketFactory");
			
			
			Session session = Session.getDefaultInstance(properties, 
					new javax.mail.Authenticator() { 						
						// override the getPasswordAuthentication 
						// method 
						protected PasswordAuthentication 
								getPasswordAuthentication() { 
							return new PasswordAuthentication(initialConfig.SMTP_AUTH_USER, 
									initialConfig.SMTP_AUTH_PWD); 
						} 
					});

			// Method to send Email notification
			try {
				/*MimeMessage messages = new MimeMessage(session);
				messages.setFrom(new InternetAddress(initialConfig.SMTP_AUTH_USER));
				messages.addRecipient(Message.RecipientType.TO, new InternetAddress(emialId));
				messages.setSubject(sub);
				messages.setContent(messageContent, "text/html");
				Transport.send(messages);*/
				
				MimeMessage message = new MimeMessage(session); 
				
				// header field of the header. 
				message.setFrom(new InternetAddress(initialConfig.SMTP_AUTH_USER));
				
				message.addRecipient(Message.RecipientType.TO, 
									new InternetAddress(emialId)); 
				message.setSubject(sub);
				message.setContent(messageContent, "text/html");
				//message.setText("Hello, WoW it's sending email "); 

				// Send message 
				Transport.send(message); 
				msgsent = true;
				
			} catch (Exception e) {
				msgsent = false;
				cBLogger.error("Class Name : sendingMail , Function : sendCancelAppointmentEmail , Error :"
						+ e.getMessage());
			}
			return msgsent;
		}
		
		
}
