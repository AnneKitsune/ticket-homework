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

/**
 *
 * @author jojolepro
 */
public class TicketUpdateDTO {
    private Integer id;
    private Integer ticket;
    private String content;
    private Integer userId;
    private Date createdAt;
    public TicketUpdateDTO(TicketUpdate tu){
        id = tu.getId();
        ticket = tu.getTicket().getId();
        content = tu.getContent();
        userId = tu.getUser().getId();
        createdAt = tu.getCreatedAt();
    }
}
