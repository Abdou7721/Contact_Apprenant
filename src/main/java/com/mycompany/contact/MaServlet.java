/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.contact;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "MaServlet", urlPatterns = {"/Ma_Servlet"})
public class MaServlet extends HttpServlet {
     private List<Contacts> contacts = new ArrayList<>();


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MaServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MaServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            String nom = request.getParameter("nom");
            deleteContact(nom);
        }
        request.setAttribute("contacts", contacts);
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }
        

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String telephone = request.getParameter("telephone");
        String competence = request.getParameter("competence");
        
       Contacts nouveauContact = new Contacts();
        nouveauContact.setNom(nom);
        nouveauContact.setPrenom(prenom);
        nouveauContact.settelephone(telephone);
        nouveauContact.setCompetenceFavorite(competence);
        contacts.add(nouveauContact);
        
         request.setAttribute("contacts", contacts);
         request.getRequestDispatcher("contact.jsp").forward(request, response);
        
    }


private void deleteContact(String nom) {
    for (int i = 0; i < contacts.size(); i++) {
        if (contacts.get(i).getNom().equals(nom)) {
            contacts.remove(i);
            break;
        }
    }
}
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
