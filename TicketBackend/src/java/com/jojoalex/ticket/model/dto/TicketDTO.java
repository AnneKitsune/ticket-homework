/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jojoalex.ticket.model.dto;

import com.jojoalex.ticket.model.entities.Ticket;
import com.jojoalex.ticket.model.entities.TicketUpdate;
import com.jojoalex.ticket.model.entities.User;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author jojolepro
 */
public class TicketDTO {
    private Integer id;
    private Integer userFor;
    private Integer userClosedBy;
    private Integer userOpenedBy;
    private String title;
    private String content;
    private Date createdAt;
    private Date closedAt;
    private String priority;
    private Set<Integer> ticketUpdates = new HashSet<>(0);
    
    public TicketDTO(Ticket ticket){
        id = ticket.getId();
        userFor = ticket.getUserByForUser().getId();
        if(ticket.getUserByClosedBy() != null)
            userClosedBy = ticket.getUserByClosedBy().getId();
        if(ticket.getUserByOpenedBy() != null)
            userOpenedBy = ticket.getUserByOpenedBy().getId();
        title = ticket.getTitle();
        content = ticket.getContent();
        createdAt = ticket.getCreatedAt();
        closedAt = ticket.getClosedAt();
        priority = ticket.getPriority();
        for(TicketUpdate t : ticket.getTicketUpdates()){
            ticketUpdates.add(t.getId());
        }
    }
}
