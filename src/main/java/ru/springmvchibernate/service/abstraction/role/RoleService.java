package ru.springmvchibernate.service.abstraction.role;


import ru.springmvchibernate.model.Role;

import java.util.List;

/**
 * Created by Skrezhet on 09.04.2017.
 */
public interface RoleService {
    Role getById(Long id);

    Role getByRoleName(String roleName);

    void addUser(Role role);

    void editUser(Role role);

    void deleteRole(Long id);

    List<Role> getAllRoles();
}
