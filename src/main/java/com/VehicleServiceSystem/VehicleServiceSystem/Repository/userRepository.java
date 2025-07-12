package com.VehicleServiceSystem.VehicleServiceSystem.Repository;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.userDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface userRepository extends JpaRepository<userDataModel,Integer> {
    userDataModel findByEmail(String email);
}
