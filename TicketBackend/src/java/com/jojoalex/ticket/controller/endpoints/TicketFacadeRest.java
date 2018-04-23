/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jojoalex.ticket.controller.endpoints;

import java.util.ArrayList;
import javax.ws.rs.GET;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.Path;

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
    
    public void createTicket(){
        
    }
    
    public void getTicket(int id){
        
    }
    
    public void closeTicket(int id){
        
    }

}