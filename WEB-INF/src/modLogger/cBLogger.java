package modLogger;

import org.apache.log4j.Logger;

public class cBLogger {
	static Logger logger = Logger.getLogger("modLogger.cBLogger");

	
	public static void error(String message) {
		logger.error(message);
	}

	public static void debug(String message) {
		logger.debug(message);
	}

	public static void warn(String message) {
		logger.warn(message);
	}

	public static void error(String message, Throwable t) {
		logger.error(message, t);
	}

	public static void debug(String message, Throwable t) {
		logger.debug(message, t);
	}

	public static void warn(String message, Throwable t) {
		logger.warn(message, t);
	}
}
