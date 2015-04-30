/**
 * 
 */
package th.mu.rama.ped.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Sirimongkol
 *
 */
@Controller
public class HomeController {

	@RequestMapping(value={"/", "/index"}, method = RequestMethod.GET)
    public String home() {
        return "index";
    }
    
}
