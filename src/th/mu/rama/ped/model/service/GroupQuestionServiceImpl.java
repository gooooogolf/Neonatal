/**
 * 
 */
package th.mu.rama.ped.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import th.mu.rama.ped.model.dao.GroupQuestionDAO;
import th.mu.rama.ped.model.entity.GroupQuestion;

/**
 * @author Sirimongkol
 *
 */
@Service("groupQuestionService")
@Transactional
public class GroupQuestionServiceImpl extends GenericServiceImpl<GroupQuestion>
		implements GroupQuestionService {
	@Autowired
	public GroupQuestionServiceImpl(GroupQuestionDAO genericDAO) {
		super(genericDAO);
	}

}
