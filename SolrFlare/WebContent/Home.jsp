<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Preference selection</title>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/headerstyle.css" type="text/css" />
<link rel="stylesheet" href="css/navbar.css" type="text/css" />
<link rel="stylesheet" href="css/bodystyle.css" type="text/css" />

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<script src="js/jquery-1.11.1.js"></script>
</head>

<body>

	<script type="text/javascript">
		
	</script>

	<div id="fb-root"></div>

	<!-- UI Elements here -->
	<jsp:include page="Headerbar.html" />

	<br>
	<br>
	<section class="loginpanel">
		<div class="wrap"></div>
	</section>

	<div class="messagetext" id="message"></div>

	<input type="hidden" name="userInfo1" id="userInfo1"
		value="dummyvalue1" />
	<input type="hidden" name="userInfo2" id="userInfo2"
		value="dummyvalue2" />

	<script src="js/index.js"></script>

	<!--Footer bar-->
	<jsp:include page="Footer.html" />

</body>
</html>