/**
 * 
 */
package th.mu.rama.ped.model.dao;

import org.springframework.stereotype.Repository;

import th.mu.rama.ped.model.entity.Question;

/**
 * @author Sirimongkol
 *
 */
@Repository("questionDAO")
public class QuestionDAOImpl extends GenericDAOImpl<Question> implements
		QuestionDAO {

	
}
