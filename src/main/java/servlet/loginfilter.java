package servlet;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class loginfilter implements Filter {
	
	private Set<String> prefixIignores= new HashSet<String>();
	
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) arg0;
		HttpServletResponse resp = (HttpServletResponse) arg1;
		
		if(canIgnore(req)) {
			arg2.doFilter(req, resp);
			return;
		}
		
		if(req.getSession().getAttribute("operator")!=null||req.getRequestURI().equals("/Shop/login.jsp")||req.getRequestURI().equals("/Shop/login")) 
		{	
			arg2.doFilter(req, resp);
		
		} else {
			if (req.getRequestURI().equals("/Shop/")) {
					resp.sendRedirect("login.jsp");
			} else {
				System.out.println(req.getRequestURI());
				resp.sendRedirect("/Shop/login.jsp");
			}
		}
	
	}

	
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		String ex=arg0.getInitParameter("ex");
		String[] ignoreArray=ex.split(",");
		for(String s:ignoreArray) {
			prefixIignores.add(s);
		}
		
	}

	private boolean canIgnore(HttpServletRequest req) {
		String url = req.getRequestURI();
		for(String ignore:prefixIignores) {
			if(url.endsWith(ignore)) {
				return true;
			}
		}
		return false;
	}
	
	
}
