<%-- 
    Document   : index    
    Author     : KamalKant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >        
        <title>Welcome to Network Traffic Monitoring and Control</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">       
        
    </head>
    <body>
        <table  cellspacing="0" cellpadding="0" align="center" border="0" class="body_content">          

            <%@include file="header.jsp" %>
            <tr>
                <td colspan="3" width="100%">
                    <img src="images/cloud-computing-is-changing-business.jpg" height="300" width="100%"/>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="padding: 0px 20px 0px 20px;">
                    <h1>About Project</h1>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="padding: 0px 20px 0px 20px;color: #666;font-size: 14px;line-height: 24px;">
                    <p>
                        An IDS is either a hardware device or software application that uses known intrusion signatures to detect and analyze both inbound and outbound network traffic for abnormal activities.
                        <br/>    
                        <strong>This is done through:</strong><br/>
                    <ul>
                        <li>System file comparisons against malware signatures.</li>
                        <li>Scanning processes that detect signs of harmful patterns.</li>
                        <li>Monitoring user behavior to detect malicious intent.</li>
                        <li>Monitoring system settings and configurations.</li>                        
                    </ul>
                    Upon detecting a security policy violation, virus or configuration error, an IDS is able to kick an offending user off the network and send an alert to security personnel.
                    <br/>
                    Despite its benefits, including in-depth network traffic analysis and attack detection, an IDS has inherent drawbacks. Because it uses previously known intrusion signatures to locate attacks, newly discovered (i.e., zero-day) threats can remain undetected.
                    <br/>
                    Furthermore, an IDS only detects ongoing attacks, not incoming assaults. To block these, an intrusion prevention system is required.

                    </p>
                    <p>

                    </p>
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
