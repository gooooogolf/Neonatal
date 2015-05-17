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
@Table(name="CHOICE")
public class Choice implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1263273203812079202L;
	
	@Id
	@GeneratedValue
	@Column(name = "CHOICE_ID")
	private int id;
	
	@Column(name = "CHOICE_NUMBER")
	private int choiceNumber;
	
	@Column(name = "CHOICE_TITLE", columnDefinition = "TEXT")
	private String choiceTitle;
	
	@Column(name = "IS_CHOICE_TEXT")
	private boolean isChoiceText;
	
	@Column(name = "CHOICE_VAR")
	private String choiceVar;
	
	@Column(name = "CHOICE_STATUS")
	private String status;
	
	@Column(name = "CHOICE_EFFECTIVE_DATE")
	private Date effectiveDate;

	public Choice() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Choice(int id, int choiceNumber, String choiceTitle,
			boolean isChoiceText, String choiceVar, String status,
			Date effectiveDate) {
		super();
		this.id = id;
		this.choiceNumber = choiceNumber;
		this.choiceTitle = choiceTitle;
		this.isChoiceText = isChoiceText;
		this.choiceVar = choiceVar;
		this.status = status;
		this.effectiveDate = effectiveDate;
	}

	@Override
	public String toString() {
		return "Choice [id=" + id + ", choiceNumber=" + choiceNumber
				+ ", choiceTitle=" + choiceTitle + ", isChoiceText="
				+ isChoiceText + ", choiceVar=" + choiceVar + ", status="
				+ status + ", effectiveDate=" + effectiveDate + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getChoiceNumber() {
		return choiceNumber;
	}

	public void setChoiceNumber(int choiceNumber) {
		this.choiceNumber = choiceNumber;
	}

	public String getChoiceTitle() {
		return choiceTitle;
	}

	public void setChoiceTitle(String choiceTitle) {
		this.choiceTitle = choiceTitle;
	}

	public boolean isChoiceText() {
		return isChoiceText;
	}

	public void setChoiceText(boolean isChoiceText) {
		this.isChoiceText = isChoiceText;
	}

	public String getChoiceVar() {
		return choiceVar;
	}

	public void setChoiceVar(String choiceVar) {
		this.choiceVar = choiceVar;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
