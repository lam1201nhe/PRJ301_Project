/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;

/**
 *
 * @author Admin
 */
public abstract class BaseAuthenticationController extends HttpServlet{
    private boolean isAuthenticated(HttpServletRequest request){
        Account account = (Account)request.getSession().getAttribute("account");
        return account != null;
    }   

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(isAuthenticated(req)){
            //
            processPost(req, resp);
        }else {
            resp.sendRedirect("../error404.jsp");
        }
    }
    
    protected abstract void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
    protected abstract void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(isAuthenticated(req)){
            //
            processGet(req, resp);
        }else {
            resp.sendRedirect("../error404.jsp");
        }
    }
    
    
}
