/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org;

import connection.Password;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
@WebServlet(name = "ChangePwd", urlPatterns = {"/changePwd"})
public class ChangePwd extends HttpServlet {

    //String result = null;
    HttpSession session = null;
    Connection con = null;
    ResultSet rs = null;
    PreparedStatement pst = null;
    Statement st = null;
    String oldpwd = null;
    String newpwd = null;
    String conpwd = null;
    String uid = null;
    String opwd = null;
    String result = "";
    int i = 0;
    int j = 0;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/xml");
        session = request.getSession(true);
        PrintWriter out = response.getWriter();

        Password encPwd = new Password();
        uid = (String) session.getAttribute("ID");
        oldpwd = request.getParameter("txtopwd");
        oldpwd = encPwd.encryptPassword(oldpwd);
        System.out.println("oldpwd: "+oldpwd);

        newpwd = request.getParameter("txtpwd");
        newpwd = encPwd.encryptPassword(newpwd);

        if (request.getParameter("oldpwd") != null) {//check old password
            
            String oldpwd1 = request.getParameter("oldpwd");
            oldpwd1 = encPwd.encryptPassword(oldpwd1);
            result = CheckOldPwd(oldpwd1);
            //response.sendRedirect("encryption.jsp");
            out.write("<status><sname>" + result + "</sname></status>");

        } else if (request.getParameter("btnsubmit") != null) { //change client password
            j = ChangeClientPwd();
            if (j > 0) {
                session.setAttribute("MSG", "Your password has been successfully changed. !");
                response.sendRedirect("changepwd.jsp");
            } else {
                session.setAttribute("MSG", "Your password has not been changed. !");
                response.sendRedirect("changepwd.jsp");
            }
        }

        //connection from database
        try {
            con = connection.dbConnection.makeConnection();
        } catch (Exception e) {
        }

    }

    //check old password
    public String CheckOldPwd(String oldpwd) {
        String res = null;
        try {
            con = connection.dbConnection.makeConnection();
            st = con.createStatement();
            String sql = "select password from registers where id =  '" + uid + "' and password = '" + oldpwd + "'";
            System.out.println("sql : " + sql);
            rs = st.executeQuery(sql);
            if (rs.next()) {
                res = "na";
            } else {
                res = "Please enter correct old password";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

//change client password
    public int ChangeClientPwd() {
        int x = 0;
        try {

            String SqlString = "update registers set  password=? where id='" + uid + "' and password= '" + oldpwd + "'";
            pst = con.prepareStatement(SqlString);
            pst.setString(1, newpwd);
            x = pst.executeUpdate();

        } catch (Exception e) {
        }

        return x;
    }
}
