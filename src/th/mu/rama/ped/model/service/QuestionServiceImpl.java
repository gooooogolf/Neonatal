/**
 * 
 */
package th.mu.rama.ped.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.mu.rama.ped.model.dao.QuestionDAO;
import th.mu.rama.ped.model.entity.Question;

/**
 * @author Sirimongkol
 *
 */
@Service("questionService")
public class QuestionServiceImpl extends GenericServiceImpl<Question> implements
		QuestionService {

	@Autowired
	public QuestionServiceImpl(QuestionDAO genericDAO) {
		super(genericDAO);
	}

}
