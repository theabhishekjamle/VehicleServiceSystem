package com.VehicleServiceSystem.VehicleServiceSystem.Service;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.bookingModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Repository.bookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class bookingServiceImplements implements bookingService{


    @Autowired
    private bookingRepository bookingRepo;

    @Override
    public boolean addBookingService(bookingModel booking) {
       try {
           bookingRepo.save(booking);
           System.out.println("Booking Confimred ");
           return true;

       }catch (Exception e){
           e.printStackTrace();
           return false;
       }

    }


        @Override
        public String trackVehicle(String vehicleno) {
            Optional<bookingModel> booking = bookingRepo.findByVehicleno(vehicleno);

            if (booking.isPresent()) {
                System.out.println("Booking found: " + booking.get());
                return "trackVehiclePage"; // Return the view name for showing booking info
            } else {
                System.out.println("No booking found for vehicle: " + vehicleno);
                return "vehicleNotFoundPage"; // Create a JSP/HTML page for this
            }
        }

    @Override
    public List<bookingModel> getAllBooking() {
        return bookingRepo.findAll();
    }


}
