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
@Path("users")
public class UserFacadeRest {

    private final UserDAO userDAO;

    public UserFacadeRest() {
        userDAO = new UserDAO();

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
    
    public void addClient(){
        
    }

}