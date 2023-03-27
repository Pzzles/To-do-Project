<%-- 
    Document   : viewEntries
    Created on : 13 Feb 2023, 2:40:18 PM
    Author     : PULE
--%>

<%@page import="java.util.List"%>
<%@page import="com.puleProjects.bean.Task"%>
<%@page import="com.puleProjects.models.TaskModel"%>
<%@page import="com.puleProjects.dao.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>To-do List</title>
  <style>
  body {
    font-family: Arial, sans-serif;
    font-size: 16px;
    line-height: 1.5;
  }

  h1 {
    font-size: 2em;
    font-weight: bold;
  }

  a {
    text-decoration: none;
    color: inherit;
  }

  label {
    display: block;
    font-weight: bold;
    margin-bottom: 10px;
  }

  button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-bottom: 10px;
    cursor: pointer;
  }

  button:hover {
    background-color: #3e8e41;
  }

  select {
    padding: 8px 16px;
    font-size: 16px;
    border: none;
    border-radius: 4px;
    background-color: #f1f1f1;
    margin-bottom: 10px;
    width: 100%;
  }

  form {
    margin-bottom: 20px;
  }

  div {
    margin-bottom: 20px;
  }
  
  table {
  border-collapse: collapse;
  width: 100%;
  margin-bottom: 20px;
}

table th, table td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}

table th {
  background-color: #f2f2f2;
  font-weight: bold;
}

</style>

    </head>
    <body>
        <header>
            <h1>To-do List</h1>
        </header>

        <main>
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Actions</th> 
                    </tr>
                </thead>

                <%
                    DAO tDao = new TaskModel();
                    List<Task> allTasks = (List<Task>) session.getAttribute("allTasks");

                    for (Task task : allTasks) {

                        String name = task.getName();
                %>

                <tbody>
                    <tr>
                        <td><%= name%></td>
                        <td><%= task.getDescription()%></td>
                        <td><%= task.getStatus()%></td>
                        <td><a href="ActionsServlet?action=deleteOne&name=<%=name%>">delete</a></td>
                    </tr>

                </tbody>
                <%
                    }
                %>
            </table>
        </main>
    </body>
</html>
