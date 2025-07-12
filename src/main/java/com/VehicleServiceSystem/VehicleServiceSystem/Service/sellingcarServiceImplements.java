package com.VehicleServiceSystem.VehicleServiceSystem.Service;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.sellingcarModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Repository.CarRepository;
import com.VehicleServiceSystem.VehicleServiceSystem.Repository.sellingcarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class sellingcarServiceImplements implements sellingcarsService {

    @Autowired
    public sellingcarRepository sellingcarRepo;

    @Override
    public boolean addSellingCar(sellingcarModel sellcar) {
        try{
            sellingcarRepo.save(sellcar);
            System.out.println(" Car Registered ");
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<sellingcarModel> getAllSellingCars() {
        return sellingcarRepo.findAll();
    }


}
