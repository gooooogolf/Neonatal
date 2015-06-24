/**
 * 
 */
package th.mu.rama.ped.model.wrapper;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author 006223
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="VFPDataSet")
public class PatientDetailWrapper implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1893043757035212245L;
	
	@XmlElement(name="demo_long")
	private PatientDetail patientDetail;

	public PatientDetail getPatientDetail() {
		return patientDetail;
	}

	public void setPatientDetail(PatientDetail patientDetail) {
		this.patientDetail = patientDetail;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
