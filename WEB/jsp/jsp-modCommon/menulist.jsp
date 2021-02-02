<%@ page import="modUser.userDo.*,java.util.*"%>
<%@ page import="modCommon.commonBo.*"%>
<%@ page import="modAdmin.adminBo.*"%>
<%!
ArrayList countryList = new ArrayList();
ArrayList global_Settings = new ArrayList();
String default_country="";
String searchcountyid;
%>
<%
try
{
    cBSubscriptionManage objcBGlobalSettings = new cBSubscriptionManage();
    global_Settings=objcBGlobalSettings.getGlobalSettings();
    for(int i=0;i<global_Settings.size();i=i+2)
    {
    	if(global_Settings.get(i).equals("default_country"))
    	{
      		 default_country=(String)global_Settings.get(i+1);
    	}
    }
	cBCommonFunctions objcDCountry=new cBCommonFunctions();
    countryList =objcDCountry.getCountryDetails();
    objcBGlobalSettings =null;
    objcDCountry =null;
    String contry="";
    searchcountyid =session.getAttribute("CountryID").toString();
   contry = request.getParameter("countryid");
 String contryval="";
 contryval = objcDCountry.contryval(contry);
 %>
 <%
}
catch(Exception e)
{
	//flag=0;
}
%>


	<%-- <form style="margin:0;" name="mainSearch" action="<%=request.getContextPath()%>/WEB/jsp/jsp-modCommon/searchResult.jsp?mainsearch='javascript:document.mainSearch.mainsearch.value'&countryid='javascript:document.mainSearch.countryid.value'&search_option='javascript:document.mainSearch.searchoption.value'">
		<input type="hidden" name="searchoption" value="firstload" />  
				 <div class="table_font tablebg">
				 
						<input type="text" name="mainsearch" class="flatbox2 form-control" placeholder="Enter keyword"/>
					
 							<select name="countryid" id ="countryid" class="flatbox1 form-control" onchange="filterStatesForAdvancedSearch1('<%=request.getContextPath() %>')">
							<option value="">Select Country</option>
							<%  
								try{ 
									int flag=0;
									for (int k = 0; k < countryList.size(); k=k+2)
									{
										 int countryId=Integer.parseInt(countryList.get(k).toString());
										 if(searchcountyid != null && countryId==(Integer.parseInt(searchcountyid))){
											 flag=1; %>
											<option value="<%=countryList.get(k)%>" selected="selected"><%=countryList.get(k+1)%></option> 
									  <%	 }
										 else if(countryId==(Integer.parseInt(default_country)) && flag==0)
									     {
										  %>          
											<option value="<%=countryList.get(k)%>" selected="selected"><%=countryList.get(k+1)%></option>
							
										 <%}
							     		 else
									     {%>
										   <option value="<%=countryList.get(k)%>"><%=countryList.get(k+1) %></option>
									      <%} 
									}
								}catch(Exception country)
								{
																	
								}
							%>
							</select>
					
						<input type="submit" value="Search" class="btn btn-primary" onclick="return selectCity();"/>
					
		        </div>
 		</form>  --%>

 <%--    <div class="tableheader">
		<h2>Categories</h2>
	</div>
    <tr>
		<td height="50" align="center">
			<% 
			cBProfileManagement objBoGetleftmenu=new cBProfileManagement();
			ArrayList leftmenucategories = new ArrayList();
		    leftmenucategories = objBoGetleftmenu.getCategories();
		    try{
		  			%>
						<div id="menu3">
					    <ul style="list-style:none;padding:0;">
						<% 
							for(int i=0;i<leftmenucategories.size();i=i+2)
							{
						 %>
								<li class="c_active">
									<a href="<%=request.getContextPath()%>/index.jsp?category_id=<%=leftmenucategories.get(i)%>&category_name=<%=leftmenucategories.get(i+1)%>&searchkey=ALL&country_id=<%=default_country %>" title=""><%=leftmenucategories.get(i+1) %></a>
								</li>
						<% 
							}
					  	%>
					   </ul>
				       </div>
						<%
			} catch(Exception ee){
	
			}
			%>
		</td>
   </tr>  --%>
   
 