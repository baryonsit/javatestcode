<div class="footer">
	<div class="container-fluid">
		<div class="footer-content-data">
			<div class="foot_logo col-md-3">
				<img src="<%=request.getContextPath()%>/WEB/includes/images/sch_logo.png" />
			</div>
			<div id="footerContent" class="Copy col-md-6 text-center"></div>
			<div class="col-md-3 text-right">
				<p>Product of <a href="https://www.baryonssoftsolutions.com/" target="_blank">Baryons</a></p>
			</div>

		</div>
	</div>
</div>
<script>

var d = new Date();
var dataString = "<p>Copyright &copy; SchoolInaBox "+d.getFullYear()+" All Rights Reserved.</p>";
document.getElementById("footerContent").innerHTML = dataString;
</script>