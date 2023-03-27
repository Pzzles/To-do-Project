<%-- 
    Document   : makeEntry
    Created on : 11 Feb 2023, 5:03:05 PM
    Author     : PULE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>To-do List</title>
        <link rel="stylesheet" type="text/css" href="path/to/your/css/file.css">
        <style>
            /* Set default styles for body, headings, and form elements */

            body {
                font-family: Arial, sans-serif;
                font-size: 16px;
                line-height: 1.5;
            }

            h1 {
                font-size: 2em;
                font-weight: bold;
            }

            input[type="text"],
            textarea,
            select {
                padding: 8px 16px;
                font-size: 16px;
                border: none;
                border-radius: 4px;
                background-color: #f1f1f1;
                margin-bottom: 10px;
                width: 100%;
            }

            input[type="submit"] {
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

            input[type="submit"]:hover,
            button[type="submit"]:hover {
                background-color: #3e8e41;
            }

            button[type="submit"] {
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

        </style>
    </head>
    <body>
        <header>
            <h1>To-do List</h1>
        </header>

        <main>
            <form method="get" action="TaskServlet?action=add">
                <section>
                    <label for="taskName">Task Name</label>
                    <input type="text" id="taskName" name="name" placeholder="Enter task name" required>
                </section>

                <section>
                    <label for="taskEntry">Task Entry</label>
                    <textarea id="taskEntry" name="entry" placeholder="Enter task entry" required></textarea>
                </section>

                <section>
                    <label for="taskStatus">Task Status</label>
                    <select id="taskStatus" name="status" required>
                        <option value="" disabled selected>Select status</option>
                        <option value="complete">Complete</option>
                        <option value="incomplete">Incomplete</option>
                    </select>
                </section>

                <section>
                    <button type="submit" name="action" value="add">Add Task</button>
                </section>
            </form>
        </main>
    </body>
</html>
