package com.xwj.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xwj.entity.User;

/**
 * Servlet Filter implementation class IndexFilter
 */
@WebFilter(urlPatterns = { "/Index", "/UserInfo", "/IssueDetail", "/NewIssue", "/DeptManagement", "/Register","/AddDept"
		,"/DeleteIssue","/Logout","/TrashBin","/UserManagement"})
public class IndexFilter implements Filter {

	public IndexFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest hsr = (HttpServletRequest) request;
		HttpServletResponse hsp = (HttpServletResponse) response;
		User user = (User) hsr.getSession().getAttribute("user_session");
		if (user == null) {
			hsp.sendRedirect(request.getServletContext().getContextPath() + "/Login");
			return;
		} else {
			chain.doFilter(request, response);
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {

	}

}
