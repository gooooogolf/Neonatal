/**
 * 
 */
package th.mu.rama.ped.model.entity;

import java.io.Serializable;
import java.util.List;

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
@Table(name="GROUP_QUESTION")
public class GroupQuestion implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3356490016915150608L;
	
	@Id
	@GeneratedValue
	@Column(name = "GROUP_ID")
	private int id;
	
	@Column(name = "GROUP_NAME")
	private String groupName;
	
	@Column(name = "GROUP_TITLE", columnDefinition = "TEXT")
	private String groupTitle;
	
	@Column(name = "GROUP_SEQ")
	private int sequence;
	
	@Column(name = "GROUP_STATUS")
	private String status;
	
	@ManyToMany
	@Column(name = "QUESTIONS") 
	private List<Question> questions;
	
	public GroupQuestion() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GroupQuestion(int id, String groupName, String groupTitle,
			int sequence, String status, List<Question> questions) {
		super();
		this.id = id;
		this.groupName = groupName;
		this.groupTitle = groupTitle;
		this.sequence = sequence;
		this.status = status;
		this.questions = questions;
	}
	@Override
	public String toString() {
		return "GroupLayout [id=" + id + ", groupName=" + groupName
				+ ", groupTitle=" + groupTitle + ", sequence=" + sequence
				+ ", status=" + status + ", questions=" + questions + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupTitle() {
		return groupTitle;
	}
	public void setGroupTitle(String groupTitle) {
		this.groupTitle = groupTitle;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
