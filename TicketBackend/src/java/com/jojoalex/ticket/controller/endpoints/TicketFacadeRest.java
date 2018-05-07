/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jojoalex.ticket.controller.endpoints;

import com.jojoalex.ticket.controller.utils.RESTUtils;
import com.jojoalex.ticket.controller.utils.TokenStore;
import com.jojoalex.ticket.model.dao.TicketDAO;
import com.jojoalex.ticket.model.dto.TicketDTO;
import com.jojoalex.ticket.model.dto.TicketUpdateDTO;
import com.jojoalex.ticket.model.entities.Ticket;
import com.jojoalex.ticket.model.entities.TicketUpdate;
import com.jojoalex.ticket.model.entities.User;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Context;

/**
 *
 * @author jojolepro
 */
@Path("tickets")
public class TicketFacadeRest {

    private final TicketDAO ticketDAO;

    public TicketFacadeRest() {
        ticketDAO = new TicketDAO();

    }

    /*@GET
    public String findAll(@HeaderParam("token") String token) {
        if (TokenStore.validateToken(token)) {
            ArrayList<CustomerDTO> list = customerDAO.findListOfCustomersDTO();
            return RESTUtils.JSONFactory.toJson(list);
        } else {
            return "Invalid Token";
        }
    }*/
    @GET
    @Path("opened")
    public String ticketOpened(){
        ArrayList<Ticket> t = ticketDAO.findListOfTickets();
        ArrayList<TicketDTO> o = new ArrayList<>();
        for(Ticket ti : t){
            if(ti.getUserByClosedBy() == null){
                o.add(new TicketDTO(ti));
            }
        }
        
        return RESTUtils.JSONFactory.toJson(o);
    }
    
    @GET
    @Path("closed")
    public String ticketClosed(){
        ArrayList<Ticket> t = ticketDAO.findListOfTickets();
        ArrayList<TicketDTO> o = new ArrayList<>();
        for(Ticket ti : t){
            if(ti.getUserByClosedBy() != null){
                o.add(new TicketDTO(ti));
            }
        }
        
        return RESTUtils.JSONFactory.toJson(o);
    }
    
    @GET
    @Path("close/{id}")
    public void closeTicket(@PathParam("id") int id,@Context HttpServletRequest req){
        User u = TokenStore.userFromRequest(req);
        if(u == null || !u.isAdmin())
            return;
        
        Ticket t = ticketDAO.getTicketByID((short)id);
        if(t != null){
            t.setClosedAt(Date.from(Calendar.getInstance().toInstant()));
            t.setUserByClosedBy(u);
            ticketDAO.updateTicket(t);
        }
    }
    
    @GET
    @Path("user/{userid}")
    public String ticketForUser(@PathParam("userid") int userid){
        ArrayList<Ticket> t = ticketDAO.findListOfTickets();
        ArrayList<TicketDTO> o = new ArrayList<>();
        for(Ticket ti : t){
            if(ti.getUserByForUser().getId() == userid){
                o.add(new TicketDTO(ti));
            }
        }
        
        return RESTUtils.JSONFactory.toJson(o);
    }
    
    @GET
    @Path("msg/{id}")
    public String ticketMsgForTicket(@PathParam("id") int id){
        ArrayList<TicketUpdate> t = ticketDAO.findListOfTicketUpdate();
        ArrayList<TicketUpdateDTO> o = new ArrayList<>();
        for(TicketUpdate ti : t){
            if(ti.getTicket().getId() == id){
                o.add(new TicketUpdateDTO(ti));
            }
        }
        
        return RESTUtils.JSONFactory.toJson(o);
    }
    
    @GET
    @Path("id/{id}")
    public String ticketForId(@PathParam("id") int id){
        Ticket t = ticketDAO.getTicketByID((short)id);
        if(t == null){
            return null;
        }
        return RESTUtils.JSONFactory.toJson(new TicketDTO(t));
    }
    
    @GET
    @Path("priority/{priority}")
    public String ticketByPriority(@PathParam("priority") String priority){
        ArrayList<Ticket> t = ticketDAO.findListOfTickets();
        ArrayList<TicketDTO> o = new ArrayList<>();
        for(Ticket ti : t){
            //Normale, Importante, Critique
            if(ti.getPriority().equals(priority)){
                o.add(new TicketDTO(ti));
            }
        }
        
        return RESTUtils.JSONFactory.toJson(o);
    }
    
    @POST
    @Path("new")
    public String createTicket(@Context HttpServletRequest req,@FormParam("content") String content,@FormParam("priority") String priority,
            @FormParam("title") String title,@FormParam("for_user") int forUser){
        User u = TokenStore.userFromRequest(req);
        if(u != null){
            Ticket t = new Ticket();
            t.setContent(content);
            t.setPriority(priority);
            t.setTitle(title);
            int openedBy = u.getId();
            ticketDAO.createTicket(t, forUser, openedBy);
            return "OK";
        }
        return "Invalid or missing login token.";
    }
    
    
    @POST
    @Path("postmsg")
    public void createTicketMsg(@Context HttpServletRequest req,@FormParam("content") String content,@FormParam("ticketid") int ticketid){
        User u = TokenStore.userFromRequest(req);
        if(u != null){
            TicketUpdate t = new TicketUpdate();
            t.setContent(content);
            t.setCreatedAt(Date.from(Calendar.getInstance().toInstant()));
            t.setUser(u);
            ticketDAO.createTicketUpdate(t, ticketid);
        }
    }
}