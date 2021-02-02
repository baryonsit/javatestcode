//var xmlHttp = null;
//var xmlHttp1 = null; 

function getHttpObj()
{

	try
	{
		var xmlHttp=new XMLHttpRequest();
		var xmlHttp1=new XMLHttpRequest();
	}
	catch (e)
	{
		try
		{
			xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			xmlHttp1=new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch (ea)
		{
			try
			{
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
				xmlHttp1=new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch (eaa)
			{
				alert("Your browser does not support AJAX!");
				return false;
			}
		}
	}
	return xmlHttp;
}



function filterfacility(base_url)
	{
	/*var status=document.getElementById("showFacilityByOption").selectedIndex;
	var search_by_facname=document.getElementById("searchFacilityByName").selectedIndex;
	status=document.getElementById("showFacilityByOption").options[status].text;
	search_by_facname=document.getElementById("searchFacilityByName").value;
	
	getHttpObj();
	xmlHttp.onreadystatechange=function()
	{
		if(xmlHttp.readyState==4)
		{
		
			document.getElementById("showfacilities").innerHTML = xmlHttp.responseText;
		}
	}
	
	var url = "../WEB-INF/jsp/jsp-modFacility/filterFacilities.jsp?facilitytype="+status+"&search_by_facname="+search_by_facname;
//	var url = "../WEB-INF/jsp/jsp-modFacility/filterFacilities.jsp?search_by_facname="+search_by_facname;

	alert(url);
	xmlHttp.open("get",url,true);
	xmlHttp.send(null);
	*/	
	status=document.getElementById("showFacilityByOption").value;
	var search_by_facname=document.getElementById("searchFacilityByName").value;
	document.addfacilityform.action = base_url+"/WEB/jsp/jsp-modFacility/facilityList.jsp?facilitytype="+status+"&search_by_facname="+search_by_facname;
	document.addfacilityform.submit();
	}

function ajaxfncheck()
{
	//alert("HI");
	var url;
	getHttpObj();
	var facID=document.getElementsByName("facid")[0].value;
	var fromDT=document.getElementsByName("appfromdate")[0].value;
	var toDT=document.getElementsByName("apptodate")[0].value;
	var fromTime=document.getElementsByName("apptimefrom")[0].value;
	var toTime=document.getElementsByName("apptimeto")[0].value;
	//alert(facID+"\n"+fromDT+"\n"+toDT+"\n"+fromTime+"\n"+toTime+"\n")
	document.getElementsByName("fixapp")[0].disabled=false;
	xmlHttp.onreadystatechange=function()
	{
		if (xmlHttp.readyState == 4) {
			var check = parseInt(xmlHttp.responseText);
			if (check > 0) {
				document.getElementById("avail").innerHTML = "For Given Date And Time Appointment Is Not Available";
				document.getElementsByName("fixapp")[0].disabled=true;
			}
			else 
				if (check == 0) {
					document.getElementById("avail").innerHTML = "Appointment Is Available";
					document.getElementsByName("fixapp")[0].disabled=false;
				}
				else {
					document.getElementById("avail").innerHTML = "Please Try Agian";
					document.getElementsByName("fixapp")[0].disabled=false;
				}
		}
	}
	url = "/WEB/jsp/jsp-modAppointment/checkAppointAvail.jsp?facID="+facID+"&fromDT="+fromDT+"&toDT="+toDT+"&fromTime="+fromTime+"&toTime="+toTime;
	xmlHttp.open("get",url,true);
	xmlHttp.send(null);
}

function filterStatesForAdvancedSearch(base_url)
{
	var id=document.getElementById("country_id").value;
	var url;
	var country_obj=getHttpObj();
	country_obj.onreadystatechange=function()
	{
		if(country_obj.readyState==4)
		{
			document.getElementById("filterStatesForSearch").innerHTML = country_obj.responseText;		
		}
	}
	
	url = base_url+"/WEB/jsp/jsp-modCommon/filterStatesForAdvancedSearch.jsp?state_id="+id;
	country_obj.open("get",url,true);
	country_obj.send(null);
}
/*function filterCityForAdvancedSearch(base_url,id)
{
	alert(base_url);
    alert(id);
	var url;
	country_obj=getHttpObj();
	//alert(country_obj);
	country_obj.onreadystatechange=function()
	{
		if(country_obj.readyState==4)
		{
			document.getElementById("filterStatesForSearch").innerHTML = country_obj.responseText;
			
			
		}
	}
	
	url = base_url+"/WEB/jsp/jsp-modCommon/filterStatesForSearch.jsp?state_id="+id;
	alert(url);
	country_obj.open("get",url,true);
	country_obj.send(null);
}*/
function checkMembership_Id(base_url)
  {
  	var Member_id=document.getElementById("Membership_Id").value;
	var url;
    if(document.getElementById("Membership_Id").value=="")
      {
    		alert("please enter the Membership Id");
   			 return false;
       }
	if(document.getElementById("Membership_Id").value!="") {
	      var Member_obj=getHttpObj();
	       Member_obj.onreadystatechange=function()
	       {
	        if(Member_obj.readyState==4)
	          {
	         //alert("RES : "+parseInt(Member_obj.responseText));
	          var memberShipResult=parseInt(Member_obj.responseText); 
	          
	          if(memberShipResult>0){
	          //alert("dfruufu");
	           document.fixappoint.submit();
               return true;
	          }
	           else
	           {
	            alert("Invalid Membership_id");
	            return false;
	            
	           }
	          // document.getElementById("checkMembership_Id").innerHTML=Member_obj.responseText;
	           
	           }
	        }
	}

    url=base_url+"/WEB/jsp/jsp-modCommon/checkMembership_Id.jsp?Member_id="+Member_id;
    //alert(url);
    Member_obj.open("get",url,true);
    Member_obj.send(null);
  }


function alphanumeric_validate(txt){
	var usrid=txt; //txtUserid-->ID of textbox   
	var alphanum=/^[0-9a-zA-Z]+$/; //This contains A to Z , 0 to 9 and A to B
		if(usrid.match(alphanum)){
			return true;
		}else{
			return false;
		}
	}

function check_availability(base_url)
{
//	var chr = new Array(100);
	var user_name=document.getElementById("username").value;
//	chr = user_name;
	if(user_name.length <= 0)
	{
		alert("Please enter the Username");
		return false;
	}
	if(user_name.length < 6)
	{
		alert("Username should have minium 6 characters")
		return false;
	}
	else
	{
		if(!alphanumeric_validate(user_name)){
			alert("Invalid Username. Only characters a-z and A-Z and 0-9 and a underscore are allowed");
			return false;
		}
		/*for (var un = 0; un < chr.length; un++) 
		{
			if (!((chr[un] >= 'A' && chr[un] <= 'Z') || (chr[un] >= 'a' && chr[un] <= 'z') || (chr[un] >= 0 && chr[un] <= 9)))
			{
				if (!(chr[un] == '_'))
				{
					alert("Invalid Username. Only characters a-z and A-Z and 0-9 and a underscore are allowed");
					return false;
				}
			}
		}*/
        
		
		var url;
		var un_obj=getHttpObj();
		un_obj.onreadystatechange=function()
		{
			if(un_obj.readyState==4)
			{
				document.getElementById("check_avdiv").innerHTML = un_obj.responseText;
				
			}
		}
		
		url = base_url+"/WEB/jsp/jsp-modUser/userAjax.jsp?option=usernameavailable&un="+user_name;
		un_obj.open("get",url,true);
		un_obj.send(null);
	}
}
	