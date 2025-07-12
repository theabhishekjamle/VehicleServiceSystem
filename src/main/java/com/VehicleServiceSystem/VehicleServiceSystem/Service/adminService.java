package com.VehicleServiceSystem.VehicleServiceSystem.Service;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.adminDataModel;

public interface adminService {
    public boolean adminSignUp(adminDataModel admin);
    public adminDataModel findByAdminIdAndPassword(String adminId,String password);
}
