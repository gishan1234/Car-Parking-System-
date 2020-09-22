<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html class="no-js" lang="">
<head>

<title>VPMS - Print</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<%
		int vid = Integer.parseInt(request.getParameter("vid"));
			Connection con = DatabaseConnection.getConnection();
			Statement statement = con.createStatement();
			ResultSet resultset = statement.executeQuery("select * from tblvehicle where ID='" + vid + "'");
			while (resultset.next()) {
	%>
	<center>
		<div id="exampl">
			<br> <br>

			<table border="2" cellspacing="2" cellpadding="2" width="80%">
				<tr>
					<th colspan="4" style="text-align: center; font-size: 22px;">
						Vehicle Parking Receipt</th>
				</tr>
				<tr>
					<th>Parking Number</th>
					<td><%=resultset.getString(2)%></td>
					<th>Vehicle Category</th>
					<td><%=resultset.getString(3)%></td>
				</tr>
				<tr>
					<th>Vehicle Company Name</th>
					<td><%=resultset.getString(4)%></td>

					<th>Registration Number</th>
					<td><%=resultset.getString(5)%></td>
				</tr>
				<tr>
					<th>Owner Name</th>
					<td><%=resultset.getString(6)%></td>

					<th>Owner Contact Number</th>
					<td><%=resultset.getString(7)%></td>
				</tr>
				<tr>
					<th>In Time</th>
					<td><%=resultset.getString(8)%></td>
					<th>Status</th>
					<td>
						<%
							if (resultset.getString(12).equals("")) {
						%> Incoming Vehicle <%
							}
						%> <%
 	if (resultset.getString(12).equals("Out")) {
 %> Outgoing Vehicle<%
 	}
 %>
					</td>
				</tr>
				<tr>
					<th>Out time</th>
					<td><%=resultset.getString(9)%></td>
					<th>Parking Charge</th>
					<td><%=resultset.getString(10)%></td>
				</tr>
				<tr>
					<th>Remark</th>
					<td colspan="3"><%=resultset.getString(11)%></td>

				</tr>

				<tr>
					<td colspan="4" style="text-align: center; cursor: pointer"><i
						class="fa fa-print fa-2x" aria-hidden="true"
						OnClick="CallPrint(this.value)"></i></td>
				</tr>

			</table>
			<%
				}
			%>

		</div>
	</center>
	<script>
		function CallPrint(strid) {
			var prtContent = document.getElementById("exampl");
			var WinPrint = window
					.open('', '',
							'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
			WinPrint.document.write(prtContent.innerHTML);
			WinPrint.document.close();
			WinPrint.focus();
			WinPrint.print();
			WinPrint.close();
		}
	</script>
	<%
		} else {
			response.sendRedirect("admin-login.jsp");
		}
	%>
</body>
</html>