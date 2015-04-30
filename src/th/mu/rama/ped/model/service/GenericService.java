/**
 * 
 */
package th.mu.rama.ped.model.service;

import java.util.List;


/**
 * @author Sirimongkol
 *
 */
public interface GenericService<Clazz> {
	
	public Clazz find(Integer id);
	public void save (Clazz clazz);
	public void update (Clazz clazz);
	public void saveOrUpdate (Clazz clazz);
	public List<Clazz> findAll();
	public Integer countAll();
	public void delete(Clazz clazz);	
	
}
