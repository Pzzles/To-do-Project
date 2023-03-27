/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puleProjects.models;

import com.puleProjects.bean.Task;
import com.puleProjects.dao.DAOImplementation;
import com.puleProjects.utilities.GetConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PULE
 */
public class TaskModel extends DAOImplementation {

    private Connection con = null;
    private PreparedStatement ps;
    private Statement stmt;
    private ResultSet rs;

    @Override
    public boolean updateTask(String name) {

        boolean result = false;
        con = GetConnection.getInstance();

        if (con != null) {
            try {

                createTable();

                ps = con.prepareStatement("");

            } catch (SQLException ex) {
                System.out.println("Error!! " + ex.getMessage());
            }
        } else {
            System.out.println("Connection failed");
        }
        return result;
    }

    @Override
    public boolean deleteTask(String name) {
        boolean result = false;
        con = GetConnection.getInstance();

        if (con != null) {
            try {
                ps = con.prepareStatement("DELETE FROM tasks WHERE name = ?");
                ps.setString(1, name);
                result = ps.executeUpdate() > 0;

            } catch (SQLException ex) {
                System.out.println("Error!! " + ex.getMessage());
            } finally {
                try {
                    ps.close();
                    //  con.close();
                } catch (SQLException ex) {
                    System.out.println("Error!! " + ex.getMessage());
                }
            }
        }
        return result;
    }

    @Override
    public Task viewTask(String name) {
        Task task = null;
        con = GetConnection.getInstance();

        if (con != null) {
            try {
                ps = con.prepareStatement("SELECT * FROM tasks where name = ?");
                ps.setString(1, name);
                rs = ps.executeQuery();

                while (rs.next()) {
                    task = new Task();
                    task.setId(rs.getInt("id"));
                    task.setName(rs.getString("name"));
                    task.setDescription(rs.getString("description"));
                    task.setStatus(rs.getString("status"));

                }
            } catch (SQLException ex) {
                System.out.println("Error!! " + ex.getMessage());
            } finally {
                try {
                    rs.close();
                    //  con.close();
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("Error!! " + ex.getMessage());
                }
            }
        }
        return task;
    }

    @Override
    public List<Task> viewAllTasks() {
        List<Task> allTasks = new ArrayList<>();
        con = GetConnection.getInstance();

        if (con != null) {
            try {
                ps = con.prepareStatement("SELECT * FROM tasks");
                rs = ps.executeQuery();

                while (rs.next()) {
                    Task task = new Task();
                    task.setId(rs.getInt("id"));
                    task.setName(rs.getString("name"));
                    task.setDescription(rs.getString("description"));
                    task.setStatus(rs.getString("status"));
                    allTasks.add(task);
                }
            } catch (SQLException ex) {
                System.out.println("Error!! " + ex.getMessage());
            } finally {
                try {
                    rs.close();
                    // con.close();
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("Error!! " + ex.getMessage());
                }
            }
        }

        return allTasks;
    }

    @Override
    public boolean addTask(Task task) {
        boolean result = false;
        con = GetConnection.getInstance();

        if (con != null) {
            try {
                createTable();

                ps = con.prepareStatement("INSERT INTO tasks("
                        + "id,"
                        + "name,"
                        + "description,"
                        + "status"
                        + ") VALUES(?,?,?,?)");

                ps.setInt(1, task.getId());
                ps.setString(2, task.getName());
                ps.setString(3, task.getDescription());
                ps.setString(4, task.getStatus());
                result = ps.executeUpdate() > 0;

            } catch (SQLException ex) {
                System.out.println("Error!! " + ex.getMessage());
            } finally {
                try {
                    // con.close();
                    ps.close();
                } catch (SQLException ex) {
                    System.out.println("Error!! " + ex.getMessage());
                }

            }
        }
        return result;
    }

    private boolean createTable() {

        boolean result = false;
        con = GetConnection.getInstance();

        if (con != null) {
            try {
                stmt = con.createStatement();
                String sql = "CREATE TABLE IF NOT EXISTS tasks (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50), description VARCHAR(250), status VARCHAR(50))";
                result = stmt.executeUpdate(sql) > 0;
                System.out.println("Table created");

            } catch (SQLException ex) {
                System.out.println("Error!! " + ex.getMessage());
            }
        }

        return result;
    }

}

//
//            <%
////                DAO tDao = new TaskModel();
//  //              List<Task> allTasks = tDao.viewAllTasks();
//    //            if (allTasks != null) {
//      //              for (Task task : allTasks) {
//            %>
//            <option>
//                <%=// task.getId() + " " + task.getName()%>
//
//            </option>
//            <!--<input type="submit" value="delete" name="delete" />-->
//            <%
//                    //}
//                //}
//            %>
