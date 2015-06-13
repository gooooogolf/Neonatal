/**
 * 
 */
package th.mu.rama.ped.model.service;

import th.mu.rama.ped.model.entity.User;

/**
 * @author Sirimongkol
 *
 */
public interface UserService extends GenericService<User> {
	public User get(String userId);
}
