package com.VehicleServiceSystem.VehicleServiceSystem.Controller;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.sellingcarModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;
@Controller
public class CarController {
    @Autowired
    private CarService carService;

    @GetMapping("/viewcars")
    public String viewCarsPage(Model model) {
        List<sellingcarModel> carList = carService.getAllCars();
        model.addAttribute("sellingcars_list", carList); // this is used in JSP
        return "viewCars";
    }

}
