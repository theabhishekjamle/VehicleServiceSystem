package com.VehicleServiceSystem.VehicleServiceSystem.Repository;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.bookingModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface bookingRepository extends JpaRepository<bookingModel, String> {

    Optional<bookingModel> findByVehicleno(String vehicleno);
}
