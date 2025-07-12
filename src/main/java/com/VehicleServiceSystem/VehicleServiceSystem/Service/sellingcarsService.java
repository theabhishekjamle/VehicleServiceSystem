package com.VehicleServiceSystem.VehicleServiceSystem.Service;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.sellingcarModel;

import java.util.List;

public interface sellingcarsService {
    public boolean addSellingCar(sellingcarModel sellcar);
    public List<sellingcarModel> getAllSellingCars();

}
