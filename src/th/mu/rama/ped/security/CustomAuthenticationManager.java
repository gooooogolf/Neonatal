package th.mu.rama.ped.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import th.mu.rama.ped.model.entity.User;
import th.mu.rama.ped.model.service.UserService;
/**
 * @author Sirimongkol
 *
 */
@Component("customAuthenticationManager")
public class CustomAuthenticationManager implements AuthenticationManager{
	
	protected static Logger logger = Logger.getLogger(CustomAuthenticationManager.class);

	@Autowired
	private UserService userService;	

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
				User user = userService.get(username);
				if (user != null) {
					if (auth.getCredentials().equals("1111")) {
						return new UsernamePasswordAuthenticationToken(auth.getName(), auth.getCredentials(), getAuthorities(user.getRoleId()));
					}
					else {
						throw new BadCredentialsException("Password ไม่ถูกต้อง กรุณาตรวจสอบ");
					}
				} else {
					throw new BadCredentialsException("รหัสบุคคล " + username + " ไม่ได้รับสิทธิ์ในการใช้งาน, กรุณาตรวจสอบ");
				}

				
			} catch (Exception e) {
				throw new BadCredentialsException(e.getMessage());
			}
		}
	}

	public Collection<? extends GrantedAuthority> getAuthorities(Integer role) {
		List<GrantedAuthority> authList = getGrantedAuthorities(getRoles(role));
		return authList;
	}
	
	public List<String> getRoles(Integer role) {

		List<String> roles = new ArrayList<String>();

		if (role.intValue() == 1) {
			roles.add("ROLE_USER");
			roles.add("ROLE_ADMIN");
		} else if (role.intValue() == 2) {
			roles.add("ROLE_USER");
		}
		return roles;
	}
	
	public static List<GrantedAuthority> getGrantedAuthorities(List<String> roles) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		for (String role : roles) {
			authorities.add(new SimpleGrantedAuthority(role));
		}
		return authorities;
	}
}
