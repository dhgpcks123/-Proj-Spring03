<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		$('#frm').submit();
	});
</script>	
<body>
	<form id="frm" method="GET" action="/www/main.jeju">
		<input type="hidden" name="ax" value="${param.ax}"/>
		<input type="hidden" name="ay" value="${param.ay}"/>
	</form>
</body>
</html>