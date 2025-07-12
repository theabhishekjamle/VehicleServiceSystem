package com.VehicleServiceSystem.VehicleServiceSystem.Service;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.sellingcarModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Repository.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

public interface CarService {
    public List<sellingcarModel> getAllCars();
}
