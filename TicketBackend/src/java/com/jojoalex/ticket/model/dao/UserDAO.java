/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jojoalex.ticket.model.dao;

import com.jojoalex.ticket.controller.utils.EncryptionException;
import com.jojoalex.ticket.controller.utils.EncryptionUtils;
import com.jojoalex.ticket.model.entities.Ticket;
import com.jojoalex.ticket.model.entities.User;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class UserDAO implements Serializable {

    private final SessionFactory sessionFactory;

    public UserDAO() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }

    public User getUserByUserNameAndPassword(String userName, String password) throws EncryptionException {
        Session session = sessionFactory.openSession();

        String encryptPassword = (new EncryptionUtils()).encrypt(password);

        User aUser = (User) session.getNamedQuery("findUserByUserNameAndPassword")
                .setString("userName", userName)
                .setString("password", encryptPassword)
                .uniqueResult();
        session.close();
        return aUser;
    }

    /*public void saveUser(User user) {
        Session session = sessionFactory.openSession();
        session.merge(user);
        session.flush();
        session.close();
    }*/
    
    public void createUser(User b) {
        Session session = sessionFactory.openSession();
        session.persist(b);
        session.flush();
        session.close();
    }

    public User getUserById(Integer id) {
        Session session = sessionFactory.openSession();
        User foundUser = (User) session.createQuery("from User where id=" + id).uniqueResult();

        session.close();
        return foundUser;
    }
    
    public ArrayList<User> getUsers() {
        Session session = sessionFactory.openSession();
        ArrayList<User> ls = (ArrayList<User>)session.createQuery("from User")
                .list();
        session.close();
        return ls;
    }

}
