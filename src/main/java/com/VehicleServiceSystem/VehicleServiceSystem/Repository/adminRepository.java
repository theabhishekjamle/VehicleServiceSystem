package com.VehicleServiceSystem.VehicleServiceSystem.Repository;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.adminDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface adminRepository extends JpaRepository<adminDataModel, Integer> {

    // Custom method for login validation
    adminDataModel findByAdminIdAndPassword(String adminId, String password);
}
