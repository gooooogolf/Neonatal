/**
 * 
 */
package th.mu.rama.ped.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.mu.rama.ped.model.dao.AnswerDAO;
import th.mu.rama.ped.model.entity.Answer;

/**
 * @author Sirimongkol
 *
 */
@Service("answerService")
public class AnswerServiceImpl extends GenericServiceImpl<Answer> implements AnswerService {

	@Autowired
	public AnswerServiceImpl(AnswerDAO genericDAO) {
		super(genericDAO);
	}
	
	@Autowired
	private AnswerDAO answerDAO;

	public List<Answer> findByMrnAndWorkgroup(String mrn, String workgroup) {
		return answerDAO.findByMrnAndWorkgroup(mrn, workgroup);
	}
}
