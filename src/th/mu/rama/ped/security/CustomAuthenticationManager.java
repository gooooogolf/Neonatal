package th.mu.rama.ped.security;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.stereotype.Component;
/**
 * @author Sirimongkol
 *
 */
@SuppressWarnings("deprecation")
@Component("customAuthenticationManager")
public class CustomAuthenticationManager implements AuthenticationManager{
	
	protected static Logger logger = Logger.getLogger(CustomAuthenticationManager.class);


	@Override
	public Authentication authenticate(Authentication auth)
			throws AuthenticationException {
		logger.debug("Performing custom authentication");
		String username = auth.getName();
		String password = (String) auth.getCredentials();
		if (username.isEmpty()) {
			logger.debug("username invalid!");
			throw new BadCredentialsException("กรุณากรอก User Id");
		}
		else if (password.isEmpty()) {
			logger.debug("password invalid!");
			throw new BadCredentialsException("กรุณากรอก Password");
		}
		else {
			try {
				if (auth.getCredentials().equals("1111")) {
					List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
					authorities.add(new GrantedAuthorityImpl("USER"));
					return new UsernamePasswordAuthenticationToken(auth.getName(), auth.getCredentials(), authorities);
				}
				else {
					throw new BadCredentialsException("Password ไม่ถูกต้อง กรุณาตรวจสอบ");
				}
				
			} catch (Exception e) {
				throw new BadCredentialsException(e.getMessage());
			}
		}
	}

	public static boolean isInteger(String s) {
	    try { 
	        Integer.parseInt(s); 
	    } catch(NumberFormatException e) { 
	        return false; 
	    }
	    return true;
	}
}
