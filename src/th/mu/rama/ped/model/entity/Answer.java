/**
 * 
 */
package th.mu.rama.ped.model.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Sirimongkol
 *
 */
@Entity
@Table(name="ANSWER")
public class Answer implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7836112458487109272L;
	
	@Id
	@GeneratedValue
	@Column(name = "ANS_ID")
	private int id;
	
	@Column(name = "WORKGROUP")
	private String workgroup;
	
	@Column(name = "MRN")
	private String mrn;
	
	@Column(name = "QUESTION_ID")
	private int questionId;
	
	@Column(name = "QUESTION_TYPE")
	private String questionType;
	
	@Column(name = "CHOICE_ID")
	private int choiceId;
	
	@Column(name = "ANS_TEXT", columnDefinition = "TEXT")
	private String answerText;
	
	@Column(name = "ANS_VAR")
	private String answerVar;
	
	@Column(name = "ANS_STATUS")
	private String status;
	
	@Column(name = "ANS_EFFECTIVE_DATE")
	private Date effectiveDate;

	@Column(name = "STAFF_ID")
	private String staffId;

	public Answer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Answer(int id, String workgroup, String mrn, int questionId,
			String questionType, int choiceId, String answerText,
			String answerVar, String status, Date effectiveDate, String staffId) {
		super();
		this.id = id;
		this.workgroup = workgroup;
		this.mrn = mrn;
		this.questionId = questionId;
		this.questionType = questionType;
		this.choiceId = choiceId;
		this.answerText = answerText;
		this.answerVar = answerVar;
		this.status = status;
		this.effectiveDate = effectiveDate;
		this.staffId = staffId;
	}

	@Override
	public String toString() {
		return "Answer [id=" + id + ", workgroup=" + workgroup + ", mrn=" + mrn
				+ ", questionId=" + questionId + ", questionType="
				+ questionType + ", choiceId=" + choiceId + ", answerText="
				+ answerText + ", answerVar=" + answerVar + ", status="
				+ status + ", effectiveDate=" + effectiveDate + ", staffId="
				+ staffId + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWorkgroup() {
		return workgroup;
	}

	public void setWorkgroup(String workgroup) {
		this.workgroup = workgroup;
	}

	public String getMrn() {
		return mrn;
	}

	public void setMrn(String mrn) {
		this.mrn = mrn;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}

	public int getChoiceId() {
		return choiceId;
	}

	public void setChoiceId(int choiceId) {
		this.choiceId = choiceId;
	}

	public String getAnswerText() {
		return answerText;
	}

	public void setAnswerText(String answerText) {
		this.answerText = answerText;
	}

	public String getAnswerVar() {
		return answerVar;
	}

	public void setAnswerVar(String answerVar) {
		this.answerVar = answerVar;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getEffectiveDate() {
		return effectiveDate;
	}

	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}

	public String getStaffId() {
		return staffId;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
