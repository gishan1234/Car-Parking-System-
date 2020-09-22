<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<aside id="left-panel" class="left-panel">
	<nav class="navbar navbar-expand-sm navbar-default">
		<div id="main-menu" class="main-menu collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="dashboard.jsp"><i
						class="menu-icon fa fa-laptop"></i>Dashboard </a></li>


				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Vehicle
						Category
				</a>
					<ul class="sub-menu children dropdown-menu">
						<li><i class="fa fa-table"></i><a href="add-category.jsp">Add
								Category</a></li>
						<li><i class="fa fa-table"></i><a href="manage-category.jsp">Manage
								Category</a></li>
					</ul></li>
				<li><a href="add-vehicle.jsp"> <i
						class="menu-icon ti-email"></i>Add Vehicle
				</a></li>
				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Manage
						Vehicle
				</a>
					<ul class="sub-menu children dropdown-menu">
						<li><i class="menu-icon fa fa-th"></i><a
							href="manage-incomingvehicle.jsp">Manage In Vehicle</a></li>
						<li><i class="menu-icon fa fa-th"></i><a
							href="manage-outgoingvehicle.jsp">Manage Out Vehicle</a></li>

					</ul></li>
				<li class="menu-item-has-children dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Reports
				</a>
					<ul class="sub-menu children dropdown-menu">
						<li><i class="menu-icon fa fa-th"></i><a
							href="bwdates-report-ds.jsp">Between Dates Reports</a></li>

					</ul></li>
				<li><a href="search-vehicle.jsp"> <i
						class="menu-icon ti-search"></i>Search Vehicle
				</a></li>
				<li><a href="parking-seat.jsp"> <i
						class="menu-icon fa fa-car"></i>Parking Seats
				</a></li>
				<li><a href="user-membership.jsp"><i
						class="menu-icon fa fa-group"></i>Users Membership </a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
</aside>