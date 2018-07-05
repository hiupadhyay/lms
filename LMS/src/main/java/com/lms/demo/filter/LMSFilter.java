package com.lms.demo.filter;

import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.springframework.stereotype.Component;

/**
 * Servlet Filter implementation class LMSFilter
 */
@Component
public class LMSFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LMSFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("MyFilter doFilter() is invoked.");
    Enumeration<String> params = request.getParameterNames();
    System.out.println(params);
    while (params.hasMoreElements()) {
      String param=params.nextElement();
      System.out.println("Parameter:"+param+"\tValue:"+request.getParameter(param));
    }
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
