/**
 * 
 */
package th.mu.rama.ped.model.wrapper;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author 006223
 *
 */
@XmlRootElement(name = "staff_detail")
@XmlAccessorType(XmlAccessType.FIELD)
public class StaffDetail implements Serializable{
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 8486533860838879022L;
	private String name;
	private String role;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public StaffDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StaffDetail(String name, String role) {
		super();
		this.name = name;
		this.role = role;
	}
	@Override
	public String toString() {
		return "StaffDetail [name=" + name + ", role=" + role + "]";
	}
	
}
