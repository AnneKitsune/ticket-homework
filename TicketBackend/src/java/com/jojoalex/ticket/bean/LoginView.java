/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jojoalex.ticket.bean;

import com.jojoalex.ticket.controller.utils.EncryptionException;
import com.jojoalex.ticket.controller.utils.SessionUtils;
import com.jojoalex.ticket.model.dao.UserDAO;
import com.jojoalex.ticket.model.entities.User;
import javax.annotation.PostConstruct;
import javax.inject.Named;
import javax.enterprise.context.Dependent;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;
import org.jboss.logging.Logger;

/**
 *
 * @author Alexis-Laptop
 */
@ManagedBean(name = "loginview")
@ViewScoped
public class LoginView {

    private String username;
    private String password;
    
    private UserDAO userDAO;
    
    public LoginView() {
    }
    
    @PostConstruct
    public void init() {
        userDAO = new UserDAO();
    }
    
    public String connect() {
        
        //FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "USername: " + username, ""));
        //return "login";
        //*
        try {
            User aUser = userDAO.getUserByUserNameAndPassword(username, password);
            //System.out.println(aUser.getFullname());
            if (aUser != null) {
                System.out.println("good");
                HttpSession session = SessionUtils.getSession();
                System.out.println("good");
                session.setAttribute("user", aUser);
                System.out.println("Good");
                FacesContext.getCurrentInstance().getApplication().getNavigationHandler().handleNavigation(FacesContext.getCurrentInstance(), null, "index.xhtml");
                return "index?faces-redirect=true";
            } else {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Échec de la connexion", "Mauvais nom d'utilisateur ou mot de passe"));
            }
        } catch (EncryptionException ex) {
           FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Échec de la connexion", "Problem de lors de l'encodage du mot de passe"));
            System.out.println("Erreur d'encryption");
        }
        System.out.println("passe");
        return "login";
        //*/
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
}
