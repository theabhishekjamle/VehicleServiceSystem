package com.VehicleServiceSystem.VehicleServiceSystem.Service;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.adminDataModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Model.userDataModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Repository.adminRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class adminServiceImplements implements adminService{

    @Autowired
    private adminRepository adminRepo;

    @Override
    public boolean adminSignUp(adminDataModel admin) {
        try{
           adminRepo.save(admin);
            System.out.println(" Admin Register ");
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public adminDataModel findByAdminIdAndPassword(String adminId, String password) {
        return adminRepo.findByAdminIdAndPassword(adminId, password);
    }


}
