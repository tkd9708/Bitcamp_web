<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<table class="table table-bordered" style="width: 900px">
		<caption class="alert alert-info"><b>전체구구단</b></caption>
		<tr>
		<%
			for(int i=2; i<=9; i++){
				%>
				<td style="background-color: #eee" align= "center"><b><%=i %>단</b></td>			
				<%
			}
			%>
		</tr>
		
		<%
			for(int i=1; i<=9; i++){
				%>
				<tr>
				<%
				for(int j=2; j<=9; j++){
					%>
					<td align= "center"><%=j %>x<%=i %>=<%=j*i %></td>
					
					<%
				}
				%>
				</tr>
				<%
			}
			%>
		
	</table>
</body>
</html>