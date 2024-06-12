/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static org.IPAddress.con;

/**
 *
 * @author kamal
 */
@WebServlet(name = "Attacker", urlPatterns = {"/attacker"})
public class Attacker extends HttpServlet {

 static Connection con = null;
    PreparedStatement pst = null;
    ResultSet rst = null;
    String ipaddress = null;
    String created_by = null;
    int i = 0;    
    
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        HttpSession session = request.getSession(true);

        try {
            con = connection.dbConnection.makeConnection();
            String query = "DELETE from attacker_list WHERE id= '" + id + "' ";
            pst = con.prepareStatement(query);
            i = pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        if (i > 0) {
            session.setAttribute("MSG", "Attacker has been successfuly deleted !!");
            response.sendRedirect("attackerlist.jsp");
        } else {
            session.setAttribute("MSG", "Attacker has not been deleted !!");
            response.sendRedirect("attackerlist.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        created_by = (String) session.getAttribute("ID");

        //connection from database
        try {
            con = connection.dbConnection.makeConnection();
        } catch (Exception e) {
        }

    }

}
