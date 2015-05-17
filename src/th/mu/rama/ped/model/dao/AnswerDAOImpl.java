package th.mu.rama.ped.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import th.mu.rama.ped.model.entity.Answer;

@Repository("answerDAO")
public class AnswerDAOImpl extends GenericDAOImpl<Answer> implements AnswerDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Answer> findByMrnAndWorkgroup(String mrn, String workgroup) {
		String hql = "from Answer a where a.mrn = '" + mrn + "' and a.workgroup = '" + workgroup + "'";
		return sessionFactory.getCurrentSession().createQuery(hql).list();
	}

}
