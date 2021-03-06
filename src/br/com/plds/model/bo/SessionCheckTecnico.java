package br.com.plds.model.bo;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SessionCheckTecnico implements Filter {

	private String contextPath;
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain fc) throws IOException, ServletException {
		// TODO Auto-generated method stub
		  HttpServletRequest req = (HttpServletRequest) request;
		    HttpServletResponse res = (HttpServletResponse) response;  
		
		   
		    if (req.getSession().getAttribute("user") == null) {
		        res.sendRedirect(contextPath + "/index.jsp"); 
		    } else {
		      String userType = (String) req.getSession().getAttribute("role");		   
		      if (!userType.equals("tecnico")){ 
		        res.sendRedirect(contextPath + "/index.jsp");  
		      }
		      fc.doFilter(request, response);
		    }
		
	}

	@Override
	public void init(FilterConfig fc) throws ServletException {
		// TODO Auto-generated method stub
		contextPath = fc.getServletContext().getContextPath();
	}
	
	

}
