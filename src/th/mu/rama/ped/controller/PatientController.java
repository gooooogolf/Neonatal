/**
 * 
 */
package th.mu.rama.ped.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import th.mu.rama.ped.model.service.PatientService;
import th.mu.rama.ped.model.wrapper.PatientDetail;

/**
 * @author 006223
 *
 */
@Controller
@RequestMapping("/patient")
public class PatientController {

	private static Logger log = Logger.getLogger(PatientController.class);
	
	@Autowired
	PatientService patientService;
	
	
	@RequestMapping(value = "/{mrn}", method = RequestMethod.GET)
	@ResponseBody
	public PatientDetail getPatientDetailByMrn(@PathVariable("mrn") String mrn) {
		return patientService.getPatientDetailByMrn(mrn);
	}
	
}
