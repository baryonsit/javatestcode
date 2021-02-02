function preMonth(base_url)
{
	flag=1;
	
	document.getElementsByName("mon")[0].value=document.getElementsByName("mon")[0].value-1;
	//document.forms[2].elements[0].value=document.forms[2].elements[0].value-1;
	
	if(document.getElementsByName("mon")[0].value<0)
	{
		document.getElementsByName("mon")[0].value=11;
		document.getElementsByName("year")[0].value=document.getElementsByName("year")[0].value-1;
	}
	if(flag==1)
	{
		document.calender.submit();
	}
	
}


function nextMonth()
{

	
	var today=new Date();
	var yy = parseInt(today.getFullYear());
	var mm = parseInt(today.getMonth()+1);//January is 0!
	
	var m=0,m1=0,y=0;
	var ye;
	flag=1;
	m=parseInt(document.getElementsByName("mon")[0].value);
	m=m+1;
	y=parseInt(document.getElementsByName("year")[0].value);
	
		if(m>11)
		{
			y=parseInt(document.getElementsByName("year")[0].value);
			m=0;
			y=y+1;
			document.getElementsByName("mon")[0].value=m.toString();
			document.getElementsByName("year")[0].value=y.toString();
			document.calender.submit();
			return true
			
		}
		
		else
		{
			document.getElementsByName("mon")[0].value=m.toString();
			document.getElementsByName("year")[0].value=y.toString();
			document.calender.submit();
			return true
		}
		
}