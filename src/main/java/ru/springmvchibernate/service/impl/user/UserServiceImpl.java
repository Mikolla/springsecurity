package ru.springmvchibernate.service.impl.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import ru.springmvchibernate.dao.abstraction.user.UserDao;
import ru.springmvchibernate.dao.impl.user.UserDaoImpl;
import ru.springmvchibernate.model.User;
import ru.springmvchibernate.service.abstraction.user.UserService;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;
   /* private String name;

    @Autowired
    public UserServiceImpl(@Value("userServiceImpl") String name) {
        this.name = name;
    }*/

    public UserServiceImpl() {
    }

    @Override
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public User getUserById(long id) {
       return userDao.getUserById(id);
    }

    @Override
    public void editUser(User user) {
        userDao.editUser(user);
    }
/*
    @Override
    public User getUserByLogin(String login) {
        return userDao.getUserByLogin(login);
    } */

    @Override
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }


    @Override
    public void deleteUser(long id) {
        userDao.deleteUser(id);
    }


}
