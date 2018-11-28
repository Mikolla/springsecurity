package ru.springmvchibernate.dao.abstraction.role;


import ru.springmvchibernate.dao.GenericDao;
import ru.springmvchibernate.model.Role;

/**
 * Created by Skrezhet on 09.04.2017.
 */
public interface RoleDao extends GenericDao<Long, Role> {
    Role getRoleByRoleName(String roleName);
}
