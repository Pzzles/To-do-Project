<%-- 
    Document   : index
    Created on : 13 Feb 2023, 2:39:29 PM
    Author     : PULE
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.puleProjects.bean.Task"%>
<%@page import="com.puleProjects.models.TaskModel"%>
<%@page import="com.puleProjects.dao.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>To-Do List</title>
        <style>
            /* Reset default styles applied by the browser */
/* Use normalize.css or a similar CSS reset instead */

html {
    box-sizing: border-box;
}

*,
*::before,
*::after {
    margin: 0;
    padding: 0;
    box-sizing: inherit;
}

/* Set default styles for body, headings, and links */

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

/* Style the label and button elements */

label {
    display: block;
    font-weight: bold;
    margin-bottom: 10px;
}

button {
    background-color:#4CAF50;
border: none;
color: white;
padding: 10px 20px;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 16px;
margin-bottom: 10px;
cursor: pointer;
border-radius: 4px; /* Add rounded corners to the button /
transition: background-color 0.3s ease; / Add a transition effect on hover */
}

button:hover {
background-color: #3e8e41;
}

/* Style the select element */

select {
padding: 8px 16px;
font-size: 16px;
border: none;
border-radius: 4px;
background-color: #f1f1f1;
margin-bottom: 10px;
width: 100%;
}

/* Style the form element */

form {
margin-bottom: 20px;
display: flex; /* Use flexbox to center the form horizontally */
justify-content: center;
}

/* Style the div element */

div {
margin-bottom: 20px;
display: flex; /* Use flexbox to center the div horizontally */
justify-content: center;
}

/* Add a border and padding to the input elements */
input[type="text"],
textarea {
border: 2px solid #ccc;
border-radius: 4px;
padding: 8px 16px;
margin-bottom: 10px;
width: 100%;
box-sizing: border-box;
}

/* Add a height to the textarea element */
textarea {
height: 100px;
}

/* Style the label element */
label {
display: block;
font-weight: bold;
margin-bottom: 10px;
color: #333;
}

/* Style the link element */
a {
text-decoration: none;
color: inherit;
}

/* Style the header element */
h1 {
font-size: 2em;
font-weight: bold;
text-align: center;
margin-bottom: 30px;
}

 /*Style the main container element*/ 
.main-container {
max-width: 800px;
margin: 0 auto;  
/*Center the main container horizontally*/ 
padding: 30px;
box-sizing: border-box;
background-color: #f8f8f8;
border-radius: 10px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); 
/*Add a shadow effect to the main container*/ 
}

        </style>
    </head>
    <body>
        <header>
            <h1>To-Do List</h1>
        </header>

        <nav>
            <ul>
                <li>
                    <label for="addBtn">Make Entry</label>
                    <button id="addBtn" type="button">
                        <a href="makeEntry.jsp">Add</a>
                    </button>
                </li>
                <li>
                    <label for="viewBtn">View All Entries</label>
                    <button id="viewBtn" type="button">
                        <a href="TaskServlet?action=viewAll">Show All</a>
                    </button>
                </li>
                <li>
                    <form action="TaskServlet?action=viewOne" method="get">
                        <label for="selOpt">View Specific Entry</label>
                        <select id="selOpt" name="name" onchange="this.form.submit();">
                            <option>Default</option>
                            <% DAO tdao = new TaskModel();
                               List<Task> taskList = tdao.viewAllTasks();
                               String name = "";
                               int id;
                               for (Task task : taskList) {
                                   id = task.getId();
                                   name = task.getName(); %>
                            <option value="<%=name%>"><%= id + "  " + name%></option>
                            <% } %>
                        </select>
                    </form>
                </li>
            </ul>
        </nav>
    </body>
</html>
