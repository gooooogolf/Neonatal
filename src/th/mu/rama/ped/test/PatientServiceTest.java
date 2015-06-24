/**
 * 
 */
package th.mu.rama.ped.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import th.mu.rama.ped.model.service.PatientService;

/**
 * @author 006223
 *
 */
public class PatientServiceTest {

	private static ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	private static PatientService patientService = (PatientService) ctx.getBean("patientService");
	
	public static void main(String[] args) {
		System.out.println(patientService.getPatientDetailByMrn("4224722"));

	}

}
