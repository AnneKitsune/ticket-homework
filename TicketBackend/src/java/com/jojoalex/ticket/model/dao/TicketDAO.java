/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jojoalex.ticket.model.dao;

import com.jojoalex.ticket.model.entities.Ticket;
import com.jojoalex.ticket.model.entities.TicketUpdate;
import com.jojoalex.ticket.model.entities.User;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;


public class TicketDAO implements Serializable {

    private final SessionFactory sessionFactory;

    public TicketDAO() {
        sessionFactory = HibernateUtil.getSessionFactory();
    }

    public ArrayList<Ticket> findListOfTickets() {
        Session session = sessionFactory.openSession();
        ArrayList<Ticket> listOfTickets = (ArrayList<Ticket>)session.getNamedQuery("findAllTickets")
                .list();
        session.close();
        return listOfTickets;
    }
    
    public ArrayList<TicketUpdate> findListOfTicketUpdate() {
        Session session = sessionFactory.openSession();
        ArrayList<TicketUpdate> listOfTickets = (ArrayList<TicketUpdate>)session.getNamedQuery("findAllTicketUpdate")
                .list();
        session.close();
        return listOfTickets;
    }
    
    public void createTicket(Ticket t, int forUser,int openedBy) {
        Session session = sessionFactory.openSession();
        t.setUserByForUser((User)session.load(User.class,forUser));
        t.setCreatedAt(Date.from(Calendar.getInstance().toInstant()));
        t.setUserByOpenedBy((User)session.load(User.class,openedBy));
        session.beginTransaction();
        session.persist(t);
        session.getTransaction().commit();
        session.flush();
        session.close();
    }
    
    public void createTicketUpdate(TicketUpdate t, int ticketid) {
        Session session = sessionFactory.openSession();
        t.setTicket((Ticket)session.load(Ticket.class,ticketid));
        
        session.persist(t);
        session.flush();
        session.close();
    }
    
    public void updateTicket(Ticket t) {
        Session session = sessionFactory.openSession();
        session.merge(t);
        session.flush();
        session.close();
    }

    public Ticket getTicketByID(Short id) {
        Session session = sessionFactory.openSession();
        Ticket ticket = (Ticket) session.getNamedQuery("findTicketById")
                .setShort("id", id)
                .uniqueResult();
        session.close();
        return ticket;
    }

    public List<Ticket> findListOfTicketsWithFilters(String priority, boolean open) {
        Session session = sessionFactory.openSession();

        Criteria criteria = session.createCriteria(Ticket.class);
        
        if (!priority.isEmpty()) {
            Criterion cri = Restrictions.eq("priority", priority.toLowerCase());
            criteria.add(cri);
        }
        
        /*if (open) {
            // doesn't work
            Criterion cri = Restrictions./("open", open);
            criteria.add(cri);
        }*/

        criteria.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);
        List<Ticket> listOfTickets = criteria
                .list();
        session.close();
        return listOfTickets;
    }
}
