
<tr>
    <td colspan="3"  align="left">
        <h2 style="padding: 20px;">Network Traffic Monitoring and Control</h2>
    </td>
</tr>
<tr>
    <td colspan="3" width="100%"  class="footer">
        <%
            if (null != session.getAttribute("NAME")) {
                String loginname = (String) session.getAttribute("NAME");

        %>
        <table border="0" width="100%" >
            <tr>
                <td class="white_font_bold" width="430" style="float:left;padding-left: 10px;margin-left: -20px">
                    Welcome :<span class="yellow-font"><%=loginname%></span>
                    <span style="color: #fff;">|&nbsp;&nbsp;You connect with: <%=request.getRemoteAddr()%></span>
                </td>
                <td class="white_font" width="40%" align="right">
                    <a href="index.jsp" class="white_font_bold">Home</a><span class="clear">&nbsp;|</span>                    
                    <a href="contactus.jsp" class="white_font_bold">Contact Us</a><span class="clear">&nbsp;|</span>
                    <a href="myaccount.jsp" class="white_font_bold">My Account</a><span class="clear">&nbsp;</span>
                </td>
            </tr>
        </table>
        <%
        } else {
        %>
        <table border="0" width="100%" >
            <tr>
                <td class="white_font_bold" width="50%">
            <marquee>Network Traffic Monitoring and Control <span style="color: #fff;">&nbsp;|&nbsp;You connect with: <%=request.getRemoteAddr()%></span></marquee>
            
    </td>                
    <td width="50">&nbsp;</td>
    <td align="right">        
        <a href="index.jsp" class="white_font_bold">Home</a><span class="clear">&nbsp;|</span>                    
        <a href="contactus.jsp" class="white_font_bold">Contact Us</a><span class="clear">&nbsp;|</span>
        <a href="register.jsp" class="white_font_bold">Register</a><span class="clear">&nbsp;|</span>
        <a href="login.jsp" class="white_font_bold">Login</a>&nbsp;&nbsp;
    </td>
</tr>
</table>
<%
    }
%>
</td>
</tr>
