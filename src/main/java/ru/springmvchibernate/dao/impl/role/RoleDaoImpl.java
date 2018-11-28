package ru.springmvchibernate.dao.impl.role;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ru.springmvchibernate.dao.AbstractDao;
import ru.springmvchibernate.dao.abstraction.role.RoleDao;
import ru.springmvchibernate.model.Role;

/**
 * Created by Skrezhet on 09.04.2017.
 */
@Repository
@Transactional
public class RoleDaoImpl extends AbstractDao<Long, Role> implements RoleDao {
    @Override
    public Role getRoleByRoleName(String roleName) {
        return (Role) entityManager.createQuery("FROM Role WHERE Role_name=:roleName").setParameter("roleName", roleName).getSingleResult();
    }
}
