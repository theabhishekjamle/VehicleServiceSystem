package com.VehicleServiceSystem.VehicleServiceSystem.Service;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.bookingModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Model.userDataModel;

import java.util.List;

public interface bookingService {
    public boolean addBookingService(bookingModel booking);
    public String trackVehicle(String vehicleno);
    public List<bookingModel> getAllBooking();

}
