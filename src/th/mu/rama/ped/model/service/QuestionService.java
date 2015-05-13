/**
 * 
 */
package th.mu.rama.ped.model.service;

import th.mu.rama.ped.model.entity.Question;

/**
 * @author Sirimongkol
 *
 */
public interface QuestionService extends GenericService<Question> {
	Integer countByWorkgroup(String workgroup);
}
