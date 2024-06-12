/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kamal Kant
 */
@WebServlet(name = "MyAccount", urlPatterns = {"/myAccount"})
public class MyAccount extends HttpServlet {

    static Connection con = null;
    PreparedStatement pst = null;
    ResultSet rst = null;
    String fname = null;
    String lname = null;
    String dob = null;
    String gender = null;
    String email = null;
    String contno = null;
    String location = null;
    String city = null;
    String id = null;
    String post = null;
    String department = null;   
    int i = 0;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        ServletConfig config = getServletConfig();
        String context = config.getServletContext().getRealPath("/");

        //connection from database
        try {
            con = connection.dbConnection.makeConnection();
        } catch (Exception e) {
        }

        fname = request.getParameter("txtfname");
        lname = request.getParameter("txtlname");
        gender = request.getParameter("cmbgender");
        dob = request.getParameter("txtdob");
        email = request.getParameter("txtemail");
        contno = request.getParameter("txtcontno");
        location = request.getParameter("txtlocation");
        city = request.getParameter("txtcity");
        id = request.getParameter("hidid");
        
        post = request.getParameter("post");
        department = request.getParameter("department");        


        try {
            String sqlquery = "update registers set fname=?,lname=?,gender=?,dob=?,email=?,contno=?,location=?,city=?,post=?,department=? where id = '" + id + "'";
            pst = con.prepareStatement(sqlquery);
            pst.setString(1, fname);
            pst.setString(2, lname);
            pst.setString(3, gender);
            pst.setString(4, dob);
            pst.setString(5, email);
            pst.setString(6, contno);
            pst.setString(7, location);
            pst.setString(8, city);
            pst.setString(9, post);
            pst.setString(10, department);
            i = pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        //success or failure message
        if (i > 0) {

            session.setAttribute("MSG", "Your profile has been successfully update.");
            response.sendRedirect("myaccount.jsp");
        } else {
            session.setAttribute("MSG", "Your profile has not been update.");
            response.sendRedirect("myaccount.jsp");
        }


    }
}
