/**
 * 
 */
package th.mu.rama.ped.model.service;

import java.util.List;

import th.mu.rama.ped.model.entity.Answer;

/**
 * @author Sirimongkol
 *
 */
public interface AnswerService extends GenericService<Answer> {
	List<Answer> findByMrnAndWorkgroup(String mrn, String workgroup);
}
