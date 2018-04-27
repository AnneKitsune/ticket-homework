/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jojoalex.ticket.controller.endpoints;

import com.jojoalex.ticket.controller.utils.RESTUtils;
import com.jojoalex.ticket.controller.utils.TokenStore;
import com.jojoalex.ticket.model.dao.UserDAO;
import com.jojoalex.ticket.model.dto.UserDTO;
import com.jojoalex.ticket.model.entities.User;
import java.util.ArrayList;
import javax.ws.rs.GET;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

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
            ArrayList<User> list = userDAO.findListOfUsersDTO();
            return RESTUtils.JSONFactory.toJson(list);
        } else {
            return "Invalid Token";
        }
    }*/
    
    /*@GET
    @Path("{id}")
    public String findById(@HeaderParam("token") String token, @PathParam("id") Integer id) {
        if (TokenStore.validateToken(token)) {
            return RESTUtils.JSONFactory.toJson(userDAO.getUserById(id));
        } else {
            return "Invalid Token";
        }
    }*/
    
    @GET
    @Path("id/{id}")
    public String findById(@PathParam("id") Integer id) {
        //if (TokenStore.validateToken(token)) {
            return RESTUtils.JSONFactory.toJson(new UserDTO(userDAO.getUserById(id)));
        /*} else {
            return "Invalid Token";
        }*/
    }
    @GET
    @Path("admin/{admin}")
    public String findById(@PathParam("admin") Boolean admin) {
        ArrayList<User> user = userDAO.getUsers();
            return RESTUtils.JSONFactory.toJson(new UserDTO(userDAO.getUserById(id)));
    }
    
    public void addClient(){
        
    }

}