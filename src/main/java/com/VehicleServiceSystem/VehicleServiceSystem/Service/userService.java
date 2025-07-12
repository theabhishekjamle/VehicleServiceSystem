package com.VehicleServiceSystem.VehicleServiceSystem.Service;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.adminDataModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Model.userDataModel;

import java.util.List;


public interface userService {
    public boolean userSignUp(userDataModel user);
    public userDataModel userLogin(String email, String password);
    public  List<userDataModel> getAllUsers();

}
