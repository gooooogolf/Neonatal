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
@XmlRootElement(name = "demo_long")
@XmlAccessorType(XmlAccessType.FIELD)
public class PatientDetail implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3629376887369092408L;

	@XmlElement(name="initial_name")
	private String initialName;
	
	@XmlElement(name="first_name")
	private String firstName;
	
	@XmlElement(name="last_name")
	private String lastName;	
	
	@XmlElement(name="initial_name_eng")
	private String initialNameEng;
	
	@XmlElement(name="first_name_eng")
	private String firstNameEng;
		
	@XmlElement(name="last_name_eng")
	private String lastNameEng;
	
	@XmlElement(name="middle_name_eng")
	private String middleNameEng;
	
	@XmlElement(name="id_card_no")
	private String idCardNo;
	
	@XmlElement(name="nationality_code")
	private String nationalityCode;
	
	@XmlElement(name="nationality_detail")
	private String nationalityDetail;
	
	@XmlElement(name="dob")
	private String dob;
	
	@XmlElement(name="gender")
	private String gender;
	
	@XmlElement(name="address")
	private String address;
	
	@XmlElement(name="amphur")
	private String amphur;
	
	@XmlElement(name="province")
	private String province;
	
	@XmlElement(name="zipcode")
	private String zipcode;
	
	@XmlElement(name="home_tel")
	private String homeTel;
	
	@XmlElement(name="office_tel")
	private String officeTel;
	
	@XmlElement(name="mobile_no")
	private String mobileNo;
	
	@XmlElement(name="email")
	private String email;
	
	@XmlElement(name="emergency_contact")
	private String emergencyContact;
	
	@XmlElement(name="maritalstatus")
	private String maritalStatus;
	
	@XmlElement(name="nonresidence")
	private String nonresidence;
	
	@XmlElement(name="effectivestartdate")
	private String effectiveStartDate;
	
	@XmlElement(name="effectiveenddate")
	private String effectiveEndDate;

	public PatientDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PatientDetail(String initialName, String firstName, String lastName,
			String initialNameEng, String firstNameEng, String lastNameEng,
			String middleNameEng, String idCardNo, String nationalityCode,
			String nationalityDetail, String dob, String gender,
			String address, String amphur, String province, String zipcode,
			String homeTel, String officeTel, String mobileNo, String email,
			String emergencyContact, String maritalStatus, String nonresidence,
			String effectiveStartDate, String effectiveEndDate) {
		super();
		this.initialName = initialName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.initialNameEng = initialNameEng;
		this.firstNameEng = firstNameEng;
		this.lastNameEng = lastNameEng;
		this.middleNameEng = middleNameEng;
		this.idCardNo = idCardNo;
		this.nationalityCode = nationalityCode;
		this.nationalityDetail = nationalityDetail;
		this.dob = dob;
		this.gender = gender;
		this.address = address;
		this.amphur = amphur;
		this.province = province;
		this.zipcode = zipcode;
		this.homeTel = homeTel;
		this.officeTel = officeTel;
		this.mobileNo = mobileNo;
		this.email = email;
		this.emergencyContact = emergencyContact;
		this.maritalStatus = maritalStatus;
		this.nonresidence = nonresidence;
		this.effectiveStartDate = effectiveStartDate;
		this.effectiveEndDate = effectiveEndDate;
	}

	@Override
	public String toString() {
		return "PatientDetail [initialName=" + initialName + ", firstName="
				+ firstName + ", lastName=" + lastName + ", initialNameEng="
				+ initialNameEng + ", firstNameEng=" + firstNameEng
				+ ", lastNameEng=" + lastNameEng + ", middleNameEng="
				+ middleNameEng + ", idCardNo=" + idCardNo
				+ ", nationalityCode=" + nationalityCode
				+ ", nationalityDetail=" + nationalityDetail + ", dob=" + dob
				+ ", gender=" + gender + ", address=" + address + ", amphur="
				+ amphur + ", province=" + province + ", zipcode=" + zipcode
				+ ", homeTel=" + homeTel + ", officeTel=" + officeTel
				+ ", mobileNo=" + mobileNo + ", email=" + email
				+ ", emergencyContact=" + emergencyContact + ", maritalStatus="
				+ maritalStatus + ", nonresidence=" + nonresidence
				+ ", effectiveStartDate=" + effectiveStartDate
				+ ", effectiveEndDate=" + effectiveEndDate + "]";
	}

	public String getInitialName() {
		return initialName;
	}

	public void setInitialName(String initialName) {
		this.initialName = initialName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getInitialNameEng() {
		return initialNameEng;
	}

	public void setInitialNameEng(String initialNameEng) {
		this.initialNameEng = initialNameEng;
	}

	public String getFirstNameEng() {
		return firstNameEng;
	}

	public void setFirstNameEng(String firstNameEng) {
		this.firstNameEng = firstNameEng;
	}

	public String getLastNameEng() {
		return lastNameEng;
	}

	public void setLastNameEng(String lastNameEng) {
		this.lastNameEng = lastNameEng;
	}

	public String getMiddleNameEng() {
		return middleNameEng;
	}

	public void setMiddleNameEng(String middleNameEng) {
		this.middleNameEng = middleNameEng;
	}

	public String getIdCardNo() {
		return idCardNo;
	}

	public void setIdCardNo(String idCardNo) {
		this.idCardNo = idCardNo;
	}

	public String getNationalityCode() {
		return nationalityCode;
	}

	public void setNationalityCode(String nationalityCode) {
		this.nationalityCode = nationalityCode;
	}

	public String getNationalityDetail() {
		return nationalityDetail;
	}

	public void setNationalityDetail(String nationalityDetail) {
		this.nationalityDetail = nationalityDetail;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAmphur() {
		return amphur;
	}

	public void setAmphur(String amphur) {
		this.amphur = amphur;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getHomeTel() {
		return homeTel;
	}

	public void setHomeTel(String homeTel) {
		this.homeTel = homeTel;
	}

	public String getOfficeTel() {
		return officeTel;
	}

	public void setOfficeTel(String officeTel) {
		this.officeTel = officeTel;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmergencyContact() {
		return emergencyContact;
	}

	public void setEmergencyContact(String emergencyContact) {
		this.emergencyContact = emergencyContact;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getNonresidence() {
		return nonresidence;
	}

	public void setNonresidence(String nonresidence) {
		this.nonresidence = nonresidence;
	}

	public String getEffectiveStartDate() {
		return effectiveStartDate;
	}

	public void setEffectiveStartDate(String effectiveStartDate) {
		this.effectiveStartDate = effectiveStartDate;
	}

	public String getEffectiveEndDate() {
		return effectiveEndDate;
	}

	public void setEffectiveEndDate(String effectiveEndDate) {
		this.effectiveEndDate = effectiveEndDate;
	}
	

	
}
