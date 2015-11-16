package th.mu.rama.ped.model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Answer> findByAnswerVar(String answerVar) {
		String hql = "from Answer a where a.answerVar = '" + answerVar + "'";
		return sessionFactory.getCurrentSession().createQuery(hql).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Answer> findBetweenDate(Date startDate, Date endDate) {
		String hql = "from Answer a where a.effectiveDate  between :startDate AND :endDate";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		return query.list();
	}

}
