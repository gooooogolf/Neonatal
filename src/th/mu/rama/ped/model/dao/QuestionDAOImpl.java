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

	@Override
	public Integer countByWorkgroup(String workgroup) {
		String hql = "from Question q where q.workgroup = '" + workgroup + "' and q.status = 'active'";
		return sessionFactory.getCurrentSession().createQuery(hql).list().size();
	}

	
}
