/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class UserDTO {
    private String userID;
    private String FullName;
    private String password;
    private String roleID;
    private boolean status;

    public UserDTO() {
    }

    public UserDTO(String userID, String FullName, String password, String roleID, boolean status) {
        this.userID = userID;
        this.FullName = FullName;
        this.password = password;
        this.roleID = roleID;
        this.status = status;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
 

    @Override
    public String toString() {
        return "UserDTO{" + "userID=" + userID + ", FullName=" + FullName + ", password=" + password + ", roleID=" + roleID + ", status=" + status + '}';
    }
    
    
}
