package th.mu.rama.ped.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

/**
 * @author Sirimongkol
 *
 */
@Component("customAuthenticationFailureHandler")
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request,
		HttpServletResponse response, AuthenticationException exception)
		throws IOException, ServletException {

//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("error", true);
//		map.put("message", exception.getMessage());
//
		request.getSession().setAttribute("error", true);
		request.getSession().setAttribute("message", exception.getMessage());
		response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);  
		response.sendRedirect("login-error");  

	}

}