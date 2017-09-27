package com.xwj;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.service.BusinessService;

/**
 * Servlet implementation class AddDeptServlet
 */
@WebServlet("/AddDept")
public class AddDeptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BusinessService businessService;

	public AddDeptServlet() {
		super();
		businessService = new BusinessService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String deptName = request.getParameter("dept_name");
		System.out.println(deptName);
		int res = businessService.addDept(deptName);
		System.out.println(res);
		if (res > 0) {
			response.sendRedirect(request.getContextPath() + "/DeptManagement");
		}

	}

}
