<%@page import="javax.servlet.*,modCommon.commonBo.initialConfig"%>
<%@ page import="modAdmin.adminBo.*,java.util.*,common.EzAppointmentConstant "%>
<%@page language="java"%>
<%
	String msg = "";
	try {
		session.getAttribute("message");
		msg = session.getAttribute("message").toString();
		session.removeAttribute("message");
	} catch (Exception ee) {

	}
%>
<html>
<head>
<style type="text/css">
input.refresh-btn {
	width: 107px;
	padding: 8px;
	background: #75AD18;
	cursor: pointer;
}

.outer-div {
	display: table;
	height: 100%;
	width: 100%;
	text-align: center;
	background: #eaeaea
}

.inner-div {
	display: table-cell;
	vertical-align: middle;
}

body {
	margin: 0;
}
</style>
</head>
<body>
	<input type="hidden" id=CASLOGOUT value="<%=initialConfig.CAS_LOG_OUT%>">
	<div class="outer-div">
		<div class="inner-div">
			<h2><%=msg%></h2>
			<input class="refresh-btn" type="button" name="Refresh" value="Logout" onclick="refreshPage();" />
		</div>
	</div>
</body>
<script type="text/javascript">
	function refreshPage() {
		var CASLOGOUT = document.getElementById("CASLOGOUT").value;
		window.location.href= CASLOGOUT;
	}
</script>
</html>