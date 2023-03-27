<%-- 
    Document   : showOne
    Created on : 20 Feb 2023, 9:14:59 PM
    Author     : PULE
--%>

<%@page import="com.puleProjects.bean.Task"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <style>
            table {
                border-collapse: collapse;
                width: 100%;
                margin: 20px 0;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            th {
                background-color: #333;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <h1>Hello World!</h1>
                <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Status</th>
                </tr>
                
            </thead>
   <tbody>
            <%
            Task oneTask = (Task) session.getAttribute("taskSession");
            
        %>
         
                <tr>
                    <td><%= oneTask.getName() %></td>
                    <td><%= oneTask.getDescription()%></td>
                    <td><%= oneTask.getStatus()%></td>
                </tr>

            </tbody>
        </table>
    </body>
</html>
