package DBUtils.servlet.filter;
 
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
 
@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {
 
    private Logger logger = Logger.getLogger(AuthenticationFilter.class);
     
    public void init(FilterConfig fConfig) throws ServletException {
        logger.info("AuthenticationFilter initialized");
    }
     
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        String uri = req.getRequestURI();
        logger.info("Requested Resource::"+uri);
        HttpSession session = req.getSession(true);
        if(session == null){
            req.getRequestDispatcher("/login.html").forward(request, response);
        }else{
            chain.doFilter(request, response);
        }
    }
 
    public void destroy() {
        //close any resources here
    }
 
}