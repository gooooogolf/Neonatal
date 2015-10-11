/**
 * 
 */
package th.mu.rama.ped.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import th.mu.rama.ped.util.DateTime;

/**
 * @author Sirimongkol
 *
 */
@Controller
@RequestMapping("/report")
public class ReportController {
	
	@RequestMapping(method = RequestMethod.GET)
    public String getReportPage(Model model, HttpServletRequest request) {
		model.addAttribute("startDate", "01/01/" + DateTime.yyyy());
		model.addAttribute("endDate", "31/12/" + DateTime.yyyy());
		return "reports";
	}
	
}
