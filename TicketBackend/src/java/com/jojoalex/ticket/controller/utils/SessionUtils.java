/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jojoalex.ticket.controller.utils;

import com.jojoalex.ticket.model.entities.User;
import java.io.Serializable;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

public class SessionUtils implements Serializable {

    public static HttpSession getSession() {
        return (HttpSession) FacesContext.
                getCurrentInstance().
                getExternalContext().
                getSession(false);
    }

    public static User getConnectedUser() {
        return (User) getSession().getAttribute("user");
    }

    public static void setConnectedUser(User connectedUser) {
        getSession().setAttribute("user", connectedUser);
    }
}