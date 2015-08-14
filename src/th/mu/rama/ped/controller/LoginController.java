/**
 * 
 */
package th.mu.rama.ped.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import th.mu.rama.ped.config.Configuration;
import th.mu.rama.ped.model.service.UserService;

/**
 * @author Sirimongkol
 *
 */
@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm(Model model) {
		model.addAttribute("version", Configuration.VERSION);
		 return "login";
	}
	
	@RequestMapping(value="/login-error", method=RequestMethod.GET)
	public String invalidLogin(Model model, HttpServletRequest request) {
		model.addAttribute("error", request.getSession().getAttribute("error"));
		model.addAttribute("message", request.getSession().getAttribute("message"));
		model.addAttribute("version", Configuration.VERSION);
		return "login";
	}
	
	@RequestMapping(value="/403", method=RequestMethod.GET)
	public String accessdenied(Principal user, Model model) {
		model.addAttribute("version", Configuration.VERSION);
		if (user != null) {
			model.addAttribute("msg", "ขออภัย...คุณ" + user.getName() 
			+ ", คุณไม่ได้รับสิทธิ์เข้าใช้งานหน้านี้!");
		} else {
			model.addAttribute("msg", "คุณไม่ได้รับสิทธิ์เข้าใช้งานหน้านี้!");
		}
		
		return "403";
	}
	
	@RequestMapping(value="/login-success", method=RequestMethod.GET)
	public String successLogin(HttpServletRequest request) {
//		 String username = request.getUserPrincipal().getName();
//		 User user = userService.get(username);
//		 request.getSession().setAttribute("username", user.getDescription());
		
		 return "redirect:/index";
	}
}
