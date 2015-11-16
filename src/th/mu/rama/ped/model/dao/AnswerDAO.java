/**
 * 
 */
package th.mu.rama.ped.model.dao;

import java.util.Date;
import java.util.List;

import th.mu.rama.ped.model.entity.Answer;

/**
 * @author Sirimongkol
 *
 */
public interface AnswerDAO extends GenericDAO<Answer> {
	List<Answer> findByMrnAndWorkgroup(String mrn, String workgroup);
	List<Answer> findByAnswerVar(String answerVar);
	List<Answer> findBetweenDate(Date startDate, Date endDate);
}
