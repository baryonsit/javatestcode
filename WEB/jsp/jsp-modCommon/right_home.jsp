<%@ page language="java" %>
<%@ taglib uri="/META-INF/tlds/struts-html.tld" prefix="html"%>
<%@ taglib uri="/META-INF/tlds/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/META-INF/tlds/struts-logic.tld" prefix="logic" %>
		<div class="col-md-2 main-con-right">
			<% 
				try
				{
					if(session.getAttribute("logedroleid").equals(1) ||  session.getAttribute("logedroleid").equals(3))
					{
						 out.println("<h2 >Welcome "+session.getAttribute("logedusername")
								 +"</h2>");
					}else if(session.getAttribute("logedroleid").equals(2)){
					        out.println("<h3> Welcome "+session.getAttribute("logedusername")+"<br/>");
							out.println(" Business : "+session.getAttribute("businessName")+"<br/>");
							out.println(" Owner : "+session.getAttribute("ownerName")+"</h3>");
						}					
					
					else
					{
						out.println("<font color='red'>Username & Password Doesnot Match "+"</font>"+"");
					}
				} 
				
	
				catch(Exception e)
				{
			%> 
	                <div class="col-md-2">
					<html:form action="login.do" >
					<!--<table class="RightPanelBox table_font clearr fll" cellspacing="1" border="0" cellpadding="5">-->
					
					<!-- <table cellspacing="1"   align="center" cellpadding="5" class="table_style table_font"> -->
					<div class="main-con_left"></div>
								
					<h2>Login</h2>

							<html:text property="loginun" onclick="this.value=''" onfocus="inputFocus(this)" onblur="inputBlur(this)" value="User-id" styleClass="flatbox" style="width:155px;" />
										
									
							<html:password property="loginpwd" onclick="this.value=''" onfocus="inputFocus(this)" onblur="inputBlur(this)"  value="Password" styleClass="flatbox" style="width:155px;"/>
								
								<input type="submit" value="Login" class="flatbox_btn headings2" />
									
								<ul id="loginlink">
								<li><a href="<%=request.getContextPath()%>/WEB/jsp/jsp-modUser/businessOwnerReg.jsp?role1=BusinessUsers&businessid"> Register? </a>	</li>
								<li><a href="<%=request.getContextPath() %>/WEB/jsp/jsp-modUser/forgotPassword.jsp">Forgot Password?</a></li>
			                    </ul>
			                    
					</div>
			
					</html:form> 
			<%
				}
			%>

			<!-- <table cellspacing="1"   align="center" cellpadding="5" class="table_style table_font clearr fll" border="0"> -->
			
				<!-- <div >
						
						<h3>Latest News</h3>
								
				
						<a href="#">New Version of Appointment System releases.....</a>
				
						<a href="#">Appointment System features latest technology aspects</a>
				
              </div> -->
<script type="text/javascript">
	function inputFocus(i){
	    if(i.value==i.defaultValue)
		{
			 i.value="";
        }
	}
	function inputBlur(i){
	    if(i.value=="")
		{
			 i.value=i.defaultValue;
	    }
	}
</script>