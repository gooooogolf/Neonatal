/**
 * 
 */
package th.mu.rama.ped.model.service;

import th.mu.rama.ped.model.wrapper.PatientDetail;

/**
 * @author 006223
 *
 */
public interface PatientService {
	public boolean isAuthenticate(String username, String password);
	public PatientDetail getPatientDetailByMrn(String mrn);
}
