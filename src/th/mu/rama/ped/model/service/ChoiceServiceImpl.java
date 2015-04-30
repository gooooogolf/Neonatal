/**
 * 
 */
package th.mu.rama.ped.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import th.mu.rama.ped.model.dao.ChoiceDAO;
import th.mu.rama.ped.model.entity.Choice;

/**
 * @author Sirimongkol
 *
 */
@Service("choiceService")
@Transactional
public class ChoiceServiceImpl extends GenericServiceImpl<Choice> implements
		ChoiceService {

	@Autowired
	public ChoiceServiceImpl(ChoiceDAO genericDAO) {
		super(genericDAO);
	}
}
