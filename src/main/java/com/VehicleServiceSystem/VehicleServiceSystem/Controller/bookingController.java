package com.VehicleServiceSystem.VehicleServiceSystem.Controller;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.bookingModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Service.bookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class bookingController {

    @Autowired
    private bookingService bookingSer;

    @PostMapping("bookService")
    public String serviceForm(@ModelAttribute("booking")bookingModel booking, Model model){
        bookingSer.addBookingService(booking);
        return "trackVehiclePage";
    }

    @PostMapping("trackVehicle")
    public String trackVehicle(@ModelAttribute("booking") bookingModel booking ,Model model){
        return  bookingSer.trackVehicle(booking.getVehicleno());
    }
    @PostMapping("sell")
    public String sell(){
        return "sellPage";
    }
}
