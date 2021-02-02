package modCommon.commonDo;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Enumeration;
import java.util.Hashtable;

import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import modCommon.commonBo.initialConfig;
import modLogger.cBLogger;

public class cDConnectionManager {

	String dbname = "";
	String Username = "";
	String Password = "";
	String Host = "";
	int NoOfConnections = 0;
	int Port = 0;
	private static cDConnectionManager lCMObj = null;
	private static Hashtable<String, Hashtable<String, cDConnection>> allDBName = null;

	public static cDConnectionManager getObjHandle() {
		if (lCMObj == null)
			lCMObj = new cDConnectionManager();
		return lCMObj;
	}

	private cDConnectionManager() {

		initialConfig obj = new initialConfig();
		String str = initialConfig.PATH + initialConfig.PROJECT_NAME + initialConfig.Config;

		try {
			File file = new File(str);
			if (file.exists()) {
				/*DOMParser parser = new DOMParser();
				parser.parse(str);
				Document doc = parser.getDocument();
				NodeList list = doc.getElementsByTagName("config");
				Element el = (Element) list.item(0);

				Host = getTextValue(el, "Host");
				Port = getIntValue(el, "Port");
				dbname = getTextValue(el, "dbname");
				Username = getTextValue(el, "Username");
				try {
					Password = getTextValue(el, "Password");
				} catch (Exception e) {
					Password = "";
				}
				NoOfConnections = getIntValue(el, "NoOfConnections");*/
				
				
				dbname = initialConfig.dbname;
				Username = initialConfig.Username;
				Password = initialConfig.Password;
				NoOfConnections = initialConfig.NoOfConnections;
				Host = initialConfig.Host;
				Port = initialConfig.Port;

				allDBName = new Hashtable<String, Hashtable<String, cDConnection>>();
				addNewDB();
			} else {
				cBLogger.debug("class name: cDConnectionManager , Constructor : cDConnectionManager , Status : File doesn't exist");
			}
		} catch (Exception e) {
			cBLogger.error("class Name : cDConnectionManager, Constructor : cDConnectionManager , ", e);
		}
	}

	private Hashtable<String, cDConnection> addNewDBConnections(String dbname) {

		Hashtable<String, cDConnection> connlist = null;
		connlist = new Hashtable<String, cDConnection>();
		try {
			for (int i = 0; i < NoOfConnections; i++) {
				connlist.put(Integer.toString(i), createconnection());
			}
		} catch (Exception ee) {
			cBLogger.error("Class :cDConnectionManager  , Function : addNewDBConnections , error : ", ee);
		}
		return connlist;
	}

	private cDConnection createconnection() {
		return new cDConnection(dbname);
	}

	public boolean addNewDB() {
		allDBName.put(dbname, addNewDBConnections(dbname));
		return true;
	}

	public indexConnection openConnection() {
		Hashtable<String, cDConnection> connlist = null;

		connlist = (Hashtable<String, cDConnection>) allDBName.get(dbname);

		indexConnection indCon = new indexConnection();

		if (connlist != null) {
			Enumeration<String> cnt = connlist.keys();

			while (cnt.hasMoreElements()) {
				String connName = (String) cnt.nextElement();
				if (!connlist.get(connName).getFlagconn()) {
					Connection connection = connlist.get(connName).getCon();

					boolean requiresNewConnection = false;
					try {
						requiresNewConnection = (connection == null) || !connection.isValid(0);
					} catch (Exception e) {
						requiresNewConnection = true; // assume that a new
														// connection is
														// required
						// in case there was a valid connection, close it since
						// we are going to open a new one.
						try {
							closeConnection(connName);
							connection.close();
						} catch (Exception ex) {
						}
					}

					if (requiresNewConnection) {
						connlist.get(connName).connect();
					}

					connlist.get(connName).setFlagconn(true);
					indCon.index = connName.toString();
					indCon.con = connlist.get(connName).getCon();
					return indCon;
				}
			}
			throw new MaxConnectionsExceededException("Tried to created more than " + NoOfConnections + " connections");
		} else {
			indCon.con = noDBconnect(dbname, Username, Password);
			return indCon;
		}
	}

	public Connection noDBconnect(String dbname, String username, String password) {
		Connection con = null;
		try {
			String driverClass = "com.mysql.jdbc.Driver";
			String jdbcurl = "jdbc:mysql://" + Host + ":" + Port + "/" + dbname + "" + "?user=" + username + "" + "&password=" + password + "";
			Class.forName(driverClass);
			con = DriverManager.getConnection(jdbcurl);
		} catch (Exception e) {
			cBLogger.error("class Name : cDConnectionManager, Function : noDBconnect ,Error : ", e);
		}
		return con;
	}

	public void closeConnection(String sindex) {
		Hashtable<String, cDConnection> connlist = null;
		connlist = (Hashtable<String, cDConnection>) allDBName.get(dbname);

		if (connlist != null) {

			if (connlist.get(sindex) != null) {
				connlist.get(sindex).setFlagconn(false);
			}
		}
	}

	private class cDConnection {
		String driverClass = "";
		String jdbcurl = "";

		private Connection con = null;
		private boolean flagconn = false;

		public cDConnection(String dbname) {
			driverClass = "com.mysql.jdbc.Driver";
			jdbcurl = "jdbc:mysql://" + Host + ":" + Port + "/" + dbname + "?user=" + Username + "&password=" + Password;
			this.connect();
		}

		private void connect() {
			try {

				Class.forName(driverClass);
				this.con = DriverManager.getConnection(jdbcurl);

			} catch (Exception e) {
				cBLogger.error("class Name : cDConnectionManager, Function : connect ,Error : ", e);
			}

		}

		public Connection getCon() {
			return con;
		}

		public boolean getFlagconn() {
			return flagconn;

		}

		public void setFlagconn(boolean flagconn) {
			this.flagconn = flagconn;
		}

	}

	private String getTextValue(Element ele, String tagName) {
		String textVal = null;
		NodeList nl = ele.getElementsByTagName(tagName);
		if (nl != null && nl.getLength() > 0) {
			Element el = (Element) nl.item(0);
			textVal = el.getFirstChild().getNodeValue();
		}
		return textVal;
	}

	private int getIntValue(Element ele, String tagName) {
		return Integer.parseInt(getTextValue(ele, tagName));
	}

}