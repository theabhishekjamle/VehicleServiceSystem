package com.VehicleServiceSystem.VehicleServiceSystem.Controller;

import com.VehicleServiceSystem.VehicleServiceSystem.Model.adminDataModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Model.sellingcarModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Model.userDataModel;
import com.VehicleServiceSystem.VehicleServiceSystem.Service.sellingcarsService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


@Controller
public class sellingcarController {

    @Autowired
    public sellingcarsService sellingservice;



    @GetMapping("/shop")
    public String viewShopPage(Model model) {
        List<sellingcarModel> cars = sellingservice.getAllSellingCars();
        model.addAttribute("sellingcars_list", cars); // JSTL c:forEach uses this
        return "shopPage";
    }



    @PostMapping("/savesellingcar")
    public String savecar(@ModelAttribute("sellercar") sellingcarModel sellercar, Model model) {
        try {
            boolean status = sellingservice.addSellingCar(sellercar);
            if(status) {
                return "redirect:/shop";
            } else {
                model.addAttribute("ErrorMessage", "Something Went Wrong!");
                return "shopPage";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("ErrorMessage", "Image upload failed.");
            return "shopPage";
        }
    }



}
