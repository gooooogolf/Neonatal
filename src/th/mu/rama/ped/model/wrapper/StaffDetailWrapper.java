package th.mu.rama.ped.model.wrapper;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="VFPDataSet")
public class StaffDetailWrapper implements Serializable {

	private static final long serialVersionUID = -4732092114966253147L;
	@XmlElement(name="staff_detail")
	private StaffDetail staffDetail;
	
	public StaffDetail getStaffDetail() {
		return staffDetail;
	}
	public void setStaffDetail(StaffDetail staffDetail) {
		this.staffDetail = staffDetail;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	


}
