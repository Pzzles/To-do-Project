/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puleProjects.controller;

import com.puleProjects.bean.Task;
import com.puleProjects.dao.DAO;
import com.puleProjects.models.TaskModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PULE
 */
@WebServlet(name = "TaskServlet", urlPatterns = {"/TaskServlet"})
public class TaskServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter pr = response.getWriter();

        DAO taskDao = new TaskModel();
        Task task = null;
        List<Task> allTasks = null;
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String entry = request.getParameter("entry");
        String status = request.getParameter("status");
        String action = request.getParameter("action");

        try (PrintWriter out = response.getWriter()) {
            switch (action) {
                case "add":

                    task = new Task(name, entry, status);

                    taskDao.addTask(task);

                    dispatcher = request.getRequestDispatcher("makeEntry.jsp");
                    dispatcher.forward(request, response);
                    break;
                case "viewAll":

                    allTasks = (List<Task>) taskDao.viewAllTasks();
                    session.setAttribute("allTasks", allTasks);
                    dispatcher = request.getRequestDispatcher("viewEntries.jsp");
                    dispatcher.forward(request, response);
                    break;
                case "viewOne":
                    if (name.equals("Default")) {

                        out.println("<h1>PICK A NAME!</h1>");

                    } else {
                        Task taskSession = taskDao.viewTask(name);

                        session.setAttribute("taskSession", taskSession);
                        dispatcher = request.getRequestDispatcher("showOne.jsp");
                        dispatcher.forward(request, response);
                    }
                    break;

                case "update":

                    taskDao.updateTask(name);

                    dispatcher = request.getRequestDispatcher("");
                    dispatcher.forward(request, response);
                    break;
                case "deleteAll":

                    //taskDao.deleteAll();
                    dispatcher = request.getRequestDispatcher("");
                    dispatcher.forward(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error!! " + ex.getMessage());
        }
    }

}
