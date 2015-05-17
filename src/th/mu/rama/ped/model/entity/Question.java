/**
 * 
 */
package th.mu.rama.ped.model.entity;

import java.io.Serializable;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * @author Sirimongkol
 *
 */
@Entity
@Table(name="QUESTION")
public class Question implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 205304943513656422L;
	
	@Id
	@GeneratedValue
	@Column(name = "QUESTION_ID")
	private int id;
	
	@Column(name = "WORKGROUP")
	private String workgroup;
	
	@Column(name = "QUESTION_NUMBER")
	private int questionNumber;
	
	@Column(name = "QUESTION_TITLE", columnDefinition = "TEXT")
	private String questionTitle;
	
	@Column(name = "HELPTEXT", columnDefinition = "TEXT")
	private String helpText;
	
	@Column(name = "QUESTION_TYPE")
	private String questionType;
	
	@Column(name = "QUESTION_STATUS")
	private String status;
	
	@Column(name = "QUESTION_EFFECTIVE_DATE")
	private Date effectiveDate;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@Column(name = "CHOICES") 
	private List<Choice> choices;

	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Question(int id, String workgroup, int questionNumber,
			String questionTitle, String helpText, String questionType,
			String status, Date effectiveDate, List<Choice> choices) {
		super();
		this.id = id;
		this.workgroup = workgroup;
		this.questionNumber = questionNumber;
		this.questionTitle = questionTitle;
		this.helpText = helpText;
		this.questionType = questionType;
		this.status = status;
		this.effectiveDate = effectiveDate;
		this.choices = choices;
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", workgroup=" + workgroup
				+ ", questionNumber=" + questionNumber + ", questionTitle="
				+ questionTitle + ", helpText=" + helpText + ", questionType="
				+ questionType + ", status=" + status + ", effectiveDate="
				+ effectiveDate + ", choices=" + choices + "]";
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

	public int getQuestionNumber() {
		return questionNumber;
	}

	public void setQuestionNumber(int questionNumber) {
		this.questionNumber = questionNumber;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getHelpText() {
		return helpText;
	}

	public void setHelpText(String helpText) {
		this.helpText = helpText;
	}

	public String getQuestionType() {
		return questionType;
	}

	public void setQuestionType(String questionType) {
		this.questionType = questionType;
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

	public List<Choice> getChoices() {
		
		Collections.sort(choices, new Comparator<Choice>() {
		    public int compare(Choice c1, Choice c2) {
		    	return c1.getChoiceNumber() - c2.getChoiceNumber();
		    }
		});
		
		return choices;
	}

	public void setChoices(List<Choice> choices) {
		this.choices = choices;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	
	
	
}
