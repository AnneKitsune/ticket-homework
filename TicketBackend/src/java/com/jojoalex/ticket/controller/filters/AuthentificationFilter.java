/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jojoalex.ticket.controller.filters;

import java.io.IOException;
import java.io.Serializable;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "AuthentificationFilter", urlPatterns = {"*.xhtml"})
public class AuthentificationFilter implements Filter, Serializable {

    public AuthentificationFilter() {
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        try {
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;
            HttpSession ses = req.getSession(false);
            
            String reqURI = req.getRequestURI();
            if (reqURI.contains("/login.xhtml")
                    || (ses != null && ses.getAttribute("user") != null)
                    || reqURI.contains("/public/")
                    || reqURI.contains("javax.faces.resource")) {
                chain.doFilter(request, response);

            } else {

                res.sendRedirect(req.getContextPath() + "/login.xhtml?faces-redirect=true");  // Anonymous user. Redirect to login page
            }
        } catch (IOException | ServletException t) {
            t.printStackTrace();
        }
    }

    @Override
    public void destroy() {
       
    }
}
