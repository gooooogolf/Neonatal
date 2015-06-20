/**
 * 
 */
package th.mu.rama.ped.model.dao;

import th.mu.rama.ped.model.entity.User;

/**
 * @author Sirimongkol
 *
 */
public interface UserDAO extends GenericDAO<User>{
	public User get(String username);
}
