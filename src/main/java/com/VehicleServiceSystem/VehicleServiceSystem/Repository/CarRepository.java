package com.VehicleServiceSystem.VehicleServiceSystem.Repository;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.sellingcarModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarRepository extends JpaRepository<sellingcarModel, Integer> {

}
