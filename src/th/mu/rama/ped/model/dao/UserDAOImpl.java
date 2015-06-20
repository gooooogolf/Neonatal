/**
 * 
 */
package th.mu.rama.ped.model.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import th.mu.rama.ped.model.entity.User;

/**
 * @author Sirimongkol
 *
 */
@Repository("userDAO")
public class UserDAOImpl extends GenericDAOImpl<User> implements UserDAO {

	@Override
	public User get(String username) {
        Query query = sessionFactory.getCurrentSession().createQuery(
                "from User u where u.username = :username");
        query.setParameter("username", username);
        if(query.list().isEmpty()) return null;
        return (User) query.list().get(0);
	}
	

}
