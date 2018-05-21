/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jojoalex.ticket.bean;

import com.jojoalex.ticket.model.dao.TicketDAO;
import com.jojoalex.ticket.model.entities.Ticket;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;

/**
 *
 * @author Alexis Diamond <alexisdiamond@hotmail.ca>
 */
@ManagedBean(name = "ticketView")
@SessionScoped
public class TicketView implements Serializable {

    private List<Ticket> tickets;
    
    private TicketDAO ticketDAO;
    /**
     * Creates a new instance of TicketView
     */
    public TicketView() {}
    
    @PostConstruct
    public void init() {
        ticketDAO = new TicketDAO();
        tickets = ticketDAO.findListOfTickets();
    }
    
    public void viewDetails(Ticket ticket, int row) {
        
    }
    
    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }
    
    public List<Ticket> getTickets() {
        return tickets;
    }
}
