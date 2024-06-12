<%-- 
    Document   : myaccount    
    Author     : KamalKant
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%
    Connection conn = null;
    Statement st = null;
    ResultSet result = null;
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
    String id = null;
    id = (String) session.getAttribute("ID");
    if (id != null) {
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >        
        <title>My Account - Network Traffic Monitoring and Control</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="js/scw.js"></script>
        <script type="text/javascript">
            function checkform() {
                var enrno = document.getElementById('txtfname');
                if (enrno.value.trim() == "") {
                    alert('Please enter your first name.');
                    enrno.focus();
                    return false;
                }
                var name = document.getElementById('txtlname');
                if (name.value.trim() == "") {
                    alert('Please enter your last name.');
                    name.focus();
                    return false;
                }

                var dob = document.getElementById('txtdob');
                if (dob.value.trim() == "") {
                    alert('Please enter your date of birth.');
                    dob.focus();
                    return false;
                }
                var gender = document.getElementById('cmbgender');
                if (gender.value.trim() == "na") {
                    alert('Please select your gender.');
                    gender.focus();
                    return false;
                }
                var email = document.getElementById('txtemail');
                if (email.value.trim() == "") {
                    alert('Please enter your email id.');
                    email.focus();
                    return false;
                }
                var contno = document.getElementById('txtcontno');
                if (contno.value.trim() == "") {
                    alert('Please select your contact no.');
                    contno.focus();
                    return false;
                }

            }
        </script>
    </head>
    <body>
        <table  cellspacing="0" cellpadding="0" align="center" border="0" class="body_content">          

            <%@include file="header.jsp" %>
            <tr>
                <td valign="top">
                    <%@include file="leftmenu.jsp" %> 
                </td>
                <td valign="top" style="border-left: dotted 1px darkgreen;height: 500px;width: 750px;">
                    <table style="padding-left: 10px;" cellpadding="5" cellspacing="0" width="100%">
                        <tr>
                            <td>
                                <h1>My Account</h1>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <form action="myAccount" method="post">
                                    <table cellpadding="5" cellspacing="5" width="100%">
                                        <%                                            String msg = null;
                                            msg = (String) session.getAttribute("MSG");
                                            if (msg != null) {
                                        %>
                                        <tr>
                                            <td colspan="4" align="center">
                                                <div style="width:100%;color: #3278A3; font-size: 12px;font-weight: bold;" align="center"><%=msg%></div>
                                            </td>
                                        </tr>
                                        <%
                                                session.removeAttribute("MSG");
                                            } else {
                                                session.setAttribute("MSG", "");

                                            }
                                        %>
                                        <%
                                            try {
                                                conn = connection.dbConnection.makeConnection();
                                                String query = "SELECT fname,lname,dob,contno,email,gender,location,city,post,department FROM registers  WHERE id='" + id + "'";
                                                st = conn.prepareStatement(query);
                                                result = st.executeQuery(query);
                                                if (result.next()) {

                                                    String fname = result.getString(1);
                                                    String lname = result.getString(2);
                                                    String dob = result.getString(3);
                                                    String contno = result.getString(4);
                                                    String email = result.getString(5);
                                                    String gender = result.getString(6);
                                                    String location = result.getString(7);
                                                    String city = result.getString(8);
                                                    String post = result.getString(9);
                                                    String department = result.getString(10);                                                    
                                                    if(post == null){
                                                        post = "";
                                                    }
                                                    if(department == null){
                                                        department = "";
                                                    }                                                    
                                                    if(location == null){
                                                        location = null;
                                                    }
                                                    if(city == null){
                                                        city = "";
                                                    }
                                        %>                                        
                                        <tr>
                                            <td width="20%">
                                                <b>First Name:<span class="mandetory">&nbsp;*</span>:</b>
                                            </td>
                                            <td>
                                                <input type="hidden" name="hidid" id="hidid"  value="<%=id%>"/>
                                                <input type="text" name="txtfname" id="txtfname" class="inputbox" value="<%=fname%>"/>
                                            </td>
                                            <td width="20%">
                                                <b>Last Name <span class="mandetory"> *</span>:</b>
                                            </td>
                                            <td>
                                                <input type="text" name="txtlname" id="txtlname" class="inputbox"  value="<%=lname%>"/>
                                            </td>                                            
                                        </tr>
                                        <tr>
                                            <td width="20%">
                                                <b>Date&nbsp;of&nbsp;Birth<span class="mandetory">&nbsp;*</span>:</b>
                                            </td>
                                            <td>
                                                <input type="text" name="txtdob" id="txtdob" class="inputbox" readonly onclick="scwShow(this, event)"  value="<%=dob%>"/>
                                            </td>
                                            <td width="20%">
                                                <b>Gender <span class="mandetory"> *</span>:</b>
                                            </td>
                                            <td>
                                                <select name="cmbgender" id="cmbgender" class="select">
                                                    <option value="na" > - - - - Select - - - - </option>
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                    <option value="<%=gender%>" selected><%=gender%></option>
                                                </select>
                                            </td>                                            
                                        </tr>
                                        <tr>
                                            <td width="20%">
                                                <b>Email&nbsp;ID<span class="mandetory">&nbsp;*</span>:</b>
                                            </td>
                                            <td>
                                                <input type="text" name="txtemail" id="txtemail" class="inputbox"  value="<%=email%>"/>
                                            </td>
                                            <td width="20%">
                                                <b>Contact No. <span class="mandetory"> *</span>:</b>
                                            </td>
                                            <td>
                                                <input type="text" name="txtcontno" id="txtcontno" class="inputbox"  value="<%=contno%>"/>
                                            </td>                                            
                                        </tr>
                                        <tr>
                                            <td width="20%">
                                                <b>Location:</b>
                                            </td>
                                            <td>
                                                <input type="text" name="txtlocation" id="txtlocation" class="inputbox" value="<%=location%>"/>
                                            </td>
                                            <td width="20%">
                                                <b>City:</b>
                                            </td>
                                            <td>
                                                <input type="text" name="txtcity" id="txtcity" class="inputbox" value="<%=city%>"/>
                                            </td>                                            
                                        </tr> 
                                        <tr>
                                            <td width="20%">
                                                <b>Post</b>
                                            </td>
                                            <td>
                                                <input type="text" name="post" id="post" class="inputbox" value="<%=post%>" maxlength="100" required=""/>
                                            </td>
                                            <td width="20%">
                                                <b>Department</b>
                                            </td>
                                            <td>
                                                <input type="text" name="department" id="department" class="inputbox" value="<%=department%>" maxlength="100" required=""/>
                                            </td>                                            
                                        </tr> 

                                        <tr>  
                                            <td colspan="2"><span class="mandetory">*</span> Marked fields are mandatory.</td>
                                            <td colspan="2" align="right">
                                                <input type="submit" name="btnsubmit" id="btnsubmit" value="Update" onclick="return checkform();" class="button"/>
                                            </td>
                                        </tr>
                                        <%    }

                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }

                                        %>
                                    </table>
                                </form>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr> 
            <tr>
                <td colspan="3" width="100%" class="footer">
                    <%@include file="footer.jsp" %>
                </td>
            </tr>
        </table>

    </body>
</html>
<%    } else {
        session.setAttribute("MSG", "You must be login.");
        response.sendRedirect("login.jsp");
    }
%>

