$(document).ready(function()
{
	$("#send_sms_addmore").click(function(){
		value = $("#send_sms_count").val();
		smsShowHidden(value)
	});
	
	$("#send_sms_remove").click(function(){
		value = $("#send_sms_count").val();
		smsShowHidden(value)
	});
	
	
	function smsShowHidden(value)
	{
		if(value == 0) {
			$(".two").hide();
		}
		else {
			$(".two").show();
		}
	}
	
	smsShowHidden($("#send_sms_count").val())
	
});


function validate_rec_sms(){
//alert("in sms file");
if(document.getElementById("rec_name_sms").value==""){
		alert("Please enter Name.");
		document.getElementById("rec_name_sms").focus();
		return false;
	}
	else if(document.getElementById("mobileno").value==""){
		alert("Please enter Mobile Number");
		document.getElementById("mobileno").focus();
		return false;
	}
	
	addRecipientsSms();
}
var number=1;
var send_sms_count = 0;

function addRecipientsSms(){

if(number >1){
		for(var i=1;i<number;i++){
		//alert(document.sendSmsForm.rec_name.value);
			if(document.getElementById("rec_name_sms_"+i)){
				if((document.getElementById("rec_name_sms_"+(i)).innerHTML == (document.getElementById("rec_name_sms").value)) &&
					(document.getElementById("mobileno_"+(i)).innerHTML==document.getElementById("mobileno").value)) {
					alert("same recipients cannot be added.");
					return false;
				}
				
			}
		}

}

var tbody = document.getElementById("rec_list_sms").getElementsByTagName("tbody")[0];

	var row = document.createElement("TR");
	row.setAttribute("id","row_"+number);
	row.setAttribute('class','trgreen_color');
	var cell1 = document.createElement("TD");
	cell1.setAttribute("id","rec_name_sms_"+number);
	cell1.innerHTML = document.getElementById("rec_name_sms").value;

	var cell2 = document.createElement("TD");
	cell2.setAttribute("id","mobileno_"+number);
	cell2.innerHTML = document.getElementById("mobileno").value;

	var chkbx = document.createElement("input");
	chkbx.setAttribute('type',"checkbox");
	chkbx.setAttribute('id',"chk_"+number);
	chkbx.setAttribute('name','chkbox');
	number++;
	send_sms_count++;

	var cell3 = document.createElement("TD");

	cell3.appendChild(chkbx);
	row.appendChild(cell3);
	row.appendChild(cell1);
	row.appendChild(cell2);	
	tbody.appendChild(row);
	
	document.getElementById("send_sms_count").value = send_sms_count;

}

function removeRecipientSms(){
	var tbody = document.getElementById("rec_list_sms").getElementsByTagName("tbody")[0];
	if(tbody.rows.length <=1){
		number = 1;
		alert("Recipients list empty");
	}
	else{
		var chks = document.getElementsByName("chkbox");
		for(var i = 0; i < chks.length; i++){
			if(chks[i].checked){
				tbody.deleteRow(i+1);
				removeRecipient();
				send_sms_count--;
			}
		}
	}
	
	document.getElementById("send_sms_count").value = send_sms_count;
}

function saveNexitSms(){

	if(document.getElementById("rec_name_sms").value==""){
		alert("Please enter Name.");
		document.getElementById("rec_name_sms").focus();
		return false;
	}
	else if(document.getElementById("mobileno").value==""){
		alert("Please enter Mail ID.");
		document.getElementById("mobileno").focus();
		return false;
	}
	saveInformationSms();
}

function saveInformationSms(){
	var tbody = document.getElementById("rec_list_sms").getElementsByTagName("tbody")[0];
	if(tbody.rows.length <=1){
		alert("Please enter atleast 1 Field.");
		//document.getElementById("op").value="";
		return false;
	}
	
	sendRecToBusinessSms(tbody);
	document.getElementById("count1").value = tbody.rows.length -1;
	//document.getElementById("op").value="saveSchedules";
	//document.cookie = "PROGRAMS="+document.getElementById("programs").innerHTML;
	//document.frmSchedule.target = "";
	//document.sendMailForm.action = "fixApointment.jsp";
	//document.sendMailForm.action = "http://localhost:8080/appoint/jsp-modAppointment/fixAppointment.jsp";	
	document.sendSmsForm.submit();
}

function sendRecToBusinessSms(tbody){
	var vals = tbody.rows.length - 1;
	var smsdetails = "";
	var recmailids = "";

	for(var i = 1; i <= number; i++){
		if(document.getElementById("rec_name_sms_"+i) && document.getElementById("mobileno_"+i)){
			smsdetails = smsdetails+"%"+"_"+document.getElementById("rec_name_sms_"+i).innerHTML+"_"+document.getElementById("mobileno_"+i).innerHTML;
			//recmailids += "_"+document.getElementById("rec_mailid_"+i).innerHTML+"__";
			
		}
	}
	document.getElementById("smsdetails").value = smsdetails;
	//alert("nnnnnnnnnnnnn"+smsdetails);
	//document.getElementById("rec_mailid").value = recmailids;
	
	

}
