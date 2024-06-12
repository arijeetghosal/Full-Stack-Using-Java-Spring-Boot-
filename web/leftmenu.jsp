<%
    String utype = null;
    utype = (String) session.getAttribute("UTYPE");
%>

<div class="arrowgreen">
    <ul style="line-height: 20px;list-style: none;font-size: 14px;">
        <%
            if (utype.equals("admin")) {
        %>                   
        <li><a href="aes-encryption.jsp">Encryption</a></li>
        <li><a href="aes-decryption.jsp">Decryption</a></li>
        <li><a href="sharefile.jsp">Share File</a></li>
        <li><a href="share_file.jsp">Download Share File</a></li>
        <li><a href="notification.jsp">Notification</a></li>
        <li><a href="userlist.jsp">User List</a></li>
        <li><a href="adfilelists.jsp">File List</a></li>
        <li><a href="blockip.jsp">Block IP</a></li>
        <li><a href="iplist.jsp">IP List</a></li>
        <li><a href="attackerlist.jsp">Attacker List</a></li>        
            <%        } else {
            %>             
        <li><a href="aes-encryption.jsp">Encryption</a></li>
        <li><a href="aes-decryption.jsp">Decryption</a></li>
        <li><a href="notification.jsp">Notification</a></li>        
        <li><a href="sharefile.jsp">Share File</a></li>
        <li><a href="share_file.jsp">Download Share File</a></li>
            <%            }
            %>
        <li><a href="changepwd.jsp">Change Password</a></li>
        <li><a href="logout">Logout</a></li>
    </ul>    
</div>