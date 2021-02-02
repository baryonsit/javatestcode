jQuery(document).ready(function() {
	jQuery("#updateAppointmentStatus").validate({
		rules : {
			appointment_remark: {
				maxlength:1000,
			},
		},
		messages : {
			appointment_remark: {
				maxlength: "Maxium  1000 characters is allowed",
			},

		}
	});
	
	$("#updateUserProfile").validate({
		rules : {
			fname :{required:true},
			lname : {required:true},
			email : {
				required:true,
				email: true,	
			},
			add1 : {required:true},
			country : {required:true},
			state : {required:true},
			city : {required:true},
			zipcode : {
				required:true,
				number: true,
				},
			contact : {
				required:true,
				number: true,
				},
		},
		messages : {
			fname :  {
				required: "Enter First Name",
			},
			lname : "Enter Last Name",
			email :  {
				required: "Enter EmailId",
				email: "Enter Valid Email"
			},
			add1 : "Enter Address Line1",
			country : "Please Select Country",
			state : "Please Select State",
			city : "Please Select City",
			zipcode: {
				required: "Please Enter Zipcode",
				number: "Invalid Data.Enter Only Digit",
			},
			contact: {
				required: "Please Enter ContactNumber",
				number: "Invalid Data.Enter Only Digit",
			},

		}
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

});
