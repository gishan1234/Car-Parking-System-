<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>

<html class="no-js" lang="">
<head>

<title>VPMS - View Vehicle Detail</title>


<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

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

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<!-- Left Panel -->

	<jsp:include page="includes/sidebar.jsp"></jsp:include>

	<jsp:include page="includes/header.jsp"></jsp:include>

	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>Dashboard</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="dashboard.jsp">Dashboard</a></li>
								<li><a href="manage-incomingvehicle.jsp">View Vehicle</a></li>
								<li class="active">Incoming Vehicle</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="animated fadeIn">
			<div class="row">



				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title">View Incoming Vehicle</strong>
						</div>
						<form action="ViewIncomingVehicleDetails" method="post">
						<div class="card-body">
							<%
									int cid = Integer.parseInt(request.getParameter("viewid"));
									session.setAttribute("cid", cid);
									Connection con = DatabaseConnection.getConnection();
									Statement statement = con.createStatement();
									ResultSet resultset = statement.executeQuery("select * from tblvehicle where ID='" + cid + "'");
									while (resultset.next()) {
							%>

							<table border="1" class="table table-bordered mg-b-0">

								<tr>
									<th>Parking Number</th>
									<td><%=resultset.getString(2)%></td>
								</tr>
								<tr>
									<th>Vehicle Category</th>
									<td><input type="text" name="category" value="<%=resultset.getString(3)%>" style="border:none"></td>
								</tr>
								<tr>
									<th>Vehicle Company Name</th>
									<td><%=resultset.getString(4)%></td>
								</tr>
								<tr>
									<th>Registration Number</th>
									<td><%=resultset.getString(5)%></td>
								</tr>
								<tr>
									<th>Owner Name</th>
									<td><%=resultset.getString(6)%></td>
								</tr>
								<tr>
									<th>Owner Contact Number</th>
									<td><%=resultset.getString(7)%></td>
								</tr>
								<tr>
									<th>In Time</th>
									<td><input type="text" name="intime" value="<%=resultset.getString(8)%>" style="border:none"></td>
								</tr>
								<tr>
									<th>Out Time</th>
									<%
										if (resultset.getString(12).equals("")) {

												} else {
									%>
									<td><%=resultset.getString(9)%></td>
									<%
										}
									%>
								</tr>
								<tr>
									<th>Status</th>
									<td>
										<%
											if (resultset.getString(12).equals("")) {
										%>Vehicle In<%
											}
													if (resultset.getString(12).equals("Out")) {
										%>Vehicle Out<%
											}
										%>
									</td>
								</tr>

							</table>

						</div>
					</div>
					<table class="table mb-0">

						<%
							if (resultset.getString(12).equals("")) {
						%>
						
							<tr>
								<th>Remark :</th>
								<td><textarea name="remark" placeholder="" rows="12"
										cols="14" class="form-control" required="true"></textarea></td>
							</tr>
							<tr>
								<th>Status :</th>
								<td><select name="status" class="form-control"
									required="true">
										<option value="Out">Outgoing Vehicle</option>
								</select></td>
							</tr>
							<tr>
								<p style="text-align: center;">
								<td>
									<button type="submit" class="btn btn-primary btn-sm"
										name="submit">Update</button>
									</p>
								</td>
							</tr>
						</form>
					</table>
					<%
						} else {
					%>
					<table border="1" class="table table-bordered mg-b-0">
						<tr>
							<th>Remark</th>
							<td><%=resultset.getString(11)%></td>
						</tr>
						<tr>
						<tr>
							<th>Parking Fee</th>
							<td><%=resultset.getString(10)%></td>
						</tr>



						<%
							}
						%>
					</table>

					<%
						}
					%>
				</div>
			</div>
		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->

	<div class="clearfix"></div>

	<jsp:include page="includes/footer.jsp"></jsp:include>

	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="assets/js/main.js"></script>


	<%
		} else {
			response.sendRedirect("admin-login.jsp");
		}
	%>
</body>
</html>
