package com.vehicle;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.admin.*;
import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AddCategory
 */
@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String catename = request.getParameter("catename");
		try {
			HttpSession hs=request.getSession();
			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			int addCategory = statement.executeUpdate("insert into tblcategory(vehiclecat)values('" + catename + "')");
			if (addCategory > 0) {
				String message = "Category added sucessfully";
				hs.setAttribute("message", message);
				response.sendRedirect("add-category.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
