/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jojoalex.ticket.model.dao;

import com.jojoalex.ticket.model.entities.Ticket;
import java.io.Serializable;
import java.util.ArrayList;
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

    public List<Ticket> findListOfTickets() {
        Session session = sessionFactory.openSession();
        List<Ticket> listOfTickets = session.getNamedQuery("findAllTickets")
                .list();
        session.close();
        return listOfTickets;
    }
    
    /*public void saveTicket(Ticket aTicket, boolean isNew) {
        Session session = sessionFactory.openSession();
        if (isNew) {
            aTicket.setClient((Store) session.load(Store.class, new Integer("1")));
            aTicket.setUser();
            aTicket.setTicketUpdates();
            aTicket.setStore((Store) session.load(Store.class, new Byte("1")));
            aTicket.setAddress((Address) session.load(Address.class, new Short("1")));
            aTicket.setCreateDate(new Date());
            session.persist(aTicket);
        } else {
            aTicket.setLastUpdate(new Date());
            session.merge(aTicket);

        }
        session.flush();
        session.close();
    }*/

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
