/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.puleProjects.dao;

import com.puleProjects.bean.Task;
import java.util.List;

/**
 *
 * @author PULE
 */
public interface DAO {
    public boolean addTask(Task task);
    
    public List<Task> viewAllTasks();
    
    public Task viewTask(String name);
    
    public boolean deleteTask(String name);
    
    public boolean updateTask(String name);
}
