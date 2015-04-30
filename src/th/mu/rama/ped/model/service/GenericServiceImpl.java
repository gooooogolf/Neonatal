/**
 * 
 */
package th.mu.rama.ped.model.service;

import java.util.List;

import th.mu.rama.ped.model.dao.GenericDAO;

/**
 * @author Sirimongkol
 *
 */
public class GenericServiceImpl<Clazz> implements GenericService<Clazz> {

    private GenericDAO<Clazz> genericDAO;
	
	public GenericServiceImpl(GenericDAO<Clazz> genericDAO) {
		this.genericDAO = genericDAO;
	}

	@Override
	public Clazz find(Integer id) {
		// TODO Auto-generated method stub
		return genericDAO.find(id);
	}

	@Override
	public void save(Clazz clazz) {
		// TODO Auto-generated method stub
		genericDAO.save(clazz);
	}

	@Override
	public void update(Clazz clazz) {
		// TODO Auto-generated method stub
		genericDAO.update(clazz);
	}

	@Override
	public void saveOrUpdate(Clazz clazz) {
		// TODO Auto-generated method stub
		genericDAO.saveOrUpdate(clazz);
	}

	@Override
	public List<Clazz> findAll() {
		// TODO Auto-generated method stub
		return genericDAO.findAll();
	}

	@Override
	public Integer countAll() {
		// TODO Auto-generated method stub
		return genericDAO.countAll();
	}

	@Override
	public void delete(Clazz clazz) {
		// TODO Auto-generated method stub
		genericDAO.delete(clazz);
	}

}
