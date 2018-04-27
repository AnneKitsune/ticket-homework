/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jojoalex.ticket.model.dto;

import com.jojoalex.ticket.model.entities.User;

/**
 *
 * @author jojolepro
 */
public class UserDTO {
    private Integer id;
    private String fullname;
    private String password;
    private String email;
    private boolean admin;
    private String phone;
    public UserDTO(User user){
        id = user.getId();
        fullname = user.getFullname();
        password = user.getPassword();
        email = user.getEmail();
        admin = user.isAdmin();
        phone = user.getPhone();
    }
}
