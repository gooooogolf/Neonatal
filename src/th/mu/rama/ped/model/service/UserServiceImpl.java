/**
 * 
 */
package th.mu.rama.ped.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.mu.rama.ped.model.dao.UserDAO;
import th.mu.rama.ped.model.entity.User;

/**
 * @author Sirimongkol
 *
 */
@Service("userService")
public class UserServiceImpl extends GenericServiceImpl<User> implements UserService {

	@Autowired
	public UserServiceImpl(UserDAO dao) {
		super(dao);
	}
	
	@Autowired
	UserDAO dao;

	@Override
	public User get(String userId) {
		// TODO Auto-generated method stub
		return dao.get(userId);
	}

	
}
