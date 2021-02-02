package modCommon.commonDo;

public class MaxConnectionsExceededException extends RuntimeException {

	private static final long serialVersionUID = 727433910637152996L;

	public MaxConnectionsExceededException() {
		super();
	}

	public MaxConnectionsExceededException(String message) {
		super(message);
	}

	public MaxConnectionsExceededException(String message, Throwable cause) {
		super(message, cause);
	}

	public MaxConnectionsExceededException(Throwable cause) {
		super(cause);
	}
}
