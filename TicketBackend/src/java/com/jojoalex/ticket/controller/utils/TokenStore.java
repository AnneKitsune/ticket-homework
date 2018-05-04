/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jojoalex.ticket.controller.utils;

import com.jojoalex.ticket.model.entities.User;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;

/**
 *
 */
public class TokenStore {

    public static HashMap<String,User> currentToken = new HashMap<>();

    public static String createToken(User user) {
        String token = UUID.randomUUID().toString();
        registerToken(token,user);
        return token;
    }

    public static void registerToken(String token, User user) {
        currentToken.put(token,user);
    }

    public static boolean validateToken(String token) {
        if(token == null || token.isEmpty())
            return false;
        return currentToken.containsKey(token);
    }
    
    public static User getUser(String token){
        if(token == null || token.isEmpty())
            return null;
        return currentToken.get(token);
    }
    
    public static void remove(String token){
        currentToken.remove(token);
    }
    
    public static User userFromRequest(HttpServletRequest req){
        return TokenStore.getUser(req.getHeader("token"));
    }
    
    public static boolean validateRequest(HttpServletRequest req) {
        return TokenStore.validateToken(req.getHeader("token"));
    }

}
