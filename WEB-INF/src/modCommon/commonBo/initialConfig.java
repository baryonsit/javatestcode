package modCommon.commonBo;

import java.io.InputStream;
import java.util.Properties;

public class initialConfig {

	/*
	 * //public static final String PATH="/usr/local/work"; public static final
	 * String PATH="/home/baryons/Desktop/ssssss"; public static final String
	 * PROJECT_NAME="/ezAppointment"; public static final String
	 * Config="/WEB-INF/config.xml";
	 */

	public static String PATH;
	public static String PROJECT_NAME;
	public static String Config;
	public static String Host;
	public static int Port;
	public static String dbname;
	public static String Username;
	public static String Password;
	public static int NoOfConnections;
	public static String SMTP_HOST_NAME;
	public static String SMTP_AUTH_USER;
	public static String SMTP_AUTH_PWD;
	public static String SMTP_PORT;
	public static String CAS_LOG_OUT;
	public static String CAS_EZTICKET;
	public static String CAS_EZAPPOINTMENT;
	public static String CAS_EZPERSONNEL;
	public static String CAS_EZLIBRARY;
	public static String CAS_CTMS;
	public static String CAS_EZSCHOOL;
	public static String SCHOOLINABOX;
	public static String CASBLOMS;

	public initialConfig() {
		try {
			InputStream inputStream = this.getClass().getResourceAsStream("/common.properties");
			Properties prop = new Properties();
			prop.load(inputStream);

			PATH = prop.getProperty("DEVELOPMENT_PATH");
			PROJECT_NAME = prop.getProperty("PROJECT_NAME");
			Config = prop.getProperty("Config");
			Host = prop.getProperty("Host_Name");
			Port = Integer.parseInt(prop.getProperty("Port_Number"));
			dbname = prop.getProperty("dbname");
			Username = prop.getProperty("Username");
			Password = prop.getProperty("Password");
			NoOfConnections = Integer.parseInt(prop.getProperty("NoOfConnections"));
			SMTP_HOST_NAME = prop.getProperty("SMTP_HOST_NAME");
			SMTP_AUTH_USER = prop.getProperty("SMTP_AUTH_USER");
			SMTP_AUTH_PWD = prop.getProperty("SMTP_AUTH_PWD");
			SMTP_PORT = prop.getProperty("SMTP_PORT");
			CAS_LOG_OUT = prop.getProperty("CAS_LOG_OUT");
			CAS_EZTICKET = prop.getProperty("CAS_EZTICKET");
			CAS_EZAPPOINTMENT = prop.getProperty("CAS_EZAPPOINTMENT");
			CAS_EZPERSONNEL = prop.getProperty("CAS_EZPERSONNEL");
			CAS_EZLIBRARY = prop.getProperty("CAS_EZLIBRARY");
			CAS_CTMS = prop.getProperty("CAS_CTMS");
			CAS_EZSCHOOL = prop.getProperty("CAS_EZSCHOOL");
			SCHOOLINABOX = prop.getProperty("SCHOOLINABOX");
			CASBLOMS = prop.getProperty("CAS_BLOMS");
			CAS_LOG_OUT = prop.getProperty("CAS_LOG_OUT");

		} catch (Exception e) {

		}
	}

}
